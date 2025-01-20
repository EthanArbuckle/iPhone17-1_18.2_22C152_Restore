@interface MLE5ProgramLibrary
- (BOOL)prepareAndReturnError:(id *)a3;
- (MLE5ProgramLibrary)initWithContainer:(id)a3 configuration:(id)a4 error:(id *)a5;
- (MLE5ProgramLibrary)initWithImpl:(id)a3 container:(id)a4 configuration:(id)a5;
- (MLE5ProgramLibraryImpl)impl;
- (MLModelConfiguration)modelConfiguration;
- (MLProgramE5Container)container;
- (NSArray)functionNames;
- (NSString)modelDisplayName;
- (NSString)serializedMILText;
- (OS_dispatch_queue)lazyInitQueue;
- (e5rt_execution_stream_operation)createOperationForFunctionName:(id)a3 forceRespecialization:(BOOL)a4 hasRangeShapeInputs:(BOOL)a5 error:(id *)a6;
- (e5rt_program_library)_programLibraryHandleWithForceRespecialization:(BOOL)a3 error:(id *)a4;
- (id)_allocateStateBufferForFeatureNamed:(id)a3 entryFunctionName:(id)a4 programFunctionNames:(id)a5 error:(id *)a6;
- (id)newStateForFunctionNamed:(id)a3 stateNames:(id)a4 clientBuffers:(id)a5 error:(id *)a6;
- (id)segmentationAnalyticsAndReturnError:(id *)a3;
- (void)dealloc;
@end

@implementation MLE5ProgramLibrary

void __44__MLE5ProgramLibrary_prepareAndReturnError___block_invoke(void *a1)
{
  v2 = (void *)a1[4];
  uint64_t v3 = *(void *)(a1[5] + 8);
  id obj = *(id *)(v3 + 40);
  uint64_t v4 = [v2 _programLibraryHandleWithForceRespecialization:0 error:&obj];
  objc_storeStrong((id *)(v3 + 40), obj);
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = v4 != 0;
}

- (e5rt_program_library)_programLibraryHandleWithForceRespecialization:(BOOL)a3 error:(id *)a4
{
  BOOL v5 = a3;
  p_programLibraryHandle = &self->_programLibraryHandle;
  result = self->_programLibraryHandle;
  if (a3)
  {
    if (result)
    {
      e5rt_program_library_release();
      *p_programLibraryHandle = 0;
    }
  }
  else if (result)
  {
    return result;
  }
  v9 = [(MLE5ProgramLibrary *)self impl];
  *p_programLibraryHandle = (e5rt_program_library *)[v9 createProgramLibraryHandleWithRespecialization:v5 error:a4];

  return *p_programLibraryHandle;
}

- (MLE5ProgramLibraryImpl)impl
{
  return self->_impl;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_container, 0);
  objc_storeStrong((id *)&self->_modelConfiguration, 0);
  objc_storeStrong((id *)&self->_lazyInitQueue, 0);

  objc_storeStrong((id *)&self->_impl, 0);
}

- (BOOL)prepareAndReturnError:(id *)a3
{
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 1;
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__16;
  v14 = __Block_byref_object_dispose__17;
  id v15 = 0;
  BOOL v5 = [(MLE5ProgramLibrary *)self lazyInitQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__MLE5ProgramLibrary_prepareAndReturnError___block_invoke;
  block[3] = &unk_1E59A5228;
  block[4] = self;
  block[5] = &v10;
  block[6] = &v16;
  dispatch_sync(v5, block);

  int v6 = *((unsigned __int8 *)v17 + 24);
  if (a3 && !*((unsigned char *)v17 + 24))
  {
    *a3 = (id) v11[5];
    int v6 = *((unsigned __int8 *)v17 + 24);
  }
  BOOL v7 = v6 != 0;
  _Block_object_dispose(&v10, 8);

  _Block_object_dispose(&v16, 8);
  return v7;
}

- (OS_dispatch_queue)lazyInitQueue
{
  return self->_lazyInitQueue;
}

- (MLE5ProgramLibrary)initWithContainer:(id)a3 configuration:(id)a4 error:(id *)a5
{
  v37[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [v8 compilerOutput];

  if (!v10)
  {
    if ([v9 usePrecompiledE5Bundle])
    {
      v13 = [v8 findPrecompiledE5BundleAndReturnError:a5];
      if (!v13) {
        goto LABEL_12;
      }
      v14 = [[MLE5ProgramLibraryE5BundleImpl alloc] initWithE5BundleAtURL:v13 configuration:v9];
    }
    else
    {
      v17 = [MLE5ProgramLibraryOnDeviceAOTCompilationImpl alloc];
      v13 = [v8 URLOfMILText];
      v14 = [(MLE5ProgramLibraryOnDeviceAOTCompilationImpl *)v17 initWithMILTextAtURL:v13 container:v8 configuration:v9];
    }
    id v15 = (MLE5ProgramLibraryOnDeviceAOTCompilationImpl *)v14;

LABEL_24:
    self = [(MLE5ProgramLibrary *)self initWithImpl:v15 container:v8 configuration:v9];
    uint64_t v16 = self;
    goto LABEL_26;
  }
  if (_os_feature_enabled_impl())
  {
    uint64_t v28 = 0;
    v29 = &v28;
    uint64_t v30 = 0x4012000000;
    v31 = __Block_byref_object_copy__26116;
    v32 = __Block_byref_object_dispose__26117;
    v33 = "";
    v11 = [v8 compilerOutput];
    uint64_t v12 = v11;
    if (v11)
    {
      [v11 program];
    }
    else
    {
      uint64_t v34 = 0;
      v35 = 0;
    }

    uint64_t v18 = v29[6];
    if (v18)
    {
      char v19 = [MLE5ProgramLibraryOnDeviceAOTCompilationImpl alloc];
      uint64_t v20 = v29[6];
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __60__MLE5ProgramLibrary_initWithContainer_configuration_error___block_invoke;
      v26[3] = &unk_1E59A5200;
      v26[4] = &v28;
      id v15 = [(MLE5ProgramLibraryOnDeviceAOTCompilationImpl *)v19 initWithIRProgram:v20 container:v8 configuration:v9 deallocator:v26];
    }
    else
    {
      v21 = +[MLLogging coreChannel];
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_19E58B000, v21, OS_LOG_TYPE_ERROR, "Unable to find a MLProgram in the in-model model asset.", buf, 2u);
      }

      if (a5)
      {
        v22 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v36 = *MEMORY[0x1E4F28568];
        v23 = [NSString stringWithFormat:@"Unable to find a MLProgram in the in-model model asset."];
        v37[0] = v23;
        v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v37 forKeys:&v36 count:1];
        *a5 = [v22 errorWithDomain:@"com.apple.CoreML" code:3 userInfo:v24];
      }
      id v15 = 0;
    }
    _Block_object_dispose(&v28, 8);
    if (v35) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v35);
    }
    if (v18) {
      goto LABEL_24;
    }
LABEL_25:
    uint64_t v16 = 0;
    goto LABEL_26;
  }
  if (!a5)
  {
LABEL_12:
    id v15 = 0;
    goto LABEL_25;
  }
  +[MLModelErrorUtils genericErrorWithFormat:@"In-memory model support is disabled."];
  id v15 = 0;
  uint64_t v16 = 0;
  *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_26:

  return v16;
}

- (MLE5ProgramLibrary)initWithImpl:(id)a3 container:(id)a4 configuration:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)MLE5ProgramLibrary;
  uint64_t v12 = [(MLE5ProgramLibrary *)&v17 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_impl, a3);
    dispatch_queue_t v14 = dispatch_queue_create("com.apple.coreml.MLE5ProgramLibrary.lazyInitQueue", 0);
    lazyInitQueue = v13->_lazyInitQueue;
    v13->_lazyInitQueue = (OS_dispatch_queue *)v14;

    objc_storeStrong((id *)&v13->_container, a4);
    objc_storeStrong((id *)&v13->_modelConfiguration, a5);
  }

  return v13;
}

- (void)dealloc
{
  if (self->_programLibraryHandle) {
    e5rt_program_library_release();
  }
  v3.receiver = self;
  v3.super_class = (Class)MLE5ProgramLibrary;
  [(MLE5ProgramLibrary *)&v3 dealloc];
}

- (MLProgramE5Container)container
{
  return self->_container;
}

- (MLModelConfiguration)modelConfiguration
{
  return self->_modelConfiguration;
}

- (NSString)serializedMILText
{
  v2 = [(MLE5ProgramLibrary *)self impl];
  objc_super v3 = [v2 serializedMILText];

  return (NSString *)v3;
}

- (NSArray)functionNames
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy__16;
  id v11 = __Block_byref_object_dispose__17;
  id v12 = (id)MEMORY[0x1E4F1CBF0];
  objc_super v3 = [(MLE5ProgramLibrary *)self lazyInitQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __35__MLE5ProgramLibrary_functionNames__block_invoke;
  v6[3] = &unk_1E59A5300;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSArray *)v4;
}

