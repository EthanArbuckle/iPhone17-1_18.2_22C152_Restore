@interface _ETBufferDataSource
- (_ETBufferDataSource)initWithBlobShapes:(const void *)a3 numberOfDataPoints:(unint64_t)a4 batchSize:(unint64_t)a5 error:(id *)a6;
- (float)dataAtIndex:(unint64_t)a3 key:(const void *)a4;
- (id).cxx_construct;
- (id)dataPointAtIndex:(unint64_t)a3 error:(id *)a4;
- (unint64_t)batchSize;
- (unint64_t)numberOfDataPoints;
- (unint64_t)number_of_data_points;
- (unordered_map<std::string,)blobShapes;
- (unordered_map<std::string,)dataStorage;
- (vector<std::string,)nonBatchBlobNames;
- (void)setBatchSize:(unint64_t)a3;
- (void)setBlobShapes:()unordered_map<std:()Espresso:()std:()std:(std:(Espresso::layer_shape>>> *)a3 :allocator<std::pair<const)std::string :equal_to<std::string> :hash<std::string> :layer_shape :string;
- (void)setDataStorage:()unordered_map<std:()std:()1>> :()std:()std:(std:()std:(1>>>>> *)a3 :shared_ptr<Espresso::blob<float :allocator<std::pair<const)std::string :equal_to<std::string> :hash<std::string> shared_ptr<Espresso::blob<float :string;
- (void)setNonBatchBlobNames:()vector<std:(std::allocator<std::string>> *)a3 :string;
- (void)setNumber_of_data_points:(unint64_t)a3;
@end

@implementation _ETBufferDataSource

- (id).cxx_construct
{
  *((void *)self + 9) = 0;
  *(_OWORD *)((char *)self + 56) = 0u;
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 24) = 0u;
  *((_DWORD *)self + 20) = 1065353216;
  *(_OWORD *)((char *)self + 88) = 0u;
  *(_OWORD *)((char *)self + 104) = 0u;
  *((_DWORD *)self + 30) = 1065353216;
  return self;
}

- (void).cxx_destruct
{
  std::__hash_table<std::__hash_value_type<std::string,Espresso::layer_shape>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,Espresso::layer_shape>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,Espresso::layer_shape>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,Espresso::layer_shape>>>::~__hash_table((uint64_t)&self->_blobShapes);
  std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>>>::~__hash_table((uint64_t)&self->_dataStorage);
  p_nonBatchBlobNames = &self->_nonBatchBlobNames;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&p_nonBatchBlobNames);
}

- (void)setNonBatchBlobNames:()vector<std:(std::allocator<std::string>> *)a3 :string
{
}

- (vector<std::string,)nonBatchBlobNames
{
  objc_copyCppObjectAtomic(retstr, &self->_nonBatchBlobNames, (void (__cdecl *)(void *, const void *))__copy_helper_atomic_property__7);
  return result;
}

- (void)setBatchSize:(unint64_t)a3
{
  self->_batchSize = a3;
}

- (unint64_t)batchSize
{
  return self->_batchSize;
}

- (void)setNumber_of_data_points:(unint64_t)a3
{
  self->_number_of_data_points = a3;
}

- (unint64_t)number_of_data_points
{
  return self->_number_of_data_points;
}

- (void)setBlobShapes:()unordered_map<std:()Espresso:()std:()std:(std:(Espresso::layer_shape>>> *)a3 :allocator<std::pair<const)std::string :equal_to<std::string> :hash<std::string> :layer_shape :string
{
}

- (unordered_map<std::string,)blobShapes
{
  objc_copyCppObjectAtomic(retstr, &self->_blobShapes, (void (__cdecl *)(void *, const void *))__copy_helper_atomic_property__5);
  return result;
}

- (void)setDataStorage:()unordered_map<std:()std:()1>> :()std:()std:(std:()std:(1>>>>> *)a3 :shared_ptr<Espresso::blob<float :allocator<std::pair<const)std::string :equal_to<std::string> :hash<std::string> shared_ptr<Espresso::blob<float :string
{
}

