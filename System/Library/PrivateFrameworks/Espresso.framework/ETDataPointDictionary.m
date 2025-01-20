@interface ETDataPointDictionary
- (BOOL)setData:(float *)a3 size:(unint64_t)a4 forKey:(id)a5 freeWhenDone:(BOOL)a6;
- (BOOL)setImage:(vImage_Buffer *)a3 forKey:(id)a4;
- (float)dataForKey:(id)a3 error:(id *)a4;
- (id).cxx_construct;
- (id)dataArrayForKey:(id)a3 error:(id *)a4;
- (map<std::string,)float_buffers;
- (map<std::string,)image_buffers;
- (void)setFloat_buffers:()map<std:()float_buffer_t :()std:(std:(float_buffer_t>>> *)a3 :allocator<std::pair<const)std::string :less<std::string> string;
- (void)setImage_buffers:()map<std:()vImage_Buffer :()std:(std:(vImage_Buffer>>> *)a3 :allocator<std::pair<const)std::string :less<std::string> string;
@end

@implementation ETDataPointDictionary

- (id).cxx_construct
{
  *((void *)self + 2) = 0;
  *((void *)self + 1) = (char *)self + 16;
  *((void *)self + 6) = 0;
  *((void *)self + 5) = 0;
  *((void *)self + 3) = 0;
  *((void *)self + 4) = (char *)self + 40;
  return self;
}

- (void).cxx_destruct
{
  std::__tree<std::__value_type<std::string,std::pair<int,int>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::pair<int,int>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::pair<int,int>>>>::destroy((char *)self->_float_buffers.__tree_.__pair1_.__value_.__left_);
  left = (char *)self->_image_buffers.__tree_.__pair1_.__value_.__left_;

  std::__tree<std::__value_type<std::string,std::pair<int,int>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::pair<int,int>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::pair<int,int>>>>::destroy(left);
}

- (void)setFloat_buffers:()map<std:()float_buffer_t :()std:(std:(float_buffer_t>>> *)a3 :allocator<std::pair<const)std::string :less<std::string> string
{
}

- (map<std::string,)float_buffers
{
  objc_copyCppObjectAtomic(retstr, &self->_float_buffers, (void (__cdecl *)(void *, const void *))__copy_helper_atomic_property__2);
  return result;
}

- (void)setImage_buffers:()map<std:()vImage_Buffer :()std:(std:(vImage_Buffer>>> *)a3 :allocator<std::pair<const)std::string :less<std::string> string
{
}

- (map<std::string,)image_buffers
{
  objc_copyCppObjectAtomic(retstr, &self->_image_buffers, (void (__cdecl *)(void *, const void *))__copy_helper_atomic_property__25179);
  return result;
}

- (id)dataArrayForKey:(id)a3 error:(id *)a4
{
  id v5 = a3;
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)[v5 UTF8String]);
  v6 = (ETDataPointDictionary *)std::__tree<std::__value_type<std::string,Espresso::layer_shape>,std::__map_value_compare<std::string,std::__value_type<std::string,Espresso::layer_shape>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,Espresso::layer_shape>>>::find<std::string>((uint64_t)&self->_float_buffers, __p);
  if (v13 < 0) {
    operator delete(__p[0]);
  }
  if (&self->_float_buffers.__tree_.__pair1_ == (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, float_buffer_t>, void *>>> *)v6)
  {
    v7 = 0;
  }
  else
  {
    v7 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v6[1]._image_buffers.__tree_.__begin_node_];
    if (v6[1]._image_buffers.__tree_.__begin_node_)
    {
      v9 = 0;
      do
      {
        LODWORD(v8) = *((_DWORD *)v6[1].super.isa + (void)v9);
        v10 = [NSNumber numberWithFloat:v8];
        [v7 setObject:v10 atIndexedSubscript:v9];

        ++v9;
      }
      while (v6[1]._image_buffers.__tree_.__begin_node_ > v9);
    }
  }

  return v7;
}

- (float)dataForKey:(id)a3 error:(id *)a4
{
  id v5 = a3;
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)[v5 UTF8String]);
  v6 = (ETDataPointDictionary *)std::__tree<std::__value_type<std::string,Espresso::layer_shape>,std::__map_value_compare<std::string,std::__value_type<std::string,Espresso::layer_shape>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,Espresso::layer_shape>>>::find<std::string>((uint64_t)&self->_float_buffers, __p);
  if (v10 < 0) {
    operator delete(__p[0]);
  }
  if (&self->_float_buffers.__tree_.__pair1_ == (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, float_buffer_t>, void *>>> *)v6) {
    isa = 0;
  }
  else {
    isa = (float *)v6[1].super.isa;
  }

  return isa;
}

- (BOOL)setData:(float *)a3 size:(unint64_t)a4 forKey:(id)a5 freeWhenDone:(BOOL)a6
{
  id v10 = a5;
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)[v10 UTF8String]);
  p_float_buffers = (uint64_t **)&self->_float_buffers;
  v12 = (void **)std::__tree<std::__value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>>>::__find_equal<std::string>((uint64_t)p_float_buffers, &v20, __p);
  char v13 = *v12;
  if (!*v12)
  {
    v14 = (uint64_t **)v12;
    char v13 = operator new(0x50uLL);
    v13[2] = *(_OWORD *)__p;
    uint64_t v16 = v19;
    uint64_t v15 = v20;
    __p[1] = 0;
    uint64_t v19 = 0;
    __p[0] = 0;
    *((void *)v13 + 6) = v16;
    *((void *)v13 + 7) = 0;
    *((void *)v13 + 8) = 0;
    *((void *)v13 + 9) = 0;
    std::__tree<std::__value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>>>::__insert_node_at(p_float_buffers, v15, v14, (uint64_t *)v13);
  }
  *((void *)v13 + 7) = a3;
  *((void *)v13 + 8) = a4;
  *((unsigned char *)v13 + 72) = a6;
  if (SHIBYTE(v19) < 0) {
    operator delete(__p[0]);
  }

  return 1;
}

- (BOOL)setImage:(vImage_Buffer *)a3 forKey:(id)a4
{
  id v6 = a4;
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)[v6 UTF8String]);
  v12 = __p;
  v7 = std::__tree<std::__value_type<std::string,vImage_Buffer>,std::__map_value_compare<std::string,std::__value_type<std::string,vImage_Buffer>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,vImage_Buffer>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)&self->_image_buffers, __p, (_OWORD **)&v12);
  long long v8 = *(_OWORD *)&a3->data;
  *(_OWORD *)((char *)v7 + 72) = *(_OWORD *)&a3->width;
  *(_OWORD *)((char *)v7 + 56) = v8;
  if (v11 < 0) {
    operator delete(__p[0]);
  }

  return 1;
}

@end