void __35__MLE5ProgramLibrary_functionNames__block_invoke(uint64_t a1)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  if (!*(void *)(*(void *)(a1 + 32) + 8))
  {
    v2 = +[MLLogging coreChannel];
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_19E58B000, v2, OS_LOG_TYPE_ERROR, "MLE5ProgramLibrary must be successfully prepared before calling .functionNames property.", buf, 2u);
    }

    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"MLE5ProgramLibrary must be successfully prepared before calling .functionNames property."];
  }
  uint64_t num_functions = e5rt_program_library_get_num_functions();
  id v4 = (void *)MEMORY[0x1E4F1C3A8];
  if (num_functions)
  {
    BOOL v5 = +[MLLogging coreChannel];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v21 = [*(id *)(a1 + 32) modelDisplayName];
      uint64_t last_error_message = e5rt_get_last_error_message();
      *(_DWORD *)buf = 138412802;
      v27 = v21;
      __int16 v28 = 2080;
      uint64_t v29 = last_error_message;
      __int16 v30 = 1024;
      int v31 = num_functions;
      _os_log_error_impl(&dword_19E58B000, v5, OS_LOG_TYPE_ERROR, "Failed to get num of functions for the model: %@ E5RT: %s (%d)", buf, 0x1Cu);
    }
    int v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = [*(id *)(a1 + 32) modelDisplayName];
    [v6 raise:*v4, @"Failed to get num of functions for the model: %@ E5RT: %s (%d)", v7, e5rt_get_last_error_message(), num_functions format];
  }
  id v8 = +[MLLogging coreChannel];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    v24 = [*(id *)(a1 + 32) modelDisplayName];
    *(_DWORD *)buf = 138412290;
    v27 = v24;
    _os_log_error_impl(&dword_19E58B000, v8, OS_LOG_TYPE_ERROR, "Allocation size is too large or zero. Failed to allocate memory to get function names for the model: %@", buf, 0xCu);
  }
  uint64_t v9 = (void *)MEMORY[0x1E4F1CA00];
  id v10 = [*(id *)(a1 + 32) modelDisplayName];
  [v9 raise:*v4, @"Allocation size is too large or zero. Failed to allocate memory to get function names for the model: %@", v10 format];

  id v11 = malloc_type_malloc(0, 0x50040EE9192B6uLL);
  if (!v11)
  {
    id v12 = +[MLLogging coreChannel];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v25 = [*(id *)(a1 + 32) modelDisplayName];
      *(_DWORD *)buf = 138412290;
      v27 = v25;
      _os_log_error_impl(&dword_19E58B000, v12, OS_LOG_TYPE_ERROR, "Failed to allocate memory to get function names for the model: %@", buf, 0xCu);
    }
    v13 = (void *)MEMORY[0x1E4F1CA00];
    dispatch_queue_t v14 = [*(id *)(a1 + 32) modelDisplayName];
    [v13 raise:*v4, @"Failed to allocate memory to get function names for the model: %@", v14 format];
  }
  if (e5rt_program_library_get_function_names())
  {
    free(v11);
    id v15 = +[MLLogging coreChannel];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v23 = [*(id *)(a1 + 32) modelDisplayName];
      *(_DWORD *)buf = 138412290;
      v27 = v23;
      _os_log_error_impl(&dword_19E58B000, v15, OS_LOG_TYPE_ERROR, "Failed to get function names for the model: %@", buf, 0xCu);
    }
    uint64_t v16 = (void *)MEMORY[0x1E4F1CA00];
    objc_super v17 = [*(id *)(a1 + 32) modelDisplayName];
    [v16 raise:*v4, @"Failed to get function names for the model: %@", v17 format];
  }
  uint64_t v18 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:0];
  uint64_t v19 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v20 = *(void **)(v19 + 40);
  *(void *)(v19 + 40) = v18;

  free(v11);
}