- (unordered_map<std::string,)dataStorage
{
  objc_copyCppObjectAtomic(retstr, &self->_dataStorage, (void (__cdecl *)(void *, const void *))__copy_helper_atomic_property__29955);
  return result;
}

- (float)dataAtIndex:(unint64_t)a3 key:(const void *)a4
{
  __p[0] = (void *)a4;
  v7 = std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<Espresso::blob<float,1>>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::blob<float,1>>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::blob<float,1>>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<Espresso::blob<float,1>>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>((uint64_t)&self->_dataStorage, (unsigned __int8 *)a4, (long long **)__p);
  end = self->_nonBatchBlobNames.__end_;
  uint64_t v9 = std::__find_impl[abi:ne180100]<std::string const*,std::string const*,std::string,std::__identity>((uint64_t)self->_nonBatchBlobNames.__begin_, (uint64_t)end, (unsigned __int8 **)a4);
  v10 = *(float **)(*((void *)v7 + 5) + 16);
  if ((void *)v9 == end)
  {
    [(_ETBufferDataSource *)self blobShapes];
    v16 = (long long *)a4;
    v11 = std::__hash_table<std::__hash_value_type<std::string,Espresso::layer_shape>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,Espresso::layer_shape>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,Espresso::layer_shape>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,Espresso::layer_shape>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>((uint64_t)__p, (unsigned __int8 *)a4, &v16);
    unint64_t v12 = Espresso::layer_shape::total_dim((Espresso::layer_shape *)(v11 + 40));
    v10 += v12 / [(_ETBufferDataSource *)self batchSize] * a3;
    std::__hash_table<std::__hash_value_type<std::string,Espresso::layer_shape>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,Espresso::layer_shape>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,Espresso::layer_shape>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,Espresso::layer_shape>>>::__deallocate_node((void *)__p[2]);
    v13 = __p[0];
    __p[0] = 0;
    if (v13) {
      operator delete(v13);
    }
  }
  return v10;
}

