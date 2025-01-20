@interface MLPipelineUpdateEngine
+ (id)loadModelFromCompiledArchive:(void *)a3 modelVersionInfo:(id)a4 compilerVersionInfo:(id)a5 configuration:(id)a6 error:(id *)a7;
- (BOOL)writeToURL:(id)a3 error:(id *)a4;
- (MLUpdateProgressHandlers)progressHandlers;
- (OS_dispatch_queue)dispatchQueue;
- (id).cxx_construct;
- (id)initFromCompiledArchive:(void *)a3 modelVersionInfo:(id)a4 compilerVersionInfo:(id)a5 configuration:(id)a6 error:(id *)a7;
- (id)parameterValueForKey:(id)a3 error:(id *)a4;
- (vector<unsigned)updatableModelIndicies;
- (void)cancelUpdate;
- (void)resumeUpdate;
- (void)resumeUpdateWithParameters:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setProgressHandlers:(id)a3;
- (void)setUpdateProgressHandlers:(id)a3 dispatchQueue:(id)a4;
- (void)updateModelWithData:(id)a3;
@end

@implementation MLPipelineUpdateEngine

- (id).cxx_construct
{
  *((void *)self + 9) = 0;
  *((void *)self + 10) = 0;
  *((void *)self + 8) = 0;
  return self;
}

- (void).cxx_destruct
{
  p_updatableModelIndicies = &self->_updatableModelIndicies;
  begin = self->_updatableModelIndicies.__begin_;
  if (begin)
  {
    p_updatableModelIndicies->__end_ = begin;
    operator delete(begin);
  }
  objc_storeStrong((id *)&self->_dispatchQueue, 0);

  objc_storeStrong((id *)&self->_progressHandlers, 0);
}

- (void)setDispatchQueue:(id)a3
{
}

- (OS_dispatch_queue)dispatchQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 56, 1);
}

- (void)setProgressHandlers:(id)a3
{
}

- (MLUpdateProgressHandlers)progressHandlers
{
  return (MLUpdateProgressHandlers *)objc_getProperty(self, a2, 48, 1);
}

- (vector<unsigned)updatableModelIndicies
{
  objc_copyCppObjectAtomic(retstr, &self->_updatableModelIndicies, (void (__cdecl *)(void *, const void *))__copy_helper_atomic_property_);
  return result;
}

- (id)parameterValueForKey:(id)a3 error:(id *)a4
{
  v6.receiver = self;
  v6.super_class = (Class)MLPipelineUpdateEngine;
  v4 = [(MLPipeline *)&v6 parameterValueForKey:a3 error:a4];

  return v4;
}

- (BOOL)writeToURL:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v27 = [MEMORY[0x1E4F28CB8] defaultManager];
  v28.receiver = self;
  v28.super_class = (Class)MLPipelineUpdateEngine;
  if ([(MLPipeline *)&v28 writeToURL:v6 error:a4])
  {
    unint64_t v7 = 0x1E4F29000uLL;
    v8 = NSString;
    id v25 = v6;
    v26 = objc_msgSend(v8, "stringWithUTF8String:", objc_msgSend(v25, "fileSystemRepresentation"));
    begin = self->_updatableModelIndicies.__begin_;
    end = self->_updatableModelIndicies.__end_;
    if (begin == end)
    {
      char v20 = 1;
    }
    else
    {
      id v23 = v6;
      v24 = a4;
      v11 = begin + 1;
      do
      {
        uint64_t v12 = *(v11 - 1);
        v13 = objc_msgSend(*(id *)(v7 + 24), "stringWithFormat:", @"model%llu", v12);
        unint64_t v14 = v7;
        v15 = [*(id *)(v7 + 24) stringWithFormat:@"%@/%@", v26, v13];
        [v27 removeItemAtPath:v15 error:0];
        v16 = [v25 URLByAppendingPathComponent:v13];
        v17 = self;
        v18 = [(MLPipeline *)self models];
        v19 = [v18 objectAtIndexedSubscript:v12];
        char v20 = [v19 writeToURL:v16 error:v24];

        if (v11 == end) {
          char v21 = 0;
        }
        else {
          char v21 = v20;
        }
        ++v11;
        self = v17;
        unint64_t v7 = v14;
      }
      while ((v21 & 1) != 0);
      id v6 = v23;
    }
  }
  else
  {
    char v20 = 0;
  }

  return v20;
}

