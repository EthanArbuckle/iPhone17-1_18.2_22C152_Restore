@interface _OnDiskArchiveReader
+ (id)modelName;
+ (id)modelNetFileName;
+ (id)modelShapeFileName;
+ (id)parseCompiledNetworkBlobWithName:(id)a3 archive:(void *)a4 error:(id *)a5;
+ (id)readerFromArchiver:(void *)a3 error:(id *)a4;
- (NSArray)layerInfos;
- (NSDictionary)netJson;
- (NSDictionary)shapeJson;
- (NSString)modelPath;
- (_OnDiskArchiveReader)initWithNetJson:(id)a3 shapeJson:(id)a4 modelPath:(id)a5;
- (id)loadUpdatableParams:(id *)a3;
- (id)transformParams;
- (void)copyLayerShapesToContainer:(id)a3;
@end

@implementation _OnDiskArchiveReader

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shapeJson, 0);
  objc_storeStrong((id *)&self->_netJson, 0);
  objc_storeStrong((id *)&self->_modelPath, 0);

  objc_storeStrong((id *)&self->_layerInfos, 0);
}

- (_OnDiskArchiveReader)initWithNetJson:(id)a3 shapeJson:(id)a4 modelPath:(id)a5
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v25 = a3;
  id v23 = a4;
  id v24 = a5;
  v32.receiver = self;
  v32.super_class = (Class)_OnDiskArchiveReader;
  v9 = [(_OnDiskArchiveReader *)&v32 init];
  v26 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_netJson, a3);
    objc_storeStrong((id *)&v26->_shapeJson, a4);
    objc_storeStrong((id *)&v26->_modelPath, a5);
    v10 = [MEMORY[0x1E4F1CA48] array];
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id obj = [v25 objectForKeyedSubscript:@"layers"];
    uint64_t v11 = [obj countByEnumeratingWithState:&v28 objects:v33 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v29 != v12) {
            objc_enumerationMutation(obj);
          }
          v14 = *(void **)(*((void *)&v28 + 1) + 8 * i);
          v15 = [v14 objectForKeyedSubscript:@"type"];
          if ([v15 isEqualToString:@"rnn_arch"])
          {
            v16 = [v14 objectForKeyedSubscript:@"encoder_bidirectional_mode"];
            BOOL v17 = [v16 integerValue] != 0;
          }
          else
          {
            BOOL v17 = 0;
          }
          v18 = [_NNLayerInfo alloc];
          v19 = [v14 objectForKeyedSubscript:@"bottom"];
          v20 = [(_NNLayerInfo *)v18 initWithType:v15 concatenatedInputNames:v19 bidirectional:v17];
          [(NSArray *)v10 addObject:v20];
        }
        uint64_t v11 = [obj countByEnumeratingWithState:&v28 objects:v33 count:16];
      }
      while (v11);
    }

    layerInfos = v26->_layerInfos;
    v26->_layerInfos = v10;
  }
  return v26;
}

- (id)transformParams
{
  v2 = [(_OnDiskArchiveReader *)self netJson];
  v3 = [v2 objectForKeyedSubscript:@"transform_params"];

  return v3;
}

- (NSDictionary)netJson
{
  return self->_netJson;
}

- (id)loadUpdatableParams:(id *)a3
{
  v4 = [(_OnDiskArchiveReader *)self modelPath];
  v5 = [v4 stringByReplacingOccurrencesOfString:@"model.espresso.net" withString:@"model_updatable.params"];

  v6 = [MEMORY[0x1E4F28CB8] defaultManager];
  int v7 = [v6 isReadableFileAtPath:v5];

  if (v7)
  {
    v8 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v5];
    v9 = [MLNeuralNetworksCompileTimeParams alloc];
    id v15 = 0;
    id v10 = [(MLNeuralNetworksCompileTimeParams *)v9 unarchiveUpdatableParamsAtURL:v8 error:&v15];
    id v11 = v15;

    if (v11)
    {
      id v12 = v11;
      *a3 = v12;

      v13 = 0;
      goto LABEL_7;
    }
  }
  else
  {
    id v10 = 0;
  }
  id v10 = v10;
  v13 = v10;
