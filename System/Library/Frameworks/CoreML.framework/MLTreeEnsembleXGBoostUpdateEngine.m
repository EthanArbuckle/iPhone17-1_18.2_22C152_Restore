@interface MLTreeEnsembleXGBoostUpdateEngine
+ (id)loadModelFromCompiledArchive:(void *)a3 modelVersionInfo:(id)a4 compilerVersionInfo:(id)a5 configuration:(id)a6 error:(id *)a7;
- (BOOL)continueWithUpdate;
- (BOOL)personalization;
- (BOOL)setBoosterParameters:(void *)a3 error:(id *)a4;
- (BOOL)writeToURL:(id)a3 error:(id *)a4;
- (MLParameterContainer)parameterContainer;
- (MLTreeEnsembleXGBoostUpdateEngine)initWithCompiledArchive:(void *)a3 configuration:(id)a4 error:(id *)a5;
- (MLUpdateProgressHandlers)progressHandlers;
- (OS_dispatch_queue)progressHandlersDispatchQueue;
- (id).cxx_construct;
- (id)loadParameterDescriptionsAndContainerFromConfiguration:(id)a3 modelDescription:(id)a4 error:(id *)a5;
- (id)parameterValueForKey:(id)a3;
- (id)parameterValueForKey:(id)a3 error:(id *)a4;
- (id)updateParameters;
- (shared_ptr<Archiver::MMappedFile>)mmappedModel;
- (unint64_t)numDimensions;
- (vector<long)classesByInt;
- (vector<std::string,)classesByString;
- (vector<unsigned)cachedModel;
- (void)cancelUpdate;
- (void)resumeUpdate;
- (void)resumeUpdateWithParameters:(id)a3;
- (void)setCachedModel:(vector<unsigned)char;
- (void)setClassesByInt:(vector<long)long;
- (void)setClassesByString:()vector<std:(std::allocator<std::string>> *)a3 :string;
- (void)setContinueWithUpdate:(BOOL)a3;
- (void)setMmappedModel:(shared_ptr<Archiver::MMappedFile>)a3;
- (void)setNumDimensions:(unint64_t)a3;
- (void)setParameterContainer:(id)a3;
- (void)setPersonalization:(BOOL)a3;
- (void)setProgressHandlers:(id)a3;
- (void)setProgressHandlersDispatchQueue:(id)a3;
- (void)setUpdateProgressHandlers:(id)a3 dispatchQueue:(id)a4;
- (void)updateModelWithData:(id)a3;
@end

@implementation MLTreeEnsembleXGBoostUpdateEngine

- (id).cxx_construct
{
  *((void *)self + 22) = 0;
  *((void *)self + 23) = 0;
  *((void *)self + 25) = 0;
  *((void *)self + 26) = 0;
  *((void *)self + 24) = 0;
  *((void *)self + 28) = 0;
  *((void *)self + 29) = 0;
  *((void *)self + 27) = 0;
  *((void *)self + 31) = 0;
  *((void *)self + 32) = 0;
  *((void *)self + 30) = 0;
  return self;
}

- (void).cxx_destruct
{
  p_cachedModel = &self->_cachedModel;
  begin = self->_cachedModel.__begin_;
  if (begin)
  {
    p_cachedModel->__end_ = begin;
    operator delete(begin);
  }
  v5 = self->_classesByInt.__begin_;
  if (v5)
  {
    self->_classesByInt.__end_ = v5;
    operator delete(v5);
  }
  p_classesByString = &self->_classesByString;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&p_classesByString);
  cntrl = self->_mmappedModel.__cntrl_;
  if (cntrl) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)cntrl);
  }
  objc_storeStrong((id *)&self->_parameterContainer, 0);
  objc_storeStrong((id *)&self->_progressHandlersDispatchQueue, 0);
  objc_storeStrong((id *)&self->_progressHandlers, 0);
}

- (void)setCachedModel:(vector<unsigned)char
{
  p_cachedModel = &self->_cachedModel;
  if (&self->_cachedModel != a3)
  {
    begin = a3->__begin_;
    end = a3->__end_;
    size_t v6 = end - a3->__begin_;
    value = self->_cachedModel.__end_cap_.__value_;
    v8 = p_cachedModel->__begin_;
    if (value - p_cachedModel->__begin_ >= v6)
    {
      v11 = self->_cachedModel.__end_;
      size_t v12 = v11 - v8;
      if (v11 - v8 < v6)
      {
        v13 = &begin[v12];
        if (v11 != v8)
        {
          memmove(p_cachedModel->__begin_, begin, v12);
          v8 = p_cachedModel->__end_;
        }
        if (end != v13) {
          memmove(v8, v13, end - v13);
        }
        v14 = &v8[end - v13];
        goto LABEL_21;
      }
    }
    else
    {
      if (v8)
      {
        self->_cachedModel.__end_ = v8;
        operator delete(v8);
        value = 0;
        p_cachedModel->__begin_ = 0;
        p_cachedModel->__end_ = 0;
        p_cachedModel->__end_cap_.__value_ = 0;
      }
      if ((v6 & 0x8000000000000000) != 0) {
        std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__throw_length_error[abi:ne180100]();
      }
      uint64_t v9 = 2 * (void)value;
      if (2 * (uint64_t)value <= v6) {
        uint64_t v9 = v6;
      }
      if ((unint64_t)value >= 0x3FFFFFFFFFFFFFFFLL) {
        size_t v10 = 0x7FFFFFFFFFFFFFFFLL;
      }
      else {
        size_t v10 = v9;
      }
      std::vector<unsigned char>::__vallocate[abi:ne180100](p_cachedModel, v10);
      v8 = p_cachedModel->__end_;
    }
    if (end != begin) {
      memmove(v8, begin, v6);
    }
    v14 = &v8[v6];
LABEL_21:
    p_cachedModel->__end_ = v14;
  }
}