- (id)_allocateStateBufferForFeatureNamed:(id)a3 entryFunctionName:(id)a4 programFunctionNames:(id)a5 error:(id *)a6
{
  uint64_t v250 = *MEMORY[0x1E4F143B8];
  id v171 = a3;
  id v168 = a4;
  id v167 = a5;
  uint64_t v9 = [(MLE5ProgramLibrary *)self container];
  id v10 = [v9 modelAssetDescription];
  int v11 = [v10 usesMultiFunctionSyntax];

  id v12 = [(MLE5ProgramLibrary *)self container];
  v13 = [v12 modelAssetDescription];
  if (v11) {
    [v13 modelDescriptionOfFunctionNamed:v168];
  }
  else {
  v166 = [v13 defaultModelDescription];
  }

  dispatch_queue_t v14 = [(MLE5ProgramLibrary *)self _programLibraryHandleWithForceRespecialization:0 error:a6];
  if (!v14)
  {
    v118 = 0;
    goto LABEL_254;
  }
  [(MLE5ProgramLibrary *)self container];
  v164 = uint64_t v169 = (uint64_t)v14;
  id v15 = [v164 compilerVersionInfo];
  id v173 = v168;
  id v16 = v166;
  id v172 = v167;
  id v17 = v15;
  id v18 = v16;
  id v170 = v17;
  v165 = v18;
  if (!v18)
  {
    v201 = 0;
    uint64_t v202 = 0;
    v200 = &v201;
    goto LABEL_159;
  }
  v204[0] = 0;
  v204[1] = 0;
  v203 = (uint64_t *)v204;
  long long v210 = 0u;
  long long v211 = 0u;
  long long v212 = 0u;
  long long v213 = 0u;
  id v181 = v18;
  uint64_t v19 = [v181 inputDescriptionsByName];
  uint64_t v182 = [v19 countByEnumeratingWithState:&v210 objects:v234 count:16];
  if (!v182) {
    goto LABEL_128;
  }
  uint64_t v180 = *(void *)v211;
  do
  {
    for (uint64_t i = 0; i != v182; ++i)
    {
      if (*(void *)v211 != v180) {
        objc_enumerationMutation(v19);
      }
      uint64_t v20 = *(void **)(*((void *)&v210 + 1) + 8 * i);
      v21 = [v181 inputDescriptionsByName];
      v185 = [v21 objectForKeyedSubscript:v20];

      uint64_t v22 = [v185 type];
      v192 = v20;
      if (v22 != 4)
      {
        if (v22 == 5)
        {
          id v25 = [v185 multiArrayConstraint];
          v205 = 0;
          uint64_t v206 = 0;
          uint64_t v207 = 0;
          int v208 = 0;
          id obj = v25;
          v26 = [v25 shape];
          CoreML::numericVectorFromObjC<long long>((uint64_t)&v227, v26);

          v27 = [obj shapeConstraint];
          uint64_t v28 = [v27 type];

          switch(v28)
          {
            case 1:
              memset(&buf, 0, sizeof(buf));
              std::vector<long long>::__init_with_size[abi:ne180100]<long long *,long long *>(&buf, v227, v228, (v228 - (uint64_t)v227) >> 3);
              std::__variant_detail::__assignment<std::__variant_detail::__traits<CoreML::NNCompiler::MLFixedShape,CoreML::NNCompiler::MLRangeShape,CoreML::NNCompiler::MLEnumeratedShape>>::__assign_alt[abi:ne180100]<0ul,CoreML::NNCompiler::MLFixedShape,CoreML::NNCompiler::MLFixedShape>((uint64_t)&v205, (uint64_t)&v205, (__n128 *)&buf);
              if (buf.__r_.__value_.__r.__words[0]) {
                operator delete(buf.__r_.__value_.__l.__data_);
              }
              break;
            case 2:
              v51 = [obj shapeConstraint];
              v52 = [v51 enumeratedShapes];

              v225 = 0;
              v224 = 0;
              unint64_t v226 = 0;
              std::vector<std::vector<long long>>::reserve(&v224, [v52 count]);
              long long v241 = 0u;
              long long v240 = 0u;
              long long v239 = 0u;
              *(_OWORD *)__p = 0u;
              id v53 = v52;
              uint64_t v54 = [v53 countByEnumeratingWithState:__p objects:&buf count:16];
              if (v54)
              {
                uint64_t v55 = *(void *)v239;
                do
                {
                  for (uint64_t j = 0; j != v54; ++j)
                  {
                    if (*(void *)v239 != v55) {
                      objc_enumerationMutation(v53);
                    }
                    CoreML::numericVectorFromObjC<long long>((uint64_t)&v222, *((void **)__p[1] + j));
                    v57 = v225;
                    if ((unint64_t)v225 >= v226)
                    {
                      unint64_t v59 = 0xAAAAAAAAAAAAAAABLL * ((v225 - (unsigned char *)v224) >> 3);
                      unint64_t v60 = v59 + 1;
                      if (v59 + 1 > 0xAAAAAAAAAAAAAAALL) {
                        std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__throw_length_error[abi:ne180100]();
                      }
                      if (0x5555555555555556 * ((uint64_t)(v226 - (void)v224) >> 3) > v60) {
                        unint64_t v60 = 0x5555555555555556 * ((uint64_t)(v226 - (void)v224) >> 3);
                      }
                      if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v226 - (void)v224) >> 3) >= 0x555555555555555) {
                        unint64_t v61 = 0xAAAAAAAAAAAAAAALL;
                      }
                      else {
                        unint64_t v61 = v60;
                      }
                      v221 = &v226;
                      v62 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::vector<long long>>>(v61);
                      v63 = &v62[24 * v59];
                      v217 = v62;
                      v218 = (uint64_t *)v63;
                      v220 = &v62[24 * v64];
                      *(_OWORD *)v63 = v222;
                      *((void *)v63 + 2) = v223;
                      v219 = (uint64_t *)(v63 + 24);
                      std::vector<std::vector<long long>>::__swap_out_circular_buffer(&v224, &v217);
                      v58 = v225;
                      std::__split_buffer<std::vector<long long>>::~__split_buffer((uint64_t)&v217);
                    }
                    else
                    {
                      *(_OWORD *)v225 = v222;
                      *((void *)v57 + 2) = v223;
                      v58 = v57 + 24;
                    }
                    v225 = v58;
                  }
                  uint64_t v54 = [v53 countByEnumeratingWithState:__p objects:&buf count:16];
                }
                while (v54);
              }

              CoreML::NNCompiler::MLEnumeratedShape::MLEnumeratedShape(&v217, (uint64_t)&v227, (uint64_t *)&v224);
              std::__variant_detail::__assignment<std::__variant_detail::__traits<CoreML::NNCompiler::MLFixedShape,CoreML::NNCompiler::MLRangeShape,CoreML::NNCompiler::MLEnumeratedShape>>::__assign_alt[abi:ne180100]<2ul,CoreML::NNCompiler::MLEnumeratedShape,CoreML::NNCompiler::MLEnumeratedShape>((uint64_t)&v205, (uint64_t)&v205, (uint64_t)&v217);
              *(void *)&long long v222 = &v220;
              std::vector<std::vector<long long>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v222);
              if (v217)
              {
                v218 = (uint64_t *)v217;
                operator delete(v217);
              }
              v217 = &v224;
              std::vector<std::vector<long long>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v217);

              break;
            case 3:
              uint64_t v29 = [obj shapeConstraint];
              __int16 v30 = [v29 sizeRangeForDimension];

              v225 = 0;
              v224 = 0;
              unint64_t v226 = 0;
              std::vector<CoreML::NNCompiler::MLRangeShape::Range>::reserve(&v224, [v30 count]);
              long long v241 = 0u;
              long long v240 = 0u;
              long long v239 = 0u;
              *(_OWORD *)__p = 0u;
              id v31 = v30;
              uint64_t v32 = [v31 countByEnumeratingWithState:__p objects:&buf count:16];
              if (v32)
              {
                uint64_t v33 = *(void *)v239;
                do
                {
                  for (uint64_t k = 0; k != v32; ++k)
                  {
                    if (*(void *)v239 != v33) {
                      objc_enumerationMutation(v31);
                    }
                    uint64_t v35 = [*((id *)__p[1] + k) rangeValue];
                    uint64_t v36 = v35;
                    uint64_t v38 = v37 + v35 - 1;
                    v39 = v225;
                    if ((unint64_t)v225 >= v226)
                    {
                      v41 = v224;
                      uint64_t v42 = (v225 - (unsigned char *)v224) >> 4;
                      unint64_t v43 = v42 + 1;
                      if ((unint64_t)(v42 + 1) >> 60) {
                        std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__throw_length_error[abi:ne180100]();
                      }
                      uint64_t v44 = v226 - (void)v224;
                      if ((uint64_t)(v226 - (void)v224) >> 3 > v43) {
                        unint64_t v43 = v44 >> 3;
                      }
                      if ((unint64_t)v44 >= 0x7FFFFFFFFFFFFFF0) {
                        unint64_t v45 = 0xFFFFFFFFFFFFFFFLL;
                      }
                      else {
                        unint64_t v45 = v43;
                      }
                      if (v45) {
                        unint64_t v45 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<CoreML::NNCompiler::MLRangeShape::Range>>(v45);
                      }
                      else {
                        uint64_t v46 = 0;
                      }
                      v47 = (uint64_t *)(v45 + 16 * v42);
                      uint64_t *v47 = v36;
                      v47[1] = v38;
                      v48 = (char *)v47;
                      if (v39 == v41)
                      {
                        uint64_t v20 = v192;
                      }
                      else
                      {
                        uint64_t v20 = v192;
                        do
                        {
                          *((_OWORD *)v48 - 1) = *((_OWORD *)v39 - 1);
                          v48 -= 16;
                          v39 -= 2;
                        }
                        while (v39 != v41);
                        v39 = v224;
                      }
                      v40 = (char *)(v47 + 2);
                      v224 = v48;
                      unint64_t v226 = v45 + 16 * v46;
                      if (v39) {
                        operator delete(v39);
                      }
                    }
                    else
                    {
                      *(void *)v225 = v35;
                      v39[1] = v38;
                      v40 = (char *)(v39 + 2);
                      uint64_t v20 = v192;
                    }
                    v225 = v40;
                  }
                  uint64_t v32 = [v31 countByEnumeratingWithState:__p objects:&buf count:16];
                }
                while (v32);
              }

              CoreML::NNCompiler::MLRangeShape::MLRangeShape(&v217, (uint64_t)&v227, (uint64_t)&v224);
              std::__variant_detail::__assignment<std::__variant_detail::__traits<CoreML::NNCompiler::MLFixedShape,CoreML::NNCompiler::MLRangeShape,CoreML::NNCompiler::MLEnumeratedShape>>::__assign_alt[abi:ne180100]<1ul,CoreML::NNCompiler::MLRangeShape,CoreML::NNCompiler::MLRangeShape>((uint64_t)&v205, (uint64_t)&v205, (uint64_t)&v217);
              if (v220)
              {
                v221 = v220;
                operator delete(v220);
              }
              if (v217)
              {
                v218 = (uint64_t *)v217;
                operator delete(v217);
              }
              if (v224) {
                operator delete(v224);
              }

              break;
          }
          uint64_t v65 = [obj dataType];
          int v66 = 65552;
          if (v65 != 65552)
          {
            if (v65 == 131104)
            {
              int v66 = 131104;
            }
            else if (v65 == 65568)
            {
              int v66 = 65568;
            }
            else
            {
              int v66 = 65600;
            }
          }
          std::__variant_detail::__copy_constructor<std::__variant_detail::__traits<CoreML::NNCompiler::MLFixedShape,CoreML::NNCompiler::MLRangeShape,CoreML::NNCompiler::MLEnumeratedShape>,(std::__variant_detail::_Trait)1>::__copy_constructor((uint64_t)v214, (uint64_t)&v205);
          int v216 = v66;
          if (v227) {
            operator delete(v227);
          }
          std::__variant_detail::__dtor<std::__variant_detail::__traits<CoreML::NNCompiler::MLFixedShape,CoreML::NNCompiler::MLRangeShape,CoreML::NNCompiler::MLEnumeratedShape>,(std::__variant_detail::_Trait)1>::~__dtor((uint64_t)&v205);

          std::__variant_detail::__move_constructor<std::__variant_detail::__traits<CoreML::NNCompiler::MLFixedShape,CoreML::NNCompiler::MLRangeShape,CoreML::NNCompiler::MLEnumeratedShape>,(std::__variant_detail::_Trait)1>::__move_constructor((uint64_t)&v230[0].__end_, (uint64_t)v214);
          int v232 = v216;
          int v233 = 0;
          std::__variant_detail::__copy_constructor<std::__variant_detail::__traits<CoreML::NNCompiler::MLMultiArrayShapeInfo,CoreML::NNCompiler::MLImageShapeInfo>,(std::__variant_detail::_Trait)1>::__copy_constructor((uint64_t)&__v.__begin_, (uint64_t)&v230[0].__end_);
          std::string::basic_string[abi:ne180100]<0>(&buf, (char *)[v20 UTF8String]);
          __p[0] = &buf;
          v67 = std::__tree<std::__value_type<std::string,CoreML::NNCompiler::MLShapeInfo>,std::__map_value_compare<std::string,std::__value_type<std::string,CoreML::NNCompiler::MLShapeInfo>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,CoreML::NNCompiler::MLShapeInfo>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(&v203, &buf, (_OWORD **)__p);
          std::__variant_detail::__assignment<std::__variant_detail::__traits<CoreML::NNCompiler::MLMultiArrayShapeInfo,CoreML::NNCompiler::MLImageShapeInfo>>::__generic_assign[abi:ne180100]<std::__variant_detail::__move_assignment<std::__variant_detail::__traits<CoreML::NNCompiler::MLMultiArrayShapeInfo,CoreML::NNCompiler::MLImageShapeInfo>,(std::__variant_detail::_Trait)1>>((uint64_t)(v67 + 4), (uint64_t)&__v.__begin_);
          if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0) {
            operator delete(buf.__r_.__value_.__l.__data_);
          }
          std::__variant_detail::__dtor<std::__variant_detail::__traits<CoreML::NNCompiler::MLMultiArrayShapeInfo,CoreML::NNCompiler::MLImageShapeInfo>,(std::__variant_detail::_Trait)1>::~__dtor((uint64_t)&__v.__begin_);
          std::__variant_detail::__dtor<std::__variant_detail::__traits<CoreML::NNCompiler::MLMultiArrayShapeInfo,CoreML::NNCompiler::MLImageShapeInfo>,(std::__variant_detail::_Trait)1>::~__dtor((uint64_t)&v230[0].__end_);
          std::__variant_detail::__dtor<std::__variant_detail::__traits<CoreML::NNCompiler::MLFixedShape,CoreML::NNCompiler::MLRangeShape,CoreML::NNCompiler::MLEnumeratedShape>,(std::__variant_detail::_Trait)1>::~__dtor((uint64_t)v214);
        }
        else if (v22 == 8)
        {
          v23 = [v185 stateConstraint];
          std::__variant_detail::__move_constructor<std::__variant_detail::__traits<CoreML::NNCompiler::MLFixedShape,CoreML::NNCompiler::MLRangeShape,CoreML::NNCompiler::MLEnumeratedShape>,(std::__variant_detail::_Trait)1>::__move_constructor((uint64_t)&__v.__begin_, (uint64_t)v230);
          int v243 = DWORD2(v231);
          int v244 = 0;
          std::__variant_detail::__copy_constructor<std::__variant_detail::__traits<CoreML::NNCompiler::MLMultiArrayShapeInfo,CoreML::NNCompiler::MLImageShapeInfo>,(std::__variant_detail::_Trait)1>::__copy_constructor((uint64_t)&buf.__r_.__value_.__l.__size_, (uint64_t)&__v.__begin_);
          std::string::basic_string[abi:ne180100]<0>(__p, (char *)[v20 UTF8String]);
          v214[0] = __p;
          v24 = std::__tree<std::__value_type<std::string,CoreML::NNCompiler::MLShapeInfo>,std::__map_value_compare<std::string,std::__value_type<std::string,CoreML::NNCompiler::MLShapeInfo>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,CoreML::NNCompiler::MLShapeInfo>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(&v203, __p, (_OWORD **)v214);
          std::__variant_detail::__assignment<std::__variant_detail::__traits<CoreML::NNCompiler::MLMultiArrayShapeInfo,CoreML::NNCompiler::MLImageShapeInfo>>::__generic_assign[abi:ne180100]<std::__variant_detail::__move_assignment<std::__variant_detail::__traits<CoreML::NNCompiler::MLMultiArrayShapeInfo,CoreML::NNCompiler::MLImageShapeInfo>,(std::__variant_detail::_Trait)1>>((uint64_t)(v24 + 4), (uint64_t)&buf.__r_.__value_.__l.__size_);
          if (SBYTE7(v239) < 0) {
            operator delete(__p[0]);
          }
          std::__variant_detail::__dtor<std::__variant_detail::__traits<CoreML::NNCompiler::MLMultiArrayShapeInfo,CoreML::NNCompiler::MLImageShapeInfo>,(std::__variant_detail::_Trait)1>::~__dtor((uint64_t)&buf.__r_.__value_.__l.__size_);
          std::__variant_detail::__dtor<std::__variant_detail::__traits<CoreML::NNCompiler::MLMultiArrayShapeInfo,CoreML::NNCompiler::MLImageShapeInfo>,(std::__variant_detail::_Trait)1>::~__dtor((uint64_t)&__v.__begin_);
          std::__variant_detail::__dtor<std::__variant_detail::__traits<CoreML::NNCompiler::MLFixedShape,CoreML::NNCompiler::MLRangeShape,CoreML::NNCompiler::MLEnumeratedShape>,(std::__variant_detail::_Trait)1>::~__dtor((uint64_t)v230);
        }
        goto LABEL_126;
      }
      id v179 = [v185 imageConstraint];
      uint64_t v49 = +[MLImageConstraint imagePixelTypeFromOSType:](MLImageConstraint, "imagePixelTypeFromOSType:", [v179 pixelFormatType]);
      int v50 = 10;
      if (v49 <= 29)
      {
        if (v49 == 20)
        {
          int v50 = 20;
        }
        else if (!v49)
        {
          exceptiouint64_t n = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
          std::logic_error::logic_error(exception, "This is a logic error, encountered unsupported pixel format type.");
          __cxa_throw(exception, MEMORY[0x1E4FBA328], MEMORY[0x1E4FBA1B0]);
        }
      }
      else if (v49 == 30)
      {
        int v50 = 30;
      }
      else if (v49 == 40)
      {
        int v50 = 40;
      }
      int v177 = v50;
      v205 = 0;
      uint64_t v206 = 0;
      uint64_t v207 = 0;
      int v208 = 0;
      int v209 = 0;
      uint64_t v176 = [v179 pixelsWide];
      uint64_t v175 = [v179 pixelsHigh];
      v178 = [v179 sizeConstraint];
      uint64_t v68 = [v178 type];
      switch(v68)
      {
        case 0:
          CoreML::NNCompiler::MLImageShapeInfo::MLImageShapeInfo((uint64_t)&buf, v176, v175, v177);
          std::__variant_detail::__assignment<std::__variant_detail::__traits<CoreML::NNCompiler::MLFixedShape,CoreML::NNCompiler::MLRangeShape,CoreML::NNCompiler::MLEnumeratedShape>>::__generic_assign[abi:ne180100]<std::__variant_detail::__move_assignment<std::__variant_detail::__traits<CoreML::NNCompiler::MLFixedShape,CoreML::NNCompiler::MLRangeShape,CoreML::NNCompiler::MLEnumeratedShape>,(std::__variant_detail::_Trait)1>>((uint64_t)&v205, (uint64_t)&buf);
          goto LABEL_122;
        case 2:
          v218 = 0;
          v217 = 0;
          v219 = 0;
          v76 = [v178 enumeratedImageSizes];
          std::vector<std::pair<unsigned long,unsigned long>>::reserve(&v217, [v76 count]);

          long long v241 = 0u;
          long long v240 = 0u;
          long long v239 = 0u;
          *(_OWORD *)__p = 0u;
          id obja = [v178 enumeratedImageSizes];
          uint64_t v77 = [obja countByEnumeratingWithState:__p objects:&buf count:16];
          if (v77)
          {
            uint64_t v78 = *(void *)v239;
            v79 = v219;
            v80 = v218;
            v81 = (uint64_t *)v217;
            do
            {
              for (uint64_t m = 0; m != v77; ++m)
              {
                if (*(void *)v239 != v78) {
                  objc_enumerationMutation(obja);
                }
                v83 = (void *)*((void *)__p[1] + m);
                uint64_t v84 = [v83 pixelsWide];
                v85 = v19;
                uint64_t v86 = [v83 pixelsHigh];
                uint64_t v87 = v86;
                if (v80 >= v79)
                {
                  uint64_t v88 = ((char *)v80 - (char *)v81) >> 4;
                  unint64_t v89 = v88 + 1;
                  if ((unint64_t)(v88 + 1) >> 60)
                  {
                    v217 = v81;
                    std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__throw_length_error[abi:ne180100]();
                  }
                  if (v79 - v81 > v89) {
                    unint64_t v89 = v79 - v81;
                  }
                  if ((unint64_t)((char *)v79 - (char *)v81) >= 0x7FFFFFFFFFFFFFF0) {
                    unint64_t v90 = 0xFFFFFFFFFFFFFFFLL;
                  }
                  else {
                    unint64_t v90 = v89;
                  }
                  v91 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<CoreML::NNCompiler::MLRangeShape::Range>>(v90);
                  v93 = (uint64_t *)&v91[16 * v88];
                  uint64_t *v93 = v84;
                  v93[1] = v87;
                  if (v80 == v81)
                  {
                    v95 = &v91[16 * v88];
                  }
                  else
                  {
                    v94 = &v91[16 * v88];
                    do
                    {
                      v95 = v94 - 16;
                      *((_OWORD *)v94 - 1) = *((_OWORD *)v80 - 1);
                      v80 -= 2;
                      v94 -= 16;
                    }
                    while (v80 != v81);
                  }
                  v79 = (uint64_t *)&v91[16 * v92];
                  v80 = v93 + 2;
                  uint64_t v19 = v85;
                  if (v81) {
                    operator delete(v81);
                  }
                  v81 = (uint64_t *)v95;
                }
                else
                {
                  uint64_t *v80 = v84;
                  v80[1] = v86;
                  v80 += 2;
                }
              }
              v219 = v79;
              v218 = v80;
              v217 = v81;
              uint64_t v77 = [obja countByEnumeratingWithState:__p objects:&buf count:16];
            }
            while (v77);
          }

          uint64_t v20 = v192;
          CoreML::NNCompiler::MLImageShapeInfo::MLImageShapeInfo((uint64_t)v214, v176, v175, (uint64_t **)&v217, v177);
          std::__variant_detail::__assignment<std::__variant_detail::__traits<CoreML::NNCompiler::MLFixedShape,CoreML::NNCompiler::MLRangeShape,CoreML::NNCompiler::MLEnumeratedShape>>::__generic_assign[abi:ne180100]<std::__variant_detail::__move_assignment<std::__variant_detail::__traits<CoreML::NNCompiler::MLFixedShape,CoreML::NNCompiler::MLRangeShape,CoreML::NNCompiler::MLEnumeratedShape>,(std::__variant_detail::_Trait)1>>((uint64_t)&v205, (uint64_t)v214);
          int v209 = v216;
          std::__variant_detail::__dtor<std::__variant_detail::__traits<CoreML::NNCompiler::MLFixedShape,CoreML::NNCompiler::MLRangeShape,CoreML::NNCompiler::MLEnumeratedShape>,(std::__variant_detail::_Trait)1>::~__dtor((uint64_t)v214);
          if (v217) {
            operator delete(v217);
          }
          break;
        case 3:
          v69 = (void *)[v178 pixelsWideRange];
          uint64_t v70 = [v178 pixelsWideRange];
          uint64_t v72 = v71;
          uint64_t v73 = [v178 pixelsHighRange];
          uint64_t v74 = [v178 pixelsHighRange];
          __p[0] = v69;
          __p[1] = (void *)(v72 + v70 - 1);
          *(void *)&long long v239 = v73;
          *((void *)&v239 + 1) = v75 + v74 - 1;
          CoreML::NNCompiler::MLImageShapeInfo::MLImageShapeInfo((uint64_t)&buf, v176, v175, (uint64_t *)__p, v177);
          std::__variant_detail::__assignment<std::__variant_detail::__traits<CoreML::NNCompiler::MLFixedShape,CoreML::NNCompiler::MLRangeShape,CoreML::NNCompiler::MLEnumeratedShape>>::__generic_assign[abi:ne180100]<std::__variant_detail::__move_assignment<std::__variant_detail::__traits<CoreML::NNCompiler::MLFixedShape,CoreML::NNCompiler::MLRangeShape,CoreML::NNCompiler::MLEnumeratedShape>,(std::__variant_detail::_Trait)1>>((uint64_t)&v205, (uint64_t)&buf);
LABEL_122:
          int v209 = v249;
          std::__variant_detail::__dtor<std::__variant_detail::__traits<CoreML::NNCompiler::MLFixedShape,CoreML::NNCompiler::MLRangeShape,CoreML::NNCompiler::MLEnumeratedShape>,(std::__variant_detail::_Trait)1>::~__dtor((uint64_t)&buf);
          break;
      }

      std::__variant_detail::__move_constructor<std::__variant_detail::__traits<CoreML::NNCompiler::MLFixedShape,CoreML::NNCompiler::MLRangeShape,CoreML::NNCompiler::MLEnumeratedShape>,(std::__variant_detail::_Trait)1>::__move_constructor((uint64_t)&v230[0].__end_, (uint64_t)&v205);
      int v232 = v209;
      int v233 = 1;
      std::__variant_detail::__copy_constructor<std::__variant_detail::__traits<CoreML::NNCompiler::MLMultiArrayShapeInfo,CoreML::NNCompiler::MLImageShapeInfo>,(std::__variant_detail::_Trait)1>::__copy_constructor((uint64_t)&__v.__begin_, (uint64_t)&v230[0].__end_);
      std::string::basic_string[abi:ne180100]<0>(&buf, (char *)[v20 UTF8String]);
      __p[0] = &buf;
      v96 = std::__tree<std::__value_type<std::string,CoreML::NNCompiler::MLShapeInfo>,std::__map_value_compare<std::string,std::__value_type<std::string,CoreML::NNCompiler::MLShapeInfo>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,CoreML::NNCompiler::MLShapeInfo>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(&v203, &buf, (_OWORD **)__p);
      std::__variant_detail::__assignment<std::__variant_detail::__traits<CoreML::NNCompiler::MLMultiArrayShapeInfo,CoreML::NNCompiler::MLImageShapeInfo>>::__generic_assign[abi:ne180100]<std::__variant_detail::__move_assignment<std::__variant_detail::__traits<CoreML::NNCompiler::MLMultiArrayShapeInfo,CoreML::NNCompiler::MLImageShapeInfo>,(std::__variant_detail::_Trait)1>>((uint64_t)(v96 + 4), (uint64_t)&__v.__begin_);
      if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(buf.__r_.__value_.__l.__data_);
      }
      std::__variant_detail::__dtor<std::__variant_detail::__traits<CoreML::NNCompiler::MLMultiArrayShapeInfo,CoreML::NNCompiler::MLImageShapeInfo>,(std::__variant_detail::_Trait)1>::~__dtor((uint64_t)&__v.__begin_);
      std::__variant_detail::__dtor<std::__variant_detail::__traits<CoreML::NNCompiler::MLMultiArrayShapeInfo,CoreML::NNCompiler::MLImageShapeInfo>,(std::__variant_detail::_Trait)1>::~__dtor((uint64_t)&v230[0].__end_);
      std::__variant_detail::__dtor<std::__variant_detail::__traits<CoreML::NNCompiler::MLFixedShape,CoreML::NNCompiler::MLRangeShape,CoreML::NNCompiler::MLEnumeratedShape>,(std::__variant_detail::_Trait)1>::~__dtor((uint64_t)&v205);