- (void)cancelUpdate
{
  begin = self->_updatableModelIndicies.__begin_;
  for (i = self->_updatableModelIndicies.__end_; begin != i; ++begin)
  {
    unint64_t v5 = *begin;
    id v6 = [(MLPipeline *)self models];
    unint64_t v7 = [v6 objectAtIndexedSubscript:v5];
    [v7 cancelUpdate];
  }
}

- (void)resumeUpdateWithParameters:(id)a3
{
  id v12 = a3;
  begin = self->_updatableModelIndicies.__begin_;
  for (i = self->_updatableModelIndicies.__end_; begin != i; ++begin)
  {
    unint64_t v6 = *begin;
    unint64_t v7 = [(MLPipeline *)self modelNames];
    v8 = [v7 objectAtIndexedSubscript:v6];

    v9 = +[MLParameterUtils deScopeParameters:v12 byDeletingPrefixingScope:v8];
    v10 = [(MLPipeline *)self models];
    v11 = [v10 objectAtIndexedSubscript:v6];
    [v11 resumeUpdateWithParameters:v9];
  }
}

- (void)resumeUpdate
{
  begin = self->_updatableModelIndicies.__begin_;
  for (i = self->_updatableModelIndicies.__end_; begin != i; ++begin)
  {
    unint64_t v5 = *begin;
    unint64_t v6 = [(MLPipeline *)self models];
    unint64_t v7 = [v6 objectAtIndexedSubscript:v5];
    [v7 resumeUpdate];
  }
}

- (void)updateModelWithData:(id)a3
{
  id v4 = a3;
  unint64_t v5 = v4;
  p_updatableModelIndicies = &self->_updatableModelIndicies;
  begin = self->_updatableModelIndicies.__begin_;
  end = self->_updatableModelIndicies.__end_;
  v9 = begin + 1;
  if (begin != end && v9 != end)
  {
    unint64_t v11 = *begin;
    id v12 = begin + 1;
    do
    {
      unint64_t v14 = *v12++;
      unint64_t v13 = v14;
      BOOL v15 = v11 >= v14;
      if (v11 <= v14) {
        unint64_t v11 = v13;
      }
      if (!v15) {
        begin = v9;
      }
      v9 = v12;
    }
    while (v12 != end);
  }
  id v16 = 0;
  uint64_t v17 = 0;
  unint64_t v18 = *begin;
  v31 = v4;
  while (1)
  {
    char v20 = p_updatableModelIndicies->__begin_;
    v19 = self->_updatableModelIndicies.__end_;
    if (p_updatableModelIndicies->__begin_ != v19)
    {
      while (*v20 != v17)
      {
        if (++v20 == v19)
        {
          char v20 = self->_updatableModelIndicies.__end_;
          break;
        }
      }
    }
    if (v20 != v19)
    {
      char v21 = [(MLPipeline *)self models];
      v22 = [v21 objectAtIndexedSubscript:v17];
      [v22 updateModelWithData:v5];
    }
    if (v17 == v18) {
      goto LABEL_21;
    }
    id v23 = [(MLPipeline *)self models];
    v24 = [v23 objectAtIndexedSubscript:v17];
    id v33 = v16;
    id v25 = [v24 predictionsFromBatch:v5 error:&v33];
    id v26 = v33;

    if (v26) {
      break;
    }
    id v32 = 0;
    uint64_t v27 = +[MLBatchProviderUtils lazyBatchWithFeaturesInBatch:v25 addedToBatch:v5 error:&v32];
    id v16 = v32;

    unint64_t v5 = (void *)v27;
LABEL_21:
    if (++v17 > v18) {
      goto LABEL_24;
    }
  }
  objc_super v28 = +[MLModelErrorUtils errorWithCode:6, v26, @"Failed to carry forward results for model %llu in pipeline", v17, v31 underlyingError format];
  v29 = [(MLPipelineUpdateEngine *)self progressHandlers];
  v30 = [(MLPipelineUpdateEngine *)self dispatchQueue];
  [v29 dispatchTrainingCompletionHandlerWithError:v28 onQueue:v30];

  id v16 = v26;
LABEL_24:
}

- (void)setUpdateProgressHandlers:(id)a3 dispatchQueue:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  [(MLPipelineUpdateEngine *)self setProgressHandlers:v12];
  [(MLPipelineUpdateEngine *)self setDispatchQueue:v6];
  begin = self->_updatableModelIndicies.__begin_;
  end = self->_updatableModelIndicies.__end_;
  while (begin != end)
  {
    unint64_t v9 = *begin;
    v10 = [(MLPipeline *)self models];
    unint64_t v11 = [v10 objectAtIndexedSubscript:v9];
    [v11 setUpdateProgressHandlers:v12 dispatchQueue:v6];

    ++begin;
  }
}