- (vector<unsigned)cachedModel
{
  retstr->__end_ = 0;
  retstr->__end_cap_.__value_ = 0;
  retstr->__begin_ = 0;
  return (vector<unsigned char, std::allocator<unsigned char>> *)std::vector<unsigned char>::__init_with_size[abi:ne180100]<unsigned char *,unsigned char *>(retstr, self->_cachedModel.__begin_, (uint64_t)self->_cachedModel.__end_, self->_cachedModel.__end_- self->_cachedModel.__begin_);
}

- (void)setMmappedModel:(shared_ptr<Archiver::MMappedFile>)a3
{
  p_mmappedModel = &self->_mmappedModel;
  v5 = *(MMappedFile **)a3.__ptr_;
  uint64_t v4 = *((void *)a3.__ptr_ + 1);
  if (v4) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v4 + 8), 1uLL, memory_order_relaxed);
  }
  cntrl = self->_mmappedModel.__cntrl_;
  p_mmappedModel->__ptr_ = v5;
  p_mmappedModel->__cntrl_ = (__shared_weak_count *)v4;
  if (cntrl) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)cntrl);
  }
}

- (shared_ptr<Archiver::MMappedFile>)mmappedModel
{
  cntrl = self->_mmappedModel.__cntrl_;
  *v2 = self->_mmappedModel.__ptr_;
  v2[1] = (MMappedFile *)cntrl;
  if (cntrl) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = (MMappedFile *)self;
  return result;
}

- (void)setNumDimensions:(unint64_t)a3
{
  self->_numDimensions = a3;
}

- (unint64_t)numDimensions
{
  return self->_numDimensions;
}

- (void)setClassesByInt:(vector<long)long
{
  p_classesByInt = (char *)&self->_classesByInt;
  if (p_classesByInt != (char *)a3) {
    std::vector<long long>::__assign_with_size[abi:ne180100]<long long *,long long *>(p_classesByInt, (char *)a3->__begin_, (uint64_t)a3->__end_, a3->__end_ - a3->__begin_);
  }
}

- (vector<long)classesByInt
{
  retstr->__end_ = 0;
  retstr->__end_cap_.__value_ = 0;
  retstr->__begin_ = 0;
  return (vector<long long, std::allocator<long long>> *)std::vector<long long>::__init_with_size[abi:ne180100]<long long *,long long *>(retstr, self->_classesByInt.__begin_, (uint64_t)self->_classesByInt.__end_, self->_classesByInt.__end_ - self->_classesByInt.__begin_);
}

- (void)setClassesByString:()vector<std:(std::allocator<std::string>> *)a3 :string
{
  p_classesByString = &self->_classesByString;
  if (p_classesByString != a3) {
    std::vector<std::string>::__assign_with_size[abi:ne180100]<std::string*,std::string*>((uint64_t)p_classesByString, (std::string *)a3->__begin_, (long long *)a3->__end_, 0xAAAAAAAAAAAAAAABLL * (((char *)a3->__end_ - (char *)a3->__begin_) >> 3));
  }
}

- (vector<std::string,)classesByString
{
  retstr->__end_ = 0;
  retstr->__end_cap_.__value_ = 0;
  retstr->__begin_ = 0;
  return (vector<std::string, std::allocator<std::string>> *)std::vector<std::string>::__init_with_size[abi:ne180100]<std::string*,std::string*>((std::string *)retstr, (long long *)self->_classesByString.__begin_, (long long *)self->_classesByString.__end_, 0xAAAAAAAAAAAAAAABLL* (((char *)self->_classesByString.__end_- (char *)self->_classesByString.__begin_) >> 3));
}

- (void)setParameterContainer:(id)a3
{
}

- (MLParameterContainer)parameterContainer
{
  return self->_parameterContainer;
}

- (void)setPersonalization:(BOOL)a3
{
  self->_personalization = a3;
}

- (BOOL)personalization
{
  return self->_personalization;
}

- (void)setContinueWithUpdate:(BOOL)a3
{
  self->_continueWithUpdate = a3;
}

- (BOOL)continueWithUpdate
{
  return self->_continueWithUpdate;
}

- (void)setProgressHandlersDispatchQueue:(id)a3
{
}

- (OS_dispatch_queue)progressHandlersDispatchQueue
{
  return self->_progressHandlersDispatchQueue;
}

- (void)setProgressHandlers:(id)a3
{
}

- (MLUpdateProgressHandlers)progressHandlers
{
  return self->_progressHandlers;
}