LABEL_7:

  return v13;
}

- (NSString)modelPath
{
  return self->_modelPath;
}

+ (id)modelShapeFileName
{
  v2 = [a1 modelName];
  v3 = [v2 stringByAppendingString:@".espresso.shape"];

  return v3;
}

+ (id)readerFromArchiver:(void *)a3 error:(id *)a4
{
  int v7 = [a1 modelNetFileName];
  v8 = [a1 parseCompiledNetworkBlobWithName:v7 archive:a3 error:a4];

  if (v8)
  {
    v9 = [a1 modelShapeFileName];
    id v10 = [a1 parseCompiledNetworkBlobWithName:v9 archive:a3 error:a4];

    if (v10)
    {
      id v11 = NSString;
      id v12 = [a1 modelNetFileName];
      std::string::basic_string[abi:ne180100]<0>(__p, (char *)[v12 UTF8String]);
      IArchive::blob(&v19, *(void *)a3, (uint64_t)__p);
      v13 = (void *)(v19 + 8);
      if (*(char *)(v19 + 31) < 0) {
        v13 = (void *)*v13;
      }
      v14 = [v11 stringWithUTF8String:v13];
      if (v20) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v20);
      }
      if (v18 < 0) {
        operator delete(__p[0]);
      }

      id v15 = (void *)[objc_alloc((Class)a1) initWithNetJson:v8 shapeJson:v10 modelPath:v14];
    }
    else
    {
      id v15 = 0;
    }
  }
  else
  {
    id v15 = 0;
  }

  return v15;
}

+ (id)modelNetFileName
{
  v2 = [a1 modelName];
  v3 = [v2 stringByAppendingString:@".espresso.net"];

  return v3;
}

+ (id)modelName
{
  return @"model";
}

+ (id)parseCompiledNetworkBlobWithName:(id)a3 archive:(void *)a4 error:(id *)a5
{
  id v7 = a3;
  std::string::basic_string[abi:ne180100]<0>(&__p, (char *)[v7 UTF8String]);
  IArchive::blob(&v19, *(void *)a4, (uint64_t)&__p);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  v8 = (*(void (**)(uint64_t))(*(void *)v19 + 32))(v19);
  if (v8)
  {
    id v17 = 0;
    id v9 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v8 options:0 error:&v17];
    id v10 = v17;
    if (v9)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v9 = v9;
        a5 = (id *)v9;
        goto LABEL_18;
      }
    }
  }
  else
  {
    id v10 = 0;
    id v9 = 0;
  }
  if (a5)
  {
    id v11 = NSString;
    uint64_t v12 = *(void *)a4;
    if (*(char *)(*(void *)a4 + 31) < 0)
    {
      std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)(v12 + 8), *(void *)(v12 + 16));
    }
    else
    {
      long long v13 = *(_OWORD *)(v12 + 8);
      __p.__r_.__value_.__r.__words[2] = *(void *)(v12 + 24);
      *(_OWORD *)&__p.__r_.__value_.__l.__data_ = v13;
    }
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      p_p = &__p;
    }
    else {
      p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
    }
    id v15 = [v11 stringWithUTF8String:p_p];
    *a5 = +[MLModelErrorUtils errorWithCode:0, v10, @"Error in parsing network information from compiled model path %@.", v15 underlyingError format];

    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p.__r_.__value_.__l.__data_);
    }
    a5 = 0;
  }
LABEL_18:

  if (v20) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v20);
  }

  return a5;
}