LABEL_126:
    }
    uint64_t v182 = [v19 countByEnumeratingWithState:&v210 objects:v234 count:16];
  }
  while (v182);
LABEL_128:

  id v97 = v181;
  *((void *)&v210 + 1) = 0;
  *(void *)&long long v211 = 0;
  *(void *)&long long v210 = (char *)&v210 + 8;
  memset(v230, 0, sizeof(v230));
  long long v231 = 0u;
  v193 = [v97 stateDescriptionsByName];
  uint64_t v98 = [v193 countByEnumeratingWithState:v230 objects:&buf count:16];
  if (v98)
  {
    data = v230[0].__end_cap_.__value_->__r_.__value_.__l.__data_;
    do
    {
      for (uint64_t n = 0; n != v98; ++n)
      {
        if (v230[0].__end_cap_.__value_->__r_.__value_.__l.__data_ != data) {
          objc_enumerationMutation(v193);
        }
        v101 = (void *)*((void *)&v230[0].__end_->__r_.__value_.__l.__data_ + n);
        v102 = [v97 stateDescriptionsByName];
        v103 = [v102 objectForKeyedSubscript:v101];

        v104 = [v103 stateConstraint];
        std::__variant_detail::__move_constructor<std::__variant_detail::__traits<CoreML::NNCompiler::MLFixedShape,CoreML::NNCompiler::MLRangeShape,CoreML::NNCompiler::MLEnumeratedShape>,(std::__variant_detail::_Trait)1>::__move_constructor((uint64_t)&__v.__begin_, (uint64_t)__p);
        int v243 = DWORD2(v241);
        int v244 = 0;
        std::__variant_detail::__copy_constructor<std::__variant_detail::__traits<CoreML::NNCompiler::MLMultiArrayShapeInfo,CoreML::NNCompiler::MLImageShapeInfo>,(std::__variant_detail::_Trait)1>::__copy_constructor((uint64_t)&v234[1], (uint64_t)&__v.__begin_);
        std::string::basic_string[abi:ne180100]<0>(v214, (char *)[v101 UTF8String]);
        v205 = v214;
        v105 = std::__tree<std::__value_type<std::string,CoreML::NNCompiler::MLShapeInfo>,std::__map_value_compare<std::string,std::__value_type<std::string,CoreML::NNCompiler::MLShapeInfo>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,CoreML::NNCompiler::MLShapeInfo>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)&v210, v214, (_OWORD **)&v205);
        std::__variant_detail::__assignment<std::__variant_detail::__traits<CoreML::NNCompiler::MLMultiArrayShapeInfo,CoreML::NNCompiler::MLImageShapeInfo>>::__generic_assign[abi:ne180100]<std::__variant_detail::__move_assignment<std::__variant_detail::__traits<CoreML::NNCompiler::MLMultiArrayShapeInfo,CoreML::NNCompiler::MLImageShapeInfo>,(std::__variant_detail::_Trait)1>>((uint64_t)(v105 + 4), (uint64_t)&v234[1]);
        if (v215 < 0) {
          operator delete(v214[0]);
        }
        std::__variant_detail::__dtor<std::__variant_detail::__traits<CoreML::NNCompiler::MLMultiArrayShapeInfo,CoreML::NNCompiler::MLImageShapeInfo>,(std::__variant_detail::_Trait)1>::~__dtor((uint64_t)&v234[1]);
        std::__variant_detail::__dtor<std::__variant_detail::__traits<CoreML::NNCompiler::MLMultiArrayShapeInfo,CoreML::NNCompiler::MLImageShapeInfo>,(std::__variant_detail::_Trait)1>::~__dtor((uint64_t)&__v.__begin_);
        std::__variant_detail::__dtor<std::__variant_detail::__traits<CoreML::NNCompiler::MLFixedShape,CoreML::NNCompiler::MLRangeShape,CoreML::NNCompiler::MLEnumeratedShape>,(std::__variant_detail::_Trait)1>::~__dtor((uint64_t)__p);
      }
      uint64_t v98 = [v193 countByEnumeratingWithState:v230 objects:&buf count:16];
    }
    while (v98);
  }

  v194 = [v97 outputDescriptionsByName];
  id v106 = [v194 allKeys];
  memset(v230, 0, 24);
  std::vector<std::string>::reserve(v230, [v106 count]);
  id objb = (id)MEMORY[0x19F3C29E0]();
  long long v236 = 0u;
  long long v237 = 0u;
  *(_OWORD *)v234 = 0u;
  long long v235 = 0u;
  id v107 = v106;
  uint64_t v108 = [v107 countByEnumeratingWithState:v234 objects:&buf count:16];
  if (v108)
  {
    uint64_t v109 = *(void *)v235;
    do
    {
      for (uint64_t ii = 0; ii != v108; ++ii)
      {
        if (*(void *)v235 != v109) {
          objc_enumerationMutation(v107);
        }
        v111 = (char *)[*((id *)v234[1] + ii) UTF8String];
        std::vector<std::string>::pointer end = v230[0].__end_;
        if (v230[0].__end_ >= v230[0].__end_cap_.__value_)
        {
          unint64_t v114 = 0xAAAAAAAAAAAAAAABLL * (((char *)v230[0].__end_ - (char *)v230[0].__begin_) >> 3);
          unint64_t v115 = v114 + 1;
          if (v114 + 1 > 0xAAAAAAAAAAAAAAALL) {
            std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__throw_length_error[abi:ne180100]();
          }
          if (0x5555555555555556 * (((char *)v230[0].__end_cap_.__value_ - (char *)v230[0].__begin_) >> 3) > v115) {
            unint64_t v115 = 0x5555555555555556 * (((char *)v230[0].__end_cap_.__value_ - (char *)v230[0].__begin_) >> 3);
          }
          if (0xAAAAAAAAAAAAAAABLL * (((char *)v230[0].__end_cap_.__value_ - (char *)v230[0].__begin_) >> 3) >= 0x555555555555555) {
            unint64_t v116 = 0xAAAAAAAAAAAAAAALL;
          }
          else {
            unint64_t v116 = v115;
          }
          __v.__end_cap_.__value_ = (std::allocator<std::string> *)&v230[0].__end_cap_;
          if (v116) {
            v117 = (std::string *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>((uint64_t)&v230[0].__end_cap_, v116);
          }
          else {
            v117 = 0;
          }
          __v.__first_ = v117;
          __v.__begin_ = v117 + v114;
          __v.__end_ = __v.__begin_;
          __v.__end_cap_.__value_ = &v117[v116];
          std::string::basic_string[abi:ne180100]<0>(__v.__begin_->__r_.__value_.__r.__words, v111);
          ++__v.__end_;
          std::vector<std::string>::__swap_out_circular_buffer(v230, &__v);
          v113 = v230[0].__end_;
          std::__split_buffer<std::string>::~__split_buffer(&__v);
        }
        else
        {
          std::string::basic_string[abi:ne180100]<0>(v230[0].__end_->__r_.__value_.__r.__words, v111);
          v113 = end + 1;
        }
        v230[0].__end_ = v113;
      }
      uint64_t v108 = [v107 countByEnumeratingWithState:v234 objects:&buf count:16];
    }
    while (v108);
  }

  CoreML::MLNeuralNetworkUtilities::getEspressoConfigurationsFromShapeInfos((uint64_t)&v200, &v203, &v210, (uint64_t)v230, 1, 0, v170);
  buf.__r_.__value_.__r.__words[0] = (std::string::size_type)v230;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&buf);
  std::__tree<std::__value_type<std::string,CoreML::NNCompiler::MLShapeInfo>,std::__map_value_compare<std::string,std::__value_type<std::string,CoreML::NNCompiler::MLShapeInfo>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,CoreML::NNCompiler::MLShapeInfo>>>::destroy(*((void **)&v210 + 1));
  std::__tree<std::__value_type<std::string,CoreML::NNCompiler::MLShapeInfo>,std::__map_value_compare<std::string,std::__value_type<std::string,CoreML::NNCompiler::MLShapeInfo>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,CoreML::NNCompiler::MLShapeInfo>>>::destroy(v204[0]);