- (BOOL)writeToURL:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [(MLModel *)self modelDescription];
  v8 = [v7 modelURL];
  v24[0] = 0;
  BOOL v9 = +[MLSaver copyModelAtURL:v8 toURL:v6 error:v24];
  id v10 = v24[0];

  if (!v9)
  {
    if (!a4)
    {
      BOOL v22 = 0;
      goto LABEL_12;
    }
    size_t v12 = [v6 path];
    +[MLModelErrorUtils errorWithCode:6, v10, @"Failed to copy original model files to the new destionation: %@", v12 underlyingError format];
    BOOL v22 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_11:

LABEL_12:
    return v22;
  }
  v11 = [v6 lastPathComponent];
  size_t v12 = [v11 stringByReplacingOccurrencesOfString:@".mlmodelc" withString:@".xgboost"];

  v13 = [v6 path];
  v14 = [v13 stringByAppendingPathComponent:v12];

  v15 = [(MLTreeEnsembleXGBoostClassifier *)self booster];
  id v16 = v14;
  uint64_t v17 = [v16 UTF8String];
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x2020000000;
  v18 = (uint64_t (*)(void *, uint64_t))getXGBoosterSaveModelSymbolLoc(void)::ptr;
  v29 = getXGBoosterSaveModelSymbolLoc(void)::ptr;
  if (!getXGBoosterSaveModelSymbolLoc(void)::ptr)
  {
    v24[1] = (id)MEMORY[0x1E4F143A8];
    v24[2] = (id)3221225472;
    v24[3] = ___ZL30getXGBoosterSaveModelSymbolLocv_block_invoke;
    v24[4] = &unk_1E59A51A0;
    v25 = &v26;
    v19 = (void *)XGBoostFrameworkLibrary();
    v20 = dlsym(v19, "XGBoosterSaveModel");
    *(void *)(v25[1] + 24) = v20;
    getXGBoosterSaveModelSymbolLoc(void)::ptr = *(_UNKNOWN **)(v25[1] + 24);
    v18 = (uint64_t (*)(void *, uint64_t))v27[3];
  }
  _Block_object_dispose(&v26, 8);
  if (v18)
  {
    int v21 = v18(v15, v17);
    BOOL v22 = v21 != -1;
    if (a4)
    {
      if (v21 == -1)
      {
        *a4 = +[MLModelErrorUtils updateErrorWithFormat:@"Cannot save the trained model."];
      }
    }

    goto LABEL_11;
  }
  dlerror();
  BOOL result = abort_report_np();
  __break(1u);
  return result;
}

- (void)resumeUpdateWithParameters:(id)a3
{
}

- (void)cancelUpdate
{
}

- (void)resumeUpdate
{
}

- (id)parameterValueForKey:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (![v6 hasGlobalScope]) {
    goto LABEL_3;
  }
  v7 = [(MLTreeEnsembleXGBoostUpdateEngine *)self parameterContainer];
  v8 = [v7 currentParameterValues];
  BOOL v9 = [v8 objectForKeyedSubscript:v6];

  if (!v9)
  {
LABEL_3:
    if (a4)
    {
      +[MLModelErrorUtils parameterErrorWithUnderlyingError:0, @"Updated tree ensemble classifier model does not have a parameter for requested key %@.", v6 format];
      BOOL v9 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      BOOL v9 = 0;
    }
  }

  return v9;
}

- (id)parameterValueForKey:(id)a3
{
  v3 = [(MLTreeEnsembleXGBoostUpdateEngine *)self parameterValueForKey:a3 error:0];

  return v3;
}

- (BOOL)setBoosterParameters:(void *)a3 error:(id *)a4
{
  v7 = +[MLParameterKey learningRate];
  v8 = [(MLTreeEnsembleXGBoostUpdateEngine *)self parameterValueForKey:v7];
  BOOL v9 = [v8 stringValue];

  if (v9)
  {
    id v10 = +[MLParameterKey maxDepth];
    v11 = [(MLTreeEnsembleXGBoostUpdateEngine *)self parameterValueForKey:v10];
    size_t v12 = [v11 stringValue];

    if (v12)
    {
      v13 = +[MLParameterKey numClasses];
      v14 = [(MLTreeEnsembleXGBoostUpdateEngine *)self parameterValueForKey:v13];
      v15 = [v14 stringValue];

      if (v15)
      {
        id v16 = +[MLParameterKey minChildWeight];
        uint64_t v17 = [(MLTreeEnsembleXGBoostUpdateEngine *)self parameterValueForKey:v16];
        v18 = [v17 stringValue];

        if (v18)
        {
          v19 = +[MLParameterKey objective];
          v20 = [(MLTreeEnsembleXGBoostUpdateEngine *)self parameterValueForKey:v19];

          BOOL v21 = v20 != 0;
          if (v20)
          {
            BOOL v22 = +[MLParameterKey updateType];
            v23 = [(MLTreeEnsembleXGBoostUpdateEngine *)self parameterValueForKey:v22];

            if (v23 && ![(MLTreeEnsembleXGBoostUpdateEngine *)self personalization])
            {
              v24 = +[MLLogging coreChannel];
              if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)uint64_t v26 = 0;
                _os_log_impl(&dword_19E58B000, v24, OS_LOG_TYPE_INFO, "updateType can only be used for personalization use case while the current use case is not personalization. This parameter is ignored.", v26, 2u);
              }
            }
            softLink_XGBoosterSetParam(a3, "eta", (const char *)[v9 UTF8String]);
            softLink_XGBoosterSetParam(a3, "max_depth", (const char *)[v12 UTF8String]);
            softLink_XGBoosterSetParam(a3, "num_class", (const char *)[v15 UTF8String]);
            softLink_XGBoosterSetParam(a3, "min_child_weight", (const char *)[v18 UTF8String]);
            softLink_XGBoosterSetParam(a3, "objective", (const char *)[v20 UTF8String]);
            if ([(MLTreeEnsembleXGBoostUpdateEngine *)self personalization]
              && [v23 isEqualToString:@"treeRefresh"])
            {
              softLink_XGBoosterSetParam(a3, "process_type", "update");
              softLink_XGBoosterSetParam(a3, "updater", "refresh");
            }
          }
          else if (a4)
          {
            *a4 = +[MLModelErrorUtils updateErrorWithFormat:@"objective parameter must be provided."];
          }
        }
        else if (a4)
        {
          +[MLModelErrorUtils updateErrorWithFormat:@"minChildWeight parameter must be provided."];
          BOOL v21 = 0;
          *a4 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          BOOL v21 = 0;
        }
      }
      else if (a4)
      {
        +[MLModelErrorUtils updateErrorWithFormat:@"numClasses parameter must be provided."];
        BOOL v21 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        BOOL v21 = 0;
      }
    }
    else if (a4)
    {
      +[MLModelErrorUtils updateErrorWithFormat:@"maxDepth Parameter must be provided."];
      BOOL v21 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      BOOL v21 = 0;
    }
  }
  else if (a4)
  {
    +[MLModelErrorUtils updateErrorWithFormat:@"learningRate Parameter must be provided."];
    BOOL v21 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v21 = 0;
  }

  return v21;
}