- (_ETBufferDataSource)initWithBlobShapes:(const void *)a3 numberOfDataPoints:(unint64_t)a4 batchSize:(unint64_t)a5 error:(id *)a6
{
  v22.receiver = self;
  v22.super_class = (Class)_ETBufferDataSource;
  uint64_t v9 = [(_ETBufferDataSource *)&v22 init];
  v10 = v9;
  if (v9)
  {
    v9->_batchSize = a5;
    p_blobShapes = &v9->_blobShapes;
    if (&v10->_blobShapes != a3)
    {
      v10->_blobShapes.__table_.__p3_.__value_ = *((float *)a3 + 8);
      std::__hash_table<std::__hash_value_type<std::string,Espresso::layer_shape>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,Espresso::layer_shape>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,Espresso::layer_shape>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,Espresso::layer_shape>>>::__assign_multi<std::__hash_const_iterator<std::__hash_node<std::__hash_value_type<std::string,Espresso::layer_shape>,void *> *>>(p_blobShapes, *((long long **)a3 + 2));
    }
    v10->_number_of_data_points = a4;
    unint64_t v12 = (long long *)*((void *)a3 + 2);
    if (v12)
    {
      while (1)
      {
        uint64_t v13 = *((int *)v12 + 13);
        if (v13 == a5) {
          break;
        }
        if (v13 == 1)
        {
          end = (std::string *)v10->_nonBatchBlobNames.__end_;
          if (end >= v10->_nonBatchBlobNames.__end_cap_.__value_)
          {
            v17 = std::vector<std::string>::__push_back_slow_path<std::string const&>((char **)&v10->_nonBatchBlobNames, (uint64_t)(v12 + 1));
          }
          else
          {
            std::vector<std::string>::__construct_one_at_end[abi:ne180100]<std::string const&>((uint64_t)&v10->_nonBatchBlobNames, v12 + 1);
            v17 = end + 1;
          }
          v10->_nonBatchBlobNames.__end_ = v17;
          int v18 = Espresso::layer_shape::total_dim((Espresso::layer_shape *)((char *)v12 + 40));
          std::allocate_shared[abi:ne180100]<Espresso::blob<float,1>,std::allocator<Espresso::blob<float,1>>,int &,int &,int &,int &,void>(&v21, v18, 1, 1, 1);
          v23 = v12 + 1;
          v15 = std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<Espresso::blob<float,1>>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::blob<float,1>>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::blob<float,1>>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<Espresso::blob<float,1>>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>((uint64_t)&v10->_dataStorage, (unsigned __int8 *)v12 + 16, &v23);
          goto LABEL_12;
        }
LABEL_14:
        unint64_t v12 = *(long long **)v12;
        if (!v12) {
          return v10;
        }
      }
      unint64_t v14 = Espresso::layer_shape::total_dim((Espresso::layer_shape *)((char *)v12 + 40));
      std::allocate_shared[abi:ne180100]<Espresso::blob<float,1>,std::allocator<Espresso::blob<float,1>>,int &,int &,int &,int &,void>(&v21, LODWORD(v10->_number_of_data_points) * (v14 / a5), 1, 1, 1);
      v23 = v12 + 1;
      v15 = std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<Espresso::blob<float,1>>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::blob<float,1>>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::blob<float,1>>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<Espresso::blob<float,1>>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>((uint64_t)&v10->_dataStorage, (unsigned __int8 *)v12 + 16, &v23);
LABEL_12:
      v19 = (std::__shared_weak_count *)*((void *)v15 + 6);
      *(_OWORD *)(v15 + 40) = v21;
      if (v19) {
        nitro::nitro_function::nitro_function(v19);
      }
      goto LABEL_14;
    }
  }
  return v10;
}