LABEL_159:

  if (!v202)
  {
    buf.__r_.__value_.__r.__words[0] = (std::string::size_type)v173;
    id v187 = [MEMORY[0x1E4F1C978] arrayWithObjects:&buf count:1];
    goto LABEL_212;
  }
  v119 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:");
  v120 = v200;
  if (v200 == &v201)
  {
LABEL_208:
    id v187 = v119;
    goto LABEL_211;
  }
  v121 = (void *)*MEMORY[0x1E4F28568];
  while (2)
  {
    CoreML::MLNeuralNetworkUtilities::hashConfigShapesToConfigurationName(&buf, (const Espresso::net_configuration *)(v120 + 7));
    if ((buf.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      p_std::string buf = &buf;
    }
    else {
      p_std::string buf = (std::string *)buf.__r_.__value_.__r.__words[0];
    }
    v123 = objc_msgSend(v173, "stringByAppendingFormat:", @"_%s", p_buf);
    if ([v172 containsObject:v123])
    {
      [v119 addObject:v123];

      int v124 = 3;
      goto LABEL_194;
    }

    CoreML::MLNeuralNetworkUtilities::encodeConfigurationNameIfNeeded((std::string *)v234, (uint64_t)&buf, v170);
    uint64_t v125 = HIBYTE(buf.__r_.__value_.__r.__words[2]);
    if ((buf.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      std::string::size_type size = HIBYTE(buf.__r_.__value_.__r.__words[2]);
    }
    else {
      std::string::size_type size = buf.__r_.__value_.__l.__size_;
    }
    v127 = (void *)BYTE7(v235);
    if ((SBYTE7(v235) & 0x80u) == 0)
    {
      v128 = v234;
    }
    else
    {
      v127 = v234[1];
      v128 = (void **)v234[0];
    }
    if ((void *)size == v127)
    {
      if ((*((unsigned char *)&buf.__r_.__value_.__s + 23) & 0x80) != 0)
      {
        if (memcmp(buf.__r_.__value_.__l.__data_, v128, buf.__r_.__value_.__l.__size_)) {
          goto LABEL_181;
        }
      }
      else if (*((unsigned char *)&buf.__r_.__value_.__s + 23))
      {
        v129 = &buf;
        v130 = v128;
        while (v129->__r_.__value_.__s.__data_[0] == *(unsigned __int8 *)v130)
        {
          v129 = (std::string *)((char *)v129 + 1);
          v130 = (void **)((char *)v130 + 1);
          if (!--v125) {
            goto LABEL_184;
          }
        }
        goto LABEL_181;
      }
LABEL_184:
      v132 = +[MLLogging coreChannel];
      if (os_log_type_enabled(v132, OS_LOG_TYPE_ERROR))
      {
        if ((buf.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
          v139 = &buf;
        }
        else {
          v139 = (std::string *)buf.__r_.__value_.__r.__words[0];
        }
        LODWORD(__v.__first_) = 136315138;
        *(std::__split_buffer<std::string>::pointer *)((char *)&__v.__first_ + 4) = v139;
        _os_log_error_impl(&dword_19E58B000, v132, OS_LOG_TYPE_ERROR, "Unable to find a function for configuration name (%s), the model is broken.", (uint8_t *)&__v, 0xCu);
      }

      if (a6)
      {
        v133 = (void *)MEMORY[0x1E4F28C58];
        __p[0] = v121;
        if ((buf.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
          v134 = &buf;
        }
        else {
          v134 = (std::string *)buf.__r_.__value_.__r.__words[0];
        }
        v131 = [NSString stringWithFormat:@"Unable to find a function for configuration name (%s), the model is broken.", v134];
        v230[0].__begin_ = v131;
        v135 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v230 forKeys:__p count:1];
        *a6 = [v133 errorWithDomain:@"com.apple.CoreML" code:0 userInfo:v135];

        int v124 = 1;
        goto LABEL_190;
      }
      int v124 = 1;
    }
    else
    {
LABEL_181:
      objc_msgSend(v173, "stringByAppendingFormat:", @"_%s", v128);
      v131 = (std::string *)objc_claimAutoreleasedReturnValue();
      if (![v172 containsObject:v131])
      {

        goto LABEL_184;
      }
      [v119 addObject:v131];
      int v124 = 3;
LABEL_190:
    }
    if (SBYTE7(v235) < 0) {
      operator delete(v234[0]);
    }
LABEL_194:
    if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(buf.__r_.__value_.__l.__data_);
    }
    if (v124 == 3)
    {
      v136 = (void *)v120[1];
      if (v136)
      {
        do
        {
          v137 = (void **)v136;
          v136 = (void *)*v136;
        }
        while (v136);
      }
      else
      {
        do
        {
          v137 = (void **)v120[2];
          BOOL v138 = *v137 == v120;
          v120 = v137;
        }
        while (!v138);
      }
      v120 = v137;
      if (v137 == &v201) {
        goto LABEL_208;
      }
      continue;
    }
    break;
  }
  id v187 = 0;
LABEL_211:

LABEL_212:
  std::__tree<std::__value_type<std::string,Espresso::net_configuration>,std::__map_value_compare<std::string,std::__value_type<std::string,Espresso::net_configuration>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,Espresso::net_configuration>>>::destroy(v201);

  if ([v187 count])
  {
    long long v198 = 0u;
    long long v199 = 0u;
    long long v196 = 0u;
    long long v197 = 0u;
    id v140 = v187;
    v141 = 0;
    v142 = 0;
    uint64_t v143 = [v140 countByEnumeratingWithState:&v196 objects:v229 count:16];
    if (v143)
    {
      uint64_t v195 = *(void *)v197;
      uint64_t v184 = *MEMORY[0x1E4F1C3C8];
      uint64_t v186 = *MEMORY[0x1E4F1C3B8];
      id objc = v140;
LABEL_215:
      uint64_t v144 = 0;
      while (1)
      {
        if (*(void *)v197 != v195) {
          objc_enumerationMutation(objc);
        }
        id v145 = *(id *)(*((void *)&v196 + 1) + 8 * v144);
        if (!v234[0])
        {
          std::unique_ptr<e5rt_program_function,MLE5ObjectDeleter<e5rt_program_function>>::reset[abi:ne180100]((uint64_t *)v234);
LABEL_251:
          v118 = 0;
          id v161 = objc;
          goto LABEL_252;
        }
        __v.__first_ = 0;
        id v146 = v171;
        [v146 UTF8String];
        uint64_t v147 = e5rt_program_function_retain_inout_tensor_desc();
        v230[0].__begin_ = __v.__first_;
        if (v147)
        {
          v148 = +[MLLogging coreChannel];
          if (os_log_type_enabled(v148, OS_LOG_TYPE_ERROR))
          {
            uint64_t last_error_message = e5rt_get_last_error_message();
            LODWORD(buf.__r_.__value_.__l.__data_) = 136315394;
            *(std::string::size_type *)((char *)buf.__r_.__value_.__r.__words + 4) = last_error_message;
            WORD2(buf.__r_.__value_.__r.__words[1]) = 1024;
            *(_DWORD *)((char *)&buf.__r_.__value_.__r.__words[1] + 6) = v147;
            _os_log_error_impl(&dword_19E58B000, v148, OS_LOG_TYPE_ERROR, "E5RT: %s (%d)", (uint8_t *)&buf, 0x12u);
          }

          if (!a6) {
            goto LABEL_244;
          }
          v149 = +[MLModelErrorUtils genericErrorWithFormat:@"E5RT: %s (%d)", e5rt_get_last_error_message(), v147];
          +[MLModelErrorUtils errorWithCode:0, v149, @"Failed to get port for state with name = %@", v146 underlyingError format];
          *a6 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          uint64_t v150 = MLE5MultiArrayShapeForTensor();
          v149 = (void *)v150;
          if (v142) {
            v151 = v142;
          }
          else {
            v151 = (void *)v150;
          }
          id v152 = v151;

          if (([v152 isEqualToArray:v149] & 1) == 0)
          {
            v153 = +[MLLogging coreChannel];
            if (os_log_type_enabled(v153, OS_LOG_TYPE_ERROR))
            {
              LODWORD(buf.__r_.__value_.__l.__data_) = 138413058;
              *(std::string::size_type *)((char *)buf.__r_.__value_.__r.__words + 4) = (std::string::size_type)v145;
              WORD2(buf.__r_.__value_.__r.__words[1]) = 2112;
              *(std::string::size_type *)((char *)&buf.__r_.__value_.__r.__words[1] + 6) = (std::string::size_type)v171;
              HIWORD(buf.__r_.__value_.__r.__words[2]) = 2112;
              id v246 = v152;
              __int16 v247 = 2112;
              v248 = v149;
              _os_log_error_impl(&dword_19E58B000, v153, OS_LOG_TYPE_ERROR, "The function (%@) has invalid descriptor for state (%@), expected shape (%@) but got (%@)", (uint8_t *)&buf, 0x2Au);
            }

            [MEMORY[0x1E4F1CA00] raise:v186, @"The function (%@) has invalid descriptor for state (%@), expected shape (%@) but got (%@)", v145, v146, v152, v149 format];
          }
          uint64_t v154 = MLE5MultiArrayStridesForTensor();
          v155 = (void *)v154;
          if (v141) {
            v156 = v141;
          }
          else {
            v156 = (void *)v154;
          }
          id v157 = v156;

          if (([v157 isEqualToArray:v155] & 1) == 0)
          {
            v158 = +[MLLogging coreChannel];
            if (os_log_type_enabled(v158, OS_LOG_TYPE_ERROR))
            {
              LODWORD(buf.__r_.__value_.__l.__data_) = 138413058;
              *(std::string::size_type *)((char *)buf.__r_.__value_.__r.__words + 4) = (std::string::size_type)v145;
              WORD2(buf.__r_.__value_.__r.__words[1]) = 2112;
              *(std::string::size_type *)((char *)&buf.__r_.__value_.__r.__words[1] + 6) = (std::string::size_type)v171;
              HIWORD(buf.__r_.__value_.__r.__words[2]) = 2112;
              id v246 = v157;
              __int16 v247 = 2112;
              v248 = v155;
              _os_log_error_impl(&dword_19E58B000, v158, OS_LOG_TYPE_ERROR, "The function (%@) has invalid descriptor for state (%@), expected strides (%@) but got (%@)", (uint8_t *)&buf, 0x2Au);
            }

            [MEMORY[0x1E4F1CA00] raise:v186, @"The function (%@) has invalid descriptor for state (%@), expected strides (%@) but got (%@)", v145, v146, v157, v155 format];
          }
          if (MLE5MultiArrayDataTypeForTensor() != 65552)
          {
            v159 = +[MLLogging coreChannel];
            if (os_log_type_enabled(v159, OS_LOG_TYPE_ERROR))
            {
              LOWORD(buf.__r_.__value_.__l.__data_) = 0;
              _os_log_error_impl(&dword_19E58B000, v159, OS_LOG_TYPE_ERROR, "States are only supported for Float16 tensors.", (uint8_t *)&buf, 2u);
            }

            [MEMORY[0x1E4F1CA00] raise:v184 format:@"States are only supported for Float16 tensors."];
          }

          v141 = v157;
          v142 = v152;
        }

LABEL_244:
        std::unique_ptr<e5rt_tensor_desc,MLE5ObjectDeleter<e5rt_tensor_desc>>::reset[abi:ne180100]((uint64_t *)v230);
        std::unique_ptr<e5rt_program_function,MLE5ObjectDeleter<e5rt_program_function>>::reset[abi:ne180100]((uint64_t *)v234);
        if (v147) {
          goto LABEL_251;
        }
        if (v143 == ++v144)
        {
          id v140 = objc;
          uint64_t v143 = [objc countByEnumeratingWithState:&v196 objects:v229 count:16];
          if (v143) {
            goto LABEL_215;
          }
          break;
        }
      }
    }

    id v161 = +[MLMultiArray newMultiArrayForState:v142 strides:v141 dtype:65552 error:a6];
    if (v161)
    {
      id v161 = v161;
      v118 = v161;
    }
    else
    {
      v118 = 0;
    }
LABEL_252:
  }
  else
  {
    v118 = 0;
  }

LABEL_254:

  return v118;
}

- (id)newStateForFunctionNamed:(id)a3 stateNames:(id)a4 clientBuffers:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v36 = 0;
  uint64_t v37 = &v36;
  uint64_t v38 = 0x3032000000;
  v39 = __Block_byref_object_copy__16;
  v40 = __Block_byref_object_dispose__17;
  id v41 = 0;
  uint64_t v30 = 0;
  id v31 = &v30;
  uint64_t v32 = 0x3032000000;
  uint64_t v33 = __Block_byref_object_copy__16;
  uint64_t v34 = __Block_byref_object_dispose__17;
  id v35 = 0;
  v13 = [(MLE5ProgramLibrary *)self functionNames];
  dispatch_queue_t v14 = [(MLE5ProgramLibrary *)self lazyInitQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __78__MLE5ProgramLibrary_newStateForFunctionNamed_stateNames_clientBuffers_error___block_invoke;
  block[3] = &unk_1E59A5278;
  id v15 = v11;
  id v23 = v15;
  id v16 = v12;
  id v24 = v16;
  id v25 = self;
  id v17 = v10;
  id v26 = v17;
  id v18 = v13;
  id v27 = v18;
  uint64_t v28 = &v30;
  uint64_t v29 = &v36;
  dispatch_sync(v14, block);

  uint64_t v19 = (void *)v37[5];
  if (a6 && !v19)
  {
    *a6 = (id) v31[5];
    uint64_t v19 = (void *)v37[5];
  }
  id v20 = v19;

  _Block_object_dispose(&v30, 8);
  _Block_object_dispose(&v36, 8);

  return v20;
}

void __78__MLE5ProgramLibrary_newStateForFunctionNamed_stateNames_clientBuffers_error___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v2 = (void *)[MEMORY[0x1E4F1CC08] mutableCopy];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v18;
LABEL_3:
    uint64_t v6 = 0;
    while (1)
    {
      if (*(void *)v18 != v5) {
        objc_enumerationMutation(v3);
      }
      uint64_t v7 = *(void *)(*((void *)&v17 + 1) + 8 * v6);
      id v8 = [*(id *)(a1 + 40) objectForKeyedSubscript:v7];
      if (!v8)
      {
        uint64_t v9 = *(void **)(a1 + 48);
        uint64_t v10 = *(void *)(a1 + 56);
        uint64_t v11 = *(void *)(a1 + 64);
        uint64_t v12 = *(void *)(*(void *)(a1 + 72) + 8);
        id obj = *(id *)(v12 + 40);
        uint64_t v13 = [v9 _allocateStateBufferForFeatureNamed:v7 entryFunctionName:v10 programFunctionNames:v11 error:&obj];
        objc_storeStrong((id *)(v12 + 40), obj);
        id v8 = (void *)v13;
        if (!v13) {
          break;
        }
      }
      [v2 setObject:v8 forKeyedSubscript:v7];

      if (v4 == ++v6)
      {
        uint64_t v4 = [v3 countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (v4) {
          goto LABEL_3;
        }
        goto LABEL_10;
      }
    }
  }
  else
  {
LABEL_10:

    dispatch_queue_t v14 = [[MLState alloc] initWithBackings:v2];
    uint64_t v15 = *(void *)(*(void *)(a1 + 80) + 8);
    id v3 = *(id *)(v15 + 40);
    *(void *)(v15 + 40) = v14;
  }
}