- (void)updateModelWithData:(id)a3
{
  v62[1] = *MEMORY[0x1E4F143B8];
  id v43 = a3;
  [(MLTreeEnsembleXGBoostUpdateEngine *)self setContinueWithUpdate:1];
  id v46 = 0;
  [(MLTreeEnsembleXGBoostClassifier *)self xgBoostDataFormatFromBatchProvider:v43 needLabels:1 error:&v46];
  id v4 = v46;
  if (v4)
  {
    v5 = [(MLTreeEnsembleXGBoostUpdateEngine *)self progressHandlers];
    id v6 = [(MLTreeEnsembleXGBoostUpdateEngine *)self progressHandlersDispatchQueue];
    [v5 dispatchTrainingCompletionHandlerWithError:v4 onQueue:v6];

    goto LABEL_34;
  }
  v7 = [(MLTreeEnsembleXGBoostUpdateEngine *)self progressHandlers];
  BOOL v8 = ([v7 interestedEvents] & 1) == 0;

  if (!v8)
  {
    BOOL v9 = [(MLTreeEnsembleXGBoostUpdateEngine *)self progressHandlers];
    id v10 = [(MLTreeEnsembleXGBoostUpdateEngine *)self updateParameters];
    v11 = [(MLTreeEnsembleXGBoostUpdateEngine *)self progressHandlersDispatchQueue];
    [v9 dispatchTrainingBeginProgressHandlerWithMetrics:MEMORY[0x1E4F1CC08] parameters:v10 onQueue:v11];
  }
  v62[0] = 0;
  size_t v12 = v47;
  uint64_t v13 = v51;
  uint64_t v14 = v52;
  uint64_t v58 = 0;
  v59 = &v58;
  uint64_t v60 = 0x2020000000;
  v15 = (void (*)(void *, uint64_t, uint64_t, uint64_t *, float))getXGDMatrixCreateFromMatSymbolLoc(void)::ptr;
  v61 = getXGDMatrixCreateFromMatSymbolLoc(void)::ptr;
  if (!getXGDMatrixCreateFromMatSymbolLoc(void)::ptr)
  {
    uint64_t v53 = MEMORY[0x1E4F143A8];
    uint64_t v54 = 3221225472;
    v55 = ___ZL34getXGDMatrixCreateFromMatSymbolLocv_block_invoke_25738;
    v56 = &unk_1E59A51A0;
    v57 = &v58;
    id v16 = (void *)XGBoostFrameworkLibrary();
    uint64_t v17 = dlsym(v16, "XGDMatrixCreateFromMat");
    *(void *)(v57[1] + 24) = v17;
    getXGDMatrixCreateFromMatSymbolLoc(void)::ptr = *(_UNKNOWN **)(v57[1] + 24);
    v15 = (void (*)(void *, uint64_t, uint64_t, uint64_t *, float))v59[3];
  }
  _Block_object_dispose(&v58, 8);
  if (!v15) {
    goto LABEL_40;
  }
  v15(v12, v13, v14, v62, -1.0);
  uint64_t v18 = v62[0];
  v19 = __p;
  uint64_t v20 = v51;
  uint64_t v58 = 0;
  v59 = &v58;
  uint64_t v60 = 0x2020000000;
  BOOL v21 = (void (*)(uint64_t, const char *, void *, uint64_t))getXGDMatrixSetFloatInfoSymbolLoc(void)::ptr;
  v61 = getXGDMatrixSetFloatInfoSymbolLoc(void)::ptr;
  if (!getXGDMatrixSetFloatInfoSymbolLoc(void)::ptr)
  {
    uint64_t v53 = MEMORY[0x1E4F143A8];
    uint64_t v54 = 3221225472;
    v55 = ___ZL33getXGDMatrixSetFloatInfoSymbolLocv_block_invoke;
    v56 = &unk_1E59A51A0;
    v57 = &v58;
    BOOL v22 = (void *)XGBoostFrameworkLibrary();
    v23 = dlsym(v22, "XGDMatrixSetFloatInfo");
    *(void *)(v57[1] + 24) = v23;
    getXGDMatrixSetFloatInfoSymbolLoc(void)::ptr = *(_UNKNOWN **)(v57[1] + 24);
    BOOL v21 = (void (*)(uint64_t, const char *, void *, uint64_t))v59[3];
  }
  _Block_object_dispose(&v58, 8);
  if (!v21) {
    goto LABEL_40;
  }
  v21(v18, "label", v19, v20);
  if (![(MLTreeEnsembleXGBoostClassifier *)self booster])
  {
    uint64_t v45 = 0;
    uint64_t v58 = 0;
    v59 = &v58;
    uint64_t v60 = 0x2020000000;
    v24 = (void (*)(uint64_t *, uint64_t, uint64_t *))getXGBoosterCreateSymbolLoc(void)::ptr;
    v61 = getXGBoosterCreateSymbolLoc(void)::ptr;
    if (!getXGBoosterCreateSymbolLoc(void)::ptr)
    {
      uint64_t v53 = MEMORY[0x1E4F143A8];
      uint64_t v54 = 3221225472;
      v55 = ___ZL27getXGBoosterCreateSymbolLocv_block_invoke_25742;
      v56 = &unk_1E59A51A0;
      v57 = &v58;
      v25 = (void *)XGBoostFrameworkLibrary();
      uint64_t v26 = dlsym(v25, "XGBoosterCreate");
      *(void *)(v57[1] + 24) = v26;
      getXGBoosterCreateSymbolLoc(void)::ptr = *(_UNKNOWN **)(v57[1] + 24);
      v24 = (void (*)(uint64_t *, uint64_t, uint64_t *))v59[3];
    }
    _Block_object_dispose(&v58, 8);
    if (v24)
    {
      v24(v62, 1, &v45);
      [(MLTreeEnsembleXGBoostClassifier *)self setBooster:v45];
      goto LABEL_17;
    }
LABEL_40:
    dlerror();
    abort_report_np();
LABEL_41:
    __break(1u);
  }
  [(MLTreeEnsembleXGBoostUpdateEngine *)self setPersonalization:1];
LABEL_17:
  if ([(MLTreeEnsembleXGBoostClassifier *)self booster])
  {
    v27 = 0;
  }
  else
  {
    softLink_XGDMatrixFree(v62[0]);
    v27 = +[MLModelErrorUtils updateErrorWithFormat:@"Cannot create update instance."];
    uint64_t v28 = [(MLTreeEnsembleXGBoostUpdateEngine *)self progressHandlers];
    v29 = [(MLTreeEnsembleXGBoostUpdateEngine *)self progressHandlersDispatchQueue];
    [v28 dispatchTrainingCompletionHandlerWithError:v27 onQueue:v29];
  }
  id v44 = v27;
  BOOL v30 = [(MLTreeEnsembleXGBoostUpdateEngine *)self setBoosterParameters:[(MLTreeEnsembleXGBoostClassifier *)self booster] error:&v44];
  id v4 = v44;

  if (!v30)
  {
    v40 = [(MLTreeEnsembleXGBoostUpdateEngine *)self progressHandlers];
    v41 = [(MLTreeEnsembleXGBoostUpdateEngine *)self progressHandlersDispatchQueue];
    [v40 dispatchTrainingCompletionHandlerWithError:v4 onQueue:v41];
    goto LABEL_33;
  }
  v31 = +[MLParameterKey numTrees];
  v32 = [(MLTreeEnsembleXGBoostUpdateEngine *)self parameterValueForKey:v31];
  int v33 = [v32 unsignedIntValue];

  if (!v33)
  {
    uint64_t v42 = +[MLModelErrorUtils updateErrorWithFormat:@"numTrees Parameter must be provided and it should be > 1."];

    v40 = [(MLTreeEnsembleXGBoostUpdateEngine *)self progressHandlers];
    v41 = [(MLTreeEnsembleXGBoostUpdateEngine *)self progressHandlersDispatchQueue];
    [v40 dispatchTrainingCompletionHandlerWithError:v42 onQueue:v41];
    goto LABEL_32;
  }
  uint64_t v34 = 0;
  while (1)
  {
    v35 = [(MLTreeEnsembleXGBoostClassifier *)self booster];
    uint64_t v36 = v62[0];
    uint64_t v58 = 0;
    v59 = &v58;
    uint64_t v60 = 0x2020000000;
    v37 = (unsigned int (*)(void *, uint64_t, uint64_t))getXGBoosterUpdateOneIterSymbolLoc(void)::ptr;
    v61 = getXGBoosterUpdateOneIterSymbolLoc(void)::ptr;
    if (!getXGBoosterUpdateOneIterSymbolLoc(void)::ptr)
    {
      uint64_t v53 = MEMORY[0x1E4F143A8];
      uint64_t v54 = 3221225472;
      v55 = ___ZL34getXGBoosterUpdateOneIterSymbolLocv_block_invoke;
      v56 = &unk_1E59A51A0;
      v57 = &v58;
      v38 = (void *)XGBoostFrameworkLibrary();
      v39 = dlsym(v38, "XGBoosterUpdateOneIter");
      *(void *)(v57[1] + 24) = v39;
      getXGBoosterUpdateOneIterSymbolLoc(void)::ptr = *(_UNKNOWN **)(v57[1] + 24);
      v37 = (unsigned int (*)(void *, uint64_t, uint64_t))v59[3];
    }
    _Block_object_dispose(&v58, 8);
    if (!v37)
    {
      dlerror();
      abort_report_np();
      goto LABEL_41;
    }
    if (v37(v35, v34, v36) == -1) {
      break;
    }
    if (v33 == ++v34)
    {
      softLink_XGDMatrixFree(v62[0]);
      v40 = [(MLTreeEnsembleXGBoostUpdateEngine *)self progressHandlers];
      v41 = [(MLTreeEnsembleXGBoostUpdateEngine *)self progressHandlersDispatchQueue];
      [v40 dispatchTrainingCompletionHandlerWithMetrics:MEMORY[0x1E4F1CC08] parameters:MEMORY[0x1E4F1CC08] onQueue:v41];
      goto LABEL_33;
    }
  }
  softLink_XGDMatrixFree(v62[0]);
  uint64_t v42 = +[MLModelErrorUtils updateErrorWithFormat:@"Failed to train at iteration number: %lu", v34];

  v40 = [(MLTreeEnsembleXGBoostUpdateEngine *)self progressHandlers];
  v41 = [(MLTreeEnsembleXGBoostUpdateEngine *)self progressHandlersDispatchQueue];
  [v40 dispatchTrainingCompletionHandlerWithError:v42 onQueue:v41];
LABEL_32:
  id v4 = (id)v42;
LABEL_33:

LABEL_34:
  if (__p)
  {
    v50 = __p;
    operator delete(__p);
  }
  if (v47)
  {
    v48 = v47;
    operator delete(v47);
  }
}

