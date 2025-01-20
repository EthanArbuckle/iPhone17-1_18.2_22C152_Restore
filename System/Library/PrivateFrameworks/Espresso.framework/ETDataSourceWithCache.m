@interface ETDataSourceWithCache
- (ETDataSourceWithCache)initWithDataSource:(id)a3;
- (ETDataSourceWithCache)initWithDataSource:(id)a3 dumpPath:(id)a4;
- (id).cxx_construct;
- (id)dataPointAtIndex:(int)a3;
- (int)numberOfDataPoints;
@end

@implementation ETDataSourceWithCache

- (id).cxx_construct
{
  *((void *)self + 3) = 0;
  *((void *)self + 2) = (char *)self + 24;
  *((void *)self + 4) = 0;
  *(_OWORD *)((char *)self + 40) = 0uLL;
  *((void *)self + 7) = 0;
  return self;
}

- (void).cxx_destruct
{
  if (*((char *)&self->dump_path.__r_.__value_.var0.__l + 23) < 0) {
    operator delete(self->dump_path.__r_.__value_.var0.__l.__data_);
  }
  std::__tree<std::__value_type<int,ETDataPoint * {__strong}>,std::__map_value_compare<int,std::__value_type<int,ETDataPoint * {__strong}>,std::less<int>,true>,std::allocator<std::__value_type<int,ETDataPoint * {__strong}>>>::destroy((void *)self->_cache.__tree_.__pair1_.__value_.__left_);

  objc_storeStrong((id *)&self->_source, 0);
}

- (int)numberOfDataPoints
{
  return [(ETDataSource *)self->_source numberOfDataPoints];
}

- (id)dataPointAtIndex:(int)a3
{
  int v24 = a3;
  left = (char *)self->_cache.__tree_.__pair1_.__value_.__left_;
  p_cache = (uint64_t **)&self->_cache;
  if (!left) {
    goto LABEL_11;
  }
  p_pair1 = &self->_cache.__tree_.__pair1_;
  do
  {
    int v8 = *((_DWORD *)left + 8);
    BOOL v9 = v8 < a3;
    if (v8 >= a3) {
      v10 = (char **)left;
    }
    else {
      v10 = (char **)(left + 8);
    }
    if (!v9) {
      p_pair1 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<int, ETDataPoint *>, void *>>> *)left;
    }
    left = *v10;
  }
  while (*v10);
  if (p_pair1 == &self->_cache.__tree_.__pair1_ || SLODWORD(p_pair1[4].__value_.__left_) > a3)
  {
LABEL_11:
    uint64_t v11 = [(ETDataSource *)self->_source dataPointAtIndex:*(void *)&a3];
    v12 = std::__tree<std::__value_type<Espresso::platform,void *>,std::__map_value_compare<Espresso::platform,std::__value_type<Espresso::platform,void *>,std::less<Espresso::platform>,true>,std::allocator<std::__value_type<Espresso::platform,void *>>>::__emplace_unique_key_args<Espresso::platform,std::piecewise_construct_t const&,std::tuple<Espresso::platform&&>,std::tuple<>>(p_cache, a3, &v24);
    v13 = v12[5];
    v12[5] = (uint64_t *)v11;
  }
  if (LOBYTE(self->dump_path.__r_.var0))
  {
    unint64_t value = self->_cache.__tree_.__pair3_.__value_;
    if (value == [(ETDataSourceWithCache *)self numberOfDataPoints])
    {
      int v15 = *((char *)&self->dump_path.__r_.__value_.var0.__l + 23);
      if (v15 >= 0) {
        p_dump_path = &self->dump_path;
      }
      else {
        p_dump_path = (basic_string<char, std::char_traits<char>, std::allocator<char>> *)self->dump_path.__r_.__value_.var0.__l.__data_;
      }
      if (v15 >= 0) {
        unint64_t size = *((unsigned __int8 *)&self->dump_path.__r_.__value_.var0.__l + 23);
      }
      else {
        unint64_t size = self->dump_path.__r_.__value_.var0.__l.__size_;
      }
      v18 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(MEMORY[0x1E4FBA250], (uint64_t)p_dump_path, size);
      std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v18, (uint64_t)" ", 1);
      v19 = (void *)std::ostream::operator<<();
      std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v19, (uint64_t)"------------------------------------------", 42);
      v20 = (void *)std::ostream::operator<<();
      std::ios_base::getloc((const std::ios_base *)((char *)v20 + *(void *)(*v20 - 24)));
      v21 = std::locale::use_facet(&v25, MEMORY[0x1E4FBA258]);
      ((void (*)(const std::locale::facet *, uint64_t))v21->__vftable[2].~facet_0)(v21, 10);
      std::locale::~locale(&v25);
      std::ostream::put();
      std::ostream::flush();
      LOBYTE(self->dump_path.__r_.var0) = 0;
    }
  }
  v22 = std::__tree<std::__value_type<Espresso::platform,void *>,std::__map_value_compare<Espresso::platform,std::__value_type<Espresso::platform,void *>,std::less<Espresso::platform>,true>,std::allocator<std::__value_type<Espresso::platform,void *>>>::__emplace_unique_key_args<Espresso::platform,std::piecewise_construct_t const&,std::tuple<Espresso::platform&&>,std::tuple<>>(p_cache, a3, &v24)[5];

  return v22;
}

- (ETDataSourceWithCache)initWithDataSource:(id)a3 dumpPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = [[ETDataSourceWithCache alloc] initWithDataSource:v6];

  id v9 = v7;
  MEMORY[0x192FF0F50](&v8->dump_path, [v9 UTF8String]);
  LOBYTE(v8->dump_path.__r_.var0) = 1;

  return v8;
}

- (ETDataSourceWithCache)initWithDataSource:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)ETDataSourceWithCache;
  id v6 = [(ETDataSourceWithCache *)&v14 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_source, a3);
    v12 = 0;
    unint64_t v13 = 0;
    p_pair1 = &v7->_cache.__tree_.__pair1_;
    std::__tree<std::__value_type<int,ETDataPoint * {__strong}>,std::__map_value_compare<int,std::__value_type<int,ETDataPoint * {__strong}>,std::less<int>,true>,std::allocator<std::__value_type<int,ETDataPoint * {__strong}>>>::destroy((void *)v7->_cache.__tree_.__pair1_.__value_.__left_);
    id v9 = v12;
    v7->_cache.__tree_.__begin_node_ = &v12;
    v7->_cache.__tree_.__pair1_.__value_.__left_ = v9;
    unint64_t v10 = v13;
    v7->_cache.__tree_.__pair3_.__value_ = v13;
    if (v10)
    {
      v9[2] = p_pair1;
      v12 = 0;
      unint64_t v13 = 0;
      id v9 = 0;
    }
    else
    {
      v7->_cache.__tree_.__begin_node_ = p_pair1;
    }
    std::__tree<std::__value_type<int,ETDataPoint * {__strong}>,std::__map_value_compare<int,std::__value_type<int,ETDataPoint * {__strong}>,std::less<int>,true>,std::allocator<std::__value_type<int,ETDataPoint * {__strong}>>>::destroy(v9);
    LOBYTE(v7->dump_path.__r_.var0) = 0;
  }

  return v7;
}

@end