- (id)initFromCompiledArchive:(void *)a3 modelVersionInfo:(id)a4 compilerVersionInfo:(id)a5 configuration:(id)a6 error:(id *)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  BOOL v15 = [[MLModelAssetDescription alloc] initWithCompiledModelArchive:a3 error:a7];
  id v16 = v15;
  if (!v15) {
    goto LABEL_55;
  }
  uint64_t v17 = [(MLModelAssetDescription *)v15 defaultModelDescription];
  v74.receiver = self;
  v74.super_class = (Class)MLPipelineUpdateEngine;
  self = [(MLPipeline *)&v74 initModelFromMetadataAndArchive:a3 versionInfo:v12 description:v17 configuration:v14 error:a7];

  if (!self) {
    goto LABEL_56;
  }
  std::string::basic_string[abi:ne180100]<0>(&v70, "updateParameters");
  char hasNestedArchive = IArchive::hasNestedArchive(a3, &v70);
  char v19 = hasNestedArchive;
  if ((v72[7] & 0x80000000) != 0)
  {
    operator delete(v70);
    if (v19)
    {
LABEL_5:
      id v54 = v13;
      id v55 = v12;
      v53 = v16;
      std::string::basic_string[abi:ne180100]<0>(&__p, "updateParameters");
      char v20 = IArchive::nestedArchive(a3, (uint64_t)&__p);
      if ((v66[7] & 0x80000000) != 0) {
        operator delete(__p);
      }
      char v21 = (std::__shared_weak_count *)*((void *)v20 + 1);
      v70 = *(void **)v20;
      v71 = v21;
      if (v21) {
        atomic_fetch_add_explicit(&v21->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      std::map<std::string,IArchive>::map[abi:ne180100]((uint64_t)v72, (void *)v20 + 2);
      unint64_t v69 = 0;
      operator>>((uint64_t)&v70);
      v57 = (void *)[v14 copy];
      if (v69)
      {
        uint64_t v22 = 0;
        id v56 = v14;
        while (1)
        {
          unint64_t v68 = 0;
          operator>>((uint64_t)&v70);
          unint64_t v23 = v68;
          v24 = [(MLPipeline *)self models];
          unint64_t v25 = [v24 count];

          if (v23 >= v25) {
            break;
          }
          std::to_string(&v63, v23);
          id v26 = std::string::insert(&v63, 0, "model");
          long long v27 = *(_OWORD *)&v26->__r_.__value_.__l.__data_;
          std::string::size_type v61 = v26->__r_.__value_.__r.__words[2];
          *(_OWORD *)v60 = v27;
          v26->__r_.__value_.__l.__size_ = 0;
          v26->__r_.__value_.__r.__words[2] = 0;
          v26->__r_.__value_.__r.__words[0] = 0;
          objc_super v28 = IArchive::nestedArchive(a3, (uint64_t)v60);
          v29 = (std::__shared_weak_count *)*((void *)v28 + 1);
          __p = *(void **)v28;
          v65 = v29;
          if (v29) {
            atomic_fetch_add_explicit(&v29->__shared_owners_, 1uLL, memory_order_relaxed);
          }
          std::map<std::string,IArchive>::map[abi:ne180100]((uint64_t)v66, (void *)v28 + 2);
          if (SHIBYTE(v61) < 0) {
            operator delete(v60[0]);
          }
          if (SHIBYTE(v63.__r_.__value_.__r.__words[2]) < 0) {
            operator delete(v63.__r_.__value_.__l.__data_);
          }
          _MLModelInputArchiver::_MLModelInputArchiver((_MLModelInputArchiver *)v60, (const IArchive *)&__p);
          IArchive::rewind((uint64_t)v60);
          v30 = [(MLPipeline *)self modelNames];
          v31 = [v30 objectAtIndexedSubscript:v23];

          id v32 = [v14 parameters];
          id v33 = +[MLParameterUtils deScopeParameters:v32 byDeletingPrefixingScope:v31];
          [v57 setParameters:v33];

          id v59 = 0;
          v34 = +[MLLoader loadUpdatableModelFromArchive:v60 configuration:v57 error:&v59];
          id v35 = v59;
          if (v34)
          {
            [(MLPipeline *)self replaceModelAtIndex:v23 with:v34];
            p_updatableModelIndicies = &self->_updatableModelIndicies;
            end = self->_updatableModelIndicies.__end_;
            value = self->_updatableModelIndicies.__end_cap_.__value_;
            if (end >= value)
            {
              begin = p_updatableModelIndicies->__begin_;
              uint64_t v41 = end - p_updatableModelIndicies->__begin_;
              unint64_t v42 = v41 + 1;
              if ((unint64_t)(v41 + 1) >> 61) {
                std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__throw_length_error[abi:ne180100]();
              }
              uint64_t v43 = (char *)value - (char *)begin;
              if (v43 >> 2 > v42) {
                unint64_t v42 = v43 >> 2;
              }
              BOOL v44 = (unint64_t)v43 >= 0x7FFFFFFFFFFFFFF8;
              unint64_t v45 = 0x1FFFFFFFFFFFFFFFLL;
              if (!v44) {
                unint64_t v45 = v42;
              }
              if (v45)
              {
                unint64_t v45 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<_KDInterval>>(v45);
                begin = p_updatableModelIndicies->__begin_;
                end = self->_updatableModelIndicies.__end_;
              }
              else
              {
                uint64_t v46 = 0;
              }
              v47 = (unint64_t *)(v45 + 8 * v41);
              unint64_t *v47 = v23;
              v39 = v47 + 1;
              while (end != begin)
              {
                unint64_t v48 = *--end;
                *--v47 = v48;
              }
              p_updatableModelIndicies->__begin_ = v47;
              self->_updatableModelIndicies.__end_ = v39;
              self->_updatableModelIndicies.__end_cap_.__value_ = (unint64_t *)(v45 + 8 * v46);
              if (begin) {
                operator delete(begin);
              }
            }
            else
            {
              unint64_t *end = v23;
              v39 = end + 1;
            }
            self->_updatableModelIndicies.__end_ = v39;
            id v14 = v56;
          }
          else if (a7)
          {
            *a7 = +[MLModelErrorUtils errorWithCode:6, v35, @"Failed to load updatable sub-model at %lu", v23 underlyingError format];
          }

          std::__tree<std::__value_type<std::string,IArchive>,std::__map_value_compare<std::string,std::__value_type<std::string,IArchive>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,IArchive>>>::destroy(v62);
          if (v60[1]) {
            std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v60[1]);
          }
          std::__tree<std::__value_type<std::string,IArchive>,std::__map_value_compare<std::string,std::__value_type<std::string,IArchive>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,IArchive>>>::destroy(v67);
          if (v65) {
            std::__shared_weak_count::__release_shared[abi:ne180100](v65);
          }

          if (!v34)
          {
            char v50 = 1;
            id v13 = v54;
            id v12 = v55;
            id v16 = v53;
            goto LABEL_51;
          }
          if (++v22 >= v69) {
            goto LABEL_43;
          }
        }
        id v13 = v54;
        id v12 = v55;
        id v16 = v53;
        if (a7)
        {
          *a7 = +[MLModelErrorUtils updateErrorWithFormat:@"Updatable model index is out of range."];
        }
        char v50 = 1;
LABEL_51:
        v49 = v57;
      }
      else
      {
LABEL_43:
        v58.receiver = self;
        v58.super_class = (Class)MLPipelineUpdateEngine;
        id v13 = v54;
        id v12 = v55;
        id v16 = v53;
        v49 = v57;
        [(MLPipeline *)&v58 updateParameterDescriptionsByKeyBasedOnSubModel];
        char v50 = 0;
      }

      std::__tree<std::__value_type<std::string,IArchive>,std::__map_value_compare<std::string,std::__value_type<std::string,IArchive>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,IArchive>>>::destroy(v73);
      if (v71) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v71);
      }
      if (v50) {
        goto LABEL_55;
      }
LABEL_56:
      self = self;
      v51 = self;
      goto LABEL_57;
    }
  }
  else if (hasNestedArchive)
  {
    goto LABEL_5;
  }
  if (!a7)
  {
LABEL_55:
    v51 = 0;
    goto LABEL_57;
  }
  +[MLModelErrorUtils updateErrorWithFormat:@"Pipeline is not marked as updatable to perform update."];
  v51 = 0;
  *a7 = (id)objc_claimAutoreleasedReturnValue();
LABEL_57:

  return v51;
}

+ (id)loadModelFromCompiledArchive:(void *)a3 modelVersionInfo:(id)a4 compilerVersionInfo:(id)a5 configuration:(id)a6 error:(id *)a7
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = [[MLPipelineUpdateEngine alloc] initFromCompiledArchive:a3 modelVersionInfo:v11 compilerVersionInfo:v12 configuration:v13 error:a7];

  return v14;
}

@end