- (void)setUpdateProgressHandlers:(id)a3 dispatchQueue:(id)a4
{
  id v7 = a3;
  id v6 = a4;
  [(MLTreeEnsembleXGBoostUpdateEngine *)self setProgressHandlers:v7];
  [(MLTreeEnsembleXGBoostUpdateEngine *)self setProgressHandlersDispatchQueue:v6];
}

- (id)updateParameters
{
  v2 = [(MLTreeEnsembleXGBoostUpdateEngine *)self parameterContainer];
  v3 = [v2 currentParameterValues];

  return v3;
}

- (id)loadParameterDescriptionsAndContainerFromConfiguration:(id)a3 modelDescription:(id)a4 error:(id *)a5
{
  uint64_t v98 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v84 = a4;
  id v7 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
  BOOL v8 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
  long long v93 = 0u;
  long long v94 = 0u;
  long long v91 = 0u;
  long long v92 = 0u;
  id obj = [v6 parameters];
  uint64_t v9 = [obj countByEnumeratingWithState:&v91 objects:v97 count:16];
  if (v9)
  {
    uint64_t v86 = *(void *)v92;
    while (2)
    {
      uint64_t v87 = v9;
      for (uint64_t i = 0; i != v87; ++i)
      {
        if (*(void *)v92 != v86) {
          objc_enumerationMutation(obj);
        }
        v11 = *(void **)(*((void *)&v91 + 1) + 8 * i);
        size_t v12 = [v11 name];
        uint64_t v13 = +[MLParameterKey learningRate];
        uint64_t v14 = [v13 name];
        int v15 = [v12 isEqualToString:v14];

        if (v15)
        {
          CoreML::Specification::DoubleParameter::DoubleParameter((CoreML::Specification::DoubleParameter *)&v88);
          id v16 = [v6 parameters];
          uint64_t v17 = [v16 objectForKeyedSubscript:v11];
          [v17 floatValue];
          *(double *)v90 = v18;

          v19 = +[MLParameterKey learningRate];
          uint64_t v20 = +[MLParameterDescription parameterDescriptionForKey:v19 doubleParameterSpec:&v88];
          [v8 addObject:v20];

          BOOL v21 = +[MLParameterKey learningRate];
          [v7 addObject:v21];

          CoreML::Specification::DoubleParameter::~DoubleParameter((CoreML::Specification::DoubleParameter *)&v88);
        }
        BOOL v22 = [v11 name];
        v23 = +[MLParameterKey maxDepth];
        v24 = [v23 name];
        int v25 = [v22 isEqualToString:v24];

        if (v25)
        {
          CoreML::Specification::Int64Parameter::Int64Parameter((CoreML::Specification::Int64Parameter *)&v88);
          uint64_t v26 = [v6 parameters];
          v27 = [v26 objectForKeyedSubscript:v11];
          v90[0] = (long long *)(int)[v27 intValue];

          uint64_t v28 = +[MLParameterKey maxDepth];
          v29 = +[MLParameterDescription parameterDescriptionForKey:v28 int64ParameterSpec:&v88];
          [v8 addObject:v29];

          BOOL v30 = +[MLParameterKey maxDepth];
          [v7 addObject:v30];

          CoreML::Specification::Int64Parameter::~Int64Parameter((CoreML::Specification::Int64Parameter *)&v88);
        }
        v31 = [v11 name];
        v32 = +[MLParameterKey minChildWeight];
        int v33 = [v32 name];
        int v34 = [v31 isEqualToString:v33];

        if (v34)
        {
          CoreML::Specification::DoubleParameter::DoubleParameter((CoreML::Specification::DoubleParameter *)&v88);
          v35 = [v6 parameters];
          uint64_t v36 = [v35 objectForKeyedSubscript:v11];
          [v36 floatValue];
          *(double *)v90 = v37;

          v38 = +[MLParameterKey minChildWeight];
          v39 = +[MLParameterDescription parameterDescriptionForKey:v38 doubleParameterSpec:&v88];
          [v8 addObject:v39];

          v40 = +[MLParameterKey minChildWeight];
          [v7 addObject:v40];

          CoreML::Specification::DoubleParameter::~DoubleParameter((CoreML::Specification::DoubleParameter *)&v88);
        }
        v41 = [v11 name];
        uint64_t v42 = +[MLParameterKey numClasses];
        id v43 = [v42 name];
        int v44 = [v41 isEqualToString:v43];

        if (v44)
        {
          CoreML::Specification::Int64Parameter::Int64Parameter((CoreML::Specification::Int64Parameter *)&v88);
          uint64_t v45 = [v6 parameters];
          id v46 = [v45 objectForKeyedSubscript:v11];
          v90[0] = (long long *)(int)[v46 intValue];

          v47 = +[MLParameterKey numClasses];
          v48 = +[MLParameterDescription parameterDescriptionForKey:v47 int64ParameterSpec:&v88];
          [v8 addObject:v48];

          v49 = +[MLParameterKey numClasses];
          [v7 addObject:v49];

          CoreML::Specification::Int64Parameter::~Int64Parameter((CoreML::Specification::Int64Parameter *)&v88);
        }
        v50 = [v11 name];
        uint64_t v51 = +[MLParameterKey numTrees];
        uint64_t v52 = [v51 name];
        int v53 = [v50 isEqualToString:v52];

        if (v53)
        {
          CoreML::Specification::Int64Parameter::Int64Parameter((CoreML::Specification::Int64Parameter *)&v88);
          uint64_t v54 = [v6 parameters];
          v55 = [v54 objectForKeyedSubscript:v11];
          v90[0] = (long long *)(int)[v55 intValue];

          v56 = +[MLParameterKey numTrees];
          v57 = +[MLParameterDescription parameterDescriptionForKey:v56 int64ParameterSpec:&v88];
          [v8 addObject:v57];

          uint64_t v58 = +[MLParameterKey numTrees];
          [v7 addObject:v58];

          CoreML::Specification::Int64Parameter::~Int64Parameter((CoreML::Specification::Int64Parameter *)&v88);
        }
        v59 = [v11 name];
        uint64_t v60 = +[MLParameterKey objective];
        v61 = [v60 name];
        int v62 = [v59 isEqualToString:v61];

        if (v62)
        {
          CoreML::Specification::StringParameter::StringParameter((CoreML::Specification::StringParameter *)&v88);
          v63 = [v6 parameters];
          v64 = [v63 objectForKeyedSubscript:v11];

          if (([v64 isEqualToString:@"multi:softprob"] & 1) == 0
            && ([v64 isEqualToString:@"binary:logistic"] & 1) == 0)
          {
            if (a5)
            {
              *a5 = +[MLModelErrorUtils updateErrorWithFormat:@"Objective must be either multi:softprob or binary:logistic."];
            }

            goto LABEL_37;
          }
          id v65 = v64;
          std::string::basic_string[abi:ne180100]<0>(&__p, (char *)[v65 UTF8String]);
          *(void *)&double v66 = google::protobuf::internal::ArenaStringPtr::SetNoArena(v90, &__p).n128_u64[0];
          if (v96 < 0) {
            operator delete((void *)__p.n128_u64[0]);
          }
          v67 = +[MLParameterKey objective];
          v68 = +[MLParameterDescription parameterDescriptionForKey:v67 stringParameterSpec:&v88];
          [v8 addObject:v68];

          v69 = +[MLParameterKey objective];
          [v7 addObject:v69];

          v88 = off_1EF0D11F0;
          google::protobuf::internal::MapTypeHandler<(google::protobuf::internal::WireFormatLite::FieldType)9,std::string>::DeleteNoArena((uint64_t)v90[0]);
          google::protobuf::internal::InternalMetadataWithArenaBase<std::string,google::protobuf::internal::InternalMetadataWithArenaLite>::~InternalMetadataWithArenaBase(&v89);
        }
        v70 = [v11 name];
        v71 = +[MLParameterKey updateType];
        v72 = [v71 name];
        int v73 = [v70 isEqualToString:v72];

        if (v73)
        {
          CoreML::Specification::StringParameter::StringParameter((CoreML::Specification::StringParameter *)&v88);
          v74 = [v6 parameters];
          v75 = [v74 objectForKeyedSubscript:v11];

          if (([v75 isEqualToString:@"treeRefresh"] & 1) == 0
            && ([v75 isEqualToString:@"treeAddition"] & 1) == 0)
          {
            if (a5)
            {
              *a5 = +[MLModelErrorUtils updateErrorWithFormat:@"Update type must be either %@ or %@.", @"treeRefresh", @"treeAddition"];
            }

LABEL_37:
            v88 = off_1EF0D11F0;
            google::protobuf::internal::MapTypeHandler<(google::protobuf::internal::WireFormatLite::FieldType)9,std::string>::DeleteNoArena((uint64_t)v90[0]);
            google::protobuf::internal::InternalMetadataWithArenaBase<std::string,google::protobuf::internal::InternalMetadataWithArenaLite>::~InternalMetadataWithArenaBase(&v89);
            v81 = 0;
            goto LABEL_38;
          }
          id v76 = v75;
          std::string::basic_string[abi:ne180100]<0>(&__p, (char *)[v76 UTF8String]);
          *(void *)&double v77 = google::protobuf::internal::ArenaStringPtr::SetNoArena(v90, &__p).n128_u64[0];
          if (v96 < 0) {
            operator delete((void *)__p.n128_u64[0]);
          }
          v78 = +[MLParameterKey updateType];
          v79 = +[MLParameterDescription parameterDescriptionForKey:v78 stringParameterSpec:&v88];
          [v8 addObject:v79];

          v80 = +[MLParameterKey updateType];
          [v7 addObject:v80];

          v88 = off_1EF0D11F0;
          google::protobuf::internal::MapTypeHandler<(google::protobuf::internal::WireFormatLite::FieldType)9,std::string>::DeleteNoArena((uint64_t)v90[0]);
          google::protobuf::internal::InternalMetadataWithArenaBase<std::string,google::protobuf::internal::InternalMetadataWithArenaLite>::~InternalMetadataWithArenaBase(&v89);
        }
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v91 objects:v97 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }

  +[MLParameterUtils appendParameterDescriptions:v8 toModelDescription:v84];
  id obj = [v84 parameterDescriptionsByKey];
  v81 = +[MLParameterContainer parameterContainerFor:v7 descriptions:obj];
LABEL_38:

  return v81;
}

- (MLTreeEnsembleXGBoostUpdateEngine)initWithCompiledArchive:(void *)a3 configuration:(id)a4 error:(id *)a5
{
  id v8 = a4;
  [v8 setComputeUnits:0];
  id v9 = [(MLModel *)[MLTreeEnsembleXGBoostUpdateEngine alloc] initInterfaceAndMetadataWithCompiledArchive:a3 error:a5];
  if (v9)
  {
    id v10 = (std::__shared_weak_count *)*((void *)a3 + 1);
    uint64_t v39 = *(void *)a3;
    v40 = v10;
    if (v10) {
      atomic_fetch_add_explicit(&v10->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    std::map<std::string,IArchive>::map[abi:ne180100]((uint64_t)v41, (void *)a3 + 2);
    uint64_t v11 = operator>><unsigned char>((uint64_t)&v39, (void *)v9 + 30);
    if (*((void *)v9 + 30) == *((void *)v9 + 31))
    {
      memset(&__p, 0, sizeof(__p));
      operator>>(v11, &__p);
      IArchive::blob(&v35, v39, (uint64_t)&__p);
      (*(void (**)(long long *__return_ptr))(*(void *)v35 + 24))(&v37);
      long long v12 = v37;
      long long v37 = 0uLL;
      uint64_t v13 = (std::__shared_weak_count *)*((void *)v9 + 23);
      *((_OWORD *)v9 + 11) = v12;
      if (v13) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v13);
      }
      if (*((void *)&v37 + 1)) {
        std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&v37 + 1));
      }
      if (v36) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v36);
      }
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(__p.__r_.__value_.__l.__data_);
      }
    }
    uint64_t v14 = operator>>((uint64_t)&v39);
    uint64_t v15 = operator>><std::string>(v14, (std::vector<std::string> *)v9 + 8);
    operator>><long long>(v15, (char **)v9 + 27);
    id v16 = (void *)MEMORY[0x1E4F1CB10];
    uint64_t v17 = NSString;
    if (*(char *)(v39 + 31) < 0)
    {
      std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)(v39 + 8), *(void *)(v39 + 16));
    }
    else
    {
      long long v18 = *(_OWORD *)(v39 + 8);
      __p.__r_.__value_.__r.__words[2] = *(void *)(v39 + 24);
      *(_OWORD *)&__p.__r_.__value_.__l.__data_ = v18;
    }
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      p_p = &__p;
    }
    else {
      p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
    }
    BOOL v22 = [v17 stringWithUTF8String:p_p];
    v23 = [v16 fileURLWithPath:v22];

    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p.__r_.__value_.__l.__data_);
    }
    v24 = [v9 modelDescription];
    [v9 classesByString];
    [v9 classesByInt];
    v32.receiver = self;
    v32.super_class = (Class)MLTreeEnsembleXGBoostUpdateEngine;
    int v25 = [(MLTreeEnsembleXGBoostClassifier *)&v32 initWithDescription:v24 configuration:v8 indexToStringLabelArray:v34 indexToIntLabelArray:v33 modelURL:v23 error:a5];
    if (v33[0])
    {
      v33[1] = v33[0];
      operator delete(v33[0]);
    }
    __p.__r_.__value_.__r.__words[0] = (std::string::size_type)v34;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&__p);

    if (v25)
    {
      uint64_t v26 = [v9 modelDescription];
      id v31 = 0;
      uint64_t v27 = [(MLTreeEnsembleXGBoostUpdateEngine *)v25 loadParameterDescriptionsAndContainerFromConfiguration:v8 modelDescription:v26 error:&v31];
      id v19 = v31;
      parameterContainer = v25->_parameterContainer;
      v25->_parameterContainer = (MLParameterContainer *)v27;

      if (v25->_parameterContainer)
      {
        uint64_t v20 = v25;
        goto LABEL_37;
      }
      if (a5)
      {
        id v29 = +[MLModelErrorUtils errorWithCode:6 underlyingError:v19 format:@"Error in initalizing model parameters."];
        goto LABEL_32;
      }
    }
    else
    {
      if (a5)
      {
        id v29 = +[MLModelErrorUtils updateErrorWithFormat:@"Error in initalizing update Engine for compiled archive."];
        id v19 = 0;
LABEL_32:
        uint64_t v20 = 0;
        *a5 = v29;
        goto LABEL_37;
      }
      id v19 = 0;
    }
    uint64_t v20 = 0;