- (void)copyLayerShapesToContainer:(id)a3
{
  v4 = (uint64_t **)a3;
  v5 = [(_OnDiskArchiveReader *)self shapeJson];
  long long v28 = [v5 objectForKeyedSubscript:@"layer_shapes"];

  unint64_t v6 = 0;
  v27 = v4 + 7;
  while (1)
  {
    id v7 = objc_msgSend(v4, "inputLayerNames", v27);
    unint64_t v8 = [v7 count];

    if (v6 >= v8) {
      break;
    }
    id v9 = [v4 inputLayerNames];
    id v10 = [v9 objectAtIndexedSubscript:v6];

    id v11 = v10;
    std::string::basic_string[abi:ne180100]<0>(__p, (char *)[v11 UTF8String]);
    uint64_t v12 = [v28 objectForKeyedSubscript:v11];
    long long v13 = [v12 objectForKeyedSubscript:@"w"];
    int v14 = [v13 intValue];
    long long v31 = __p;
    *((_DWORD *)std::__tree<std::__value_type<std::string,int>,std::__map_value_compare<std::string,std::__value_type<std::string,int>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,int>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(v4 + 1, __p, (long long **)&v31)+ 14) = v14;

    id v15 = [v12 objectForKeyedSubscript:@"h"];
    int v16 = [v15 intValue];
    long long v31 = __p;
    *((_DWORD *)std::__tree<std::__value_type<std::string,int>,std::__map_value_compare<std::string,std::__value_type<std::string,int>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,int>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(v4 + 4, __p, (long long **)&v31)+ 14) = v16;

    id v17 = [v12 objectForKeyedSubscript:@"k"];
    int v18 = [v17 intValue];
    long long v31 = __p;
    *((_DWORD *)std::__tree<std::__value_type<std::string,int>,std::__map_value_compare<std::string,std::__value_type<std::string,int>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,int>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(v27, __p, (long long **)&v31)+ 14) = v18;

    uint64_t v19 = [v12 objectForKeyedSubscript:@"n"];
    int v20 = [v19 intValue];
    long long v31 = __p;
    *((_DWORD *)std::__tree<std::__value_type<std::string,int>,std::__map_value_compare<std::string,std::__value_type<std::string,int>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,int>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(v4 + 10, __p, (long long **)&v31)+ 14) = v20;

    v21 = [v12 objectForKeyedSubscript:@"seq"];

    if (v21)
    {
      v22 = [v12 objectForKeyedSubscript:@"seq"];
      int v23 = [v22 intValue];
      long long v31 = __p;
      *((_DWORD *)std::__tree<std::__value_type<std::string,int>,std::__map_value_compare<std::string,std::__value_type<std::string,int>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,int>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(v4 + 13, __p, (long long **)&v31)+ 14) = v23;
    }
    else
    {
      long long v31 = __p;
      *((_DWORD *)std::__tree<std::__value_type<std::string,int>,std::__map_value_compare<std::string,std::__value_type<std::string,int>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,int>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(v4 + 13, __p, (long long **)&v31)+ 14) = 1;
    }
    id v24 = [v12 objectForKeyedSubscript:@"_rank"];

    if (v24)
    {
      id v25 = [v12 objectForKeyedSubscript:@"_rank"];
      int v26 = [v25 intValue];
      long long v31 = __p;
      *((_DWORD *)std::__tree<std::__value_type<std::string,int>,std::__map_value_compare<std::string,std::__value_type<std::string,int>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,int>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(v4 + 16, __p, (long long **)&v31)+ 14) = v26;
    }
    else
    {
      long long v31 = __p;
      *((_DWORD *)std::__tree<std::__value_type<std::string,int>,std::__map_value_compare<std::string,std::__value_type<std::string,int>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,int>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(v4 + 16, __p, (long long **)&v31)+ 14) = -1;
    }

    if (v30 < 0) {
      operator delete(__p[0]);
    }

    ++v6;
  }
}

- (NSDictionary)shapeJson
{
  return self->_shapeJson;
}

- (NSArray)layerInfos
{
  return self->_layerInfos;
}

@end