- (id)segmentationAnalyticsAndReturnError:(id *)a3
{
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x2020000000;
  uint64_t v18 = 0;
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x3032000000;
  uint64_t v12 = __Block_byref_object_copy__16;
  uint64_t v13 = __Block_byref_object_dispose__17;
  id v14 = 0;
  uint64_t v5 = [(MLE5ProgramLibrary *)self lazyInitQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__MLE5ProgramLibrary_segmentationAnalyticsAndReturnError___block_invoke;
  block[3] = &unk_1E59A5228;
  void block[4] = self;
  block[5] = &v9;
  block[6] = &v15;
  dispatch_sync(v5, block);

  uint64_t v6 = (void *)v16[3];
  if (!v6 && a3) {
    *a3 = (id) v10[5];
  }
  _Block_object_dispose(&v9, 8);

  _Block_object_dispose(&v15, 8);

  return v6;
}

void __58__MLE5ProgramLibrary_segmentationAnalyticsAndReturnError___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id obj = *(id *)(v3 + 40);
  uint64_t v4 = [v2 _programLibraryHandleWithForceRespecialization:0 error:&obj];
  objc_storeStrong((id *)(v3 + 40), obj);
  if (v4)
  {
    uint64_t segmentation_analytics = e5rt_program_library_get_segmentation_analytics();
    if (segmentation_analytics)
    {
      uint64_t v6 = +[MLLogging coreChannel];
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        uint64_t last_error_message = e5rt_get_last_error_message();
        *(_DWORD *)std::string buf = 136315394;
        uint64_t v15 = last_error_message;
        __int16 v16 = 1024;
        int v17 = segmentation_analytics;
        _os_log_error_impl(&dword_19E58B000, v6, OS_LOG_TYPE_ERROR, "E5RT: %s (%d)", buf, 0x12u);
      }

      uint64_t v7 = +[MLModelErrorUtils genericErrorWithFormat:@"E5RT: %s (%d)", e5rt_get_last_error_message(), segmentation_analytics];
      id v8 = [*(id *)(a1 + 32) modelDisplayName];
      uint64_t v9 = +[MLModelErrorUtils errorWithCode:0, v7, @"Failed to get segmentation analytics for the model: %@.", v8 underlyingError format];
      uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
      uint64_t v11 = *(void **)(v10 + 40);
      *(void *)(v10 + 40) = v9;
    }
  }
}