LABEL_37:

    std::__tree<std::__value_type<std::string,IArchive>,std::__map_value_compare<std::string,std::__value_type<std::string,IArchive>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,IArchive>>>::destroy(v41[1]);
    if (v40) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v40);
    }
    goto LABEL_39;
  }
  if (a5)
  {
    +[MLModelErrorUtils updateErrorWithFormat:@"Error in initalizing model interface."];
    id v19 = 0;
    uint64_t v20 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v19 = 0;
    uint64_t v20 = 0;
  }
  int v25 = self;
LABEL_39:

  return v20;
}

+ (id)loadModelFromCompiledArchive:(void *)a3 modelVersionInfo:(id)a4 compilerVersionInfo:(id)a5 configuration:(id)a6 error:(id *)a7
{
  id v11 = a5;
  id v12 = a6;
  uint64_t v13 = +[MLVersionInfo versionInfoWithMajor:1 minor:0 patch:0 variant:@"generic"];
  uint64_t v14 = [v13 majorVersion];
  if (v14 >= [v11 majorVersion])
  {
    a7 = (id *)[objc_alloc((Class)a1) initWithCompiledArchive:a3 configuration:v12 error:a7];
  }
  else if (a7)
  {
    uint64_t v15 = [v11 versionNumberString];
    id v16 = [v13 versionNumberString];
    *a7 = +[MLModelErrorUtils genericErrorWithFormat:@"compiler major version for compiled model is %@ and is more recent than this framework major version %@.", v15, v16];

    a7 = 0;
  }

  return a7;
}

@end