- (id)dataPointAtIndex:(unint64_t)a3 error:(id *)a4
{
  unint64_t v35 = a3;
  v4 = (uint64_t *)self;
  v48[5] = *MEMORY[0x1E4F143B8];
  id v38 = (id)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:self->_dataStorage.__table_.__p2_.__value_];
  uint64_t v5 = v4[8];
  if (v5)
  {
    uint64_t v36 = (uint64_t)(v4 + 11);
    v37 = v4;
    do
    {
      v6 = (void *)(v5 + 16);
      uint64_t v7 = v4[4];
      if (std::__find_impl[abi:ne180100]<std::string const*,std::string const*,std::string,std::__identity>(v4[3], v7, (unsigned __int8 **)(v5 + 16)) == v7)
      {
        [v4 blobShapes];
        v46 = (long long *)(v5 + 16);
        unint64_t v12 = std::__hash_table<std::__hash_value_type<std::string,Espresso::layer_shape>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,Espresso::layer_shape>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,Espresso::layer_shape>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,Espresso::layer_shape>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>((uint64_t)__p, (unsigned __int8 *)(v5 + 16), &v46);
        unint64_t v13 = Espresso::layer_shape::total_dim((Espresso::layer_shape *)(v12 + 40));
        unint64_t v14 = v37[2];
        std::__hash_table<std::__hash_value_type<std::string,Espresso::layer_shape>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,Espresso::layer_shape>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,Espresso::layer_shape>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,Espresso::layer_shape>>>::__deallocate_node((void *)v41);
        v15 = __p[0];
        __p[0] = 0;
        if (v15) {
          operator delete(v15);
        }
        uint64_t v9 = v13 / v14;
        uint64_t v11 = *(void *)(*(void *)(v5 + 40) + 16) + 4 * v13 / v14 * v35;
      }
      else
      {
        [v4 blobShapes];
        v46 = (long long *)(v5 + 16);
        v8 = std::__hash_table<std::__hash_value_type<std::string,Espresso::layer_shape>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,Espresso::layer_shape>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,Espresso::layer_shape>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,Espresso::layer_shape>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>((uint64_t)__p, (unsigned __int8 *)(v5 + 16), &v46);
        uint64_t v9 = Espresso::layer_shape::total_dim((Espresso::layer_shape *)(v8 + 40));
        std::__hash_table<std::__hash_value_type<std::string,Espresso::layer_shape>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,Espresso::layer_shape>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,Espresso::layer_shape>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,Espresso::layer_shape>>>::__deallocate_node((void *)v41);
        v10 = __p[0];
        __p[0] = 0;
        if (v10) {
          operator delete(v10);
        }
        uint64_t v11 = *(void *)(*(void *)(v5 + 40) + 16);
      }
      v46 = (long long *)(v5 + 16);
      v16 = std::__hash_table<std::__hash_value_type<std::string,Espresso::layer_shape>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,Espresso::layer_shape>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,Espresso::layer_shape>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,Espresso::layer_shape>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(v36, (unsigned __int8 *)(v5 + 16), &v46);
      long long v17 = *(_OWORD *)(v16 + 56);
      *(_OWORD *)__p = *(_OWORD *)(v16 + 40);
      long long v41 = v17;
      int v18 = (const void *)*((void *)v16 + 10);
      uint64_t v42 = *((void *)v16 + 9);
      v44 = 0;
      uint64_t v45 = 0;
      v43 = 0;
      std::vector<unsigned int>::__init_with_size[abi:ne180100]<unsigned int *,unsigned int *>(&v43, v18, *((void *)v16 + 11), (uint64_t)(*((void *)v16 + 11) - (void)v18) >> 2);
      v19 = [NSNumber numberWithInt:v41];
      v48[0] = v19;
      v48[1] = &unk_1EE3AEFF8;
      v20 = [NSNumber numberWithInt:LODWORD(__p[1])];
      v48[2] = v20;
      long long v21 = [NSNumber numberWithInt:HIDWORD(__p[0])];
      v48[3] = v21;
      objc_super v22 = [NSNumber numberWithInt:LODWORD(__p[0])];
      v48[4] = v22;
      v39 = [MEMORY[0x1E4F1C978] arrayWithObjects:v48 count:5];

      v23 = [NSNumber numberWithInt:(LODWORD(__p[1]) * v41 * HIDWORD(__p[0]) * LODWORD(__p[0]))];
      v47[0] = v23;
      v24 = [NSNumber numberWithInt:(HIDWORD(__p[0]) * LODWORD(__p[1]) * LODWORD(__p[0]))];
      v47[1] = v24;
      v25 = [NSNumber numberWithInt:(LODWORD(__p[0]) * HIDWORD(__p[0]))];
      v47[2] = v25;
      v26 = [NSNumber numberWithInt:LODWORD(__p[0])];
      v47[3] = v26;
      v47[4] = &unk_1EE3AEFF8;
      v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:v47 count:5];

      v28 = [[ETDataTensor alloc] initWithData:v11 type:2 shape:v39 strides:v27];
      v29 = (void *)(v5 + 16);
      if (*(char *)(v5 + 39) < 0) {
        v29 = (void *)*v6;
      }
      v30 = objc_msgSend(NSString, "stringWithUTF8String:", v29, v35);
      [v38 setObject:v28 forKeyedSubscript:v30];

      v31 = [NSNumber numberWithUnsignedLong:v9];
      if (*(char *)(v5 + 39) < 0) {
        v6 = (void *)*v6;
      }
      v32 = [NSString stringWithUTF8String:v6];
      v33 = [v38 objectForKeyedSubscript:v32];
      [v33 setMaxNumberOfElements:v31];

      if (v43)
      {
        v44 = v43;
        operator delete(v43);
      }
      uint64_t v5 = *(void *)v5;
      v4 = v37;
    }
    while (v5);
  }

  return v38;
}

- (unint64_t)numberOfDataPoints
{
  return self->_number_of_data_points;
}

@end