- (e5rt_execution_stream_operation)createOperationForFunctionName:(id)a3 forceRespecialization:(BOOL)a4 hasRangeShapeInputs:(BOOL)a5 error:(id *)a6
{
  id v10 = a3;
  uint64_t v27 = 0;
  uint64_t v28 = &v27;
  uint64_t v29 = 0x2020000000;
  uint64_t v30 = 0;
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x3032000000;
  id v24 = __Block_byref_object_copy__16;
  id v25 = __Block_byref_object_dispose__17;
  id v26 = 0;
  uint64_t v11 = [(MLE5ProgramLibrary *)self lazyInitQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __101__MLE5ProgramLibrary_createOperationForFunctionName_forceRespecialization_hasRangeShapeInputs_error___block_invoke;
  block[3] = &unk_1E59A5250;
  BOOL v19 = a4;
  void block[4] = self;
  int v17 = &v21;
  id v12 = v10;
  BOOL v20 = a5;
  id v16 = v12;
  uint64_t v18 = &v27;
  dispatch_sync(v11, block);

  uint64_t v13 = (e5rt_execution_stream_operation *)v28[3];
  if (a6 && !v13)
  {
    *a6 = (id) v22[5];
    uint64_t v13 = (e5rt_execution_stream_operation *)v28[3];
  }

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v27, 8);

  return v13;
}

void __101__MLE5ProgramLibrary_createOperationForFunctionName_forceRespecialization_hasRangeShapeInputs_error___block_invoke(uint64_t a1)
{
  uint64_t v73 = *MEMORY[0x1E4F143B8];
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(unsigned __int8 *)(a1 + 64);
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  id obj = *(id *)(v4 + 40);
  uint64_t v5 = [v2 _programLibraryHandleWithForceRespecialization:v3 error:&obj];
  objc_storeStrong((id *)(v4 + 40), obj);
  if (v5)
  {
    uint64_t v6 = [*(id *)(a1 + 40) UTF8String];
    uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
    id v63 = *(id *)(v7 + 40);
    objc_storeStrong((id *)(v7 + 40), v63);
    if (!v64)
    {
LABEL_41:
      std::unique_ptr<e5rt_program_function,MLE5ObjectDeleter<e5rt_program_function>>::reset[abi:ne180100](&v64);
      return;
    }
    id v8 = [*(id *)(a1 + 32) modelConfiguration];
    int v9 = *(unsigned __int8 *)(a1 + 65);
    id v10 = [*(id *)(a1 + 32) container];
    uint64_t v11 = [v10 modelVersionInfo];
    uint64_t v12 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v15 = *(void **)(v12 + 40);
    uint64_t v13 = (id *)(v12 + 40);
    id v14 = v15;
    id v16 = v8;
    id v17 = v11;
    uint64_t v67 = 0;
    uint64_t v18 = e5rt_precompiled_compute_op_create_options_create_with_program_function();
    if (v18)
    {
      BOOL v19 = +[MLLogging coreChannel];
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        uint64_t last_error_message = e5rt_get_last_error_message();
        *(_DWORD *)std::string buf = 136315394;
        uint64_t v70 = last_error_message;
        __int16 v71 = 1024;
        int v72 = v18;
        _os_log_error_impl(&dword_19E58B000, v19, OS_LOG_TYPE_ERROR, "E5RT: %s (%d)", buf, 0x12u);
      }

      BOOL v20 = +[MLModelErrorUtils genericErrorWithFormat:@"E5RT: %s (%d)", e5rt_get_last_error_message(), v18];
      id v14 = +[MLModelErrorUtils errorWithCode:0 underlyingError:v20 format:@"Failed to configure the model specializer for the compute devices available on the system."];

      uint64_t v21 = 0;
      uint64_t v62 = 0;
      goto LABEL_35;
    }
    uint64_t v22 = [v16 modelDisplayName];
    BOOL v23 = v22 == 0;

    if (!v23)
    {
      id v24 = [v16 modelDisplayName];
      [v24 UTF8String];
      uint64_t options_set_operation_name = e5rt_precompiled_compute_op_create_options_set_operation_name();

      if (options_set_operation_name)
      {
        id v26 = +[MLLogging coreChannel];
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        {
          uint64_t v56 = e5rt_get_last_error_message();
          *(_DWORD *)std::string buf = 136315394;
          uint64_t v70 = v56;
          __int16 v71 = 1024;
          int v72 = options_set_operation_name;
          _os_log_error_impl(&dword_19E58B000, v26, OS_LOG_TYPE_ERROR, "Failed to set name for precompiled compute create options. E5RT: %s (%d)", buf, 0x12u);
        }

        objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C3A8], @"Failed to set name for precompiled compute create options. E5RT: %s (%d)", e5rt_get_last_error_message(), options_set_operation_name);
      }
    }
    uint64_t v27 = [v16 preferredMetalDevice];
    uint64_t v28 = v27;
    if (v27)
    {
      id v29 = v27;
      uint64_t v68 = 0;
      uint64_t v30 = e5rt_compute_gpu_device_retain_from_mtl_device();
      if (v30)
      {
        id v31 = +[MLLogging coreChannel];
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        {
          uint64_t v57 = e5rt_get_last_error_message();
          *(_DWORD *)std::string buf = 136315394;
          uint64_t v70 = v57;
          __int16 v71 = 1024;
          int v72 = v30;
          _os_log_error_impl(&dword_19E58B000, v31, OS_LOG_TYPE_ERROR, "E5RT: %s (%d)", buf, 0x12u);
        }

        uint64_t v32 = +[MLModelErrorUtils genericErrorWithFormat:@"E5RT: %s (%d)", e5rt_get_last_error_message(), v30];
        id v14 = +[MLModelErrorUtils errorWithCode:0, v32, @"The preferred MTLDevice %@ is not supported.", v29 underlyingError format];

        uint64_t v66 = 0;
LABEL_17:

LABEL_18:
        uint64_t v62 = 0;
        std::unique_ptr<e5rt_compute_gpu_device,MLE5ObjectDeleter<e5rt_compute_gpu_device>>::reset[abi:ne180100](&v66);
        uint64_t v21 = 0;
        goto LABEL_34;
      }
      uint64_t v33 = v68;
      uint64_t v66 = v68;

      if (!v33) {
        goto LABEL_18;
      }
      uint64_t options_set_override_compute_gpu_device = e5rt_precompiled_compute_op_create_options_set_override_compute_gpu_device();
      if (options_set_override_compute_gpu_device)
      {
        id v35 = +[MLLogging coreChannel];
        if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
        {
          uint64_t v60 = e5rt_get_last_error_message();
          *(_DWORD *)std::string buf = 136315394;
          uint64_t v70 = v60;
          __int16 v71 = 1024;
          int v72 = options_set_override_compute_gpu_device;
          _os_log_error_impl(&dword_19E58B000, v35, OS_LOG_TYPE_ERROR, "E5RT: %s (%d)", buf, 0x12u);
        }

        id v29 = +[MLModelErrorUtils genericErrorWithFormat:@"E5RT: %s (%d)", e5rt_get_last_error_message(), options_set_override_compute_gpu_device];
        id v14 = +[MLModelErrorUtils errorWithCode:0 underlyingError:v29 format:@"The model specializer was unable to use the requested preferred GPU compute device."];
        goto LABEL_17;
      }
      std::unique_ptr<e5rt_compute_gpu_device,MLE5ObjectDeleter<e5rt_compute_gpu_device>>::reset[abi:ne180100](&v66);
    }
    uint64_t v37 = [v16 e5rtDynamicCallableFunctions];
    uint64_t options_set_dynamic_callables = e5rt_precompiled_compute_op_create_options_set_dynamic_callables();

    if (options_set_dynamic_callables)
    {
      v39 = +[MLLogging coreChannel];
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
      {
        uint64_t v58 = e5rt_get_last_error_message();
        *(_DWORD *)std::string buf = 136315394;
        uint64_t v70 = v58;
        __int16 v71 = 1024;
        int v72 = options_set_dynamic_callables;
        _os_log_error_impl(&dword_19E58B000, v39, OS_LOG_TYPE_ERROR, "E5RT: %s (%d)", buf, 0x12u);
      }

      v40 = +[MLModelErrorUtils genericErrorWithFormat:@"E5RT: %s (%d)", e5rt_get_last_error_message(), options_set_dynamic_callables];
      id v14 = +[MLModelErrorUtils errorWithCode:0 underlyingError:v40 format:@"The model specializer was unable to set the dynamic callable functions."];
    }
    else
    {
      id v41 = [v16 e5rtMutableMILWeightURLs];
      uint64_t options_set_mutable_mil_weight_paths = e5rt_precompiled_compute_op_create_options_set_mutable_mil_weight_paths();

      if (options_set_mutable_mil_weight_paths)
      {
        unint64_t v43 = +[MLLogging coreChannel];
        if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
        {
          uint64_t v59 = e5rt_get_last_error_message();
          *(_DWORD *)std::string buf = 136315394;
          uint64_t v70 = v59;
          __int16 v71 = 1024;
          int v72 = options_set_mutable_mil_weight_paths;
          _os_log_error_impl(&dword_19E58B000, v43, OS_LOG_TYPE_ERROR, "E5RT: %s (%d)", buf, 0x12u);
        }

        uint64_t v44 = +[MLModelErrorUtils genericErrorWithFormat:@"E5RT: %s (%d)", e5rt_get_last_error_message(), options_set_mutable_mil_weight_paths];
        id v14 = +[MLModelErrorUtils errorWithCode:0 underlyingError:v44 format:@"The model specializer was unable to set the mutable MIL weight URLs."];
      }
      else
      {
        if (!v9
          || ([v16 usesCompileTimeMPSGraphTypeInferenceForModelVersion:v17],
              uint64_t options_set_experimental_disable_compile_time_mpsgraph_type_inference = e5rt_precompiled_compute_op_create_options_set_experimental_disable_compile_time_mpsgraph_type_inference(),
              !options_set_experimental_disable_compile_time_mpsgraph_type_inference))
        {
          uint64_t v21 = v67;
          uint64_t v62 = v67;
          goto LABEL_34;
        }
        uint64_t v54 = +[MLLogging coreChannel];
        if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
        {
          uint64_t v61 = e5rt_get_last_error_message();
          *(_DWORD *)std::string buf = 136315394;
          uint64_t v70 = v61;
          __int16 v71 = 1024;
          int v72 = options_set_experimental_disable_compile_time_mpsgraph_type_inference;
          _os_log_error_impl(&dword_19E58B000, v54, OS_LOG_TYPE_ERROR, "E5RT: %s (%d)", buf, 0x12u);
        }

        uint64_t v55 = +[MLModelErrorUtils genericErrorWithFormat:@"E5RT: %s (%d)", e5rt_get_last_error_message(), options_set_experimental_disable_compile_time_mpsgraph_type_inference];
        id v14 = +[MLModelErrorUtils errorWithCode:0 underlyingError:v55 format:@"The model specializer was unable to configure MPSGraph compile time type inference."];
      }
    }
    uint64_t v21 = 0;
    uint64_t v62 = 0;
LABEL_34:

LABEL_35:
    objc_storeStrong(v13, v14);

    if (v21)
    {
      uint64_t precompiled_compute_operation_with_options = e5rt_execution_stream_operation_create_precompiled_compute_operation_with_options();
      if (precompiled_compute_operation_with_options)
      {
        uint64_t v46 = +[MLLogging coreChannel];
        if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
        {
          uint64_t v52 = e5rt_get_last_error_message();
          *(_DWORD *)std::string buf = 136315394;
          uint64_t v70 = v52;
          __int16 v71 = 1024;
          int v72 = precompiled_compute_operation_with_options;
          _os_log_error_impl(&dword_19E58B000, v46, OS_LOG_TYPE_ERROR, "E5RT: %s (%d)", buf, 0x12u);
        }

        v47 = +[MLModelErrorUtils genericErrorWithFormat:@"E5RT: %s (%d)", e5rt_get_last_error_message(), precompiled_compute_operation_with_options];
        v48 = [*(id *)(a1 + 32) modelDisplayName];
        uint64_t v49 = +[MLModelErrorUtils errorWithCode:0, v47, @"Failed to prepare the model for predictions. ML program was %@ and the function name was %@.", v48, *(void *)(a1 + 40) underlyingError format];
        uint64_t v50 = *(void *)(*(void *)(a1 + 48) + 8);
        v51 = *(void **)(v50 + 40);
        *(void *)(v50 + 40) = v49;
      }
    }
    std::unique_ptr<e5rt_precompiled_compute_op_create_options,MLE5ObjectDeleter<e5rt_precompiled_compute_op_create_options>>::reset[abi:ne180100](&v62);
    goto LABEL_41;
  }
}

- (NSString)modelDisplayName
{
  v2 = [(MLE5ProgramLibrary *)self impl];
  uint64_t v3 = [v2 modelDisplayName];

  return (NSString *)v3;
}

void __60__MLE5ProgramLibrary_initWithContainer_configuration_error___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 8);
  v2 = *(std::__shared_weak_count **)(v1 + 56);
  *(void *)(v1 + 48) = 0;
  *(void *)(v1 + 56) = 0;
  if (v2) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  }
}

@end