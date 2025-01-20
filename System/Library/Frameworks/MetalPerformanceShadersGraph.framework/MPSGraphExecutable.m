@interface MPSGraphExecutable
+ (MPSGraphExecutable)executableWithMLIRSourceFromURL:(id)a3 executableDescriptor:(id)a4 error:(id *)a5;
+ (MPSGraphExecutable)executableWithMPSGraphPackageAtURL:(id)a3 compilationDescriptor:(id)a4 error:(id *)a5;
+ (__CFDictionary)validateNetworkWithParams:(__CFDictionary *)a3 apiVersion:(unint64_t)a4;
+ (id)executablesWithMLIRSourceForMultipleModules:(id)a3 executableDescriptor:(id)a4 regionNames:(id)a5;
+ (unint64_t)getValidateNetworkSupportedVersion;
+ (void)executablesWithMLIRSourceForMultipleModules:executableDescriptor:regionNames:;
- (BOOL)isExecutableForFeeds:(id)a3 targetTensors:(id)a4 targetOperations:(id)a5 compilationDescriptor:(id)a6;
- (FuncOp)getEntryFuncOp;
- (FuncOp)getEntryFuncOpForModule:(ModuleOp)a3;
- (MPSGraphExecutable)initWithCoreMLPackage:(id)a3 executableDescriptor:(id)a4;
- (MPSGraphExecutable)initWithCoreMLPackageAtURL:(id)a3 compilationDescriptor:(id)a4;
- (MPSGraphExecutable)initWithGraph:(id)a3 device:(id)a4 feeds:(id)a5 targetTensors:(id)a6 targetOperations:(id)a7 executableDescriptor:(id)a8;
- (MPSGraphExecutable)initWithMILProgram:(void *)a3 executableDescriptor:(id)a4;
- (MPSGraphExecutable)initWithMILProgramWithURL:(id)a3 executableDescriptor:(id)a4;
- (MPSGraphExecutable)initWithMLIRBytecode:(id)a3 executableDescriptor:(id)a4;
- (MPSGraphExecutable)initWithMLIRCommon:()unique_ptr<llvm:(std:(id)a4 :(id *)a5 default_delete<llvm::MemoryBuffer>>)a3 :MemoryBuffer executableDescriptor:error:;
- (MPSGraphExecutable)initWithMLIRModule:(ModuleOp)a3 executableDescriptor:(id)a4;
- (MPSGraphExecutable)initWithMLIRSource:(id)a3 executableDescriptor:(id)a4;
- (MPSGraphExecutable)initWithMLIRSourceFromURL:(id)a3 executableDescriptor:(id)a4;
- (MPSGraphExecutable)initWithMPSGraphPackageAtURL:(NSURL *)mpsgraphPackageURL compilationDescriptor:(MPSGraphCompilationDescriptor *)compilationDescriptor;
- (MPSGraphExecutable)initWithMPSGraphPackageAtURLCommon:(id)a3 compilationDescriptor:(id)a4 error:(id *)a5;
- (MPSGraphOptions)options;
- (ModuleOp)specializeWithDevice:(id)a3 inputsArray:(id)a4 compilationDescriptor:(id)a5;
- (ModuleOp)specializedModuleWithDevice:(id)a3 inputShapes:(id)a4 compilationDescriptor:(id)a5 fallingBack:(BOOL)a6 fallbackRuntimeKey:(const void *)a7;
- (NSArray)encodeToCommandBuffer:(MPSCommandBuffer *)commandBuffer inputsArray:(NSArray *)inputsArray resultsArray:(NSArray *)resultsArray executionDescriptor:(MPSGraphExecutableExecutionDescriptor *)executionDescriptor;
- (NSArray)feedTensors;
- (NSArray)getOutputTypesWithDevice:(MPSGraphDevice *)device inputTypes:(NSArray *)inputTypes compilationDescriptor:(MPSGraphCompilationDescriptor *)compilationDescriptor;
- (NSArray)runAsyncWithMTLCommandQueue:(id)commandQueue inputsArray:(NSArray *)inputsArray resultsArray:(NSArray *)resultsArray executionDescriptor:(MPSGraphExecutableExecutionDescriptor *)executionDescriptor;
- (NSArray)runWithMTLCommandQueue:(id)commandQueue inputsArray:(NSArray *)inputsArray resultsArray:(NSArray *)resultsArray executionDescriptor:(MPSGraphExecutableExecutionDescriptor *)executionDescriptor;
- (NSArray)targetTensors;
- (OwningOpRef<mlir::ModuleOp>)cloneForFeeds:(id)a3 targetTensors:(id)a4 targetOperations:(id)a5;
- (OwningOpRef<mlir::ModuleOp>)optimizationPassesWithDevice:(id)a3 sourceModule:(void *)a4 compilationID:(unint64_t)a5 compilationDescriptor:(id)a6;
- (ReturnOp)returnOpForFunctionInModule:(ModuleOp)a3;
- (__n128)getNewRuntimeForDevice:module:inputShapes:compilationDescriptor:fallingBack:fallbackRuntimeKey:;
- (id).cxx_construct;
- (id)allocateTensorDataTargetsForDevice:(id)a3 inputsArray:(id)a4;
- (id)createMLIRLibraryWithMPSGraphPackage:(id)a3 packageKey:(id)a4 appendOptimizedModules:(BOOL)a5;
- (id)debugDescription;
- (id)emitObjCToURL:(id)a3 test:(BOOL)a4;
- (id)emitViewerSPI;
- (id)emitViewerSPIWithDevice:(id)a3 inputShapes:(id)a4 compilationDescriptor:(id)a5;
- (id)encodeWithMPSCommandBuffer:(id)a3 inputsArray:(id)a4 resultsArray:(id)a5 executionDescriptor:(id)a6;
- (id)getIR;
- (id)getInputShapes;
- (id)getOperationsToVisitForOperation:(id)a3 visitedOperations:(id)a4;
- (id)getOutputShapes;
- (id)getTargetShapesForDevice:(id)a3 inputsArray:(id)a4;
- (id)getTensorDataArraysWithDevice:(id)a3 feedsDictionary:(id)a4 resultsDictionary:(id)a5 inputsArray:(id)a6 resultsArray:(id)a7;
- (id)initializeWithMLIRModule:(ModuleOp)a3 executableDescriptor:(id)a4;
- (id)lazyInitWithModuleURL:(id)a3 executableDescriptor:(id)a4 callablesDescription:(id)a5 moduleResourcesLoader:(shared_ptr<ModuleResourcesLoader>)a6;
- (id)runAsyncWithCommandQueue:(id)a3 inputsArray:(id)a4 resultsArray:(id)a5 executionDescriptor:(id)a6;
- (id)runAsyncWithDevice:(id)a3 inputsArray:(id)a4 resultsArray:(id)a5 executionDescriptor:(id)a6;
- (id)runInternalWithDevice:(id)a3 commandBuffer:(id)a4 feeds:(id)a5 results:(id)a6 executableExecutionDescriptor:(id)a7 mpsGraphOwnedCommandBuffer:(BOOL)a8;
- (id)runInternalWithDevice:(id)a3 commandBuffer:(id)a4 feedsDictionary:(id)a5 resultsDictionary:(id)a6 executableExecutionDescriptor:(id)a7 mpsGraphOwnedCommandBuffer:(BOOL)a8;
- (id)runWithDevice:(id)a3 inputsArray:(id)a4 resultsArray:(id)a5 executionDescriptor:(id)a6;
- (id)runWithMTLCommandQueue:(id)a3 inputsArray:(id)a4 resultsArray:(id)a5;
- (uint64_t)getNewRuntimeForDevice:module:inputShapes:compilationDescriptor:fallingBack:fallbackRuntimeKey:;
- (uint64_t)optimizationPassesWithDevice:sourceModule:compilationID:compilationDescriptor:;
- (uint64_t)optimizeOriginalModule;
- (unint64_t)getOptimizedModuleCacheSize;
- (unint64_t)getOptimizedNoDeviceModuleCacheSize;
- (unint64_t)getResourcesTotalSize;
- (vector<mlir::NamedAttribute,)getAttributesFromDescriptors:(MPSGraphExecutable *)self context:(SEL)a3 device:(id)a4;
- (vector<mlir::Type,)convertMPSGraphShapesToMLIRTypes:(MPSGraphExecutable *)self;
- (vector<mlir::Type,)convertMPSGraphShapesToMLIRTypes:(MPSGraphExecutable *)self funcOp:(SEL)a3 compilationDescriptor:(id)a4;
- (void)aneRegionOpsHashSet:;
- (void)aneRegionOpsHashSet:(void *)a3;
- (void)checkCallablesForModule:(void *)a3;
- (void)commonPostInit:(void *)a3;
- (void)commonPreInitWithDescriptor:(id)a3;
- (void)createMLIRLibraryWithMPSGraphPackage:packageKey:appendOptimizedModules:;
- (void)dealloc;
- (void)dump;
- (void)dumpCompiledProducts;
- (void)emitObjUnitTestToUrl:(id)a3;
- (void)emitViewerSPIToURL:(id)a3;
- (void)getNewRuntimeForDevice:(id)a3 module:(ModuleOp)a4 inputShapes:(id)a5 compilationDescriptor:(id)a6 fallingBack:(BOOL)a7 fallbackRuntimeKey:(const void *)a8;
- (void)getNewRuntimeForDevice:(id)a3 module:(ModuleOp)a4 inputsArray:(id)a5 compilationDescriptor:(id)a6;
- (void)getNewRuntimeForDevice:module:inputShapes:compilationDescriptor:fallingBack:fallbackRuntimeKey:;
- (void)initializeMLIR;
- (void)optimizationPassesWithDevice:sourceModule:compilationID:compilationDescriptor:;
- (void)optimizeOriginalModule;
- (void)serializeToMPSGraphPackageAtURL:(NSURL *)url descriptor:(MPSGraphExecutableSerializationDescriptor *)descriptor;
- (void)setOptions:(MPSGraphOptions)options;
- (void)setSpecializationCountMax:(unint64_t)a3;
- (void)specializeForMultipleInputTypesWithDevice:(id)a3 multipleInputTypes:(id)a4 compilationDescriptor:(id)a5;
- (void)specializeWithDevice:(MPSGraphDevice *)device inputTypes:(NSArray *)inputTypes compilationDescriptor:(MPSGraphCompilationDescriptor *)compilationDescriptor;
- (void)specializeWithDevice:(id)a3 inputShapes:(id)a4 compilationDescriptor:(id)a5;
@end

@implementation MPSGraphExecutable

- (MPSGraphExecutable)initWithMPSGraphPackageAtURLCommon:(id)a3 compilationDescriptor:(id)a4 error:(id *)a5
{
  v213[1] = *MEMORY[0x1E4F143B8];
  id v172 = a3;
  id v153 = a4;
  v197.receiver = self;
  v197.super_class = (Class)MPSGraphExecutable;
  v168 = [(MPSGraphExecutable *)&v197 init];

  [(MPSGraphExecutable *)v168 initializeMLIR];
  v7 = [[MPSGraphPackage alloc] initWithSourcePackageURL:v172 error:a5];
  v152 = v7;
  if (v7)
  {
    v151 = [(MPSGraphPackage *)v7 getMLIRLibrary];
    v8 = [v151 getDict];
    v164 = v8;
    v150 = objc_opt_new();
    [v150 setCompilationDescriptor:v153];
    uint64_t v9 = [v8 objectForKeyedSubscript:@"Original"];
    v147 = (void *)v9;
    if (v9)
    {
      v149 = [v172 URLByAppendingPathComponent:v9];
      v148 = [v151 getCallablesDescription];
      uint64_t v163 = [v151 getResourceStorageMode];
      if (v163 == 1)
      {
        uint64_t Manager = mlir::mps::MPSResourceBlobManagerInterface::getManager(*((mlir::mps::MPSResourceBlobManagerInterface **)v168 + 2), v10);
        v11 = objc_opt_new();
        v12 = [v8 objectForKeyedSubscript:@"Original Resources Used"];
        [v11 addObjectsFromArray:v12];

        [v8 objectForKeyedSubscript:@"Optimized Resources Used"];
        long long v195 = 0u;
        long long v196 = 0u;
        long long v193 = 0u;
        long long v194 = 0u;
        id v13 = (id)objc_claimAutoreleasedReturnValue();
        v169 = v13;
        uint64_t v14 = [v13 countByEnumeratingWithState:&v193 objects:v211 count:16];
        if (v14)
        {
          uint64_t v15 = *(void *)v194;
          do
          {
            for (uint64_t i = 0; i != v14; ++i)
            {
              if (*(void *)v194 != v15) {
                objc_enumerationMutation(v13);
              }
              v17 = [v13 objectForKeyedSubscript:*(void *)(*((void *)&v193 + 1) + 8 * i)];
              [v11 addObjectsFromArray:v17];

              id v13 = v169;
            }
            uint64_t v14 = [v169 countByEnumeratingWithState:&v193 objects:v211 count:16];
          }
          while (v14);
        }

        [v164 objectForKeyedSubscript:@"Optimized No Device Resources Used"];
        long long v191 = 0u;
        long long v192 = 0u;
        long long v189 = 0u;
        long long v190 = 0u;
        id v18 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v19 = [v18 countByEnumeratingWithState:&v189 objects:v210 count:16];
        if (v19)
        {
          uint64_t v20 = *(void *)v190;
          do
          {
            for (uint64_t j = 0; j != v19; ++j)
            {
              if (*(void *)v190 != v20) {
                objc_enumerationMutation(v18);
              }
              v22 = [v18 objectForKeyedSubscript:*(void *)(*((void *)&v189 + 1) + 8 * j)];
              [v11 addObjectsFromArray:v22];
            }
            uint64_t v19 = [v18 countByEnumeratingWithState:&v189 objects:v210 count:16];
          }
          while (v19);
        }

        long long v187 = 0u;
        long long v188 = 0u;
        long long v185 = 0u;
        long long v186 = 0u;
        id v23 = v11;
        uint64_t v24 = [v23 countByEnumeratingWithState:&v185 objects:v209 count:16];
        if (v24)
        {
          uint64_t v25 = *(void *)v186;
          obuint64_t j = v23;
          do
          {
            for (uint64_t k = 0; k != v24; ++k)
            {
              if (*(void *)v186 != v25) {
                objc_enumerationMutation(obj);
              }
              id v27 = v18;
              v28 = (const char *)[*(id *)(*((void *)&v185 + 1) + 8 * k) UTF8String];
              size_t v29 = strlen(v28);
              if (v29 > 0x7FFFFFFFFFFFFFF7) {
                std::string::__throw_length_error[abi:ne180100]();
              }
              size_t v30 = v29;
              if (v29 >= 0x17)
              {
                uint64_t v32 = (v29 & 0xFFFFFFFFFFFFFFF8) + 8;
                if ((v29 | 7) != 0x17) {
                  uint64_t v32 = v29 | 7;
                }
                uint64_t v33 = v32 + 1;
                p_dst = (long long *)operator new(v32 + 1);
                v200 = (mlir::Operation *)(v33 | 0x8000000000000000);
                *(void *)&long long __dst = p_dst;
                *((void *)&__dst + 1) = v30;
LABEL_31:
                memmove(p_dst, v28, v30);
                goto LABEL_32;
              }
              HIBYTE(v200) = v29;
              p_dst = &__dst;
              if (v29) {
                goto LABEL_31;
              }
LABEL_32:
              *((unsigned char *)p_dst + v30) = 0;
              if (SHIBYTE(v200) >= 0) {
                v34 = (int8x16_t *)&__dst;
              }
              else {
                v34 = (int8x16_t *)__dst;
              }
              if (SHIBYTE(v200) >= 0) {
                v35 = (const unsigned __int8 *)HIBYTE(v200);
              }
              else {
                v35 = (const unsigned __int8 *)*((void *)&__dst + 1);
              }
              id v18 = v27;
              mlir::mps::MPSResourceBlobManagerInterface::insertUndefinedEntry(Manager, v34, v35, (uint64_t *)v204);
              size_t v36 = *((void *)v204[0] + 1);
              int v37 = SHIBYTE(v200);
              uint64_t v38 = *((void *)&__dst + 1);
              v39 = (void *)__dst;
              if (SHIBYTE(v200) >= 0) {
                v40 = &__dst;
              }
              else {
                v40 = (long long *)__dst;
              }
              if (SHIBYTE(v200) >= 0) {
                uint64_t v38 = HIBYTE(v200);
              }
              if (v36 != v38 || v36 && memcmp(*(const void **)v204[0], v40, v36))
              {
                if (a5)
                {
                  v143 = (void *)MEMORY[0x1E4F28C58];
                  uint64_t v207 = *MEMORY[0x1E4F28568];
                  v208 = @"Could not create correct resource name";
                  v144 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v208 forKeys:&v207 count:1];
                  *a5 = [v143 errorWithDomain:@"com.apple.mps" code:-19 userInfo:v144];

                  LOBYTE(v37) = HIBYTE(v200);
                }
                if ((v37 & 0x80) != 0) {
                  operator delete((void *)__dst);
                }
                v138 = 0;
                v139 = obj;
                id v155 = obj;
LABEL_254:

LABEL_255:
                goto LABEL_256;
              }
              if (v37 < 0) {
                operator delete(v39);
              }
            }
            id v23 = obj;
            uint64_t v24 = [obj countByEnumeratingWithState:&v185 objects:v209 count:16];
          }
          while (v24);
        }

        v41 = [v150 compilationDescriptor];
        v42 = [v41 constantData];

        if (v42) {
          [v42 loadIntoResourceManager:Manager];
        }

        v8 = v164;
      }
      v43 = [v8 objectForKeyedSubscript:@"Original Resources Used"];
      v44 = [v8 objectForKeyedSubscript:@"Resource Offsets"];
      getModuleResourcesLoader(&__dst, v172, v163, v43, v44);

      long long v184 = __dst;
      long long __dst = 0uLL;
      id v45 = [(MPSGraphExecutable *)v168 lazyInitWithModuleURL:v149 executableDescriptor:v150 callablesDescription:v148 moduleResourcesLoader:&v184];
      v46 = (std::__shared_weak_count *)*((void *)&v184 + 1);
      if (*((void *)&v184 + 1)
        && !atomic_fetch_add((atomic_ullong *volatile)(*((void *)&v184 + 1) + 8), 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v46->__on_zero_shared)(v46);
        std::__shared_weak_count::__release_weak(v46);
      }
      v47 = (std::__shared_weak_count *)*((void *)&__dst + 1);
      if (*((void *)&__dst + 1)
        && !atomic_fetch_add((atomic_ullong *volatile)(*((void *)&__dst + 1) + 8), 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v47->__on_zero_shared)(v47);
        std::__shared_weak_count::__release_weak(v47);
      }
      llvm::DenseMapBase<llvm::DenseMap<MPSGraphModuleKey,std::unique_ptr<LazyLoadableModuleRef>,MPSGraphModuleKeyInfo,llvm::detail::DenseMapPair<MPSGraphModuleKey,std::unique_ptr<LazyLoadableModuleRef>>>,MPSGraphModuleKey,std::unique_ptr<LazyLoadableModuleRef>,MPSGraphModuleKeyInfo,llvm::detail::DenseMapPair<MPSGraphModuleKey,std::unique_ptr<LazyLoadableModuleRef>>>::clear((uint64_t)v168 + 136);
      v146 = [v164 objectForKeyedSubscript:@"Optimized"];
      uint64_t v48 = [v164 objectForKeyedSubscript:@"Optimized Resources Used"];
      memset(v183, 0, sizeof(v183));
      id v155 = v146;
      v169 = (void *)v48;
      if ([v155 countByEnumeratingWithState:v183 objects:v206 count:16])
      {
        v49 = (void *)**((void **)&v183[0] + 1);
        v50 = [v155 objectForKeyedSubscript:**((void **)&v183[0] + 1)];
        [v172 URLByAppendingPathComponent:v50];
        objc_claimAutoreleasedReturnValue();

        v51 = [*((id *)v168 + 12) entryFunctionName];
        id v52 = v49;
        id v166 = v51;
        *(void *)&long long __dst = &v200;
        *((void *)&__dst + 1) = 0x600000000;
        v53 = (void *)MEMORY[0x1E4F28D90];
        v161 = v52;
        v54 = [v52 dataUsingEncoding:4];
        v55 = [v53 JSONObjectWithData:v54 options:4 error:0];

        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v56 = v55;
          v57 = [v56 objectForKeyedSubscript:@"inputShapes"];
          v157 = [v56 objectForKeyedSubscript:@"compilationDescriptor"];
          v58 = [v56 objectForKeyedSubscript:@"callablesDescriptor"];
          v59 = [v56 objectForKeyedSubscript:@"deviceRegistry"];
          uint64_t v60 = [v59 unsignedIntegerValue];

          v61 = +[MPSGraphCompilationDescriptor descriptorWithDictionary:v157];
          unint64_t v62 = [v57 count];
          unint64_t v63 = v62;
          uint64_t v64 = DWORD2(__dst);
          if (v62 != DWORD2(__dst))
          {
            if (v62 >= DWORD2(__dst))
            {
              if (v62 > HIDWORD(__dst))
              {
                llvm::SmallVectorBase<unsigned int>::grow_pod((uint64_t)&__dst, &v200, v62, 8);
                uint64_t v64 = DWORD2(__dst);
              }
              if (v63 != v64) {
                bzero((void *)(__dst + 8 * v64), 8 * (v63 - v64));
              }
              if (v63 > HIDWORD(__dst)) {
LABEL_259:
              }
                __assert_rtn("set_size", "SmallVector.h", 102, "N <= capacity()");
            }
            else if (v62 > HIDWORD(__dst))
            {
              goto LABEL_259;
            }
            DWORD2(__dst) = v63;
            LODWORD(v64) = v63;
          }
          if (v64)
          {
            unint64_t v65 = 0;
            do
            {
              v66 = [v57 objectAtIndexedSubscript:v65];
              uint64_t v67 = [v66 integerValue];
              if (v65 >= DWORD2(__dst)) {
                __assert_rtn("operator[]", "SmallVector.h", 294, "idx < size()");
              }
              *(void *)(__dst + 8 * v65) = v67;

              ++v65;
            }
            while (v65 < DWORD2(__dst));
          }
        }
        else
        {
          uint64_t v60 = 0;
          v58 = 0;
          v61 = 0;
        }
        MPSGraphModuleKey::MPSGraphModuleKey(v204, (uint64_t)&__dst, v61, v58, v166, v60);

        if ((mlir::Operation **)__dst != &v200) {
          free((void *)__dst);
        }

        v68 = [v169 objectForKeyedSubscript:v161];
        v69 = [v164 objectForKeyedSubscript:@"Resource Offsets"];
        getModuleResourcesLoader(&v181, v172, v163, v68, v69);

        operator new();
      }

      v70 = (uint64_t *)((char *)v168 + 160);
      if (*((void *)v168 + 23))
      {
        v71 = (char *)*((void *)v168 + 22);
        if (v71)
        {
          do
          {
            v140 = *(char **)v71;
            LazyLoadableModuleRef::~LazyLoadableModuleRef((LazyLoadableModuleRef *)(v71 + 40));
            if (v71[39] < 0) {
              operator delete(*((void **)v71 + 2));
            }
            operator delete(v71);
            v71 = v140;
          }
          while (v140);
        }
        *((void *)v168 + 22) = 0;
        uint64_t v72 = *((void *)v168 + 21);
        if (v72)
        {
          for (uint64_t m = 0; m != v72; ++m)
            *(void *)(*v70 + 8 * m) = 0;
        }
        *((void *)v168 + 23) = 0;
      }
      v154 = [v164 objectForKeyedSubscript:@"Optimized No Device"];
      id obja = [v164 objectForKeyedSubscript:@"Optimized No Device Resources Used"];
      long long v177 = 0u;
      long long v178 = 0u;
      long long v175 = 0u;
      long long v176 = 0u;
      id v18 = v154;
      uint64_t v74 = [v18 countByEnumeratingWithState:&v175 objects:v198 count:16];
      if (!v74)
      {
LABEL_241:

        v138 = v168;
        v139 = obja;
        goto LABEL_254;
      }
      id v156 = v18;
      uint64_t v158 = *(void *)v176;
      v167 = (void *)((char *)v168 + 176);
LABEL_87:
      uint64_t v75 = 0;
      uint64_t v162 = v74;
LABEL_88:
      if (*(void *)v176 != v158) {
        objc_enumerationMutation(v18);
      }
      id v76 = *(id *)(*((void *)&v175 + 1) + 8 * v75);
      v77 = (const char *)[v76 UTF8String];
      v78 = v77;
      if (v77) {
        size_t v79 = strlen(v77);
      }
      else {
        size_t v79 = 0;
      }
      v80 = [v18 objectForKeyedSubscript:v76];
      v171 = [v172 URLByAppendingPathComponent:v80];

      v81 = [obja objectForKeyedSubscript:v76];
      v82 = [v164 objectForKeyedSubscript:@"Resource Offsets"];
      getModuleResourcesLoader(&v181, v172, v163, v81, v82);

      uint64_t v83 = *((void *)v168 + 2);
      v84 = (std::__shared_weak_count *)*((void *)v168 + 3);
      v174 = v84;
      if (v84) {
        atomic_fetch_add_explicit(&v84->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      uint64_t v86 = v181;
      v85 = v182;
      v173 = v182;
      if (v182) {
        atomic_fetch_add_explicit(&v182->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      id v87 = v171;
      *(void *)&long long __dst = v83;
      *((void *)&__dst + 1) = v84;
      if (v84) {
        atomic_fetch_add_explicit(&v84->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      v200 = 0;
      id v201 = v87;
      uint64_t v202 = v86;
      v203 = v85;
      if (v85) {
        atomic_fetch_add_explicit(&v85->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      v88 = v87;

      if (!v78)
      {
        v90 = 0;
        v91 = 0;
        unint64_t v92 = 0;
        __p[0] = 0;
        __p[1] = 0;
        int64_t v180 = 0;
        goto LABEL_112;
      }
      if (v79 > 0x7FFFFFFFFFFFFFF7) {
        std::string::__throw_length_error[abi:ne180100]();
      }
      if (v79 >= 0x17)
      {
        uint64_t v93 = (v79 & 0xFFFFFFFFFFFFFFF8) + 8;
        if ((v79 | 7) != 0x17) {
          uint64_t v93 = v79 | 7;
        }
        uint64_t v94 = v93 + 1;
        v89 = operator new(v93 + 1);
        __p[1] = (void *)v79;
        int64_t v180 = v94 | 0x8000000000000000;
        __p[0] = v89;
      }
      else
      {
        HIBYTE(v180) = v79;
        v89 = __p;
        if (!v79) {
          goto LABEL_111;
        }
      }
      memmove(v89, v78, v79);
LABEL_111:
      *((unsigned char *)v89 + v79) = 0;
      unint64_t v92 = HIBYTE(v180);
      v91 = (uint64_t *)__p[0];
      v90 = __p[1];
LABEL_112:
      if ((v92 & 0x80u) == 0) {
        v95 = (uint64_t *)__p;
      }
      else {
        v95 = v91;
      }
      if ((v92 & 0x80u) == 0) {
        unint64_t v96 = v92;
      }
      else {
        unint64_t v96 = (unint64_t)v90;
      }
      unint64_t v97 = std::__murmur2_or_cityhash<unsigned long,64ul>::operator()[abi:ne180100]((uint64_t)v204, v95, v96);
      unint64_t v98 = v97;
      unint64_t v99 = *((void *)v168 + 21);
      if (!v99) {
        goto LABEL_166;
      }
      uint8x8_t v100 = (uint8x8_t)vcnt_s8((int8x8_t)v99);
      v100.i16[0] = vaddlv_u8(v100);
      if (v100.u32[0] > 1uLL)
      {
        v84 = (std::__shared_weak_count *)v97;
        if (v97 >= v99) {
          v84 = (std::__shared_weak_count *)(v97 % v99);
        }
      }
      else
      {
        v84 = (std::__shared_weak_count *)((v99 - 1) & v97);
      }
      v101 = *(void ***)(*v70 + 8 * (void)v84);
      if (!v101 || (v102 = (char *)*v101) == 0)
      {
LABEL_166:
        v102 = (char *)operator new(0x58uLL);
        v204[0] = v102;
        v204[1] = (char *)v168 + 176;
        *(void *)v102 = 0;
        *((void *)v102 + 1) = v98;
        *((_OWORD *)v102 + 1) = *(_OWORD *)__p;
        *((void *)v102 + 4) = v180;
        __p[0] = 0;
        __p[1] = 0;
        int64_t v180 = 0;
        *(_OWORD *)(v102 + 40) = 0u;
        *(_OWORD *)(v102 + 56) = 0u;
        *(_OWORD *)(v102 + 72) = 0u;
        char v205 = 1;
        float v115 = (float)(unint64_t)(*((void *)v168 + 23) + 1);
        float v116 = *((float *)v168 + 48);
        if (v99 && (float)(v116 * (float)v99) >= v115)
        {
          uint64_t v117 = *v70;
          v118 = *(void **)(*v70 + 8 * (void)v84);
          id v18 = v156;
          if (v118) {
            goto LABEL_169;
          }
LABEL_194:
          *(void *)v102 = *v167;
          void *v167 = v102;
          *(void *)(v117 + 8 * (void)v84) = v167;
          if (*(void *)v102)
          {
            unint64_t v127 = *(void *)(*(void *)v102 + 8);
            if ((v99 & (v99 - 1)) != 0)
            {
              if (v127 >= v99) {
                v127 %= v99;
              }
            }
            else
            {
              v127 &= v99 - 1;
            }
            v118 = (void *)(*v70 + 8 * v127);
            goto LABEL_205;
          }
        }
        else
        {
          BOOL v119 = v99 < 3 || (v99 & (v99 - 1)) != 0;
          unint64_t v120 = v119 | (2 * v99);
          unint64_t v121 = vcvtps_u32_f32(v115 / v116);
          if (v120 <= v121) {
            size_t prime = v121;
          }
          else {
            size_t prime = v120;
          }
          if (prime == 1)
          {
            size_t prime = 2;
          }
          else if ((prime & (prime - 1)) != 0)
          {
            size_t prime = std::__next_prime(prime);
            unint64_t v99 = *((void *)v168 + 21);
          }
          if (prime > v99) {
            goto LABEL_181;
          }
          if (prime < v99)
          {
            unint64_t v123 = vcvtps_u32_f32((float)*((unint64_t *)v168 + 23) / *((float *)v168 + 48));
            if (v99 < 3
              || (uint8x8_t v124 = (uint8x8_t)vcnt_s8((int8x8_t)v99), v124.i16[0] = vaddlv_u8(v124), v124.u32[0] > 1uLL))
            {
              unint64_t v123 = std::__next_prime(v123);
            }
            else
            {
              uint64_t v125 = 1 << -(char)__clz(v123 - 1);
              if (v123 >= 2) {
                unint64_t v123 = v125;
              }
            }
            if (prime <= v123) {
              size_t prime = v123;
            }
            if (prime < v99) {
LABEL_181:
            }
              std::__hash_table<std::__hash_value_type<mlir::Operation *,std::unordered_map<void *,MPSGraphTensorData * {__strong}>>,std::__unordered_map_hasher<mlir::Operation *,std::__hash_value_type<mlir::Operation *,std::unordered_map<void *,MPSGraphTensorData * {__strong}>>,std::hash<mlir::Operation *>,std::equal_to<mlir::Operation *>,true>,std::__unordered_map_equal<mlir::Operation *,std::__hash_value_type<mlir::Operation *,std::unordered_map<void *,MPSGraphTensorData * {__strong}>>,std::equal_to<mlir::Operation *>,std::hash<mlir::Operation *>,true>,std::allocator<std::__hash_value_type<mlir::Operation *,std::unordered_map<void *,MPSGraphTensorData * {__strong}>>>>::__do_rehash<true>((uint64_t)v70, prime);
          }
          unint64_t v99 = *((void *)v168 + 21);
          unint64_t v126 = v99 - 1;
          if ((v99 & (v99 - 1)) != 0)
          {
            if (v98 >= v99)
            {
              v84 = (std::__shared_weak_count *)(v98 % v99);
              uint64_t v117 = *v70;
              v118 = *(void **)(*v70 + 8 * (v98 % v99));
              id v18 = v156;
              if (!v118) {
                goto LABEL_194;
              }
            }
            else
            {
              v84 = (std::__shared_weak_count *)v98;
              uint64_t v117 = *v70;
              v118 = *(void **)(*v70 + 8 * v98);
              id v18 = v156;
              if (!v118) {
                goto LABEL_194;
              }
            }
          }
          else
          {
            v84 = (std::__shared_weak_count *)(v126 & v98);
            uint64_t v117 = *v70;
            v118 = *(void **)(*v70 + 8 * (v126 & v98));
            id v18 = v156;
            if (!v118) {
              goto LABEL_194;
            }
          }
LABEL_169:
          *(void *)v102 = *v118;
LABEL_205:
          void *v118 = v102;
        }
        ++*((void *)v168 + 23);
        v113 = v200;
        v200 = 0;
        v204[0] = v113;
        v114 = (mlir::Operation *)*((void *)v102 + 7);
        if (!v114) {
          goto LABEL_208;
        }
LABEL_207:
        mlir::Operation::erase(v114);
        goto LABEL_208;
      }
      if (v180 >= 0) {
        v103 = (void *)HIBYTE(v180);
      }
      else {
        v103 = __p[1];
      }
      if (v180 >= 0) {
        v104 = __p;
      }
      else {
        v104 = (void **)__p[0];
      }
      if (v100.u32[0] < 2uLL)
      {
        while (1)
        {
          uint64_t v109 = *((void *)v102 + 1);
          if (v109 == v98)
          {
            uint64_t v110 = v102[39];
            if ((v110 & 0x80u) == 0) {
              unint64_t v111 = v102[39];
            }
            else {
              unint64_t v111 = *((void *)v102 + 3);
            }
            if ((void *)v111 == v103)
            {
              if ((v110 & 0x80) != 0)
              {
                if (!memcmp(*((const void **)v102 + 2), v104, *((void *)v102 + 3))) {
                  goto LABEL_164;
                }
              }
              else
              {
                if (!v102[39]) {
                  goto LABEL_164;
                }
                uint64_t v112 = 0;
                while (v102[v112 + 16] == *((unsigned char *)v104 + v112))
                {
                  if (v110 == ++v112) {
                    goto LABEL_164;
                  }
                }
              }
            }
          }
          else if ((std::__shared_weak_count *)(v109 & (v99 - 1)) != v84)
          {
            goto LABEL_166;
          }
          v102 = *(char **)v102;
          if (!v102) {
            goto LABEL_166;
          }
        }
      }
      while (1)
      {
        unint64_t v105 = *((void *)v102 + 1);
        if (v105 == v98)
        {
          uint64_t v106 = v102[39];
          if ((v106 & 0x80u) == 0) {
            unint64_t v107 = v102[39];
          }
          else {
            unint64_t v107 = *((void *)v102 + 3);
          }
          if ((void *)v107 == v103)
          {
            if ((v106 & 0x80) != 0)
            {
              if (!memcmp(*((const void **)v102 + 2), v104, *((void *)v102 + 3)))
              {
LABEL_164:
                id v18 = v156;
                v113 = v200;
                v200 = 0;
                v204[0] = v113;
                v114 = (mlir::Operation *)*((void *)v102 + 7);
                if (v114) {
                  goto LABEL_207;
                }
LABEL_208:
                *((void *)v102 + 7) = v113;
                objc_storeStrong((id *)v102 + 8, v201);
                uint64_t v128 = v202;
                v129 = v203;
                if (v203) {
                  atomic_fetch_add_explicit(&v203->__shared_owners_, 1uLL, memory_order_relaxed);
                }
                v130 = (std::__shared_weak_count *)*((void *)v102 + 10);
                *((void *)v102 + 9) = v128;
                *((void *)v102 + 10) = v129;
                if (v130 && !atomic_fetch_add(&v130->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
                {
                  ((void (*)(std::__shared_weak_count *))v130->__on_zero_shared)(v130);
                  std::__shared_weak_count::__release_weak(v130);
                  uint64_t v131 = *((void *)&__dst + 1);
                  uint64_t v132 = __dst;
                  if (*((void *)&__dst + 1)) {
LABEL_213:
                  }
                    atomic_fetch_add_explicit((atomic_ullong *volatile)(v131 + 8), 1uLL, memory_order_relaxed);
                }
                else
                {
                  uint64_t v131 = *((void *)&__dst + 1);
                  uint64_t v132 = __dst;
                  if (*((void *)&__dst + 1)) {
                    goto LABEL_213;
                  }
                }
                v133 = (std::__shared_weak_count *)*((void *)v102 + 6);
                *((void *)v102 + 5) = v132;
                *((void *)v102 + 6) = v131;
                if (v133 && !atomic_fetch_add(&v133->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
                {
                  ((void (*)(std::__shared_weak_count *))v133->__on_zero_shared)(v133);
                  std::__shared_weak_count::__release_weak(v133);
                  if (SHIBYTE(v180) < 0) {
                    goto LABEL_222;
                  }
LABEL_217:
                  v134 = v203;
                  if (v203)
                  {
LABEL_223:
                    if (!atomic_fetch_add(&v134->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
                    {
                      ((void (*)(std::__shared_weak_count *))v134->__on_zero_shared)(v134);
                      std::__shared_weak_count::__release_weak(v134);
                    }
                  }
                }
                else
                {
                  if ((SHIBYTE(v180) & 0x80000000) == 0) {
                    goto LABEL_217;
                  }
LABEL_222:
                  operator delete(__p[0]);
                  v134 = v203;
                  if (v203) {
                    goto LABEL_223;
                  }
                }

                if (v200) {
                  mlir::Operation::erase(v200);
                }
                v135 = (std::__shared_weak_count *)*((void *)&__dst + 1);
                if (*((void *)&__dst + 1)
                  && !atomic_fetch_add((atomic_ullong *volatile)(*((void *)&__dst + 1) + 8), 0xFFFFFFFFFFFFFFFFLL))
                {
                  ((void (*)(std::__shared_weak_count *))v135->__on_zero_shared)(v135);
                  std::__shared_weak_count::__release_weak(v135);
                  v136 = v173;
                  if (v173) {
                    goto LABEL_230;
                  }
                }
                else
                {
                  v136 = v173;
                  if (v173)
                  {
LABEL_230:
                    if (!atomic_fetch_add(&v136->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
                    {
                      ((void (*)(std::__shared_weak_count *))v136->__on_zero_shared)(v136);
                      std::__shared_weak_count::__release_weak(v136);
                    }
                  }
                }
                if (v174 && !atomic_fetch_add(&v174->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
                {
                  ((void (*)(std::__shared_weak_count *))v174->__on_zero_shared)(v174);
                  std::__shared_weak_count::__release_weak(v174);
                  v137 = v182;
                  if (v182) {
                    goto LABEL_236;
                  }
                }
                else
                {
                  v137 = v182;
                  if (v182)
                  {
LABEL_236:
                    if (!atomic_fetch_add(&v137->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
                    {
                      ((void (*)(std::__shared_weak_count *))v137->__on_zero_shared)(v137);
                      std::__shared_weak_count::__release_weak(v137);
                    }
                  }
                }

                if (++v75 == v162)
                {
                  uint64_t v74 = [v18 countByEnumeratingWithState:&v175 objects:v198 count:16];
                  if (!v74) {
                    goto LABEL_241;
                  }
                  goto LABEL_87;
                }
                goto LABEL_88;
              }
            }
            else
            {
              if (!v102[39]) {
                goto LABEL_164;
              }
              uint64_t v108 = 0;
              while (v102[v108 + 16] == *((unsigned char *)v104 + v108))
              {
                if (v106 == ++v108) {
                  goto LABEL_164;
                }
              }
            }
          }
        }
        else
        {
          if (v105 >= v99) {
            v105 %= v99;
          }
          if ((std::__shared_weak_count *)v105 != v84) {
            goto LABEL_166;
          }
        }
        v102 = *(char **)v102;
        if (!v102) {
          goto LABEL_166;
        }
      }
    }
    if (a5)
    {
      v141 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v212 = *MEMORY[0x1E4F28568];
      v142 = NSString;
      v149 = objc_msgSend(v172, "absoluteString", 0);
      v148 = getMPSGraphPackageVersionString();
      id v155 = [v142 stringWithFormat:@"Error: No valid MPSGraph Package Version found in .mpsgraphpackage with URL: %@ \nThis OS supports MPSGraph Package Version up to %@", v149, v148];
      v213[0] = v155;
      v169 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v213 forKeys:&v212 count:1];
      objc_msgSend(v141, "errorWithDomain:code:userInfo:", @"com.apple.mps", -20);
      v138 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_255;
    }
    v138 = 0;
LABEL_256:
  }
  else
  {
    v138 = 0;
  }

  return v138;
}

- (void)initializeMLIR
{
  v2 = (char *)self + 16;
  if (!*((void *)self + 2))
  {
    v3 = operator new(0x20uLL);
    *((void *)v3 + 1) = 0;
    *((void *)v3 + 2) = 0;
    *(void *)v3 = &unk_1EC9CFE58;
    v4 = mlir::MLIRContext::MLIRContext((mlir::MLIRContextImpl **)v3 + 3, 0);
    v5 = (std::__shared_weak_count *)*((void *)v2 + 1);
    *(void *)v2 = v4;
    *((void *)v2 + 1) = v3;
    if (v5)
    {
      if (!atomic_fetch_add(&v5->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
        std::__shared_weak_count::__release_weak(v5);
      }
    }
  }
  loadCommonMPSDialectsInContext(*(mlir::MLIRContext **)v2);
  if (mpsgraph_mlir_onceToken != -1)
  {
    dispatch_once(&mpsgraph_mlir_onceToken, &__block_literal_global_8);
  }
}

void __36__MPSGraphExecutable_initializeMLIR__block_invoke(mlir *a1)
{
  mlir::registerAsmPrinterCLOptions(a1);

  ParseEnvironmentOptions("main", "MPSGRAPH_MLIR_CL", "");
}

- (void)commonPreInitWithDescriptor:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  [v5 setDateFormat:@"yyyy-MM-dd_HH_mm_ss"];
  v6 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v7 = [v5 stringFromDate:v6];
  v8 = (void *)*((void *)self + 62);
  *((void *)self + 62) = v7;

  *((void *)self + 61) = arc4random();
  *((void *)self + 63) = 0;
  *((void *)self + 77) = 0;
  *((void *)self + 76) = -2;
  *((_DWORD *)self + 140) = 0;
  *((void *)self + 71) = 0;
  uint64_t v9 = [MEMORY[0x1E4F28CB8] defaultManager];
  v10 = (void *)*((void *)self + 69);
  *((void *)self + 69) = v9;

  *((void *)self + 65) = 0;
  v11 = [v4 compilationDescriptor];
  if (v11
    && ([v4 compilationDescriptor],
        v12 = objc_claimAutoreleasedReturnValue(),
        [v12 dispatchQueue],
        id v13 = objc_claimAutoreleasedReturnValue(),
        v13,
        v12,
        v11,
        v13))
  {
    uint64_t v14 = [v4 compilationDescriptor];
    uint64_t v15 = [v14 dispatchQueue];
    v16 = (void *)*((void *)self + 41);
    *((void *)self + 41) = v15;

    if (!v4)
    {
LABEL_4:
      uint64_t v17 = objc_opt_new();
      id v18 = (void *)*((void *)self + 12);
      *((void *)self + 12) = v17;
      goto LABEL_8;
    }
  }
  else
  {
    dispatch_queue_t v19 = dispatch_queue_create("MPSGraphExecutable_queue", 0);
    uint64_t v20 = (void *)*((void *)self + 41);
    *((void *)self + 41) = v19;

    if (!v4) {
      goto LABEL_4;
    }
  }
  v21 = [v4 compilationDescriptor];
  if (!v21) {
    __assert_rtn("-[MPSGraphExecutable commonPreInitWithDescriptor:]", "MPSGraphExecutable.mm", 629, "executableDescriptor.compilationDescriptor");
  }

  id v18 = [v4 compilationDescriptor];
  uint64_t v22 = [v18 copy];
  id v23 = (void *)*((void *)self + 12);
  *((void *)self + 12) = v22;

LABEL_8:
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__MPSGraphExecutable_commonPreInitWithDescriptor___block_invoke;
  block[3] = &unk_1E4FC1670;
  block[4] = self;
  if (-[MPSGraphExecutable commonPreInitWithDescriptor:]::onceToken == -1)
  {
    if (!evOptions) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
  dispatch_once(&-[MPSGraphExecutable commonPreInitWithDescriptor:]::onceToken, block);
  if (evOptions) {
LABEL_10:
  }
    *((void *)self + 78) |= 2uLL;
LABEL_11:
  overrideCompilationDescriptorWithEV(*((MPSGraphCompilationDescriptor **)self + 12));
  *((void *)self + 64) = qword_1E8EBD9C8;
  objc_storeStrong((id *)self + 66, (id)qword_1E8EBD9D0);
  objc_storeStrong((id *)self + 68, (id)qword_1E8EBD9D8);
  *((unsigned char *)self + 576) = byte_1E8EBD9E0;
  if (byte_1E8EBD9F5) {
    uint64_t v24 = byte_1E8EBD9F4;
  }
  else {
    uint64_t v24 = [*((id *)self + 12) compilerOptions] & 0x80;
  }
  *((unsigned char *)self + 581) = v24 != 0;
  *((unsigned char *)self + 582) = byte_1E8EBD9F6;
  *((unsigned char *)self + 583) = byte_1E8EBD9F7;
  *((void *)self + 75) = dword_1E8EBD9FC;
  *((unsigned char *)self + 584) = byte_1E8EBD9F8;
  if (byte_1E8EBDA04) {
    char v25 = 1;
  }
  else {
    char v25 = [*((id *)self + 12) printANEPlacementAnalysis];
  }
  *((unsigned char *)self + 585) = v25;
  *((unsigned char *)self + 586) = byte_1E8EBDA18;
  *((unsigned char *)self + 587) = byte_1E8EBDA19;
  *((unsigned char *)self + 588) = byte_1E8EBDA1B;
  *((unsigned char *)self + 589) = byte_1E8EBDA1C;
  *((unsigned char *)self + 590) = byte_1E8EBDA1D;
  *((unsigned char *)self + 593) = byte_1E8EBDA42;
  if (HIBYTE(word_1E8EBD9C1) && !(_BYTE)word_1E8EBD9C1 && MTLReportFailureTypeEnabled()) {
    MTLReportFailure();
  }
  if (byte_1E8EBD9E1 && !(_BYTE)word_1E8EBD9C1 && MTLReportFailureTypeEnabled()) {
    MTLReportFailure();
  }
  if (byte_1E8EBD9F0 && !(_BYTE)word_1E8EBD9C1 && MTLReportFailureTypeEnabled()) {
    MTLReportFailure();
  }
  if (byte_1E8EBD9F2 && !(_BYTE)word_1E8EBD9C1 && MTLReportFailureTypeEnabled()) {
    MTLReportFailure();
  }
  uint64_t v26 = NSTemporaryDirectory();
  if (v26) {
    id v27 = (__CFString *)v26;
  }
  else {
    id v27 = @"/tmp/";
  }
  v28 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  size_t v29 = [v28 bundleIdentifier];

  uint64_t v30 = [NSString stringWithFormat:@"%@%@/mpsgraph-%d-%@-%lu", v27, v29, getpid(), *((void *)self + 62), *((void *)self + 61)];
  v31 = (void *)*((void *)self + 67);
  *((void *)self + 67) = v30;

  char v48 = 0;
  if ([*((id *)self + 69) fileExistsAtPath:*((void *)self + 67) isDirectory:&v48])
  {
    if (!v48 && MTLReportFailureTypeEnabled())
    {
      uint64_t v41 = *((void *)self + 67);
      id v40 = [0 localizedFailureReason];
      uint64_t v42 = [v40 cStringUsingEncoding:4];
      id v43 = [0 localizedDescription];
      uint64_t v45 = v42;
      uint64_t v46 = [v43 cStringUsingEncoding:4];
      uint64_t v44 = v41;
      MTLReportFailure();

      uint64_t v32 = 0;
      goto LABEL_33;
    }
    uint64_t v32 = 0;
  }
  else
  {
    uint64_t v33 = (void *)*((void *)self + 69);
    uint64_t v34 = *((void *)self + 67);
    id v47 = 0;
    char v35 = [v33 createDirectoryAtPath:v34 withIntermediateDirectories:1 attributes:0 error:&v47];
    id v36 = v47;
    uint64_t v32 = v36;
    if ((v35 & 1) == 0)
    {
      id v37 = [v36 localizedFailureReason];
      uint64_t v38 = [v37 cStringUsingEncoding:4];
      id v39 = [v32 localizedDescription];
      NSLog(&cfstr_ErrorCreatingD.isa, v38, [v39 cStringUsingEncoding:4]);

      id v40 = (id)*((void *)self + 67);
      *((void *)self + 67) = 0;
LABEL_33:
    }
  }
  [(MPSGraphExecutable *)self initializeMLIR];
}

char *__50__MPSGraphExecutable_commonPreInitWithDescriptor___block_invoke(uint64_t a1)
{
  if (getenv("MPSGRAPH_LOG_INFO"))
  {
    evOptions = 1;
    puts("MPSGRAPH_LOG_INFO EV is set.");
  }
  v2 = getenv("MPSGRAPH_COMPILER_STITCHING");
  if (v2)
  {
    word_1E8EBD9C1 = 257;
    int v3 = atoi(v2);
    if (!v3) {
      byte_1E8EBD9C3 = 1;
    }
    printf("MPSGRAPH_COMPILER_STITCHING EV is set to %d.\n", v3);
  }
  id v4 = getenv("MPSGRAPH_DISABLE_TYPE_INFERENCE");
  if (v4)
  {
    word_1E8EBD9C1 = 257;
    byte_1E8EBD9C4 = atoi(v4) != 0;
    puts("MPSGRAPH_DISABLE_TYPE_INFERENCE EV is set.");
  }
  if (getenv("MPSGRAPH_USE_COMMON_CANONICALIZATION_PASS"))
  {
    word_1E8EBD9C1 = 257;
    byte_1E8EBDA02 = 1;
    puts("MPSGRAPH_USE_COMMON_CANONICALIZATION_PASS EV is set.");
  }
  if (getenv("MPSGRAPH_RUN_F32_TO_F16_PASS"))
  {
    word_1E8EBD9C1 = 257;
    byte_1E8EBDA03 = 1;
    puts("MPSGRAPH_RUN_F32_TO_F16_PASS EV is set.");
  }
  id v5 = getenv("MPSGRAPH_ANE_SPATIAL_SPLITTING");
  if (v5)
  {
    byte_1E8EBD9E1 = 1;
    LOBYTE(word_1E8EBD9C1) = 1;
    qword_1E8EBD9E8 = atoll(v5);
    printf("MPSGRAPH_ANE_SPATIAL_SPLITTING EV is set to %llu.\n", qword_1E8EBD9E8);
  }
  if (getenv("MPSGRAPH_ENABLE_ANE_FW_TO_FW_SIGNAL"))
  {
    LOBYTE(word_1E8EBD9C1) = 1;
    *(_WORD *)&byte_1E8EBD9F0 = 257;
    puts("MPSGRAPH_ENABLE_ANE_FW_TO_FW_SIGNAL EV is set.");
  }
  if (getenv("MPSGRAPH_DISABLE_ANE_FW_TO_FW_SIGNAL"))
  {
    LOBYTE(word_1E8EBD9C1) = 1;
    *(_WORD *)&byte_1E8EBD9F0 = 1;
    puts("MPSGRAPH_DISABLE_ANE_FW_TO_FW_SIGNAL EV is set.");
  }
  if (getenv("MPSGRAPH_ENABLE_ANE_LATE_LATCH"))
  {
    LOBYTE(word_1E8EBD9C1) = 1;
    *(_WORD *)&byte_1E8EBD9F2 = 257;
    puts("MPSGRAPH_ENABLE_ANE_FW_TO_FW_SIGNAL EV is set.");
  }
  if (getenv("MPSGRAPH_DISABLE_ANE_LATE_LATCH"))
  {
    LOBYTE(word_1E8EBD9C1) = 1;
    *(_WORD *)&byte_1E8EBD9F2 = 1;
    puts("MPSGRAPH_DISABLE_ANE_FW_TO_FW_SIGNAL EV is set.");
  }
  v6 = getenv("MPSGRAPH_DUMP_MODULE");
  if (v6)
  {
    qword_1E8EBD9C8 = atoll(v6);
    puts("MPSGRAPH_DUMP_MODULE EV is set.");
  }
  uint64_t v7 = getenv("MPSGRAPH_DUMP_MODULE_FILE_PATH");
  if (v7)
  {
    v8 = v7;
    uint64_t v9 = [NSString stringWithUTF8String:v7];
    v10 = (void *)qword_1E8EBD9D0;
    qword_1E8EBD9D0 = v9;

    printf("MPSGRAPH_DUMP_MODULE_FILE_PATH EV is set to %s.\n", v8);
  }
  v11 = getenv("MPSGRAPH_DUMP_COMPILED_PRODUCTS_PATH");
  if (v11)
  {
    v12 = v11;
    uint64_t v13 = [NSString stringWithUTF8String:v11];
    uint64_t v14 = (void *)qword_1E8EBD9D8;
    qword_1E8EBD9D8 = v13;

    printf("MPSGRAPH_DUMP_COMPILED_PRODUCTS_PATH EV is set to %s.\n", v12);
  }
  if (getenv("MPSGRAPH_DISABLE_CC"))
  {
    byte_1E8EBD9E0 = 0;
    puts("MPSGRAPH_DISABLE_CC EV is set.");
  }
  if (getenv("MPSGRAPH_ENABLE_PROFILING_OP_NAMES"))
  {
    byte_1E8EBDA00 = 1;
    puts("MPSGRAPH_ENABLE_PROFILING_OP_NAMES EV is set.");
  }
  if (getenv("MPSGRAPH_ENABLE_ENCODER_BREAKUP"))
  {
    byte_1E8EBDA01 = 1;
    puts("MPSGRAPH_ENABLE_ENCODER_BREAKUP EV is set.");
  }
  uint64_t v15 = getenv("MPSGRAPH_PLACEMENT_PASS");
  if (v15)
  {
    byte_1E8EBD9F4 = atoi(v15) != 0;
    byte_1E8EBD9F5 = 1;
    printf("MPSGRAPH_PLACEMENT_PASS EV is set to %d.\n", byte_1E8EBD9F4);
  }
  v16 = getenv("MPSGRAPH_USE_COST_MODEL");
  if (v16)
  {
    byte_1E8EBD9F6 = atoi(v16) != 0;
    printf("MPSGRAPH_USE_COST_MODEL EV is set to %d.\n", byte_1E8EBD9F6);
  }
  if (getenv("MPSGRAPH_USE_OLD_COST_MODEL_PASS"))
  {
    byte_1E8EBD9F7 = 1;
    puts("MPSGRAPH_USE_OLD_COST_MODEL_PASS EV is set.");
  }
  uint64_t v17 = getenv("MPSGRAPH_FORCE_DEVICE_PLACEMENT");
  if (v17)
  {
    dword_1E8EBD9FC = atoi(v17);
    printf("MPSGRAPH_FORCE_DEVICE_PLACEMENT EV is set to %d.\n", dword_1E8EBD9FC);
  }
  if (getenv("MPSGRAPH_PRINT_COST_MODEL"))
  {
    byte_1E8EBD9F8 = 1;
    puts("MPSGRAPH_PRINT_COST_MODEL EV is set.");
  }
  if (getenv("MPSGRAPH_PRINT_ANE_PLACEMENT_ANALYSIS"))
  {
    byte_1E8EBDA04 = 1;
    LOBYTE(word_1E8EBD9C1) = 1;
    puts("MPSGRAPH_PRINT_ANE_PLACEMENT_ANALYSIS EV is set.");
  }
  id v18 = getenv("MPSGRAPH_ANE_LIVEIO_LIMIT");
  if (v18)
  {
    *(void *)&xmmword_1E8EBDA08 = atoi(v18);
    printf("MPSGRAPH_ANE_LIVEIO_LIMIT EV is set to %lu.\n", (void)xmmword_1E8EBDA08);
  }
  dispatch_queue_t v19 = getenv("MPSGRAPH_ANE_REGION_OP_LIMIT");
  if (v19)
  {
    *((void *)&xmmword_1E8EBDA08 + 1) = atoi(v19);
    printf("MPSGRAPH_ANE_REGION_OP_LIMIT EV is set to %lu.\n", *((void *)&xmmword_1E8EBDA08 + 1));
  }
  if (getenv("MPSGRAPH_LEGACY_ANE_QUANTIZATION"))
  {
    byte_1E8EBDA18 = 1;
    puts("MPSGRAPH_LEGACY_ANE_QUANTIZATION EV is set.");
  }
  if (getenv("MPSGRAPH_KEEP_ANEC_UNIT_NAME_ATTRS"))
  {
    byte_1E8EBDA19 = 1;
    puts("MPSGRAPH_KEEP_ANEC_UNIT_NAME_ATTRS EV is set.");
  }
  if (getenv("MPSGRAPH_DISABLE_GPU_QUANT_OPS"))
  {
    word_1E8EBD9C1 = 257;
    byte_1E8EBDA1A = 1;
    puts("MPSGRAPH_DISABLE_GPU_QUANT_OPS EV is set.");
  }
  uint64_t v20 = getenv("MPSGRAPH_SPECIALIZATION_COUNT_MAX");
  if (v20)
  {
    *(void *)(*(void *)(a1 + 32) + 608) = atoi(v20);
    printf("MPSGRAPH_SPECIALIZATION_COUNT_MAX EV is set to %lu.\n", *(void *)(*(void *)(a1 + 32) + 608));
  }
  if (getenv("MPSGRAPH_DISABLE_PRE_ENCODE_TI"))
  {
    byte_1E8EBDA1B = 1;
    puts("MPSGRAPH_DISABLE_PRE_ENCODE_TI EV is set.");
  }
  if (getenv("MPSGRAPH_ENABLE_PRE_ENCODE_TI_READ_INPUTS"))
  {
    byte_1E8EBDA1C = 1;
    puts("MPSGRAPH_ENABLE_PRE_ENCODE_TI_READ_INPUTS EV is set.");
  }
  if (getenv("MPSGRAPH_ENABLE_RUNTIME_TI_VERIFIERS"))
  {
    byte_1E8EBDA1D = 1;
    puts("MPSGRAPH_ENABLE_RUNTIME_TI_VERIFIERS EV is set.");
  }
  if (getenv("MPSGRAPH_DISABLE_SDPA_GQA"))
  {
    byte_1E8EBDA1E = 0;
    puts("MPSGRAPH_DISABLE_SDPA_GQA EV is set.");
  }
  if (getenv("MPSGRAPH_ENABLE_GPU_REGIONS"))
  {
    byte_1E8EBDA1F = 1;
    puts("MPSGRAPH_ENABLE_GPU_REGIONS EV is set.");
  }
  if (getenv("MPSGRAPH_ENABLE_PARALLEL_ENCODE"))
  {
    word_1E8EBD9C1 = 257;
    byte_1E8EBDA20 = 1;
    puts("MPSGRAPH_ENABLE_PARALLEL_ENCODE EV is set.");
  }
  v21 = getenv("MPSGRAPH_MIN_NUM_OPS_PER_PARALLEL_REGION");
  if (v21)
  {
    byte_1E8EBDA21 = 1;
    LOBYTE(word_1E8EBD9C1) = 1;
    qword_1E8EBDA28 = atoi(v21);
    printf("MPSGRAPH_MIN_NUM_OPS_PER_PARALLEL_REGION EV is set to %llu.\n", qword_1E8EBDA28);
  }
  uint64_t v22 = getenv("MPSGRAPH_MAX_NUM_PARALLEL_REGIONS");
  if (v22)
  {
    byte_1E8EBDA30 = 1;
    LOBYTE(word_1E8EBD9C1) = 1;
    qword_1E8EBDA38 = atoi(v22);
    printf("MPSGRAPH_MAX_NUM_PARALLEL_REGIONS EV is set to %llu.\n", qword_1E8EBDA38);
  }
  if (getenv("MPSGRAPH_ENABLE_MLIR_DIAGNOSTICS"))
  {
    word_1E8EBD9C1 = 257;
    byte_1E8EBDA40 = 1;
    puts("MPSGRAPH_ENABLE_MLIR_DIAGNOSTICS EV is set.");
  }
  id v23 = getenv("MPSGRAPH_ENABLE_SHAPE_EQUIVALENCE");
  if (v23)
  {
    word_1E8EBD9C1 = 257;
    byte_1E8EBDA41 = atoi(v23) != 0;
    printf("MPSGRAPH_ENABLE_SHAPE_EQUIVALENCE EV is set to %d.\n", byte_1E8EBDA41);
  }
  result = getenv("MPSGRAPH_ENABLE_ANEC_MODULE_VALIDATION");
  if (result)
  {
    byte_1E8EBDA42 = 1;
    return (char *)puts("MPSGRAPH_ENABLE_ANEC_MODULE_VALIDATION EV is set.");
  }
  return result;
}

- (void)commonPostInit:(void *)a3
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  uint64_t v41 = self;
  int v3 = (LazyLoadableModuleRef *)LazyLoadableModuleRef::operator=((uint64_t)self + 40, (uint64_t *)a3);
  id v5 = (unsigned int *)LazyLoadableModuleRef::get(v3, v4);
  id v40 = (mlir *)v5;
  id v39 = (id)objc_opt_new();
  id v38 = (id)objc_opt_new();
  unint64_t v6 = v5[11];
  if ((v6 & 0x7FFFFF) != 0)
  {
    unint64_t v7 = (unint64_t)&v5[4 * ((v6 >> 23) & 1) + 16] + ((v6 >> 21) & 0x7F8);
    if (v7 > 0xFFFFFFFFFFFFFFF8)
    {
      char v25 = "static_cast<uintptr_t>(ArithAddr + Alignment.value() - 1) >= ArithAddr && \"Overflow\"";
      int v26 = 191;
      id v27 = "Alignment.h";
      v28 = "alignAddr";
    }
    else
    {
      v8 = (void *)(((v7 + 7) & 0xFFFFFFFFFFFFFFF8) + 32 * v5[10]);
      if ((void *)*v8 != v8)
      {
        uint64_t v9 = v8[1];
        if (v9) {
          uint64_t v10 = v9 - 8;
        }
        else {
          uint64_t v10 = 0;
        }
        v37[0] = &v41;
        v37[1] = &v38;
        v37[2] = &v40;
        v37[3] = &v39;
        v11 = (mlir::GenericProgramPoint *)(v10 + 32);
        v12 = *(mlir::GenericProgramPoint **)(v10 + 40);
        if (v12 != (mlir::GenericProgramPoint *)(v10 + 32))
        {
          do
          {
            uint64_t v13 = (mlir::GenericProgramPoint *)*((void *)v12 + 1);
            mlir::GenericProgramPoint::~GenericProgramPoint(v12);
            uint64_t v42 = v37;
            mlir::detail::walk<mlir::ForwardIterator>(v14, (mlir::Operation *)_ZN4llvm12function_refIFvPN4mlir9OperationEEE11callback_fnIZNS1_6detail4walkILNS1_9WalkOrderE1ENS1_15ForwardIteratorERZ37__MPSGraphExecutable_commonPostInit__E3__1NS1_3mps6CallOpEvEENSt3__19enable_ifIXaantsr4llvm9is_one_ofIT2_S3_PNS1_6RegionEPNS1_5BlockEEE5valuesr3std7is_sameIT3_vEE5valueESM_E4typeES3_OT1_EUlS3_E_EEvlS3_, (uint64_t)&v42, 1);
            v12 = v13;
          }
          while (v13 != v11);
        }
        uint64_t v15 = objc_opt_new();
        long long v35 = 0u;
        long long v36 = 0u;
        long long v33 = 0u;
        long long v34 = 0u;
        id v16 = v39;
        uint64_t v17 = [v16 countByEnumeratingWithState:&v33 objects:v44 count:16];
        if (v17)
        {
          uint64_t v18 = *(void *)v34;
          do
          {
            uint64_t v19 = 0;
            do
            {
              if (*(void *)v34 != v18) {
                objc_enumerationMutation(v16);
              }
              [v15 setObject:@"default" forKeyedSubscript:*(void *)(*((void *)&v33 + 1) + 8 * v19++)];
            }
            while (v17 != v19);
            uint64_t v17 = [v16 countByEnumeratingWithState:&v33 objects:v44 count:16];
          }
          while (v17);
        }

        long long v31 = 0u;
        long long v32 = 0u;
        long long v29 = 0u;
        long long v30 = 0u;
        id v20 = v38;
        uint64_t v21 = [v20 countByEnumeratingWithState:&v29 objects:v43 count:16];
        if (v21)
        {
          uint64_t v22 = *(void *)v30;
          do
          {
            uint64_t v23 = 0;
            do
            {
              if (*(void *)v30 != v22) {
                objc_enumerationMutation(v20);
              }
              objc_msgSend(v15, "setObject:forKeyedSubscript:", @"dynamic", *(void *)(*((void *)&v29 + 1) + 8 * v23++), (void)v29);
            }
            while (v21 != v23);
            uint64_t v21 = [v20 countByEnumeratingWithState:&v29 objects:v43 count:16];
          }
          while (v21);
        }

        uint64_t v24 = (void *)*((void *)v41 + 13);
        *((void *)v41 + 13) = v15;

        mlir::verify(v40, (mlir::Operation *)1);
      }
      char v25 = "!region.empty() && \"unexpected empty region\"";
      int v26 = 895;
      id v27 = "OpDefinition.h";
      v28 = "getBody";
    }
  }
  else
  {
    char v25 = "index < numRegions && \"invalid region index\"";
    int v26 = 666;
    id v27 = "Operation.h";
    v28 = "getRegion";
  }
  __assert_rtn(v28, v27, v26, v25);
}

- (MPSGraphExecutable)initWithGraph:(id)a3 device:(id)a4 feeds:(id)a5 targetTensors:(id)a6 targetOperations:(id)a7 executableDescriptor:(id)a8
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  obuint64_t j = a3;
  id v22 = a4;
  id v21 = a5;
  id v23 = a6;
  id v24 = a7;
  id v25 = a8;
  v27.receiver = self;
  v27.super_class = (Class)MPSGraphExecutable;
  id v14 = [(MPSGraphExecutable *)&v27 init];
  uint64_t v15 = v14;
  if (v14)
  {
    id v16 = objc_storeWeak((id *)v14 + 1, obj);
    v15[78] = [obj options];

    uint64_t v17 = obj[5];
    uint64_t v18 = obj[6];
    if (v18)
    {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v18 + 8), 1uLL, memory_order_relaxed);
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v18 + 8), 1uLL, memory_order_relaxed);
      uint64_t v19 = (std::__shared_weak_count *)v15[3];
      v15[2] = v17;
      v15[3] = v18;
      if (!v19) {
        goto LABEL_8;
      }
    }
    else
    {
      uint64_t v19 = (std::__shared_weak_count *)v15[3];
      v15[2] = v17;
      v15[3] = 0;
      if (!v19) {
        goto LABEL_8;
      }
    }
    if (!atomic_fetch_add(&v19->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v19->__on_zero_shared)(v19);
      std::__shared_weak_count::__release_weak(v19);
    }
LABEL_8:
    [v15 commonPreInitWithDescriptor:v25];
    [v25 compilerOptions];
    kdebug_trace();
    operator new();
  }

  return 0;
}

void __101__MPSGraphExecutable_initWithGraph_device_feeds_targetTensors_targetOperations_executableDescriptor___block_invoke(uint64_t a1, void *a2)
{
  id v28 = a2;
  uint64_t v3 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "indexOfObject:");
  if (v3 == 0x7FFFFFFFFFFFFFFFLL && MTLReportFailureTypeEnabled())
  {
    int v26 = [v28 operation];
    objc_super v27 = [v26 name];
    MTLReportFailure();
  }
  id v4 = *(void **)(*(void *)(a1 + 40) + 8);
  unint64_t v6 = (uint64_t *)v4[7];
  unint64_t v5 = v4[8];
  if ((unint64_t)v6 < v5)
  {
    uint64_t *v6 = v3;
    uint64_t v7 = (uint64_t)(v6 + 1);
    goto LABEL_23;
  }
  v8 = (uint64_t *)v4[6];
  uint64_t v9 = v6 - v8;
  unint64_t v10 = v9 + 1;
  if ((unint64_t)(v9 + 1) >> 61) {
    std::vector<int>::__throw_length_error[abi:ne180100]();
  }
  uint64_t v11 = v5 - (void)v8;
  if (v11 >> 2 > v10) {
    unint64_t v10 = v11 >> 2;
  }
  if ((unint64_t)v11 >= 0x7FFFFFFFFFFFFFF8) {
    unint64_t v12 = 0x1FFFFFFFFFFFFFFFLL;
  }
  else {
    unint64_t v12 = v10;
  }
  if (v12)
  {
    if (v12 >> 61) {
      std::__throw_bad_array_new_length[abi:ne180100]();
    }
    uint64_t v13 = operator new(8 * v12);
    id v14 = (uint64_t *)&v13[8 * v9];
    uint64_t v15 = &v13[8 * v12];
    *id v14 = v3;
    uint64_t v7 = (uint64_t)(v14 + 1);
    int64_t v16 = (char *)v6 - (char *)v8;
    if (v6 == v8) {
      goto LABEL_21;
    }
    goto LABEL_15;
  }
  uint64_t v13 = 0;
  id v14 = (uint64_t *)(8 * v9);
  uint64_t v15 = 0;
  *(void *)(8 * v9) = v3;
  uint64_t v7 = 8 * v9 + 8;
  int64_t v16 = (char *)v6 - (char *)v8;
  if (v6 != v8)
  {
LABEL_15:
    unint64_t v17 = v16 - 8;
    if (v17 < 0x58) {
      goto LABEL_32;
    }
    if ((unint64_t)((char *)v8 - v13) < 0x20) {
      goto LABEL_32;
    }
    uint64_t v18 = (v17 >> 3) + 1;
    uint64_t v19 = 8 * (v18 & 0x3FFFFFFFFFFFFFFCLL);
    id v20 = &v6[v19 / 0xFFFFFFFFFFFFFFF8];
    id v14 = (uint64_t *)((char *)v14 - v19);
    id v21 = &v13[8 * v9 - 16];
    id v22 = v6 - 2;
    uint64_t v23 = v18 & 0x3FFFFFFFFFFFFFFCLL;
    do
    {
      long long v24 = *(_OWORD *)v22;
      *(v21 - 1) = *((_OWORD *)v22 - 1);
      _OWORD *v21 = v24;
      v21 -= 2;
      v22 -= 4;
      v23 -= 4;
    }
    while (v23);
    unint64_t v6 = v20;
    if (v18 != (v18 & 0x3FFFFFFFFFFFFFFCLL))
    {
LABEL_32:
      do
      {
        uint64_t v25 = *--v6;
        *--id v14 = v25;
      }
      while (v6 != v8);
    }
  }
LABEL_21:
  v4[6] = v14;
  v4[7] = v7;
  v4[8] = v15;
  if (v8) {
    operator delete(v8);
  }
LABEL_23:
  v4[7] = v7;
}

- (MPSGraphExecutable)initWithMLIRModule:(ModuleOp)a3 executableDescriptor:(id)a4
{
  id v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)MPSGraphExecutable;
  uint64_t v7 = [(MPSGraphExecutable *)&v11 init];
  v8 = v7;
  if (v7)
  {
    uint64_t v9 = [(MPSGraphExecutable *)v7 initializeWithMLIRModule:a3.state executableDescriptor:v6];
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

- (id)lazyInitWithModuleURL:(id)a3 executableDescriptor:(id)a4 callablesDescription:(id)a5 moduleResourcesLoader:(shared_ptr<ModuleResourcesLoader>)a6
{
  ptr = a6.__ptr_;
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v41 = a3;
  id v10 = a4;
  id v42 = a5;
  objc_storeWeak((id *)self + 1, 0);
  *((void *)self + 78) = 1;
  id v40 = v10;
  [(MPSGraphExecutable *)self commonPreInitWithDescriptor:v10];
  *((void *)self + 4) = 0;
  llvm::SourceMgr::SourceMgr((llvm::SourceMgr *)v51);
  uint64_t v11 = *((void *)self + 2);
  memset(&v53, 0, 32);
  mlir::SourceMgrDiagnosticHandler::SourceMgrDiagnosticHandler((llvm *)v54, (uint64_t)v51, v11, (long long *)&v53);
  char moduleURL = (char)v53._moduleURL;
  if (v53._moduleURL >= (NSURL *)8)
  {
    if (((uint64_t)v53._moduleURL & 4) != 0)
    {
      if (((uint64_t)v53._moduleURL & 2) != 0) {
        uint64_t v13 = &v53;
      }
      else {
        uint64_t v13 = v53._ctx.__ptr_;
      }
      (*(void (**)(void *))(((unint64_t)v53._moduleURL & 0xFFFFFFFFFFFFFFF8) + 16))(v13);
    }
    if ((moduleURL & 2) == 0) {
      llvm::deallocate_buffer((llvm *)v53._ctx.__ptr_, v53._ctx.__cntrl_);
    }
  }
  *((void *)self + 11) = 0;
  llvm::DenseMapBase<llvm::DenseMap<void const*,std::unique_ptr<RuntimeCacheEntry>,llvm::DenseMapInfo<void const*,void>,llvm::detail::DenseMapPair<void const*,std::unique_ptr<RuntimeCacheEntry>>>,void const*,std::unique_ptr<RuntimeCacheEntry>,llvm::DenseMapInfo<void const*,void>,llvm::detail::DenseMapPair<void const*,std::unique_ptr<RuntimeCacheEntry>>>::clear((llvm *)((char *)self + 112));
  llvm::DenseMapBase<llvm::DenseMap<MPSGraphModuleKey,std::unique_ptr<LazyLoadableModuleRef>,MPSGraphModuleKeyInfo,llvm::detail::DenseMapPair<MPSGraphModuleKey,std::unique_ptr<LazyLoadableModuleRef>>>,MPSGraphModuleKey,std::unique_ptr<LazyLoadableModuleRef>,MPSGraphModuleKeyInfo,llvm::detail::DenseMapPair<MPSGraphModuleKey,std::unique_ptr<LazyLoadableModuleRef>>>::clear((uint64_t)self + 136);
  id v14 = (void *)*((void *)self + 57);
  *((void *)self + 57) = 0;

  uint64_t v15 = (void *)*((void *)self + 58);
  *((void *)self + 58) = 0;

  int64_t v16 = (void *)*((void *)self + 60);
  *((void *)self + 60) = 0;

  uint64_t v18 = (MLIRContext *)*((void *)self + 2);
  unint64_t v17 = (std::__shared_weak_count *)*((void *)self + 3);
  v49 = v18;
  v50 = v17;
  if (v17) {
    atomic_fetch_add_explicit(&v17->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  uint64_t v19 = *(ModuleResourcesLoader **)ptr;
  uint64_t v20 = *((void *)ptr + 1);
  id v47 = *(ModuleResourcesLoader **)ptr;
  uint64_t v48 = v20;
  *(void *)ptr = 0;
  *((void *)ptr + 1) = 0;
  id v21 = (NSURL *)v41;
  v53._ctx.__ptr_ = v18;
  v53._ctx.__cntrl_ = (__shared_weak_count *)v17;
  if (v17) {
    atomic_fetch_add_explicit(&v17->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  v53._originalModule.op.state = 0;
  v53._char moduleURL = v21;
  v53._resourceLoader.__ptr_ = v19;
  v53._resourceLoader.__cntrl_ = (__shared_weak_count *)v20;
  if (v20) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v20 + 8), 1uLL, memory_order_relaxed);
  }
  id v39 = v21;

  LazyLoadableModuleRef::operator=((uint64_t)self + 40, (uint64_t *)&v53);
  LazyLoadableModuleRef::~LazyLoadableModuleRef(&v53);
  if (v20 && !atomic_fetch_add((atomic_ullong *volatile)(v20 + 8), 0xFFFFFFFFFFFFFFFFLL))
  {
    (*(void (**)(uint64_t))(*(void *)v20 + 16))(v20);
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v20);
  }
  if (v50 && !atomic_fetch_add(&v50->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v50->__on_zero_shared)(v50);
    std::__shared_weak_count::__release_weak(v50);
  }
  atomic_store(1u, (unsigned __int8 *)self + 452);
  id v22 = (void *)*((void *)self + 13);
  *((void *)self + 13) = 0;

  uint64_t v23 = v42;
  if (v42)
  {
    long long v24 = (void *)[v42 mutableCopy];
    [v24 allKeys];
    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    id v25 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v26 = [v25 countByEnumeratingWithState:&v43 objects:v52 count:16];
    if (v26)
    {
      uint64_t v27 = *(void *)v44;
      do
      {
        for (uint64_t i = 0; i != v26; ++i)
        {
          if (*(void *)v44 != v27) {
            objc_enumerationMutation(v25);
          }
          uint64_t v29 = *(void *)(*((void *)&v43 + 1) + 8 * i);
          long long v30 = [*((id *)self + 12) callables];
          long long v31 = [v30 objectForKeyedSubscript:v29];
          BOOL v32 = v31 == 0;

          if (v32)
          {
            long long v35 = @"default";
          }
          else
          {
            [v24 objectForKeyedSubscript:v29];

            long long v33 = [v24 objectForKeyedSubscript:v29];
            BOOL v34 = v33 == @"inline";

            long long v35 = @"dynamic";
            if (v34)
            {
              int v36 = MTLReportFailureTypeEnabled();
              long long v35 = @"dynamic";
              if (v36)
              {
                MTLReportFailure();
                long long v35 = @"dynamic";
              }
            }
          }
          [v24 setObject:v35 forKeyedSubscript:v29];
        }
        uint64_t v26 = [v25 countByEnumeratingWithState:&v43 objects:v52 count:16];
      }
      while (v26);
    }

    id v37 = (void *)*((void *)self + 13);
    *((void *)self + 13) = v24;

    uint64_t v23 = v42;
  }
  mlir::SourceMgrDiagnosticHandler::~SourceMgrDiagnosticHandler((mlir::SourceMgrDiagnosticHandler *)v54);
  llvm::SourceMgr::~SourceMgr((llvm::SourceMgr *)v51);

  return self;
}

- (id)initializeWithMLIRModule:(ModuleOp)a3 executableDescriptor:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  state = a3.state;
  id v5 = a4;
  objc_storeWeak((id *)self + 1, 0);
  *((void *)self + 78) = 1;
  [(MPSGraphExecutable *)self commonPreInitWithDescriptor:v5];
  *((void *)self + 4) = 0;
  llvm::SourceMgr::SourceMgr((llvm::SourceMgr *)v13);
  uint64_t v6 = *((void *)self + 2);
  long long v15 = 0u;
  *(_OWORD *)int64_t v16 = 0u;
  mlir::SourceMgrDiagnosticHandler::SourceMgrDiagnosticHandler((llvm *)v17, (uint64_t)v13, v6, &v15);
  char v7 = v16[1];
  if (v16[1] >= 8)
  {
    if ((v16[1] & 4) != 0)
    {
      if ((v16[1] & 2) != 0) {
        v8 = &v15;
      }
      else {
        v8 = (long long *)v15;
      }
      (*(void (**)(long long *))((v16[1] & 0xFFFFFFFFFFFFFFF8) + 16))(v8);
    }
    if ((v7 & 2) == 0) {
      llvm::deallocate_buffer((llvm *)v15, *((void **)&v15 + 1));
    }
  }
  *((void *)self + 11) = 0;
  llvm::DenseMapBase<llvm::DenseMap<void const*,std::unique_ptr<RuntimeCacheEntry>,llvm::DenseMapInfo<void const*,void>,llvm::detail::DenseMapPair<void const*,std::unique_ptr<RuntimeCacheEntry>>>,void const*,std::unique_ptr<RuntimeCacheEntry>,llvm::DenseMapInfo<void const*,void>,llvm::detail::DenseMapPair<void const*,std::unique_ptr<RuntimeCacheEntry>>>::clear((llvm *)((char *)self + 112));
  llvm::DenseMapBase<llvm::DenseMap<MPSGraphModuleKey,std::unique_ptr<LazyLoadableModuleRef>,MPSGraphModuleKeyInfo,llvm::detail::DenseMapPair<MPSGraphModuleKey,std::unique_ptr<LazyLoadableModuleRef>>>,MPSGraphModuleKey,std::unique_ptr<LazyLoadableModuleRef>,MPSGraphModuleKeyInfo,llvm::detail::DenseMapPair<MPSGraphModuleKey,std::unique_ptr<LazyLoadableModuleRef>>>::clear((uint64_t)self + 136);
  uint64_t v9 = (void *)*((void *)self + 57);
  *((void *)self + 57) = 0;

  id v10 = (void *)*((void *)self + 58);
  *((void *)self + 58) = 0;

  uint64_t v11 = (void *)*((void *)self + 60);
  *((void *)self + 60) = 0;

  mlir::Op<mlir::ModuleOp,mlir::OpTrait::OneRegion,mlir::OpTrait::ZeroResults,mlir::OpTrait::ZeroSuccessors,mlir::OpTrait::ZeroOperands,mlir::OpTrait::NoRegionArguments,mlir::OpTrait::NoTerminator,mlir::OpTrait::SingleBlock,mlir::OpTrait::OpInvariants,mlir::BytecodeOpInterface::Trait,mlir::OpTrait::AffineScope,mlir::OpTrait::IsIsolatedFromAbove,mlir::OpTrait::SymbolTable,mlir::SymbolOpInterface::Trait,mlir::OpAsmOpInterface::Trait,mlir::RegionKindInterface::Trait,mlir::OpTrait::HasOnlyGraphRegion>::clone((mlir::Operation::CloneOptions *)&state);
}

- (MPSGraphExecutable)initWithCoreMLPackage:(id)a3 executableDescriptor:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v21 = 0;
  id v22 = &v21;
  uint64_t v23 = 0x3032000000;
  long long v24 = __Block_byref_object_copy__415;
  id v25 = __Block_byref_object_dispose__416;
  id v26 = 0;
  dispatch_semaphore_t v8 = dispatch_semaphore_create(0);
  if (qword_1E8EBF240 == -1)
  {
    id v9 = (id) qword_1E8EBF248;
    if (qword_1E8EBF240 == -1) {
      goto LABEL_3;
    }
LABEL_8:
    dispatch_once(&qword_1E8EBF240, &__block_literal_global_882);
    if ( (id) qword_1E8EBF248) {
      goto LABEL_4;
    }
    goto LABEL_9;
  }
  dispatch_once(&qword_1E8EBF240, &__block_literal_global_882);
  id v14 = (id) qword_1E8EBF248;
  if (qword_1E8EBF240 != -1) {
    goto LABEL_8;
  }
LABEL_3:
  if ( (id) qword_1E8EBF248) {
    goto LABEL_4;
  }
LABEL_9:
  if (MTLReportFailureTypeEnabled()) {
    MTLReportFailure();
  }
LABEL_4:
  if (qword_1E8EBF240 != -1) {
    dispatch_once(&qword_1E8EBF240, &__block_literal_global_882);
  }
  id v10 = (id) qword_1E8EBF248;
  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 3221225472;
  unint64_t v17 = __65__MPSGraphExecutable_initWithCoreMLPackage_executableDescriptor___block_invoke;
  uint64_t v18 = &unk_1E4FC1698;
  uint64_t v20 = &v21;
  uint64_t v11 = v8;
  uint64_t v19 = v11;
  [v10 compileModelAtURL:v6 completionHandler:&v15];
  dispatch_semaphore_wait(v11, 0xFFFFFFFFFFFFFFFFLL);
  unint64_t v12 = -[MPSGraphExecutable initWithMILProgramWithURL:executableDescriptor:](self, "initWithMILProgramWithURL:executableDescriptor:", v22[5], v7, v15, v16, v17, v18);

  _Block_object_dispose(&v21, 8);
  return v12;
}

void __65__MPSGraphExecutable_initWithCoreMLPackage_executableDescriptor___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (!v6)
  {
    if (qword_1E8EBF260 == -1)
    {
      id v7 = (id) qword_1E8EBF268;
      if (qword_1E8EBF260 == -1) {
        goto LABEL_4;
      }
    }
    else
    {
      dispatch_once(&qword_1E8EBF260, &__block_literal_global_888);
      id v16 = (id) qword_1E8EBF268;
      if (qword_1E8EBF260 == -1)
      {
LABEL_4:
        if ( (id) qword_1E8EBF268)
        {
LABEL_5:
          if (qword_1E8EBF260 != -1) {
            dispatch_once(&qword_1E8EBF260, &__block_literal_global_888);
          }
          if ([ (id) qword_1E8EBF268 canAddMLProgramToCompiledModelAtURL:v5])
          {
            if (qword_1E8EBF260 != -1) {
              dispatch_once(&qword_1E8EBF260, &__block_literal_global_888);
            }
            id v19 = 0;
            dispatch_semaphore_t v8 = [ (id) qword_1E8EBF268 addMLProgramToCompiledModelAtURL:v5 error:&v19];
            id v6 = v19;
            if (v6 && MTLReportFailureTypeEnabled())
            {
              id v17 = [v6 description];
              uint64_t v18 = [v17 UTF8String];
              MTLReportFailure();
            }
          }
          else
          {
            id v6 = 0;
          }
          id v9 = (void *)MEMORY[0x1E4F1CB10];
          id v10 = NSString;
          objc_msgSend(v5, "path", v18);
          id v11 = (id)objc_claimAutoreleasedReturnValue();
          unint64_t v12 = [v10 stringWithFormat:@"%@/model.mil", v11];
          uint64_t v13 = [v9 fileURLWithPath:v12];
          uint64_t v14 = *(void *)(*(void *)(a1 + 40) + 8);
          uint64_t v15 = *(void **)(v14 + 40);
          *(void *)(v14 + 40) = v13;

          goto LABEL_14;
        }
LABEL_20:
        if (MTLReportFailureTypeEnabled()) {
          MTLReportFailure();
        }
        goto LABEL_5;
      }
    }
    dispatch_once(&qword_1E8EBF260, &__block_literal_global_888);
    if ( (id) qword_1E8EBF268) {
      goto LABEL_5;
    }
    goto LABEL_20;
  }
  if (!MTLReportFailureTypeEnabled()) {
    goto LABEL_15;
  }
  id v11 = [v6 description];
  [v11 UTF8String];
  MTLReportFailure();
LABEL_14:

LABEL_15:
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (MPSGraphExecutable)initWithCoreMLPackageAtURL:(id)a3 compilationDescriptor:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_semaphore_t v8 = objc_opt_new();
  [v8 setCompilationDescriptor:v7];
  id v9 = [(MPSGraphExecutable *)self initWithCoreMLPackage:v6 executableDescriptor:v8];

  return v9;
}

- (MPSGraphExecutable)initWithMILProgramWithURL:(id)a3 executableDescriptor:(id)a4
{
  id v6 = a3;
  long long v43 = (MIL::MILContext *)a4;
  MIL::MILContext::Make((uint64_t *)&__dst, v43);
  std::string::size_type v55 = __dst.__r_.__value_.__r.__words[0];
  if (__dst.__r_.__value_.__r.__words[0]) {
    operator new();
  }
  id v56 = 0;
  MEMORY[0x1852FD510](0);
  MEMORY[0x1852FD520](0);
  id v54 = 0;
  id v7 = [NSString stringWithContentsOfURL:v6 encoding:4 error:&v54];
  id v44 = v54;
  id v39 = v7;
  if (v44 && MTLReportFailureTypeEnabled())
  {
    [v6 absoluteString];
    id v35 = v6;
    id v36 = objc_claimAutoreleasedReturnValue();
    [v36 UTF8String];
    id v37 = [v44 localizedFailureReason];
    [v37 cStringUsingEncoding:4];
    id v38 = [v44 localizedDescription];
    [v38 cStringUsingEncoding:4];
    MTLReportFailure();

    id v6 = v35;
    id v7 = v39;
  }
  id v42 = v7;
  dispatch_semaphore_t v8 = (const char *)[v42 UTF8String];
  size_t v9 = strlen(v8);
  if (v9 > 0x7FFFFFFFFFFFFFF7) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  std::string::size_type v10 = v9;
  if (v9 >= 0x17)
  {
    uint64_t v12 = (v9 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v9 | 7) != 0x17) {
      uint64_t v12 = v9 | 7;
    }
    uint64_t v13 = v12 + 1;
    p_dst = (std::string *)operator new(v12 + 1);
    __dst.__r_.__value_.__l.__size_ = v10;
    __dst.__r_.__value_.__r.__words[2] = v13 | 0x8000000000000000;
    __dst.__r_.__value_.__r.__words[0] = (std::string::size_type)p_dst;
  }
  else
  {
    *((unsigned char *)&__dst.__r_.__value_.__s + 23) = v9;
    p_dst = &__dst;
    if (!v9) {
      goto LABEL_12;
    }
  }
  size_t v9 = (size_t)memmove(p_dst, v8, v10);
LABEL_12:
  p_dst->__r_.__value_.__s.__data_[v10] = 0;
  MIL::ParserOptions::Make(&v45, (MIL::ParserOptions *)v9);
  id v41 = v6;
  uint64_t v14 = [v6 pathComponents];
  uint64_t v15 = NSString;
  id v16 = objc_msgSend(v14, "subarrayWithRange:", 0, objc_msgSend(v14, "count") - 1);
  id v40 = self;
  id v17 = [v15 pathWithComponents:v16];

  char v52 = 0;
  uint64_t v18 = [MEMORY[0x1E4F28CB8] defaultManager];
  char v19 = [v18 fileExistsAtPath:v17 isDirectory:&v52];
  if ([v17 length])
  {
    char v20 = v52 ? v19 : 0;
    if ((v20 & 1) == 0) {
      __assert_rtn("-[MPSGraphExecutable initWithMILProgramWithURL:executableDescriptor:]", "MPSGraphExecutable.mm", 1236, "isDirectory && isPath");
    }
  }
  uint64_t v21 = v45;
  id v22 = v17;
  uint64_t v23 = (const char *)[v22 UTF8String];
  size_t v24 = strlen(v23);
  if (v24 > 0x7FFFFFFFFFFFFFF7) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  id v25 = (void *)v24;
  if (v24 >= 0x17)
  {
    uint64_t v27 = (v24 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v24 | 7) != 0x17) {
      uint64_t v27 = v24 | 7;
    }
    uint64_t v28 = v27 + 1;
    id v26 = operator new(v27 + 1);
    __p[1] = v25;
    unint64_t v51 = v28 | 0x8000000000000000;
    __p[0] = v26;
    goto LABEL_24;
  }
  HIBYTE(v51) = v24;
  id v26 = __p;
  if (v24) {
LABEL_24:
  }
    memmove(v26, v23, (size_t)v25);
  *((unsigned char *)v25 + (void)v26) = 0;
  (*(void (**)(uint64_t, void **))(*(void *)v21 + 48))(v21, __p);
  if (SHIBYTE(v51) < 0) {
    operator delete(__p[0]);
  }
  std::string::size_type v47 = v55;
  uint64_t v48 = v56;
  if (v56) {
    atomic_fetch_add_explicit(&v56->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0) {
    std::string::__init_copy_ctor_external(&v46, __dst.__r_.__value_.__l.__data_, __dst.__r_.__value_.__l.__size_);
  }
  else {
    std::string v46 = __dst;
  }
  MIL::Text::ParseProgram();
  uint64_t v29 = v49;
  uint64_t v49 = 0;
  if (SHIBYTE(v46.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v46.__r_.__value_.__l.__data_);
  }
  long long v30 = v48;
  if (v48 && !atomic_fetch_add(&v48->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v30->__on_zero_shared)(v30);
    std::__shared_weak_count::__release_weak(v30);
  }

  uint64_t v31 = v45;
  uint64_t v45 = 0;
  if (v31) {
    (*(void (**)(uint64_t))(*(void *)v31 + 8))(v31);
  }
  BOOL v32 = [[MPSGraphExecutable alloc] initWithMILProgram:v29 executableDescriptor:v43];
  if (v29) {
    (*(void (**)(uint64_t))(*(void *)v29 + 8))(v29);
  }
  if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__dst.__r_.__value_.__l.__data_);
  }

  long long v33 = v56;
  if (v56 && !atomic_fetch_add(&v56->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v33->__on_zero_shared)(v33);
    std::__shared_weak_count::__release_weak(v33);
  }

  return v32;
}

- (MPSGraphExecutable)initWithMILProgram:(void *)a3 executableDescriptor:(id)a4
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = [(MPSGraphExecutable *)self init];
  *((void *)v6 + 78) = 1;
  [(MPSGraphExecutable *)v6 commonPreInitWithDescriptor:v5];
  [v5 compilerOptions];
  lowerMILProgram();
}

+ (__CFDictionary)validateNetworkWithParams:(__CFDictionary *)a3 apiVersion:(unint64_t)a4
{
}

+ (unint64_t)getValidateNetworkSupportedVersion
{
  return 0;
}

- (MPSGraphExecutable)initWithMLIRSourceFromURL:(id)a3 executableDescriptor:(id)a4
{
  id v6 = a4;
  id v16 = 0;
  id v7 = [NSString stringWithContentsOfURL:a3 encoding:4 error:&v16];
  id v8 = v16;
  if (v8 && MTLReportFailureTypeEnabled())
  {
    id v11 = [v8 localizedFailureReason];
    uint64_t v12 = [v11 cStringUsingEncoding:4];
    id v13 = [v8 localizedDescription];
    uint64_t v14 = v12;
    uint64_t v15 = [v13 cStringUsingEncoding:4];
    MTLReportFailure();
  }
  size_t v9 = -[MPSGraphExecutable initWithMLIRSource:executableDescriptor:](self, "initWithMLIRSource:executableDescriptor:", v7, v6, v14, v15);

  return v9;
}

- (MPSGraphExecutable)initWithMLIRCommon:()unique_ptr<llvm:(std:(id)a4 :(id *)a5 default_delete<llvm::MemoryBuffer>>)a3 :MemoryBuffer executableDescriptor:error:
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  [(MPSGraphExecutable *)self initializeMLIR];
  size_t v9 = (char *)operator new(0x60uLL);
  *((void *)v9 + 1) = 0;
  *((void *)v9 + 2) = 0;
  *(void *)size_t v9 = &unk_1EC9CFDE8;
  llvm::SourceMgr::SourceMgr((llvm::SourceMgr *)(v9 + 24));
  v18[0] = v10;
  v18[1] = (uint64_t **)v9;
  unint64_t v11 = *(void *)a3.var0.var0;
  *(void *)a3.var0.var0 = 0;
  uint64_t v22 = 0;
  __n128 v21 = (__n128)v11;
  unint64_t v12 = *((void *)v9 + 4);
  if (v12 >= *((void *)v9 + 5))
  {
    id v13 = std::vector<llvm::SourceMgr::SrcBuffer>::__push_back_slow_path<llvm::SourceMgr::SrcBuffer>((__n128 **)v10, &v21);
  }
  else
  {
    llvm::SourceMgr::SrcBuffer::SrcBuffer(*((__n128 **)v9 + 4), &v21);
    id v13 = (__n128 *)(v12 + 24);
    *((void *)v9 + 4) = v12 + 24;
  }
  *((void *)v9 + 4) = v13;
  llvm::SourceMgr::SrcBuffer::~SrcBuffer((llvm::SourceMgr::SrcBuffer *)&v21);
  mlir::ParserConfig::ParserConfig((uint64_t)&v21, *((void *)self + 2), 1, 0);
  mlir::mps::importMPSModule(v18, (mlir::StringAttr **)&v21, &v17);
  if (v17)
  {
    [(MPSGraphExecutable *)self initializeWithMLIRModule:v17 executableDescriptor:v8];
    objc_claimAutoreleasedReturnValue();
    uint64_t v14 = v17;
    if (!v17) {
      goto LABEL_10;
    }
  }
  else
  {
    if (!a5) {
      goto LABEL_10;
    }
    uint64_t v15 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v19 = *MEMORY[0x1E4F28568];
    char v20 = @"Error importing MLIR module.";
    id v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v20 forKeys:&v19 count:1];
    *a5 = [v15 errorWithDomain:@"com.apple.mps" code:-19 userInfo:v16];

    uint64_t v14 = v17;
    if (!v17) {
LABEL_10:
    }
      mlir::ParserConfig::~ParserConfig((mlir::ParserConfig *)&v21);
  }
  mlir::Operation::erase(v14);
  goto LABEL_10;
}

- (MPSGraphExecutable)initWithMLIRSource:(id)a3 executableDescriptor:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v21.receiver = self;
  v21.super_class = (Class)MPSGraphExecutable;
  id v8 = [(MPSGraphExecutable *)&v21 init];
  if (v8)
  {
    size_t v9 = (const char *)[v6 UTF8String];
    uint64_t v10 = (uint64_t)v9;
    if (v9) {
      size_t v11 = strlen(v9);
    }
    else {
      size_t v11 = 0;
    }
    llvm::MemoryBuffer::getMemBuffer(v10, v11, (uint64_t)"", 0, &v20);
    uint64_t v19 = v20;
    char v20 = 0;
    id v18 = 0;
    unint64_t v12 = [(MPSGraphExecutable *)v8 initWithMLIRCommon:&v19 executableDescriptor:v7 error:&v18];
    id v13 = v18;
    uint64_t v14 = v19;
    uint64_t v19 = 0;
    if (v14) {
      (*(void (**)(char *))(*(void *)v14 + 8))(v14);
    }
    if (!v12)
    {
      if (v13)
      {
        [v13 localizedDescription];

        if (MTLReportFailureTypeEnabled())
        {
          id v17 = [v13 localizedDescription];
          MTLReportFailure();
        }
      }
      else if (MTLReportFailureTypeEnabled())
      {
        MTLReportFailure();
      }
    }

    uint64_t v15 = v20;
    char v20 = 0;
    if (v15) {
      (*(void (**)(char *))(*(void *)v15 + 8))(v15);
    }
  }
  else
  {
    unint64_t v12 = 0;
  }

  return v12;
}

- (MPSGraphExecutable)initWithMLIRBytecode:(id)a3 executableDescriptor:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v19.receiver = self;
  v19.super_class = (Class)MPSGraphExecutable;
  id v8 = [(MPSGraphExecutable *)&v19 init];
  if (v8)
  {
    id v9 = v6;
    llvm::MemoryBuffer::getMemBuffer([v9 bytes], objc_msgSend(v9, "length"), (uint64_t)"", 0, &v18);
    id v17 = v18;
    id v18 = 0;
    id v16 = 0;
    uint64_t v10 = [(MPSGraphExecutable *)v8 initWithMLIRCommon:&v17 executableDescriptor:v7 error:&v16];
    id v11 = v16;
    unint64_t v12 = v17;
    id v17 = 0;
    if (v12) {
      (*(void (**)(char *))(*(void *)v12 + 8))(v12);
    }
    if (!v10)
    {
      if (v11)
      {
        [v11 localizedDescription];

        if (MTLReportFailureTypeEnabled())
        {
          uint64_t v15 = [v11 localizedDescription];
          MTLReportFailure();
        }
      }
      else if (MTLReportFailureTypeEnabled())
      {
        MTLReportFailure();
      }
    }

    id v13 = v18;
    id v18 = 0;
    if (v13) {
      (*(void (**)(char *))(*(void *)v13 + 8))(v13);
    }
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

+ (MPSGraphExecutable)executableWithMLIRSourceFromURL:(id)a3 executableDescriptor:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  id v22 = 0;
  id v9 = [NSString stringWithContentsOfURL:v7 encoding:4 error:&v22];
  id v10 = v22;
  id v11 = v10;
  if (v9)
  {
    unint64_t v12 = (const char *)[v9 UTF8String];
    uint64_t v13 = (uint64_t)v12;
    if (v12) {
      size_t v14 = strlen(v12);
    }
    else {
      size_t v14 = 0;
    }
    llvm::MemoryBuffer::getMemBuffer(v13, v14, (uint64_t)"", 0, &v21);
    id v16 = [MPSGraphExecutable alloc];
    char v20 = v21;
    objc_super v21 = 0;
    uint64_t v15 = [(MPSGraphExecutable *)v16 initWithMLIRCommon:&v20 executableDescriptor:v8 error:a5];
    id v17 = v20;
    char v20 = 0;
    if (v17) {
      (*(void (**)(char *))(*(void *)v17 + 8))(v17);
    }
    id v18 = v21;
    objc_super v21 = 0;
    if (v18) {
      (*(void (**)(char *))(*(void *)v18 + 8))(v18);
    }
  }
  else
  {
    uint64_t v15 = 0;
    if (a5) {
      *a5 = v10;
    }
  }

  return v15;
}

- (MPSGraphExecutable)initWithMPSGraphPackageAtURL:(NSURL *)mpsgraphPackageURL compilationDescriptor:(MPSGraphCompilationDescriptor *)compilationDescriptor
{
  id v6 = mpsgraphPackageURL;
  id v7 = compilationDescriptor;
  v15.receiver = self;
  v15.super_class = (Class)MPSGraphExecutable;
  id v8 = [(MPSGraphExecutable *)&v15 init];
  if (v8)
  {
    id v14 = 0;
    id v9 = [(MPSGraphExecutable *)v8 initWithMPSGraphPackageAtURLCommon:v6 compilationDescriptor:v7 error:&v14];
    id v10 = v14;
    id v11 = v10;
    if (!v9)
    {
      if (v10)
      {
        [v10 localizedDescription];

        if (MTLReportFailureTypeEnabled())
        {
          uint64_t v13 = [v11 localizedDescription];
          MTLReportFailure();
        }
      }
      else if (MTLReportFailureTypeEnabled())
      {
        MTLReportFailure();
      }
    }
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

+ (MPSGraphExecutable)executableWithMPSGraphPackageAtURL:(id)a3 compilationDescriptor:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [[MPSGraphExecutable alloc] initWithMPSGraphPackageAtURLCommon:v7 compilationDescriptor:v8 error:a5];

  return v9;
}

- (ReturnOp)returnOpForFunctionInModule:(ModuleOp)a3
{
  v3.var0 = (Operation *)[(MPSGraphExecutable *)self getEntryFuncOpForModule:a3.state];
  if (!v3.var0 && MTLReportFailureTypeEnabled()) {
    MTLReportFailure();
  }
  unint64_t v4 = *((unsigned int *)v3.var0 + 11);
  if ((v4 & 0x7FFFFF) == 0) {
    __assert_rtn("getRegion", "Operation.h", 666, "index < numRegions && \"invalid region index\"");
  }
  unint64_t v5 = (unint64_t)v3.var0 + 16 * ((v4 >> 23) & 1) + ((v4 >> 21) & 0x7F8) + 64;
  if (v5 >= 0xFFFFFFFFFFFFFFF9) {
    __assert_rtn("alignAddr", "Alignment.h", 191, "static_cast<uintptr_t>(ArithAddr + Alignment.value() - 1) >= ArithAddr && \"Overflow\"");
  }
  uint64_t v6 = *(void *)(((v5 + 7) & 0xFFFFFFFFFFFFFFF8) + 32 * *((unsigned int *)v3.var0 + 10) + 8);
  if (v6) {
    id v7 = (mlir::GenericProgramPoint **)(v6 - 8);
  }
  else {
    id v7 = 0;
  }
  mlir::Block::getTerminator(v7);
  if (!v8
    || (uint64_t v9 = llvm::DefaultDoCastIfPossible<mlir::func::ReturnOp,mlir::Operation *,llvm::CastInfo<mlir::func::ReturnOp,mlir::Operation *,void>>::doCastIfPossible(v8)) == 0)
  {
    if (MTLReportFailureTypeEnabled()) {
      MTLReportFailure();
    }
    return (ReturnOp)0;
  }
  return (ReturnOp)v9;
}

+ (id)executablesWithMLIRSourceForMultipleModules:(id)a3 executableDescriptor:(id)a4 regionNames:(id)a5
{
  v26[5] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  v21[3] = (char *)a4;
  v21[2] = (char *)a5;
  v21[1] = (char *)objc_opt_new();
  uint64_t v8 = (const char *)[v7 UTF8String];
  uint64_t v9 = (uint64_t)v8;
  if (v8) {
    size_t v10 = strlen(v8);
  }
  else {
    size_t v10 = 0;
  }
  llvm::MemoryBuffer::getMemBuffer(v9, v10, (uint64_t)"", 0, v21);
  id v11 = operator new(0x20uLL);
  *((void *)v11 + 1) = 0;
  *((void *)v11 + 2) = 0;
  *(void *)id v11 = &unk_1EC9CFE58;
  objc_super v19 = (mlir::MLIRContext *)mlir::MLIRContext::MLIRContext((mlir::MLIRContextImpl **)v11 + 3, 0);
  char v20 = v11;
  loadCommonMPSDialectsInContext(v19);
  mlir::MLIRContext::allowUnregisteredDialects((uint64_t)v19, 1);
  llvm::SourceMgr::SourceMgr((llvm::SourceMgr *)&v16);
  unint64_t v12 = v21[0];
  v21[0] = 0;
  uint64_t v24 = 0;
  __n128 v23 = (__n128)(unint64_t)v12;
  uint64_t v13 = v17;
  if ((unint64_t)v17 >= v18)
  {
    id v14 = std::vector<llvm::SourceMgr::SrcBuffer>::__push_back_slow_path<llvm::SourceMgr::SrcBuffer>((__n128 **)&v16, &v23);
  }
  else
  {
    llvm::SourceMgr::SrcBuffer::SrcBuffer(v17, &v23);
    id v14 = (__n128 *)((char *)v13 + 24);
  }
  id v17 = v14;
  llvm::SourceMgr::SrcBuffer::~SrcBuffer((llvm::SourceMgr::SrcBuffer *)&v23);
  mlir::ParserConfig::ParserConfig((uint64_t)&v23, (uint64_t)v19, 1, 0);
  uint64_t v22 = 0;
  memset(v25, 0, sizeof(v25));
  v26[0] = v26;
  v26[1] = v26;
  memset(&v26[2], 0, 24);
  if (mlir::parseSourceFile(&v16, (uint64_t)v25, (uint64_t ***)&v23, &v22))
  {
    if (!v22) {
      __assert_rtn("Location", "Location.h", 66, "loc && \"location should never be null.\"");
    }
    mlir::detail::constructContainerOpForParserIfNecessary<mlir::ModuleOp>((uint64_t)v25, (mlir::StringAttr *)v23.n128_u64[0], v22, &v15);
  }
  else
  {
    objc_super v15 = 0;
  }
  mlir::Block::~Block((mlir::Block *)v25);
  operator new();
}

- (void)setSpecializationCountMax:(unint64_t)a3
{
  *((void *)self + 76) = a3;
}

- (BOOL)isExecutableForFeeds:(id)a3 targetTensors:(id)a4 targetOperations:(id)a5 compilationDescriptor:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = [v12 count];
  if (v14 == [*((id *)self + 58) count])
  {
    uint64_t v15 = [v11 count];
    if (v15 == [*((id *)self + 57) count])
    {
      uint64_t v16 = [v10 count];
      if (v16 == [*((id *)self + 60) count])
      {
        uint64_t v52 = 0;
        LazyLoadableModuleRef v53 = &v52;
        uint64_t v54 = 0x2020000000;
        char v55 = 1;
        id v17 = (void *)*((void *)self + 58);
        v49[0] = MEMORY[0x1E4F143A8];
        v49[1] = 3221225472;
        v49[2] = __96__MPSGraphExecutable_isExecutableForFeeds_targetTensors_targetOperations_compilationDescriptor___block_invoke;
        v49[3] = &unk_1E4FC16C0;
        unint64_t v51 = &v52;
        id v50 = v12;
        [v17 enumerateObjectsUsingBlock:v49];
        unint64_t v18 = (void *)*((void *)self + 57);
        v46[0] = MEMORY[0x1E4F143A8];
        v46[1] = 3221225472;
        v46[2] = __96__MPSGraphExecutable_isExecutableForFeeds_targetTensors_targetOperations_compilationDescriptor___block_invoke_2;
        v46[3] = &unk_1E4FC16E8;
        uint64_t v48 = &v52;
        id v47 = v11;
        [v18 enumerateObjectsUsingBlock:v46];
        if ([v13 compilerOptions])
        {
          objc_super v19 = (void *)*((void *)self + 60);
          v43[0] = MEMORY[0x1E4F143A8];
          v43[1] = 3221225472;
          v43[2] = __96__MPSGraphExecutable_isExecutableForFeeds_targetTensors_targetOperations_compilationDescriptor___block_invoke_3;
          v43[3] = &unk_1E4FC1710;
          id v44 = v10;
          uint64_t v45 = &v52;
          [v19 enumerateKeysAndObjectsUsingBlock:v43];
        }
        if ((_BYTE)word_1E8EBD9C1)
        {
          char v20 = v53;
          if (*((unsigned char *)v53 + 24))
          {
            char v21 = [*((id *)self + 12) isEqualTo:v13];
LABEL_9:
            char v20 = v53;
LABEL_54:
            *((unsigned char *)v20 + 24) = v21;

            _Block_object_dispose(&v52, 8);
            goto LABEL_11;
          }
          goto LABEL_47;
        }
        char v20 = v53;
        int v23 = *((unsigned __int8 *)v53 + 24);
        if (!HIBYTE(word_1E8EBD9C1))
        {
          if (*((unsigned char *)v53 + 24))
          {
            uint64_t v24 = [v13 compilerOptions];
            int v23 = v24 == [*((id *)self + 12) compilerOptions];
            char v20 = v53;
          }
          *((unsigned char *)v20 + 24) = v23;
        }
        if (v23)
        {
          uint64_t v25 = [v13 aneCompilerSpatialSplitting];
          BOOL v26 = v25 != [*((id *)self + 12) aneCompilerSpatialSplitting] && byte_1E8EBD9E1 == 0;
          char v27 = !v26;
          char v20 = v53;
          *((unsigned char *)v53 + 24) = v27;
          if (!v26)
          {
            int v28 = [v13 enableANEFWToFWSignal];
            int v29 = v28 ^ [*((id *)self + 12) enableANEFWToFWSignal] ^ 1;
            if (byte_1E8EBD9F0) {
              char v30 = 1;
            }
            else {
              char v30 = v29;
            }
            char v20 = v53;
            *((unsigned char *)v53 + 24) = v30;
            if (v30)
            {
              int v31 = [v13 enableANELateLatch];
              int v32 = v31 ^ [*((id *)self + 12) enableANELateLatch] ^ 1;
              if (byte_1E8EBD9F2) {
                int v33 = 1;
              }
              else {
                int v33 = v32;
              }
              char v20 = v53;
              *((unsigned char *)v53 + 24) = v33;
              if (v33 == 1)
              {
                BOOL v34 = [v13 entryFunctionName];
                id v35 = [*((id *)self + 12) entryFunctionName];
                *((unsigned char *)v53 + 24) = v34 == v35;

                char v20 = v53;
                if (*((unsigned char *)v53 + 24))
                {
                  id v36 = [v13 callables];
                  id v37 = [*((id *)self + 12) callables];
                  *((unsigned char *)v53 + 24) = v36 == v37;

                  char v20 = v53;
                  if (*((unsigned char *)v53 + 24))
                  {
                    uint64_t v38 = [v13 minimumNumberOfOpsInParallelRegion];
                    BOOL v39 = v38 != [*((id *)self + 12) minimumNumberOfOpsInParallelRegion]
                       && byte_1E8EBDA21 == 0;
                    char v40 = !v39;
                    char v20 = v53;
                    *((unsigned char *)v53 + 24) = v40;
                    if (!v39)
                    {
                      uint64_t v41 = [v13 maximumNumberOfParallelEncodingRegions];
                      char v21 = v41 == [*((id *)self + 12) maximumNumberOfParallelEncodingRegions]
                         || byte_1E8EBDA30 != 0;
                      goto LABEL_9;
                    }
LABEL_47:
                    char v21 = 0;
                    goto LABEL_54;
                  }
LABEL_53:
                  char v21 = 0;
                  *((unsigned char *)v20 + 24) = 0;
                  goto LABEL_54;
                }
LABEL_52:
                *((unsigned char *)v20 + 24) = 0;
                goto LABEL_53;
              }
LABEL_51:
              *((unsigned char *)v20 + 24) = 0;
              goto LABEL_52;
            }
LABEL_50:
            *((unsigned char *)v20 + 24) = 0;
            goto LABEL_51;
          }
        }
        else
        {
          *((unsigned char *)v20 + 24) = 0;
        }
        *((unsigned char *)v20 + 24) = 0;
        goto LABEL_50;
      }
    }
  }
  char v21 = 0;
LABEL_11:

  return v21;
}

uint64_t __96__MPSGraphExecutable_isExecutableForFeeds_targetTensors_targetOperations_compilationDescriptor___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  if (*(unsigned char *)(v4 + 24))
  {
    id v7 = v3;
    uint64_t v5 = [*(id *)(a1 + 32) containsObject:v3];
    id v3 = v7;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v5;
  }
  else
  {
    uint64_t v5 = 0;
    *(unsigned char *)(v4 + 24) = 0;
  }
  return MEMORY[0x1F41817F8](v5, v3);
}

uint64_t __96__MPSGraphExecutable_isExecutableForFeeds_targetTensors_targetOperations_compilationDescriptor___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  if (*(unsigned char *)(v4 + 24))
  {
    id v7 = v3;
    uint64_t v5 = [*(id *)(a1 + 32) containsObject:v3];
    id v3 = v7;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v5;
  }
  else
  {
    uint64_t v5 = 0;
    *(unsigned char *)(v4 + 24) = 0;
  }
  return MEMORY[0x1F41817F8](v5, v3);
}

void __96__MPSGraphExecutable_isExecutableForFeeds_targetTensors_targetOperations_compilationDescriptor___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  uint64_t v6 = [*(id *)(a1 + 32) objectForKeyedSubscript:v10];
  id v7 = v6;
  uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
  if (*(unsigned char *)(v8 + 24))
  {
    char v9 = [v6 isEqualTo:v5];
    uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
  }
  else
  {
    char v9 = 0;
  }
  *(unsigned char *)(v8 + 24) = v9;
}

- (id)getOperationsToVisitForOperation:(id)a3 visitedOperations:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v8 = v5[5];
  if (v8)
  {
    char v9 = *(void **)(v8 + 8);
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    _OWORD v25[2] = __73__MPSGraphExecutable_getOperationsToVisitForOperation_visitedOperations___block_invoke;
    v25[3] = &unk_1E4FC1738;
    id v26 = v6;
    id v27 = v7;
    [v9 enumerateObjectsUsingBlock:v25];
  }
  id v10 = [v5 inputTensors];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __73__MPSGraphExecutable_getOperationsToVisitForOperation_visitedOperations___block_invoke_2;
  v22[3] = &unk_1E4FC1580;
  id v11 = v6;
  id v23 = v11;
  id v12 = v7;
  id v24 = v12;
  [v10 enumerateObjectsUsingBlock:v22];

  id v13 = [v5 controlDependencies];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __73__MPSGraphExecutable_getOperationsToVisitForOperation_visitedOperations___block_invoke_3;
  v19[3] = &unk_1E4FC1760;
  id v14 = v11;
  id v20 = v14;
  id v15 = v12;
  id v21 = v15;
  [v13 enumerateObjectsUsingBlock:v19];

  uint64_t v16 = v21;
  id v17 = v15;

  return v17;
}

void __73__MPSGraphExecutable_getOperationsToVisitForOperation_visitedOperations___block_invoke(uint64_t a1, uint64_t a2)
{
  id v4 = *(id *)(a2 + 8);
  id v3 = objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:");

  if (!v3) {
    [*(id *)(a1 + 40) addObject:v4];
  }
}

void __73__MPSGraphExecutable_getOperationsToVisitForOperation_visitedOperations___block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = [a2 operation];
  id v3 = objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:");

  if (!v3) {
    [*(id *)(a1 + 40) addObject:v4];
  }
}

void __73__MPSGraphExecutable_getOperationsToVisitForOperation_visitedOperations___block_invoke_3(uint64_t a1, void *a2)
{
  id v4 = a2;
  id v3 = objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:");

  if (!v3) {
    [*(id *)(a1 + 40) addObject:v4];
  }
}

- (OwningOpRef<mlir::ModuleOp>)cloneForFeeds:(id)a3 targetTensors:(id)a4 targetOperations:(id)a5
{
  v225 = v5;
  uint64_t v277 = *MEMORY[0x1E4F143B8];
  a3;
  id v9 = a4;
  id v10 = self;
  id v229 = v9;
  id v228 = a5;
  v254[0] = 0;
  v254[1] = 0;
  unsigned int v255 = 0;
  v256 = 0;
  uint64_t v257 = 0;
  int v258 = 0;
  v259 = 0;
  uint64_t v260 = 0;
  unsigned int v261 = 0;
  id v11 = (uint64_t **)*((void *)self + 4);
  location = (id *)((char *)self + 8);
  WeakRetained = (mlir::Operation **)objc_loadWeakRetained((id *)self + 1);
  id v13 = mlir::OpBuilder::clone(v11, WeakRetained[8], (mlir::IRMapping *)v254);
  uint64_t v14 = *((void *)v13 + 6);
  id v15 = *(void **)(v14 + 16);
  if (v15 == &mlir::detail::TypeIDResolver<void,void>::id)
  {
    *(void *)&long long v274 = *(void *)(v14 + 8);
    AttrData = (void *)mlir::OpaqueAttr::getAttrData((mlir::OpaqueAttr *)&v274);
    if (v223 == 14 && *AttrData == 0x2E6E69746C697562 && *(void *)((char *)AttrData + 6) == 0x656C75646F6D2E6ELL)
    {
      __int16 v270 = 1283;
      __p = "classof on '";
      v268 = "builtin.module";
      uint64_t v269 = 14;
      v262 = "' failed due to the operation not being registered";
      __int16 v265 = 259;
      llvm::operator+((uint64_t *)&__p, (uint64_t *)&v262, (uint64_t)&v274);
      llvm::report_fatal_error((llvm::Twine *)&v274, 1);
    }
  }
  else
  {
    v226 = v13;
    if (v15 == &mlir::detail::TypeIDResolver<mlir::ModuleOp,void>::id)
    {

      __p = 0;
      v267 = 0;
      v268 = 0;
      long long v250 = 0u;
      long long v251 = 0u;
      long long v252 = 0u;
      long long v253 = 0u;
      obunint64_t j = *((id *)self + 59);
      uint64_t v16 = [obj countByEnumeratingWithState:&v250 objects:v273 count:16];
      v233 = self;
      if (!v16) {
        goto LABEL_38;
      }
      id v17 = 0;
      uint64_t v231 = *(void *)v251;
      while (1)
      {
        uint64_t v232 = v16;
        for (uint64_t i = 0; i != v232; ++i)
        {
          if (*(void *)v251 != v231) {
            objc_enumerationMutation(obj);
          }
          objc_super v19 = [*((id *)v10 + 60) objectForKeyedSubscript:*(void *)(*((void *)&v250 + 1) + 8 * i)];
          id v20 = (mlir::MLIRContext **)*((void *)v10 + 4);
          id v21 = [v19 shape];
          uint64_t v22 = (mlir::MLIRContext *)[v19 dataType];
          id v23 = v21;
          id v24 = *v20;
          id v25 = v23;
          uint64_t MLIRElementType = getMLIRElementType(v24, v22);
          MLIRType = getMLIRType(v25, MLIRElementType);

          id v10 = v233;
          if (v17 < v268)
          {
            *(void *)id v17 = MLIRType;
            v17 += 8;
            goto LABEL_25;
          }
          int v28 = (char *)__p;
          int64_t v29 = v17 - (unsigned char *)__p;
          uint64_t v30 = (v17 - (unsigned char *)__p) >> 3;
          unint64_t v31 = v30 + 1;
          if ((unint64_t)(v30 + 1) >> 61) {
            std::vector<int>::__throw_length_error[abi:ne180100]();
          }
          uint64_t v32 = v268 - (unsigned char *)__p;
          if ((v268 - (unsigned char *)__p) >> 2 > v31) {
            unint64_t v31 = v32 >> 2;
          }
          if ((unint64_t)v32 >= 0x7FFFFFFFFFFFFFF8) {
            unint64_t v33 = 0x1FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v33 = v31;
          }
          if (v33)
          {
            if (v33 >> 61) {
              std::__throw_bad_array_new_length[abi:ne180100]();
            }
            BOOL v34 = operator new(8 * v33);
            id v35 = (uint64_t ***)&v34[8 * v30];
            void *v35 = MLIRType;
            uint64_t v36 = (uint64_t)(v35 + 1);
            int64_t v37 = v17 - v28;
            if (v17 == v28)
            {
LABEL_28:
              id v10 = v233;
              __p = v35;
              v267 = (char *)v36;
              v268 = &v34[8 * v33];
              if (!v17) {
                goto LABEL_24;
              }
LABEL_23:
              operator delete(v17);
              goto LABEL_24;
            }
          }
          else
          {
            BOOL v34 = 0;
            id v35 = (uint64_t ***)(8 * v30);
            *(void *)(8 * v30) = MLIRType;
            uint64_t v36 = 8 * v30 + 8;
            int64_t v37 = v17 - v28;
            if (v17 == v28) {
              goto LABEL_28;
            }
          }
          unint64_t v38 = v37 - 8;
          if (v38 < 0x168
            || (unint64_t v41 = (v17 - 8 - v28) & 0xFFFFFFFFFFFFFFF8, &v34[v29 - 8 - v41] > &v34[v29 - 8])
            || &v17[-v41 - 8] > v17 - 8
            || (unint64_t)(v17 - v34 - v29) < 0x20)
          {
            BOOL v39 = v17;
            id v10 = v233;
            do
            {
LABEL_21:
              char v40 = (uint64_t **)*((void *)v39 - 1);
              v39 -= 8;
              *--id v35 = v40;
            }
            while (v39 != v28);
            goto LABEL_22;
          }
          uint64_t v42 = (v38 >> 3) + 1;
          uint64_t v43 = 8 * (v42 & 0x3FFFFFFFFFFFFFFCLL);
          BOOL v39 = &v17[-v43];
          id v35 = (uint64_t ***)((char *)v35 - v43);
          id v44 = &v34[v29 - 16];
          uint64_t v45 = v17 - 16;
          uint64_t v46 = v42 & 0x3FFFFFFFFFFFFFFCLL;
          do
          {
            long long v47 = *(_OWORD *)v45;
            *(v44 - 1) = *((_OWORD *)v45 - 1);
            _OWORD *v44 = v47;
            v44 -= 2;
            v45 -= 32;
            v46 -= 4;
          }
          while (v46);
          id v10 = v233;
          if (v42 != (v42 & 0x3FFFFFFFFFFFFFFCLL)) {
            goto LABEL_21;
          }
LABEL_22:
          id v17 = (char *)__p;
          __p = v35;
          v267 = (char *)v36;
          v268 = &v34[8 * v33];
          if (v17) {
            goto LABEL_23;
          }
LABEL_24:
          id v17 = (char *)v36;
LABEL_25:
          v267 = v17;
        }
        uint64_t v16 = [obj countByEnumeratingWithState:&v250 objects:v273 count:16];
        if (!v16)
        {
LABEL_38:

          uint64_t v48 = [(MPSGraphExecutable *)v10 getEntryFuncOpForModule:v226];
          v249 = (mlir::mps *)v48;
          if (!v48) {
            __assert_rtn("-[MPSGraphExecutable cloneForFeeds:targetTensors:targetOperations:]", "MPSGraphExecutable.mm", 1907, "function");
          }
          unint64_t v49 = v48[11];
          if ((v49 & 0x7FFFFF) != 0)
          {
            unint64_t v50 = (unint64_t)&v48[4 * ((v49 >> 23) & 1) + 16] + ((v49 >> 21) & 0x7F8);
            if (v50 < 0xFFFFFFFFFFFFFFF9)
            {
              uint64_t v51 = *(void *)(((v50 + 7) & 0xFFFFFFFFFFFFFFF8) + 32 * v48[10] + 8);
              if (v51) {
                uint64_t v52 = (mlir::Block *)(v51 - 8);
              }
              else {
                uint64_t v52 = 0;
              }
              LazyLoadableModuleRef v53 = (mlir::StringAttr **)*((void *)v10 + 4);
              mpsFileLoc("-[MPSGraphExecutable cloneForFeeds:targetTensors:targetOperations:]", "/Library/Caches/com.apple.xbs/Sources/MetalPerformanceShadersGraph/mpsgraph/MetalPerformanceShadersGraph/Core/Files/MPSGraphExecutable.mm", &v262);
              LOWORD(v276) = 260;
              *(void *)&long long v274 = &v262;
              uint64_t StringAttr = mlir::Builder::getStringAttr(v53, (mlir::MLIRContext *)&v274);
              uint64_t v55 = mlir::FileLineColLoc::get(StringAttr, 0x777u, 0);
              id v56 = v233;
              if (!v55) {
                __assert_rtn("Location", "Location.h", 66, "loc && \"location should never be null.\"");
              }
              if (SHIBYTE(v264) < 0) {
                operator delete(v262);
              }
              unint64_t v57 = 0;
              v262 = 0;
              v263 = 0;
              v264 = 0;
              while (2)
              {
                if (v57 < [v229 count])
                {
                  v59 = [v229 objectAtIndexedSubscript:v57];
                  v246 = (void *)[v59 value];
                  *(void *)&long long v274 = 0;
                  int v60 = llvm::DenseMapBase<llvm::DenseMap<mlir::Value,unsigned int,llvm::DenseMapInfo<mlir::Value,void>,llvm::detail::DenseMapPair<mlir::Value,unsigned int>>,mlir::Value,unsigned int,llvm::DenseMapInfo<mlir::Value,void>,llvm::detail::DenseMapPair<mlir::Value,unsigned int>>::LookupBucketFor<mlir::Value>((uint64_t *)v254, (unint64_t *)&v246, &v274);
                  if ((llvm *)v274 == (llvm *)((char *)v254[0] + 16 * v255)) {
                    int v61 = 0;
                  }
                  else {
                    int v61 = v60;
                  }
                  if (v61 == 1) {
                    uint64_t v62 = *(void *)(v274 + 8);
                  }
                  else {
                    uint64_t v62 = 0;
                  }
                  id v56 = v233;

                  unint64_t v63 = v263;
                  if (v263 < v264)
                  {
                    *(void *)v263 = v62;
                    v58 = v63 + 8;
                    goto LABEL_49;
                  }
                  uint64_t v64 = v262;
                  int64_t v65 = v263 - (unsigned char *)v262;
                  uint64_t v66 = (v263 - (unsigned char *)v262) >> 3;
                  unint64_t v67 = v66 + 1;
                  if ((unint64_t)(v66 + 1) >> 61) {
                    std::vector<long>::__throw_length_error[abi:ne180100]();
                  }
                  uint64_t v68 = v264 - (unsigned char *)v262;
                  if ((v264 - (unsigned char *)v262) >> 2 > v67) {
                    unint64_t v67 = v68 >> 2;
                  }
                  if ((unint64_t)v68 >= 0x7FFFFFFFFFFFFFF8) {
                    unint64_t v69 = 0x1FFFFFFFFFFFFFFFLL;
                  }
                  else {
                    unint64_t v69 = v67;
                  }
                  if (v69)
                  {
                    if (v69 >> 61) {
                      std::__throw_bad_array_new_length[abi:ne180100]();
                    }
                    v70 = operator new(8 * v69);
                    v71 = &v70[8 * v66];
                    *(void *)v71 = v62;
                    v58 = v71 + 8;
                    int64_t v72 = v63 - v64;
                    if (v63 != v64)
                    {
LABEL_67:
                      unint64_t v73 = v72 - 8;
                      if (v73 < 0x58)
                      {
                        id v56 = v233;
                        goto LABEL_76;
                      }
                      uint64_t v75 = &v70[v65];
                      unint64_t v76 = v63 - &v70[v65];
                      id v56 = v233;
                      if (v76 < 0x20) {
                        goto LABEL_341;
                      }
                      uint64_t v77 = (v73 >> 3) + 1;
                      uint64_t v78 = 8 * (v77 & 0x3FFFFFFFFFFFFFFCLL);
                      size_t v79 = &v63[-v78];
                      v71 -= v78;
                      v80 = v75 - 16;
                      v81 = (long long *)(v63 - 16);
                      uint64_t v82 = v77 & 0x3FFFFFFFFFFFFFFCLL;
                      do
                      {
                        long long v83 = *v81;
                        *((_OWORD *)v80 - 1) = *(v81 - 1);
                        *(_OWORD *)v80 = v83;
                        v80 -= 32;
                        v81 -= 2;
                        v82 -= 4;
                      }
                      while (v82);
                      unint64_t v63 = v79;
                      if (v77 != (v77 & 0x3FFFFFFFFFFFFFFCLL))
                      {
LABEL_341:
                        do
                        {
LABEL_76:
                          uint64_t v84 = *((void *)v63 - 1);
                          v63 -= 8;
                          *((void *)v71 - 1) = v84;
                          v71 -= 8;
                        }
                        while (v63 != v64);
                      }
                      unint64_t v63 = v262;
                      v262 = v71;
                      v263 = v58;
                      v264 = &v70[8 * v69];
                      if (v63) {
LABEL_78:
                      }
                        operator delete(v63);
LABEL_49:
                      v263 = v58;
                      ++v57;
                      continue;
                    }
                  }
                  else
                  {
                    v70 = 0;
                    v71 = (char *)(8 * v66);
                    uint64_t v74 = (void *)(8 * v66);
                    *uint64_t v74 = v62;
                    v58 = (char *)(v74 + 1);
                    int64_t v72 = v63 - v64;
                    if (v63 != v64) {
                      goto LABEL_67;
                    }
                  }
                  id v56 = v233;
                  v262 = v71;
                  v263 = v58;
                  v264 = &v70[8 * v69];
                  if (v63) {
                    goto LABEL_78;
                  }
                  goto LABEL_49;
                }
                break;
              }
              uint64_t v85 = *((void *)v56 + 4);
              uint64_t v86 = *(void *)(mlir::anec::A11Legacy::getBody((mlir::anec::A11Legacy *)&v249) + 8);
              if (v86) {
                uint64_t v87 = v86 - 8;
              }
              else {
                uint64_t v87 = 0;
              }
              *(void *)(v85 + 16) = v87;
              *(void *)(v85 + 24) = v87 + 32;
              mlir::OpBuilder::create<mlir::func::ReturnOp,std::vector<mlir::Value> &>(*((mlir::OpBuilder **)v56 + 4), v55, (uint64_t *)&v262);
              for (unint64_t j = 0; j < [*((id *)v56 + 59) count]; ++j)
              {
                v89 = [*((id *)v56 + 59) objectAtIndexedSubscript:j];
                v90 = (void *)[v89 value];
                v91 = mlir::Block::addArgument(v52, *(void *)([v89 value] + 8) & 0xFFFFFFFFFFFFFFF8, v55);
                v246 = v90;
                *(void *)&long long v274 = 0;
                int v92 = llvm::DenseMapBase<llvm::DenseMap<mlir::Value,unsigned int,llvm::DenseMapInfo<mlir::Value,void>,llvm::detail::DenseMapPair<mlir::Value,unsigned int>>,mlir::Value,unsigned int,llvm::DenseMapInfo<mlir::Value,void>,llvm::detail::DenseMapPair<mlir::Value,unsigned int>>::LookupBucketFor<mlir::Value>((uint64_t *)v254, (unint64_t *)&v246, &v274);
                if ((llvm *)v274 == (llvm *)((char *)v254[0] + 16 * v255)) {
                  int v93 = 0;
                }
                else {
                  int v93 = v92;
                }
                if (v93 == 1)
                {
                  uint64_t v94 = *(uint64_t **)(v274 + 8);
                  if (v91) {
                    BOOL v95 = v94 == v91;
                  }
                  else {
                    BOOL v95 = 0;
                  }
                  if (v95) {
                    __assert_rtn("replaceAllUsesWith", "UseDefLists.h", 213, "(!newValue || this != OperandType::getUseList(newValue)) && \"cannot RAUW a value with itself\"");
                  }
                }
                else
                {
                  uint64_t v94 = 0;
                }
                while (1)
                {
                  unint64_t v96 = (void *)*v94;
                  if (!*v94) {
                    break;
                  }
                  unint64_t v97 = (void *)v96[1];
                  if (v97)
                  {
                    *unint64_t v97 = *v96;
                    if (*v96) {
                      *(void *)(*v96 + 8) = v96[1];
                    }
                  }
                  v96[3] = v91;
                  v96[1] = v91;
                  uint64_t v98 = *v91;
                  *unint64_t v96 = *v91;
                  if (v98) {
                    *(void *)(v98 + 8) = v96;
                  }
                  uint64_t *v91 = (uint64_t)v96;
                }
              }
              v246 = 0;
              v247 = 0;
              v248 = 0;
              unint64_t v99 = (char *)v262;
              uint8x8_t v100 = v263;
              if (v262 != v263)
              {
                v101 = 0;
                while (1)
                {
                  while (1)
                  {
                    unint64_t v103 = *(void *)(*(void *)v99 + 8) & 0xFFFFFFFFFFFFFFF8;
                    if (v101 >= v248) {
                      break;
                    }
                    *v101++ = v103;
                    v102 = v101;
                    v247 = v101;
                    v99 += 8;
                    if (v99 == v100) {
                      goto LABEL_137;
                    }
                  }
                  v104 = (unint64_t *)v246;
                  int64_t v105 = (char *)v101 - (unsigned char *)v246;
                  uint64_t v106 = ((char *)v101 - (unsigned char *)v246) >> 3;
                  unint64_t v107 = v106 + 1;
                  if ((unint64_t)(v106 + 1) >> 61) {
                    std::vector<int>::__throw_length_error[abi:ne180100]();
                  }
                  uint64_t v108 = (char *)v248 - (unsigned char *)v246;
                  if (((char *)v248 - (unsigned char *)v246) >> 2 > v107) {
                    unint64_t v107 = v108 >> 2;
                  }
                  if ((unint64_t)v108 >= 0x7FFFFFFFFFFFFFF8) {
                    unint64_t v109 = 0x1FFFFFFFFFFFFFFFLL;
                  }
                  else {
                    unint64_t v109 = v107;
                  }
                  if (v109)
                  {
                    if (v109 >> 61) {
                      std::__throw_bad_array_new_length[abi:ne180100]();
                    }
                    uint64_t v110 = operator new(8 * v109);
                    unint64_t v111 = (unint64_t *)&v110[8 * v106];
                    *unint64_t v111 = v103;
                    v102 = v111 + 1;
                    int64_t v112 = (char *)v101 - (char *)v104;
                    if (v101 != v104)
                    {
LABEL_116:
                      unint64_t v113 = v112 - 8;
                      if (v113 < 0x168)
                      {
                        v114 = v101;
                        goto LABEL_118;
                      }
                      unint64_t v117 = ((char *)(v101 - 1) - (char *)v104) & 0xFFFFFFFFFFFFFFF8;
                      if (&v110[v105 - 8 - v117] > &v110[v105 - 8])
                      {
                        v114 = v101;
                        goto LABEL_118;
                      }
                      if ((unint64_t *)((char *)v101 - v117 - 8) > v101 - 1)
                      {
                        v114 = v101;
                        goto LABEL_118;
                      }
                      if ((unint64_t)((char *)v101 - v110 - v105) < 0x20)
                      {
                        v114 = v101;
                        goto LABEL_118;
                      }
                      uint64_t v118 = (v113 >> 3) + 1;
                      uint64_t v119 = 8 * (v118 & 0x3FFFFFFFFFFFFFFCLL);
                      v114 = &v101[v119 / 0xFFFFFFFFFFFFFFF8];
                      unint64_t v111 = (unint64_t *)((char *)v111 - v119);
                      unint64_t v120 = &v110[v105 - 16];
                      unint64_t v121 = v101 - 2;
                      uint64_t v122 = v118 & 0x3FFFFFFFFFFFFFFCLL;
                      do
                      {
                        long long v123 = *(_OWORD *)v121;
                        *(v120 - 1) = *((_OWORD *)v121 - 1);
                        *unint64_t v120 = v123;
                        v120 -= 2;
                        v121 -= 4;
                        v122 -= 4;
                      }
                      while (v122);
                      if (v118 != (v118 & 0x3FFFFFFFFFFFFFFCLL))
                      {
                        do
                        {
LABEL_118:
                          unint64_t v115 = *--v114;
                          *--unint64_t v111 = v115;
                        }
                        while (v114 != v104);
                      }
                      v101 = (unint64_t *)v246;
                      v246 = v111;
                      v247 = v102;
                      v248 = (unint64_t *)&v110[8 * v109];
                      if (!v101) {
                        goto LABEL_124;
                      }
LABEL_123:
                      operator delete(v101);
                      goto LABEL_124;
                    }
                  }
                  else
                  {
                    uint64_t v110 = 0;
                    unint64_t v111 = (unint64_t *)(8 * v106);
                    float v116 = (unint64_t *)(8 * v106);
                    *float v116 = v103;
                    v102 = v116 + 1;
                    int64_t v112 = (char *)v101 - (char *)v104;
                    if (v101 != v104) {
                      goto LABEL_116;
                    }
                  }
                  v246 = v111;
                  v247 = v102;
                  v248 = (unint64_t *)&v110[8 * v109];
                  if (v101) {
                    goto LABEL_123;
                  }
LABEL_124:
                  v247 = v102;
                  v99 += 8;
                  v101 = v102;
                  if (v99 == v100) {
                    goto LABEL_137;
                  }
                }
              }
              v102 = 0;
LABEL_137:
              uint8x8_t v124 = (mlir::MLIRContext **)*((void *)v233 + 4);
              unint64_t ArgumentTypes = mlir::Block::getArgumentTypes(v52);
              if (ArgumentTypes > v126)
              {
                v130 = "begin <= end";
                int v131 = 83;
                uint64_t v132 = "ArrayRef.h";
                v133 = "ArrayRef";
LABEL_316:
                __assert_rtn(v133, v132, v131, v130);
              }
              mlir::ValueRange::ValueRange((unint64_t *)&v274, ArgumentTypes, (uint64_t)(v126 - ArgumentTypes) >> 3);
              mlir::TypeRange::TypeRange(v272, v274, *((unint64_t *)&v274 + 1));
              mlir::ValueRange::ValueRange(v271, (uint64_t)v246, ((char *)v102 - (unsigned char *)v246) >> 3);
              uint64_t FunctionType = mlir::Builder::getFunctionType(v124, v272[0], v272[1], v271[0], v271[1]);
              uint64_t v128 = v249;
              if (v249)
              {
                uint64_t InterfaceFor = mlir::OpInterface<mlir::FunctionOpInterface,mlir::detail::FunctionOpInterfaceInterfaceTraits>::getInterfaceFor((uint64_t)v249);
                if (!InterfaceFor)
                {
                  v130 = "(!t || conceptImpl) && \"expected value to provide interface instance\"";
                  int v131 = 110;
                  uint64_t v132 = "InterfaceSupport.h";
                  v133 = "Interface";
                  goto LABEL_316;
                }
              }
              else
              {
                uint64_t InterfaceFor = 0;
              }
              mlir::function_interface_impl::setFunctionType((uint64_t)v128, InterfaceFor, FunctionType);
              v245[0] = 0;
              v245[1] = 0;
              v244 = v245;
              uint64_t v134 = MEMORY[0x1E4F1CA48];
              v135 = (id *)objc_loadWeakRetained(location);
              v136 = objc_msgSend((id)v134, "arrayWithCapacity:", objc_msgSend(v135[10], "count"));

              v137 = [MEMORY[0x1E4F1CA60] dictionary];
              unint64_t v138 = 0;
              long long v274 = 0u;
              long long v275 = 0u;
              float v276 = 1.0;
              while (v138 < [v228 count])
              {
                uint64_t v134 = [v228 objectAtIndexedSubscript:v138];
                [v136 addObject:v134];

                ++v138;
              }
              for (unint64_t k = 0; k < [v229 count]; ++k)
              {
                v140 = [v229 objectAtIndexedSubscript:k];
                uint64_t v134 = [v140 operation];

                [v136 addObject:v134];
              }
              while (2)
              {
                if (![v136 count])
                {
                  v241 = 0;
                  unint64_t v242 = 0;
                  v243 = 0;
                  v182 = (id *)objc_loadWeakRetained(location);
                  unint64_t v183 = [v182[10] count];
                  unint64_t v184 = v183;
                  if (v183)
                  {
                    if (v183 >> 61) {
                      std::vector<int>::__throw_length_error[abi:ne180100]();
                    }
                    long long v185 = (char *)operator new(8 * v183);
                    v241 = &v185[v242 & 0xFFFFFFFFFFFFFFF8];
                    unint64_t v242 = (unint64_t)v241;
                    v243 = &v185[8 * v184];
                  }

                  v238 = 0;
                  unint64_t v239 = 0;
                  v240 = 0;
                  long long v186 = (id *)objc_loadWeakRetained(location);
                  unint64_t v187 = [v186[10] count];
                  unint64_t v188 = v187;
                  if (v187)
                  {
                    if (v187 >> 61) {
                      std::vector<int>::__throw_length_error[abi:ne180100]();
                    }
                    long long v189 = (char *)operator new(8 * v187);
                    v238 = &v189[v239 & 0xFFFFFFFFFFFFFFF8];
                    unint64_t v239 = (unint64_t)v238;
                    v240 = &v189[8 * v188];
                  }

                  long long v190 = objc_loadWeakRetained(location);
                  v237 = &v241;
                  long long v191 = (mlir::ForwardIterator *)v190[8];
                  v234 = &v237;
                  mlir::detail::walk<mlir::ForwardIterator>(v191, (mlir::Operation *)_ZN4llvm12function_refIFvPN4mlir9OperationEEE11callback_fnIZNS1_6detail4walkILNS1_9WalkOrderE1ENS1_15ForwardIteratorEZ67__MPSGraphExecutable_cloneForFeeds_targetTensors_targetOperations__E3__3NS1_3mps16AssignVariableOpEvEENSt3__19enable_ifIXaantsr4llvm9is_one_ofIT2_S3_PNS1_6RegionEPNS1_5BlockEEE5valuesr3std7is_sameIT3_vEE5valueESL_E4typeES3_OT1_EUlS3_E_EEvlS3_, (uint64_t)&v234, 1);

                  v237 = &v238;
                  v234 = &v237;
                  mlir::detail::walk<mlir::ForwardIterator>(v226, (mlir::Operation *)_ZN4llvm12function_refIFvPN4mlir9OperationEEE11callback_fnIZNS1_6detail4walkILNS1_9WalkOrderE1ENS1_15ForwardIteratorEZ67__MPSGraphExecutable_cloneForFeeds_targetTensors_targetOperations__E3__4NS1_3mps16AssignVariableOpEvEENSt3__19enable_ifIXaantsr4llvm9is_one_ofIT2_S3_PNS1_6RegionEPNS1_5BlockEEE5valuesr3std7is_sameIT3_vEE5valueESL_E4typeES3_OT1_EUlS3_E_EEvlS3_, (uint64_t)&v234, 1);
                  long long v194 = v241;
                  long long v193 = (void *)v242;
                  unint64_t v195 = (uint64_t)(v242 - (void)v241) >> 3;
                  if (v195 != (uint64_t)(v239 - (void)v238) >> 3 && MTLReportFailureTypeEnabled()) {
                    MTLReportFailure();
                  }
                  v235 = 0;
                  uint64_t v236 = 0;
                  v234 = (void ***)&v235;
                  if (v193 != v194)
                  {
                    unint64_t v196 = 0;
                    if (v195 <= 1) {
                      unint64_t v195 = 1;
                    }
                    do
                    {
                      if (v196 >= (uint64_t)(v242 - (void)v241) >> 3 || v196 >= (uint64_t)(v239 - (void)v238) >> 3) {
                        std::vector<mlir::Value>::__throw_out_of_range[abi:ne180100]();
                      }
                      unint64_t v197 = *((void *)v241 + v196);
                      uint64_t v198 = *((void *)v238 + v196);
                      v199 = v235;
                      v200 = &v235;
                      id v201 = &v235;
                      if (v235)
                      {
                        do
                        {
                          while (1)
                          {
                            id v201 = (uint64_t **)v199;
                            unint64_t v202 = v199[4];
                            if (v197 >= v202) {
                              break;
                            }
                            v199 = *v201;
                            v200 = v201;
                            if (!*v201) {
                              goto LABEL_267;
                            }
                          }
                          if (v202 >= v197) {
                            goto LABEL_257;
                          }
                          v199 = v201[1];
                        }
                        while (v199);
                        v200 = v201 + 1;
                      }
LABEL_267:
                      v203 = (uint64_t *)operator new(0x30uLL);
                      v203[4] = v197;
                      v203[5] = v198;
                      uint64_t *v203 = 0;
                      v203[1] = 0;
                      v203[2] = (uint64_t)v201;
                      mlir::Operation *v200 = v203;
                      if (*v234)
                      {
                        v234 = (void ***)*v234;
                        v203 = *v200;
                      }
                      std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(v235, v203);
                      ++v236;
LABEL_257:
                      ++v196;
                    }
                    while (v196 != v195);
                    for (unint64_t m = 0; m != v195; ++m)
                    {
                      if (m >= (uint64_t)(v239 - (void)v238) >> 3) {
                        std::vector<mlir::Value>::__throw_out_of_range[abi:ne180100]();
                      }
                      if (m >= (uint64_t)(v242 - (void)v241) >> 3) {
                        std::vector<mlir::Value>::__throw_out_of_range[abi:ne180100]();
                      }
                      if (*((void *)&v274 + 1))
                      {
                        unint64_t v205 = *((void *)v241 + m);
                        unint64_t v206 = 0x9DDFEA08EB382D69 * (((8 * v205) + 8) ^ HIDWORD(v205));
                        unint64_t v207 = 0x9DDFEA08EB382D69 * (HIDWORD(v205) ^ (v206 >> 47) ^ v206);
                        unint64_t v208 = 0x9DDFEA08EB382D69 * (v207 ^ (v207 >> 47));
                        uint8x8_t v209 = (uint8x8_t)vcnt_s8(*(int8x8_t *)((char *)&v274 + 8));
                        v209.i16[0] = vaddlv_u8(v209);
                        if (v209.u32[0] > 1uLL)
                        {
                          unint64_t v210 = v208;
                          if (v208 >= *((void *)&v274 + 1)) {
                            unint64_t v210 = v208 % *((void *)&v274 + 1);
                          }
                        }
                        else
                        {
                          unint64_t v210 = v208 & (*((void *)&v274 + 1) - 1);
                        }
                        v211 = *(void **)(v274 + 8 * v210);
                        if (v211)
                        {
                          uint64_t v212 = (void *)*v211;
                          if (v212)
                          {
                            if (v209.u32[0] < 2uLL)
                            {
                              while (1)
                              {
                                uint64_t v214 = v212[1];
                                if (v214 == v208)
                                {
                                  if (v212[2] == v205) {
                                    goto LABEL_293;
                                  }
                                }
                                else if ((v214 & (*((void *)&v274 + 1) - 1)) != v210)
                                {
                                  goto LABEL_292;
                                }
                                uint64_t v212 = (void *)*v212;
                                if (!v212) {
                                  goto LABEL_292;
                                }
                              }
                            }
                            do
                            {
                              unint64_t v213 = v212[1];
                              if (v213 == v208)
                              {
                                if (v212[2] == v205) {
                                  goto LABEL_293;
                                }
                              }
                              else
                              {
                                if (v213 >= *((void *)&v274 + 1)) {
                                  v213 %= *((void *)&v274 + 1);
                                }
                                if (v213 != v210) {
                                  break;
                                }
                              }
                              uint64_t v212 = (void *)*v212;
                            }
                            while (v212);
                          }
                        }
                      }
LABEL_292:
                      mlir::Operation::erase(*((mlir::Operation **)v238 + m));
LABEL_293:
                      ;
                    }
                  }
                  mlir::mps::inferTypes(v249, v192);
                  *v225 = v226;
                  std::__tree<void *>::destroy(v235);
                  if (v238)
                  {
                    unint64_t v239 = (unint64_t)v238;
                    operator delete(v238);
                  }
                  if (v241)
                  {
                    unint64_t v242 = (unint64_t)v241;
                    operator delete(v241);
                  }
                  v215 = (void *)v275;
                  if ((void)v275)
                  {
                    do
                    {
                      v216 = (void *)*v215;
                      operator delete(v215);
                      v215 = v216;
                    }
                    while (v216);
                  }
                  v217 = (void *)v274;
                  *(void *)&long long v274 = 0;
                  if (v217) {
                    operator delete(v217);
                  }

                  std::__tree<MPSGraphTensor * {__strong}>::destroy((uint64_t)&v244, v245[0]);
                  if (v246) {
                    operator delete(v246);
                  }
                  if (v262)
                  {
                    v263 = (char *)v262;
                    operator delete(v262);
                  }
                  if (__p) {
                    operator delete(__p);
                  }
                  llvm::deallocate_buffer(v259, (void *)(16 * v261));
                }
                v141 = [v136 objectAtIndexedSubscript:0];
                uint64_t v142 = v141[8];
                if (!v142) {
                  __assert_rtn("dyn_cast", "Casting.h", 662, "detail::isPresent(Val) && \"dyn_cast on a non-existent value\"");
                }
                if (!llvm::DefaultDoCastIfPossible<mlir::mps::AssignVariableOp,mlir::Operation *,llvm::CastInfo<mlir::mps::AssignVariableOp,mlir::Operation *,void>>::doCastIfPossible(v142)) {
                  goto LABEL_244;
                }
                unint64_t v143 = v141[8];
                unint64_t v144 = 0x9DDFEA08EB382D69 * (((8 * v143) + 8) ^ HIDWORD(v143));
                unint64_t v145 = 0x9DDFEA08EB382D69 * (HIDWORD(v143) ^ (v144 >> 47) ^ v144);
                unint64_t v146 = v145 ^ (v145 >> 47);
                unint64_t v147 = 0x9DDFEA08EB382D69 * v146;
                unint64_t v148 = *((void *)&v274 + 1);
                if (*((void *)&v274 + 1))
                {
                  uint8x8_t v149 = (uint8x8_t)vcnt_s8(*(int8x8_t *)((char *)&v274 + 8));
                  v149.i16[0] = vaddlv_u8(v149);
                  if (v149.u32[0] > 1uLL)
                  {
                    uint64_t v134 = 0x9DDFEA08EB382D69 * v146;
                    if (v147 >= *((void *)&v274 + 1)) {
                      uint64_t v134 = v147 % *((void *)&v274 + 1);
                    }
                  }
                  else
                  {
                    uint64_t v134 = v147 & (*((void *)&v274 + 1) - 1);
                  }
                  v150 = *(void **)(v274 + 8 * v134);
                  if (v150)
                  {
                    v151 = (void *)*v150;
                    if (v151)
                    {
                      if (v149.u32[0] < 2uLL)
                      {
                        while (1)
                        {
                          uint64_t v153 = v151[1];
                          if (v153 == v147)
                          {
                            if (v151[2] == v143) {
                              goto LABEL_244;
                            }
                          }
                          else if ((v153 & (*((void *)&v274 + 1) - 1)) != v134)
                          {
                            goto LABEL_171;
                          }
                          v151 = (void *)*v151;
                          if (!v151) {
                            goto LABEL_171;
                          }
                        }
                      }
                      do
                      {
                        unint64_t v152 = v151[1];
                        if (v152 == v147)
                        {
                          if (v151[2] == v143) {
                            goto LABEL_244;
                          }
                        }
                        else
                        {
                          if (v152 >= *((void *)&v274 + 1)) {
                            v152 %= *((void *)&v274 + 1);
                          }
                          if (v152 != v134) {
                            break;
                          }
                        }
                        v151 = (void *)*v151;
                      }
                      while (v151);
                    }
                  }
                }
LABEL_171:
                v154 = operator new(0x20uLL);
                void *v154 = 0;
                v154[1] = v147;
                v154[2] = v143;
                v154[3] = v143;
                float v155 = (float)(unint64_t)(*((void *)&v275 + 1) + 1);
                if (v148 && (float)(v276 * (float)v148) >= v155)
                {
                  uint64_t v156 = v274;
                  v157 = *(void **)(v274 + 8 * v134);
                  if (v157) {
                    goto LABEL_174;
                  }
LABEL_223:
                  void *v154 = v275;
                  *(void *)&long long v275 = v154;
                  *(void *)(v156 + 8 * v134) = &v275;
                  if (*v154)
                  {
                    unint64_t v178 = *(void *)(*v154 + 8);
                    if ((v148 & (v148 - 1)) != 0)
                    {
                      if (v178 >= v148) {
                        v178 %= v148;
                      }
                    }
                    else
                    {
                      v178 &= v148 - 1;
                    }
                    v157 = (void *)(v274 + 8 * v178);
LABEL_242:
                    void *v157 = v154;
                  }
                  ++*((void *)&v275 + 1);
LABEL_244:
                  [v137 setObject:v141 forKey:v141];
                  uint64_t v181 = [(MPSGraphExecutable *)v233 getOperationsToVisitForOperation:v141 visitedOperations:v137];
                  [v136 removeObjectAtIndex:0];
                  [v136 addObjectsFromArray:v181];

                  continue;
                }
                break;
              }
              BOOL v158 = (v148 & (v148 - 1)) != 0;
              if (v148 < 3) {
                BOOL v158 = 1;
              }
              unint64_t v159 = v158 | (2 * v148);
              unint64_t v160 = vcvtps_u32_f32(v155 / v276);
              if (v159 <= v160) {
                size_t prime = v160;
              }
              else {
                size_t prime = v159;
              }
              if (prime == 1)
              {
                size_t prime = 2;
              }
              else if ((prime & (prime - 1)) != 0)
              {
                size_t prime = std::__next_prime(prime);
                unint64_t v148 = *((void *)&v274 + 1);
              }
              if (prime <= v148)
              {
                if (prime >= v148) {
                  goto LABEL_221;
                }
                unint64_t v172 = vcvtps_u32_f32((float)*((unint64_t *)&v275 + 1) / v276);
                if (v148 < 3
                  || (uint8x8_t v173 = (uint8x8_t)vcnt_s8((int8x8_t)v148), v173.i16[0] = vaddlv_u8(v173), v173.u32[0] > 1uLL))
                {
                  unint64_t v172 = std::__next_prime(v172);
                }
                else
                {
                  uint64_t v174 = 1 << -(char)__clz(v172 - 1);
                  if (v172 >= 2) {
                    unint64_t v172 = v174;
                  }
                }
                if (prime <= v172) {
                  size_t prime = v172;
                }
                if (prime < v148)
                {
                  if (prime) {
                    goto LABEL_185;
                  }
                  long long v176 = (void *)v274;
                  *(void *)&long long v274 = 0;
                  if (v176) {
                    operator delete(v176);
                  }
                  unint64_t v148 = 0;
                  *((void *)&v274 + 1) = 0;
                  uint64_t v177 = -1;
                  goto LABEL_222;
                }
                unint64_t v148 = *((void *)&v274 + 1);
                uint64_t v177 = *((void *)&v274 + 1) - 1;
                if ((*((void *)&v274 + 1) & (*((void *)&v274 + 1) - 1)) == 0) {
                  goto LABEL_222;
                }
                goto LABEL_234;
              }
LABEL_185:
              if (prime >> 61) {
                std::__throw_bad_array_new_length[abi:ne180100]();
              }
              uint64_t v162 = operator new(8 * prime);
              uint64_t v163 = (void *)v274;
              *(void *)&long long v274 = v162;
              if (v163) {
                operator delete(v163);
              }
              uint64_t v164 = 0;
              *((void *)&v274 + 1) = prime;
              do
                *(void *)(v274 + 8 * v164++) = 0;
              while (prime != v164);
              v165 = (void **)v275;
              if (!(void)v275)
              {
LABEL_233:
                unint64_t v148 = prime;
                uint64_t v177 = prime - 1;
                if ((prime & (prime - 1)) == 0) {
                  goto LABEL_222;
                }
                goto LABEL_234;
              }
              size_t v166 = *(void *)(v275 + 8);
              size_t v167 = prime - 1;
              if ((prime & (prime - 1)) == 0)
              {
                size_t v168 = v166 & v167;
                *(void *)(v274 + 8 * v168) = &v275;
                for (n = *v165; *v165; n = *v165)
                {
                  size_t v170 = n[1] & v167;
                  if (v170 == v168)
                  {
                    v165 = (void **)n;
                  }
                  else if (*(void *)(v274 + 8 * v170))
                  {
                    *v165 = (void *)*n;
                    uint64_t v171 = 8 * v170;
                    void *n = **(void **)(v274 + v171);
                    **(void **)(v274 + v171) = n;
                  }
                  else
                  {
                    *(void *)(v274 + 8 * v170) = v165;
                    v165 = (void **)n;
                    size_t v168 = v170;
                  }
                }
                goto LABEL_233;
              }
              if (v166 < prime)
              {
                *(void *)(v274 + 8 * v166) = &v275;
                long long v175 = *v165;
                if (*v165) {
                  goto LABEL_228;
                }
LABEL_220:
                unint64_t v148 = prime;
LABEL_221:
                uint64_t v177 = v148 - 1;
                if ((v148 & (v148 - 1)) == 0)
                {
LABEL_222:
                  uint64_t v134 = v177 & v147;
                  uint64_t v156 = v274;
                  v157 = *(void **)(v274 + 8 * (v177 & v147));
                  if (!v157) {
                    goto LABEL_223;
                  }
LABEL_174:
                  void *v154 = *v157;
                  goto LABEL_242;
                }
LABEL_234:
                if (v147 >= v148)
                {
                  uint64_t v134 = v147 % v148;
                  uint64_t v156 = v274;
                  v157 = *(void **)(v274 + 8 * (v147 % v148));
                  if (!v157) {
                    goto LABEL_223;
                  }
                }
                else
                {
                  uint64_t v134 = v147;
                  uint64_t v156 = v274;
                  v157 = *(void **)(v274 + 8 * v147);
                  if (!v157) {
                    goto LABEL_223;
                  }
                }
                goto LABEL_174;
              }
              v166 %= prime;
              *(void *)(v274 + 8 * v166) = &v275;
              long long v175 = *v165;
              if (!*v165) {
                goto LABEL_220;
              }
              while (1)
              {
LABEL_228:
                size_t v180 = v175[1];
                if (v180 >= prime) {
                  v180 %= prime;
                }
                if (v180 == v166) {
                  goto LABEL_227;
                }
                if (*(void *)(v274 + 8 * v180)) {
                  break;
                }
                *(void *)(v274 + 8 * v180) = v165;
                v165 = (void **)v175;
                long long v175 = (void *)*v175;
                size_t v166 = v180;
                if (!v175) {
                  goto LABEL_233;
                }
              }
              *v165 = (void *)*v175;
              uint64_t v179 = 8 * v180;
              *long long v175 = **(void **)(v274 + v179);
              **(void **)(v274 + v179) = v175;
              long long v175 = v165;
LABEL_227:
              v165 = (void **)v175;
              long long v175 = (void *)*v175;
              if (!v175) {
                goto LABEL_233;
              }
              goto LABEL_228;
            }
            v218 = "static_cast<uintptr_t>(ArithAddr + Alignment.value() - 1) >= ArithAddr && \"Overflow\"";
            int v219 = 191;
            v220 = "Alignment.h";
            v221 = "alignAddr";
          }
          else
          {
            v218 = "index < numRegions && \"invalid region index\"";
            int v219 = 666;
            v220 = "Operation.h";
            v221 = "getRegion";
          }
          __assert_rtn(v221, v220, v219, v218);
        }
      }
    }
  }
  __assert_rtn("cast", "Casting.h", 578, "isa<To>(Val) && \"cast<Ty>() argument of incompatible type!\"");
}

- (FuncOp)getEntryFuncOp
{
  id v3 = (std::recursive_mutex *)((char *)self + 264);
  std::recursive_mutex::lock((std::recursive_mutex *)((char *)self + 264));
  v5.var0 = (Operation *)[(MPSGraphExecutable *)self getEntryFuncOpForModule:LazyLoadableModuleRef::get((LazyLoadableModuleRef *)((char *)self + 40), v4)];
  std::recursive_mutex::unlock(v3);
  return v5;
}

- (FuncOp)getEntryFuncOpForModule:(ModuleOp)a3
{
  FuncOp v5 = [*((id *)self + 12) entryFunctionName];

  if (v5)
  {
    id v6 = [*((id *)self + 12) entryFunctionName];
    id v7 = (const char *)[v6 UTF8String];
    uint64_t v8 = v7;
    if (v7) {
      size_t v9 = strlen(v7);
    }
    else {
      size_t v9 = 0;
    }
    Context = (mlir::StringAttr *)mlir::Attribute::getContext((mlir::Attribute *)((char *)a3.state + 24));
    __int16 v16 = 261;
    v15[0] = v8;
    v15[1] = v9;
    uint64_t v12 = mlir::StringAttr::get(Context, (mlir::MLIRContext *)v15);
    uint64_t v13 = mlir::SymbolTable::lookupSymbolIn((unsigned int *)a3.state, v12);
    if (v13)
    {
      uint64_t v14 = llvm::DefaultDoCastIfPossible<mlir::func::FuncOp,mlir::Operation &,llvm::CastInfo<mlir::func::FuncOp,mlir::Operation,void>>::doCastIfPossible(v13);

      if (v14) {
        return (FuncOp)v14;
      }
    }
    else
    {
    }
    uint64_t v14 = 0;
    if (MTLReportFailureTypeEnabled())
    {
      MTLReportFailure();
      return (FuncOp)0;
    }
    return (FuncOp)v14;
  }

  return (FuncOp)getFuncOpInModule((uint64_t)a3.state);
}

- (void)optimizeOriginalModule
{
}

- (vector<mlir::Type,)convertMPSGraphShapesToMLIRTypes:(MPSGraphExecutable *)self
{
  id v6 = a4;
  uint64_t v32 = 0;
  unint64_t v33 = &v32;
  uint64_t v34 = 0x4812000000;
  id v35 = __Block_byref_object_copy__490;
  uint64_t v36 = __Block_byref_object_dispose__491;
  int64_t v37 = "";
  BOOL v39 = 0;
  char v40 = 0;
  __p = 0;
  unint64_t v7 = [v6 count];
  unint64_t v8 = v7;
  size_t v9 = __p;
  if (v7 <= (v40 - (unsigned char *)__p) >> 3) {
    goto LABEL_13;
  }
  if (v7 >> 61) {
    std::vector<int>::__throw_length_error[abi:ne180100]();
  }
  id v10 = v39;
  id v11 = (char *)operator new(8 * v7);
  uint64_t v12 = v10 - v9;
  uint64_t v13 = &v11[(v10 - v9) & 0xFFFFFFFFFFFFFFF8];
  uint64_t v14 = v13;
  if (v10 != v9)
  {
    if ((unint64_t)(v12 - 8) < 0x58)
    {
      uint64_t v14 = &v11[(v10 - v9) & 0xFFFFFFFFFFFFFFF8];
      do
      {
LABEL_10:
        uint64_t v23 = *((void *)v10 - 1);
        v10 -= 8;
        *((void *)v14 - 1) = v23;
        v14 -= 8;
      }
      while (v10 != v9);
      goto LABEL_11;
    }
    uint64_t v14 = &v11[(v10 - v9) & 0xFFFFFFFFFFFFFFF8];
    if (v10 - v11 - (v12 & 0xFFFFFFFFFFFFFFF8) < 0x20) {
      goto LABEL_10;
    }
    uint64_t v15 = v12 >> 3;
    unint64_t v16 = ((unint64_t)(v12 - 8) >> 3) + 1;
    uint64_t v17 = 8 * (v16 & 0x3FFFFFFFFFFFFFFCLL);
    unint64_t v18 = &v10[-v17];
    uint64_t v14 = &v13[-v17];
    objc_super v19 = &v11[8 * v15 - 16];
    id v20 = (long long *)(v10 - 16);
    uint64_t v21 = v16 & 0x3FFFFFFFFFFFFFFCLL;
    do
    {
      long long v22 = *v20;
      *((_OWORD *)v19 - 1) = *(v20 - 1);
      *(_OWORD *)objc_super v19 = v22;
      v19 -= 32;
      v20 -= 2;
      v21 -= 4;
    }
    while (v21);
    id v10 = v18;
    if (v16 != (v16 & 0x3FFFFFFFFFFFFFFCLL)) {
      goto LABEL_10;
    }
  }
LABEL_11:
  __p = v14;
  BOOL v39 = v13;
  char v40 = &v11[8 * v8];
  if (v9) {
    operator delete(v9);
  }
LABEL_13:
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __55__MPSGraphExecutable_convertMPSGraphShapesToMLIRTypes___block_invoke;
  v31[3] = &unk_1E4FC1788;
  v31[4] = self;
  v31[5] = &v32;
  [v6 enumerateObjectsUsingBlock:v31];
  id v24 = v33;
  retstr->var1 = 0;
  retstr->var2.var0 = 0;
  retstr->var0 = 0;
  id v26 = (unsigned char *)v24[6];
  id v25 = (unsigned char *)v24[7];
  int64_t v27 = v25 - v26;
  if (v25 != v26)
  {
    if (v27 < 0) {
      std::vector<int>::__throw_length_error[abi:ne180100]();
    }
    int v28 = (Type *)operator new(v25 - v26);
    retstr->var0 = v28;
    int64_t v29 = (Type *)((char *)v28 + 8 * (v27 >> 3));
    retstr->var2.var0 = v29;
    memcpy(v28, v26, v27);
    retstr->var1 = v29;
  }
  _Block_object_dispose(&v32, 8);
  if (__p)
  {
    BOOL v39 = __p;
    operator delete(__p);
  }

  return result;
}

void __55__MPSGraphExecutable_convertMPSGraphShapesToMLIRTypes___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(mlir::MLIRContext **)(*(void *)(a1 + 32) + 16);
  id v32 = v3;
  FuncOp v5 = [v3 shape];
  id v6 = (mlir::MLIRContext *)[v32 dataType];
  id v7 = v5;
  uint64_t MLIRElementType = getMLIRElementType(v4, v6);
  MLIRType = getMLIRType(v7, MLIRElementType);

  id v10 = *(void **)(*(void *)(a1 + 40) + 8);
  uint64_t v12 = (uint64_t ***)v10[7];
  unint64_t v11 = v10[8];
  if ((unint64_t)v12 < v11)
  {
    char *v12 = MLIRType;
    uint64_t v13 = (uint64_t)(v12 + 1);
    goto LABEL_14;
  }
  uint64_t v14 = (char *)v10[6];
  uint64_t v15 = ((char *)v12 - v14) >> 3;
  unint64_t v16 = v15 + 1;
  if ((unint64_t)(v15 + 1) >> 61) {
    std::vector<int>::__throw_length_error[abi:ne180100]();
  }
  uint64_t v17 = v11 - (void)v14;
  if (v17 >> 2 > v16) {
    unint64_t v16 = v17 >> 2;
  }
  if ((unint64_t)v17 >= 0x7FFFFFFFFFFFFFF8) {
    unint64_t v18 = 0x1FFFFFFFFFFFFFFFLL;
  }
  else {
    unint64_t v18 = v16;
  }
  if (v18)
  {
    if (v18 >> 61) {
      std::__throw_bad_array_new_length[abi:ne180100]();
    }
    objc_super v19 = (char *)operator new(8 * v18);
    id v20 = (uint64_t ***)&v19[8 * v15];
    uint64_t v21 = &v19[8 * v18];
    *id v20 = MLIRType;
    uint64_t v13 = (uint64_t)(v20 + 1);
    long long v22 = (char *)((char *)v12 - v14);
    if (v12 == (uint64_t ***)v14)
    {
LABEL_12:
      v10[6] = v20;
      v10[7] = v13;
      v10[8] = v21;
      if (!v12) {
        goto LABEL_14;
      }
      goto LABEL_13;
    }
  }
  else
  {
    objc_super v19 = 0;
    id v20 = (uint64_t ***)(8 * v15);
    uint64_t v21 = 0;
    *(void *)(8 * v15) = MLIRType;
    uint64_t v13 = 8 * v15 + 8;
    long long v22 = (char *)((char *)v12 - v14);
    if (v12 == (uint64_t ***)v14) {
      goto LABEL_12;
    }
  }
  unint64_t v23 = (unint64_t)(v22 - 8);
  if (v23 < 0x58) {
    goto LABEL_30;
  }
  if ((unint64_t)(v14 - v19) < 0x20) {
    goto LABEL_30;
  }
  uint64_t v24 = (v23 >> 3) + 1;
  uint64_t v25 = 8 * (v24 & 0x3FFFFFFFFFFFFFFCLL);
  id v26 = &v12[v25 / 0xFFFFFFFFFFFFFFF8];
  id v20 = (uint64_t ***)((char *)v20 - v25);
  int64_t v27 = &v19[8 * v15 - 16];
  int v28 = v12 - 2;
  uint64_t v29 = v24 & 0x3FFFFFFFFFFFFFFCLL;
  do
  {
    long long v30 = *(_OWORD *)v28;
    *((_OWORD *)v27 - 1) = *((_OWORD *)v28 - 1);
    *(_OWORD *)int64_t v27 = v30;
    v27 -= 32;
    v28 -= 4;
    v29 -= 4;
  }
  while (v29);
  uint64_t v12 = v26;
  if (v24 != (v24 & 0x3FFFFFFFFFFFFFFCLL))
  {
LABEL_30:
    do
    {
      unint64_t v31 = *--v12;
      *--id v20 = v31;
    }
    while (v12 != (uint64_t ***)v14);
  }
  uint64_t v12 = (uint64_t ***)v10[6];
  v10[6] = v20;
  v10[7] = v13;
  v10[8] = v21;
  if (v12) {
LABEL_13:
  }
    operator delete(v12);
LABEL_14:
  v10[7] = v13;
}

- (vector<mlir::Type,)convertMPSGraphShapesToMLIRTypes:(MPSGraphExecutable *)self funcOp:(SEL)a3 compilationDescriptor:(id)a4
{
  id v10 = a4;
  id v11 = a6;
  uint64_t v42 = 0;
  uint64_t v43 = &v42;
  uint64_t v44 = 0x4812000000;
  uint64_t v45 = __Block_byref_object_copy__490;
  uint64_t v46 = __Block_byref_object_dispose__491;
  long long v47 = "";
  unint64_t v49 = 0;
  unint64_t v50 = 0;
  __p = 0;
  v41[0] = 0;
  v41[1] = v41;
  v41[2] = 0x3812000000;
  v41[3] = __Block_byref_object_copy__495;
  v41[4] = __Block_byref_object_dispose__496;
  v41[5] = 0;
  v41[6] = a5.var0;
  unint64_t v12 = [v10 count];
  unint64_t v13 = v12;
  uint64_t v14 = __p;
  if (v12 <= (v50 - (unsigned char *)__p) >> 3) {
    goto LABEL_13;
  }
  if (v12 >> 61) {
    std::vector<int>::__throw_length_error[abi:ne180100]();
  }
  uint64_t v15 = v49;
  unint64_t v16 = (char *)operator new(8 * v12);
  uint64_t v17 = v15 - v14;
  unint64_t v18 = &v16[(v15 - v14) & 0xFFFFFFFFFFFFFFF8];
  objc_super v19 = v18;
  if (v15 != v14)
  {
    if ((unint64_t)(v17 - 8) < 0x58)
    {
      objc_super v19 = &v16[(v15 - v14) & 0xFFFFFFFFFFFFFFF8];
      do
      {
LABEL_10:
        uint64_t v28 = *((void *)v15 - 1);
        v15 -= 8;
        *((void *)v19 - 1) = v28;
        v19 -= 8;
      }
      while (v15 != v14);
      goto LABEL_11;
    }
    objc_super v19 = &v16[(v15 - v14) & 0xFFFFFFFFFFFFFFF8];
    if (v15 - v16 - (v17 & 0xFFFFFFFFFFFFFFF8) < 0x20) {
      goto LABEL_10;
    }
    uint64_t v20 = v17 >> 3;
    unint64_t v21 = ((unint64_t)(v17 - 8) >> 3) + 1;
    uint64_t v22 = 8 * (v21 & 0x3FFFFFFFFFFFFFFCLL);
    unint64_t v23 = &v15[-v22];
    objc_super v19 = &v18[-v22];
    uint64_t v24 = &v16[8 * v20 - 16];
    uint64_t v25 = (long long *)(v15 - 16);
    uint64_t v26 = v21 & 0x3FFFFFFFFFFFFFFCLL;
    do
    {
      long long v27 = *v25;
      *((_OWORD *)v24 - 1) = *(v25 - 1);
      *(_OWORD *)uint64_t v24 = v27;
      v24 -= 32;
      v25 -= 2;
      v26 -= 4;
    }
    while (v26);
    uint64_t v15 = v23;
    if (v21 != (v21 & 0x3FFFFFFFFFFFFFFCLL)) {
      goto LABEL_10;
    }
  }
LABEL_11:
  __p = v19;
  unint64_t v49 = v18;
  unint64_t v50 = &v16[8 * v13];
  if (v14) {
    operator delete(v14);
  }
LABEL_13:
  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = __84__MPSGraphExecutable_convertMPSGraphShapesToMLIRTypes_funcOp_compilationDescriptor___block_invoke;
  v37[3] = &unk_1E4FC17B0;
  BOOL v39 = v41;
  void v37[4] = self;
  id v29 = v11;
  id v38 = v29;
  char v40 = &v42;
  [v10 enumerateObjectsUsingBlock:v37];
  long long v30 = v43;
  retstr->var1 = 0;
  retstr->var2.var0 = 0;
  retstr->var0 = 0;
  id v32 = (unsigned char *)v30[6];
  unint64_t v31 = (unsigned char *)v30[7];
  int64_t v33 = v31 - v32;
  if (v31 != v32)
  {
    if (v33 < 0) {
      std::vector<int>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v34 = (Type *)operator new(v31 - v32);
    retstr->var0 = v34;
    id v35 = (Type *)((char *)v34 + 8 * (v33 >> 3));
    retstr->var2.var0 = v35;
    memcpy(v34, v32, v33);
    retstr->var1 = v35;
  }

  _Block_object_dispose(v41, 8);
  _Block_object_dispose(&v42, 8);
  if (__p)
  {
    unint64_t v49 = __p;
    operator delete(__p);
  }

  return result;
}

void __84__MPSGraphExecutable_convertMPSGraphShapesToMLIRTypes_funcOp_compilationDescriptor___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  uint64_t v6 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 48);
  unint64_t v7 = *(unsigned int *)(v6 + 44);
  if ((v7 & 0x7FFFFF) == 0)
  {
    unint64_t v107 = "index < numRegions && \"invalid region index\"";
    int v108 = 666;
    unint64_t v109 = "Operation.h";
    uint64_t v110 = "getRegion";
    goto LABEL_104;
  }
  unint64_t v8 = v6 + 16 * ((v7 >> 23) & 1) + ((v7 >> 21) & 0x7F8) + 64;
  if (v8 > 0xFFFFFFFFFFFFFFF8)
  {
    unint64_t v107 = "static_cast<uintptr_t>(ArithAddr + Alignment.value() - 1) >= ArithAddr && \"Overflow\"";
    int v108 = 191;
    unint64_t v109 = "Alignment.h";
    uint64_t v110 = "alignAddr";
    goto LABEL_104;
  }
  size_t v9 = (void *)(((v8 + 7) & 0xFFFFFFFFFFFFFFF8) + 32 * *(unsigned int *)(v6 + 40));
  if ((void *)*v9 == v9) {
    goto LABEL_126;
  }
  uint64_t v10 = v9[1];
  uint64_t v11 = v10 - 8;
  if (!v10) {
    uint64_t v11 = 0;
  }
  uint64_t v12 = *(void *)(v11 + 48);
  if (a3 >= (unint64_t)((*(void *)(v11 + 56) - v12) >> 3))
  {
LABEL_126:
    unint64_t v107 = "Index < this->size() && \"Invalid index!\"";
    int v108 = 443;
    unint64_t v109 = "ArrayRef.h";
    uint64_t v110 = "operator[]";
LABEL_104:
    __assert_rtn(v110, v109, v108, v107);
  }
  uint64_t v13 = *(void *)(v12 + 8 * a3);
  uint64_t v14 = *(void *)(v13 + 8);
  uint64_t v15 = (uint64_t **)(v14 & 0xFFFFFFFFFFFFFFF8);
  if ((v14 & 0xFFFFFFFFFFFFFFF8) == 0)
  {
    unint64_t v111 = "detail::isPresent(Val) && \"dyn_cast on a non-existent value\"";
    int v112 = 650;
    unint64_t v113 = "Casting.h";
    v114 = "dyn_cast";
    goto LABEL_112;
  }
  if (mlir::TypeInterface<mlir::ShapedType,mlir::detail::ShapedTypeInterfaceTraits>::getInterfaceFor((uint64_t **)(v14 & 0xFFFFFFFFFFFFFFF8)))
  {
    uint64_t InterfaceFor = mlir::TypeInterface<mlir::ShapedType,mlir::detail::ShapedTypeInterfaceTraits>::getInterfaceFor(v15);
    if (InterfaceFor)
    {
      v133 = v15;
      uint64_t v134 = InterfaceFor;
      if (v15) {
        goto LABEL_13;
      }
      goto LABEL_106;
    }
    unint64_t v111 = "(!t || conceptImpl) && \"expected value to provide interface instance\"";
    int v112 = 98;
    unint64_t v113 = "InterfaceSupport.h";
    v114 = "Interface";
LABEL_112:
    __assert_rtn(v114, v113, v112, v111);
  }
  v133 = 0;
  uint64_t v134 = 0;
LABEL_106:
  if (MTLReportFailureTypeEnabled())
  {
    uint64_t v123 = a3;
    MTLReportFailure();
  }
LABEL_13:
  uint64_t v17 = *(mlir::MLIRContext **)(*(void *)(a1 + 32) + 16);
  unint64_t v18 = objc_msgSend(v5, "shape", v123);
  objc_super v19 = (mlir::MLIRContext *)[v5 dataType];
  id v20 = v18;
  uint64_t MLIRElementType = getMLIRElementType(v17, v19);
  MLIRType = getMLIRType(v20, MLIRElementType);
  uint64_t v24 = v23;

  int v131 = MLIRType;
  uint64_t v132 = v24;

  v129[0] = (void *)mlir::MemoryMapperInterface::getOperandRange((mlir::MemoryMapperInterface *)&v133);
  if (mlir::Type::isIntOrFloat((mlir::Type *)v129))
  {
    __p[0] = (void *)mlir::MemoryMapperInterface::getOperandRange((mlir::MemoryMapperInterface *)&v133);
    BOOL v25 = mlir::Type::getIntOrFloatBitWidth((mlir::Type *)__p) == 1;
  }
  else
  {
    BOOL v25 = 0;
  }
  if ([v5 dataType] == 536870920 && v25)
  {
    long long v27 = [v5 shape];
    uint64_t OperandRange = mlir::MemoryMapperInterface::getOperandRange((mlir::MemoryMapperInterface *)&v133);
    int v131 = getMLIRType(v27, OperandRange);
    uint64_t v132 = v29;
  }
  if (([*(id *)(a1 + 40) compilerOptions] & 0x200) == 0)
  {
    mlir::MemoryMapperInterface::getOperandRange((mlir::MemoryMapperInterface *)&v133);
    mlir::MemoryMapperInterface::getOperandRange((mlir::MemoryMapperInterface *)&v131);
    uint64_t v30 = mlir::MemoryMapperInterface::getOperandRange((mlir::MemoryMapperInterface *)&v133);
    if (v30 != mlir::MemoryMapperInterface::getOperandRange((mlir::MemoryMapperInterface *)&v131))
    {
      if (MTLReportFailureTypeEnabled())
      {
        uint64_t v119 = mlir::MemoryMapperInterface::getOperandRange((mlir::MemoryMapperInterface *)&v133);
        unint64_t v120 = v129;
        getIRStringForMLIRObject<mlir::Type>(v129, v119);
        if (v130 < 0) {
          unint64_t v120 = (void **)v129[0];
        }
        uint64_t v121 = mlir::MemoryMapperInterface::getOperandRange((mlir::MemoryMapperInterface *)&v131);
        getIRStringForMLIRObject<mlir::Type>(__p, v121);
        if (v128 >= 0) {
          uint64_t v122 = __p;
        }
        else {
          uint64_t v122 = (void **)__p[0];
        }
        uint64_t v125 = v120;
        unint64_t v126 = v122;
        uint64_t v124 = a3;
        MTLReportFailure();
        if (v128 < 0) {
          operator delete(__p[0]);
        }
        if (v130 < 0) {
          operator delete(v129[0]);
        }
      }
    }
  }
  unint64_t v31 = (void *)(*(void *)(v13 + 8) & 0xFFFFFFFFFFFFFFF8);
  if (!v31)
  {
    unint64_t v115 = "detail::isPresent(Val) && \"dyn_cast on a non-existent value\"";
    int v116 = 650;
    unint64_t v117 = "Casting.h";
    uint64_t v118 = "dyn_cast";
    goto LABEL_110;
  }
  if (!*(void *)v31)
  {
    unint64_t v115 = "abstractType && \"Malformed type storage object.\"";
    int v116 = 160;
    unint64_t v117 = "TypeSupport.h";
    uint64_t v118 = "getAbstractType";
LABEL_110:
    __assert_rtn(v118, v117, v116, v115);
  }
  id v32 = *(void **)(*(void *)v31 + 136);
  if (v32 != &mlir::detail::TypeIDResolver<mlir::RankedTensorType,void>::id) {
    unint64_t v31 = 0;
  }
  v129[0] = v31;
  if (v32 == &mlir::detail::TypeIDResolver<mlir::RankedTensorType,void>::id)
  {
    if (!mlir::TensorType::hasRank((mlir::TensorType *)v129)) {
      __assert_rtn("getRank", "BuiltinTypeInterfaces.h.inc", 227, "(*static_cast<const ConcreteType *>(this)).hasRank() && \"cannot query rank of unranked shaped type\"");
    }
    mlir::ArrayAttr::getValue((mlir::ArrayAttr *)v129);
    if (!v33)
    {
      uint64_t v34 = [v5 shape];
      if ([v34 count] == 1)
      {
        id v35 = [v5 shape];
        uint64_t v36 = [v35 objectAtIndexedSubscript:0];
        uint64_t v37 = [v36 integerValue];

        if (v37 == 1)
        {
          id v38 = *(void **)(*(void *)(a1 + 56) + 8);
          char v40 = (uint64_t ***)v38[7];
          unint64_t v39 = v38[8];
          if ((unint64_t)v40 >= v39)
          {
            unint64_t v41 = (uint64_t ****)(v38 + 6);
            uint64_t v42 = (char *)v38[6];
            uint64_t v43 = ((char *)v40 - v42) >> 3;
            unint64_t v44 = v43 + 1;
            if ((unint64_t)(v43 + 1) >> 61) {
              std::vector<int>::__throw_length_error[abi:ne180100]();
            }
            uint64_t v45 = v39 - (void)v42;
            if (v45 >> 2 > v44) {
              unint64_t v44 = v45 >> 2;
            }
            if ((unint64_t)v45 >= 0x7FFFFFFFFFFFFFF8) {
              unint64_t v46 = 0x1FFFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v46 = v44;
            }
            if (v46)
            {
              if (v46 >> 61) {
                std::__throw_bad_array_new_length[abi:ne180100]();
              }
              long long v47 = (char *)operator new(8 * v46);
            }
            else
            {
              long long v47 = 0;
            }
            int64_t v72 = (uint64_t ***)&v47[8 * v43];
            unint64_t v73 = &v47[8 * v46];
            *int64_t v72 = v133;
            int64_t v65 = v72 + 1;
            if (v40 == (uint64_t ***)v42) {
              goto LABEL_90;
            }
            unint64_t v98 = (char *)v40 - v42 - 8;
            if (v98 < 0x58) {
              goto LABEL_133;
            }
            if ((unint64_t)(v42 - v47) < 0x20) {
              goto LABEL_133;
            }
            uint64_t v99 = (v98 >> 3) + 1;
            uint64_t v100 = 8 * (v99 & 0x3FFFFFFFFFFFFFFCLL);
            v101 = &v40[v100 / 0xFFFFFFFFFFFFFFF8];
            int64_t v72 = (uint64_t ***)((char *)v72 - v100);
            v102 = &v47[8 * v43 - 16];
            unint64_t v103 = v40 - 2;
            uint64_t v104 = v99 & 0x3FFFFFFFFFFFFFFCLL;
            do
            {
              long long v105 = *(_OWORD *)v103;
              *((_OWORD *)v102 - 1) = *((_OWORD *)v103 - 1);
              *(_OWORD *)v102 = v105;
              v102 -= 32;
              v103 -= 4;
              v104 -= 4;
            }
            while (v104);
            char v40 = v101;
            if (v99 != (v99 & 0x3FFFFFFFFFFFFFFCLL))
            {
LABEL_133:
              do
              {
                uint64_t v106 = *--v40;
                *--int64_t v72 = v106;
              }
              while (v40 != (uint64_t ***)v42);
            }
            goto LABEL_89;
          }
          goto LABEL_50;
        }
      }
      else
      {
      }
    }
    uint64_t v48 = *(void *)(a1 + 32);
    unint64_t v49 = *(void *)(v48 + 616);
    unint64_t v50 = *(void *)(v48 + 608);
    if (v49 < v50)
    {
      ArgAttrsAttr = (void *)mlir::CallableOpInterface::getArgAttrsAttr((mlir::CallableOpInterface *)&v133);
      uint64_t v53 = v52;
      uint64_t v54 = (void *)mlir::CallableOpInterface::getArgAttrsAttr((mlir::CallableOpInterface *)&v131);
      mlir::verifyCompatibleShape(ArgAttrsAttr, v53, v54, v55);
      uint64_t v56 = *(void *)(a1 + 32);
      unint64_t v49 = *(void *)(v56 + 616);
      unint64_t v50 = *(void *)(v56 + 608);
    }
    if (v49 < v50)
    {
      unint64_t v57 = (void *)mlir::CallableOpInterface::getArgAttrsAttr((mlir::CallableOpInterface *)&v133);
      uint64_t v59 = v58;
      int v60 = (void *)mlir::CallableOpInterface::getArgAttrsAttr((mlir::CallableOpInterface *)&v131);
      if (!mlir::verifyCompatibleShape(v57, v59, v60, v61))
      {
        if (MTLReportFailureTypeEnabled())
        {
          uint64_t v124 = a3;
          MTLReportFailure();
        }
      }
    }
  }
  if ((objc_msgSend(*(id *)(a1 + 40), "compilerOptions", v124, v125, v126) & 1) != 0
    || ([*(id *)(a1 + 40) compilerOptions] & 0x200) != 0)
  {
    id v38 = *(void **)(*(void *)(a1 + 56) + 8);
    char v40 = (uint64_t ***)v38[7];
    unint64_t v64 = v38[8];
    if ((unint64_t)v40 < v64)
    {
      unint64_t v63 = v131;
      goto LABEL_53;
    }
    unint64_t v41 = (uint64_t ****)(v38 + 6);
    uint64_t v66 = (char *)v38[6];
    uint64_t v67 = ((char *)v40 - v66) >> 3;
    unint64_t v68 = v67 + 1;
    if (!((unint64_t)(v67 + 1) >> 61))
    {
      uint64_t v69 = v64 - (void)v66;
      if (v69 >> 2 > v68) {
        unint64_t v68 = v69 >> 2;
      }
      if ((unint64_t)v69 >= 0x7FFFFFFFFFFFFFF8) {
        unint64_t v70 = 0x1FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v70 = v68;
      }
      if (v70)
      {
        if (v70 >> 61) {
          goto LABEL_128;
        }
        v71 = (char *)operator new(8 * v70);
      }
      else
      {
        v71 = 0;
      }
      int64_t v72 = (uint64_t ***)&v71[8 * v67];
      unint64_t v73 = &v71[8 * v70];
      *int64_t v72 = v131;
      int64_t v65 = v72 + 1;
      if (v40 == (uint64_t ***)v66) {
        goto LABEL_90;
      }
      unint64_t v74 = (char *)v40 - v66 - 8;
      if (v74 < 0x58) {
        goto LABEL_134;
      }
      if ((unint64_t)(v66 - v71) < 0x20) {
        goto LABEL_134;
      }
      uint64_t v75 = (v74 >> 3) + 1;
      uint64_t v76 = 8 * (v75 & 0x3FFFFFFFFFFFFFFCLL);
      uint64_t v77 = &v40[v76 / 0xFFFFFFFFFFFFFFF8];
      int64_t v72 = (uint64_t ***)((char *)v72 - v76);
      uint64_t v78 = &v71[8 * v67 - 16];
      size_t v79 = v40 - 2;
      uint64_t v80 = v75 & 0x3FFFFFFFFFFFFFFCLL;
      do
      {
        long long v81 = *(_OWORD *)v79;
        *((_OWORD *)v78 - 1) = *((_OWORD *)v79 - 1);
        *(_OWORD *)uint64_t v78 = v81;
        v78 -= 32;
        v79 -= 4;
        v80 -= 4;
      }
      while (v80);
      char v40 = v77;
      if (v75 != (v75 & 0x3FFFFFFFFFFFFFFCLL))
      {
LABEL_134:
        do
        {
          uint64_t v82 = *--v40;
          *--int64_t v72 = v82;
        }
        while (v40 != (uint64_t ***)v66);
      }
      goto LABEL_89;
    }
LABEL_127:
    std::vector<int>::__throw_length_error[abi:ne180100]();
  }
  id v38 = *(void **)(*(void *)(a1 + 56) + 8);
  char v40 = (uint64_t ***)v38[7];
  unint64_t v62 = v38[8];
  if ((unint64_t)v40 < v62)
  {
LABEL_50:
    unint64_t v63 = v133;
LABEL_53:
    uint64_t *v40 = v63;
    int64_t v65 = v40 + 1;
    goto LABEL_92;
  }
  unint64_t v41 = (uint64_t ****)(v38 + 6);
  long long v83 = (char *)v38[6];
  uint64_t v84 = ((char *)v40 - v83) >> 3;
  unint64_t v85 = v84 + 1;
  if ((unint64_t)(v84 + 1) >> 61) {
    goto LABEL_127;
  }
  uint64_t v86 = v62 - (void)v83;
  if (v86 >> 2 > v85) {
    unint64_t v85 = v86 >> 2;
  }
  if ((unint64_t)v86 >= 0x7FFFFFFFFFFFFFF8) {
    unint64_t v87 = 0x1FFFFFFFFFFFFFFFLL;
  }
  else {
    unint64_t v87 = v85;
  }
  if (!v87)
  {
    v88 = 0;
    goto LABEL_82;
  }
  if (v87 >> 61) {
LABEL_128:
  }
    std::__throw_bad_array_new_length[abi:ne180100]();
  v88 = (char *)operator new(8 * v87);
LABEL_82:
  int64_t v72 = (uint64_t ***)&v88[8 * v84];
  unint64_t v73 = &v88[8 * v87];
  *int64_t v72 = v133;
  int64_t v65 = v72 + 1;
  if (v40 == (uint64_t ***)v83) {
    goto LABEL_90;
  }
  unint64_t v89 = (char *)v40 - v83 - 8;
  if (v89 < 0x58) {
    goto LABEL_135;
  }
  if ((unint64_t)(v83 - v88) < 0x20) {
    goto LABEL_135;
  }
  uint64_t v90 = (v89 >> 3) + 1;
  uint64_t v91 = 8 * (v90 & 0x3FFFFFFFFFFFFFFCLL);
  int v92 = &v40[v91 / 0xFFFFFFFFFFFFFFF8];
  int64_t v72 = (uint64_t ***)((char *)v72 - v91);
  int v93 = &v88[8 * v84 - 16];
  uint64_t v94 = v40 - 2;
  uint64_t v95 = v90 & 0x3FFFFFFFFFFFFFFCLL;
  do
  {
    long long v96 = *(_OWORD *)v94;
    *((_OWORD *)v93 - 1) = *((_OWORD *)v94 - 1);
    *(_OWORD *)int v93 = v96;
    v93 -= 32;
    v94 -= 4;
    v95 -= 4;
  }
  while (v95);
  char v40 = v92;
  if (v90 != (v90 & 0x3FFFFFFFFFFFFFFCLL))
  {
LABEL_135:
    do
    {
      unint64_t v97 = *--v40;
      *--int64_t v72 = v97;
    }
    while (v40 != (uint64_t ***)v83);
  }
LABEL_89:
  char v40 = *v41;
LABEL_90:
  v38[6] = v72;
  v38[7] = v65;
  v38[8] = v73;
  if (v40) {
    operator delete(v40);
  }
LABEL_92:
  v38[7] = v65;
}

- (vector<mlir::NamedAttribute,)getAttributesFromDescriptors:(MPSGraphExecutable *)self context:(SEL)a3 device:(id)a4
{
  uint64_t v109 = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  id v10 = a6;
  id v82 = v10;
  uint64_t v84 = retstr;
  if (v9)
  {
    objc_msgSend(v9, "getNamedAttrArray:device:", a5, v10, v10);
  }
  else
  {
    retstr->var0 = 0;
    retstr->var1 = 0;
    retstr->var2.var0 = 0;
  }
  uint64_t v11 = objc_msgSend(*((id *)self + 12), "entryFunctionName", v82);

  if (!v11) {
    goto LABEL_25;
  }
  uint64_t v91 = "mps.entryFunctionName";
  LOWORD(v95) = 259;
  uint64_t v12 = mlir::StringAttr::get((mlir::StringAttr *)a5, (mlir::MLIRContext *)&v91);
  id v13 = [*((id *)self + 12) entryFunctionName];
  uint64_t v14 = (unsigned char *)[v13 UTF8String];
  __int16 v107 = 257;
  if (*v14)
  {
    *(void *)&v106[0] = v14;
    char v15 = 3;
  }
  else
  {
    char v15 = 1;
  }
  LOBYTE(v107) = v15;
  uint64_t v16 = mlir::StringAttr::get((mlir::StringAttr *)a5, (mlir::MLIRContext *)v106);
  mlir::NamedAttribute::NamedAttribute(__p, v12, v16);
  uint64_t v17 = v84;
  var1 = (char *)v84->var1;
  var0 = v84->var2.var0;
  if (var1 >= (char *)var0)
  {
    unint64_t v21 = v84->var0;
    uint64_t v22 = (var1 - (char *)v84->var0) >> 4;
    unint64_t v23 = v22 + 1;
    if ((unint64_t)(v22 + 1) >> 60) {
      std::vector<int>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v24 = var0 - v21;
    if (v24 >> 3 > v23) {
      unint64_t v23 = v24 >> 3;
    }
    if ((unint64_t)v24 >= 0x7FFFFFFFFFFFFFF0) {
      unint64_t v25 = 0xFFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v25 = v23;
    }
    if (v25)
    {
      if (v25 >> 60) {
        std::__throw_bad_array_new_length[abi:ne180100]();
      }
      uint64_t v26 = (char *)operator new(16 * v25);
    }
    else
    {
      uint64_t v26 = 0;
    }
    long long v27 = (NamedAttribute *)&v26[16 * v22];
    uint64_t v28 = (NamedAttribute *)&v26[16 * v25];
    *(_OWORD *)long long v27 = *(_OWORD *)__p;
    id v20 = (NamedAttribute *)((char *)v27 + 16);
    if (var1 == (char *)v21)
    {
      uint64_t v17 = v84;
      v84->var0 = v27;
      v84->var1 = v20;
      v84->var2.var0 = v28;
      if (!var1) {
        goto LABEL_24;
      }
    }
    else
    {
      do
      {
        *((_OWORD *)v27 - 1) = *((_OWORD *)var1 - 1);
        long long v27 = (NamedAttribute *)((char *)v27 - 16);
        var1 -= 16;
      }
      while (var1 != (char *)v21);
      uint64_t v17 = v84;
      var1 = (char *)v84->var0;
      v84->var0 = v27;
      v84->var1 = v20;
      v84->var2.var0 = v28;
      if (!var1) {
        goto LABEL_24;
      }
    }
    operator delete(var1);
    uint64_t v17 = v84;
  }
  else
  {
    *(_OWORD *)var1 = *(_OWORD *)__p;
    id v20 = (NamedAttribute *)(var1 + 16);
  }
LABEL_24:
  v17->var1 = v20;

LABEL_25:
  uint64_t v29 = (void *)*((void *)self + 13);
  if (!v29) {
    goto LABEL_100;
  }
  long long v104 = 0u;
  long long v105 = 0u;
  long long v102 = 0u;
  long long v103 = 0u;
  obunint64_t j = v29;
  uint64_t v30 = [obj countByEnumeratingWithState:&v102 objects:v108 count:16];
  unint64_t v31 = 0;
  if (!v30)
  {
    uint64_t v90 = 0;
    goto LABEL_80;
  }
  unint64_t v89 = 0;
  uint64_t v90 = 0;
  uint64_t v86 = *(void *)v103;
  do
  {
    uint64_t v32 = 0;
    uint64_t v88 = v30;
    do
    {
      if (*(void *)v103 != v86) {
        objc_enumerationMutation(obj);
      }
      uint64_t v33 = *(void **)(*((void *)&v102 + 1) + 8 * v32);
      __p[0] = 0;
      __p[1] = 0;
      uint64_t v101 = 0;
      int v92 = 0;
      char v96 = 0;
      uint64_t v97 = 0;
      int v98 = 1;
      uint64_t v94 = 0;
      uint64_t v95 = 0;
      uint64_t v93 = 0;
      uint64_t v91 = (const char *)&unk_1EC9A38B8;
      uint64_t v99 = __p;
      llvm::raw_ostream::SetBufferAndMode((uint64_t)&v91, 0, 0, 0);
      id v34 = v33;
      id v35 = (const char *)[v34 UTF8String];
      uint64_t v36 = v35;
      if (v35)
      {
        size_t v37 = strlen(v35);
        if (v37 > v94 - (uint64_t)v95)
        {
          id v38 = llvm::raw_ostream::write((llvm::raw_ostream *)&v91, v36, v37);
          unint64_t v39 = (_WORD *)*((void *)v38 + 4);
          if (*((void *)v38 + 3) - (void)v39 > 1uLL) {
            goto LABEL_36;
          }
          goto LABEL_40;
        }
        if (v37)
        {
          memcpy(v95, v36, v37);
          v95 += v37;
        }
      }
      id v38 = (llvm::raw_ostream *)&v91;
      unint64_t v39 = v95;
      if ((unint64_t)(v94 - (void)v95) > 1)
      {
LABEL_36:
        _WORD *v39 = 8250;
        *((void *)v38 + 4) += 2;
        goto LABEL_41;
      }
LABEL_40:
      id v38 = llvm::raw_ostream::write(v38, ": ", 2uLL);
LABEL_41:
      id v40 = [*((id *)self + 13) objectForKeyedSubscript:v34];
      unint64_t v41 = (const char *)[v40 UTF8String];
      uint64_t v42 = v41;
      if (v41)
      {
        size_t v43 = strlen(v41);
        unint64_t v44 = (void *)*((void *)v38 + 4);
        if (v43 <= *((void *)v38 + 3) - (void)v44)
        {
          if (v43)
          {
            memcpy(v44, v42, v43);
            *((void *)v38 + 4) += v43;
          }
        }
        else
        {
          llvm::raw_ostream::write(v38, v42, v43);
        }
      }

      __int16 v107 = 260;
      *(void *)&v106[0] = __p;
      uint64_t v45 = a5;
      uint64_t v46 = mlir::StringAttr::get((mlir::StringAttr *)a5, (mlir::MLIRContext *)v106);
      uint64_t v47 = v46;
      if (v90 < v89)
      {
        *v90++ = v46;
        llvm::raw_ostream::~raw_ostream((llvm::raw_ostream *)&v91);
        if (SHIBYTE(v101) < 0) {
          goto LABEL_29;
        }
        goto LABEL_30;
      }
      uint64_t v48 = v90 - v31;
      unint64_t v49 = v48 + 1;
      if ((unint64_t)(v48 + 1) >> 61) {
        std::vector<int>::__throw_length_error[abi:ne180100]();
      }
      if (((char *)v89 - (char *)v31) >> 2 > v49) {
        unint64_t v49 = ((char *)v89 - (char *)v31) >> 2;
      }
      if ((unint64_t)((char *)v89 - (char *)v31) >= 0x7FFFFFFFFFFFFFF8) {
        unint64_t v50 = 0x1FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v50 = v49;
      }
      if (v50)
      {
        if (v50 >> 61) {
          std::__throw_bad_array_new_length[abi:ne180100]();
        }
        uint64_t v51 = operator new(8 * v50);
        uint64_t v52 = (uint64_t *)&v51[8 * v48];
        *uint64_t v52 = v47;
        uint64_t v53 = (uint64_t)(v52 + 1);
        uint64_t v54 = v90;
        int64_t v55 = (char *)v90 - (char *)v31;
        if (v90 == v31) {
          goto LABEL_63;
        }
      }
      else
      {
        uint64_t v51 = 0;
        uint64_t v52 = (uint64_t *)(8 * v48);
        *(void *)(8 * v48) = v47;
        uint64_t v53 = 8 * v48 + 8;
        uint64_t v54 = v90;
        int64_t v55 = (char *)v90 - (char *)v31;
        if (v90 == v31) {
          goto LABEL_63;
        }
      }
      unint64_t v56 = v55 - 8;
      if (v56 < 0x168)
      {
        unint64_t v57 = v54;
        goto LABEL_62;
      }
      uint64_t v59 = v54 - 1;
      unint64_t v60 = ((char *)v59 - (char *)v31) & 0xFFFFFFFFFFFFFFF8;
      if (&v51[(char *)v90 - (char *)v31 - 8 - v60] > &v51[(char *)v90 - (char *)v31 - 8])
      {
        unint64_t v57 = v90;
        do
        {
LABEL_62:
          uint64_t v58 = *--v57;
          *--uint64_t v52 = v58;
        }
        while (v57 != v31);
        goto LABEL_63;
      }
      if ((uint64_t *)((char *)v59 - v60) > v59)
      {
        unint64_t v57 = v90;
        goto LABEL_62;
      }
      if ((unint64_t)((char *)v31 - v51) < 0x20)
      {
        unint64_t v57 = v90;
        goto LABEL_62;
      }
      uint64_t v61 = (v56 >> 3) + 1;
      uint64_t v62 = 8 * (v61 & 0x3FFFFFFFFFFFFFFCLL);
      unint64_t v57 = &v90[v62 / 0xFFFFFFFFFFFFFFF8];
      uint64_t v52 = (uint64_t *)((char *)v52 - v62);
      unint64_t v63 = &v51[8 * v48 - 16];
      unint64_t v64 = v90 - 2;
      uint64_t v65 = v61 & 0x3FFFFFFFFFFFFFFCLL;
      do
      {
        long long v66 = *(_OWORD *)v64;
        *(v63 - 1) = *((_OWORD *)v64 - 1);
        *unint64_t v63 = v66;
        v63 -= 2;
        v64 -= 4;
        v65 -= 4;
      }
      while (v65);
      if (v61 != (v61 & 0x3FFFFFFFFFFFFFFCLL)) {
        goto LABEL_62;
      }
LABEL_63:
      unint64_t v89 = (uint64_t *)&v51[8 * v50];
      if (v31) {
        operator delete(v31);
      }
      unint64_t v31 = v52;
      uint64_t v90 = (uint64_t *)v53;
      llvm::raw_ostream::~raw_ostream((llvm::raw_ostream *)&v91);
      if (SHIBYTE(v101) < 0) {
LABEL_29:
      }
        operator delete(__p[0]);
LABEL_30:
      ++v32;
      a5 = v45;
    }
    while (v32 != v88);
    uint64_t v30 = [obj countByEnumeratingWithState:&v102 objects:v108 count:16];
  }
  while (v30);
LABEL_80:

  uint64_t v91 = "mps.callables";
  LOWORD(v95) = 259;
  uint64_t v67 = mlir::StringAttr::get((mlir::StringAttr *)a5, (mlir::MLIRContext *)&v91);
  uint64_t v68 = mlir::ArrayAttr::get((mlir::MLIRContext *)a5, (uint64_t)v31, v90 - v31);
  mlir::NamedAttribute::NamedAttribute(v106, v67, v68);
  uint64_t v69 = v84;
  v71 = (char *)v84->var1;
  unint64_t v70 = v84->var2.var0;
  if (v71 < (char *)v70)
  {
    *(_OWORD *)v71 = v106[0];
    int64_t v72 = (NamedAttribute *)(v71 + 16);
    goto LABEL_98;
  }
  unint64_t v73 = v84->var0;
  uint64_t v74 = (v71 - (char *)v84->var0) >> 4;
  unint64_t v75 = v74 + 1;
  if ((unint64_t)(v74 + 1) >> 60) {
    std::vector<int>::__throw_length_error[abi:ne180100]();
  }
  uint64_t v76 = v70 - v73;
  if (v76 >> 3 > v75) {
    unint64_t v75 = v76 >> 3;
  }
  if ((unint64_t)v76 >= 0x7FFFFFFFFFFFFFF0) {
    unint64_t v77 = 0xFFFFFFFFFFFFFFFLL;
  }
  else {
    unint64_t v77 = v75;
  }
  if (v77)
  {
    if (v77 >> 60) {
      std::__throw_bad_array_new_length[abi:ne180100]();
    }
    uint64_t v78 = (char *)operator new(16 * v77);
  }
  else
  {
    uint64_t v78 = 0;
  }
  size_t v79 = (NamedAttribute *)&v78[16 * v74];
  uint64_t v80 = (NamedAttribute *)&v78[16 * v77];
  *(_OWORD *)size_t v79 = v106[0];
  int64_t v72 = (NamedAttribute *)((char *)v79 + 16);
  if (v71 == (char *)v73)
  {
    uint64_t v69 = v84;
    v84->var0 = v79;
    v84->var1 = v72;
    v84->var2.var0 = v80;
    if (!v71) {
      goto LABEL_98;
    }
    goto LABEL_97;
  }
  do
  {
    *((_OWORD *)v79 - 1) = *((_OWORD *)v71 - 1);
    size_t v79 = (NamedAttribute *)((char *)v79 - 16);
    v71 -= 16;
  }
  while (v71 != (char *)v73);
  uint64_t v69 = v84;
  v71 = (char *)v84->var0;
  v84->var0 = v79;
  v84->var1 = v72;
  v84->var2.var0 = v80;
  if (v71)
  {
LABEL_97:
    operator delete(v71);
    uint64_t v69 = v84;
  }
LABEL_98:
  v69->var1 = v72;
  if (v31) {
    operator delete(v31);
  }
LABEL_100:

  return result;
}

- (ModuleOp)specializedModuleWithDevice:(id)a3 inputShapes:(id)a4 compilationDescriptor:(id)a5 fallingBack:(BOOL)a6 fallbackRuntimeKey:(const void *)a7
{
  v122[6] = *MEMORY[0x1E4F143B8];
  id v10 = (MPSGraphDevice *)a3;
  id v97 = a4;
  id v11 = a5;
  uint64_t v12 = v11;
  if (!v11) {
    uint64_t v12 = (void *)*((void *)self + 12);
  }
  id v13 = v12;

  uint64_t v14 = [(MPSGraphCompilationDescriptor *)v13 callables];
  int v98 = v10;
  uint64_t v99 = v13;
  if (v14)
  {
    char v15 = [(MPSGraphCompilationDescriptor *)v13 callables];
    uint64_t v16 = [*((id *)self + 12) callables];

    BOOL v17 = v15 == v16;
    id v13 = v99;
    if (!v17)
    {
      if (MTLReportFailureTypeEnabled()) {
        MTLReportFailure();
      }
    }
  }
  unint64_t v18 = [(MPSGraphCompilationDescriptor *)v13 entryFunctionName];
  if (v18)
  {
    objc_super v19 = [(MPSGraphCompilationDescriptor *)v13 entryFunctionName];
    id v20 = [*((id *)self + 12) entryFunctionName];
    char v21 = [v19 isEqual:v20];

    id v10 = v98;
    id v13 = v99;
    if ((v21 & 1) == 0)
    {
      if (MTLReportFailureTypeEnabled()) {
        MTLReportFailure();
      }
    }
  }
  id v22 = v97;
  uint64_t v101 = v22;
  if (([(MPSGraphCompilationDescriptor *)v13 compilerOptions] & 1) == 0)
  {

    uint64_t v101 = 0;
  }
  uint64_t v100 = (std::recursive_mutex *)((char *)self + 200);
  std::recursive_mutex::lock((std::recursive_mutex *)((char *)self + 200));
  if (*((void *)self + 77) >= *((void *)self + 76))
  {
    unint64_t v23 = [MEMORY[0x1E4F1CA48] array];
    for (unint64_t i = 0; i < [v22 count]; ++i)
    {
      unint64_t v25 = [MPSGraphShapedType alloc];
      uint64_t v26 = [v22 objectAtIndexedSubscript:i];
      long long v27 = -[MPSGraphShapedType initWithShape:dataType:](v25, "initWithShape:dataType:", 0, [v26 dataType]);

      [v23 addObject:v27];
    }
    id v28 = v23;

    uint64_t v101 = v28;
  }
  std::recursive_mutex::unlock(v100);
  std::recursive_mutex::lock(v100);
  getFlatShapes(&v119, v101);
  uint64_t DeviceKey = getDeviceKey(v10);
  uint64_t v30 = (void *)*((void *)self + 13);
  unint64_t v31 = [*((id *)self + 12) entryFunctionName];
  MPSGraphModuleKey::MPSGraphModuleKey(&v113, (uint64_t)&v119, v13, v30, v31, DeviceKey);

  if (v10)
  {
    v121[0] = 0;
    int v32 = llvm::DenseMapBase<llvm::DenseMap<MPSGraphModuleKey,std::unique_ptr<LazyLoadableModuleRef>,MPSGraphModuleKeyInfo,llvm::detail::DenseMapPair<MPSGraphModuleKey,std::unique_ptr<LazyLoadableModuleRef>>>,MPSGraphModuleKey,std::unique_ptr<LazyLoadableModuleRef>,MPSGraphModuleKeyInfo,llvm::detail::DenseMapPair<MPSGraphModuleKey,std::unique_ptr<LazyLoadableModuleRef>>>::LookupBucketFor<MPSGraphModuleKey>(*((void *)self + 17), *((unsigned int *)self + 38), (const void **)&v113._ctx.__ptr_, v121);
    int v34 = v121[0] == (const MPSGraphModuleKey *)(*((void *)self + 17) + 104 * *((unsigned int *)self + 38))
        ? 0
        : v32;
    if (v34 == 1)
    {
      unint64_t v111 = LazyLoadableModuleRef::get(*((LazyLoadableModuleRef **)v121[0] + 12), v33);
      if (!v111 && MTLReportFailureTypeEnabled()) {
        MTLReportFailure();
      }
      id v35 = [(MPSGraphCompilationDescriptor *)v13 compilationCompletionHandler];
      BOOL v36 = v35 == 0;

      if (!v36)
      {
        size_t v37 = [(MPSGraphCompilationDescriptor *)v13 compilationCompletionHandler];
        ((void (**)(void, MPSGraphExecutable *, void))v37)[2](v37, self, 0);
      }
      if ((OwningOpRef<mlir::ModuleOp> *)v113._ctx.__ptr_ != &v113._originalModule) {
        free(v113._ctx.__ptr_);
      }
      if (v119 != v120) {
        free(v119);
      }
      std::recursive_mutex::unlock(v100);
      goto LABEL_137;
    }
  }

  if ((OwningOpRef<mlir::ModuleOp> *)v113._ctx.__ptr_ != &v113._originalModule) {
    free(v113._ctx.__ptr_);
  }
  if (v119 != v120) {
    free(v119);
  }
  std::recursive_mutex::unlock(v100);
  if (v13 != *((MPSGraphCompilationDescriptor **)self + 12)) {
    overrideCompilationDescriptorWithEV(v13);
  }
  [(MPSGraphExecutable *)self optimizeOriginalModule];
  unsigned __int8 v38 = atomic_load((unsigned __int8 *)self + 452);
  if ((v38 & 1) == 0) {
    __assert_rtn("-[MPSGraphExecutable specializedModuleWithDevice:inputShapes:compilationDescriptor:fallingBack:fallbackRuntimeKey:]", "MPSGraphExecutable.mm", 2251, "_originalModuleIsOptimized && \"original module should be already optimized\"");
  }
  std::recursive_mutex::lock(v100);
  id v40 = LazyLoadableModuleRef::get((LazyLoadableModuleRef *)((char *)self + 40), v39);
  getFlatShapes(v121, v101);
  uint64_t v41 = getDeviceKey(v10);
  uint64_t v42 = (void *)*((void *)self + 13);
  size_t v43 = [*((id *)self + 12) entryFunctionName];
  MPSGraphModuleKey::MPSGraphModuleKey(&v119, (uint64_t)v121, v13, v42, v43, v41);

  if (v10)
  {
    v113._ctx.__ptr_ = 0;
    int v44 = llvm::DenseMapBase<llvm::DenseMap<MPSGraphModuleKey,std::unique_ptr<LazyLoadableModuleRef>,MPSGraphModuleKeyInfo,llvm::detail::DenseMapPair<MPSGraphModuleKey,std::unique_ptr<LazyLoadableModuleRef>>>,MPSGraphModuleKey,std::unique_ptr<LazyLoadableModuleRef>,MPSGraphModuleKeyInfo,llvm::detail::DenseMapPair<MPSGraphModuleKey,std::unique_ptr<LazyLoadableModuleRef>>>::LookupBucketFor<MPSGraphModuleKey>(*((void *)self + 17), *((unsigned int *)self + 38), (const void **)&v119, (const MPSGraphModuleKey **)&v113);
    ptr = v113._ctx.__ptr_;
    int v46 = v113._ctx.__ptr_ == (MLIRContext *)(*((void *)self + 17) + 104 * *((unsigned int *)self + 38)) ? 0 : v44;
    if (v46 == 1)
    {
      uint64_t v47 = [(MPSGraphCompilationDescriptor *)v13 compilationCompletionHandler];
      BOOL v48 = v47 == 0;

      if (!v48)
      {
        unint64_t v50 = [(MPSGraphCompilationDescriptor *)v13 compilationCompletionHandler];
        ((void (**)(void, MPSGraphExecutable *, void))v50)[2](v50, self, 0);
      }
      unint64_t v111 = LazyLoadableModuleRef::get(*((LazyLoadableModuleRef **)ptr + 12), v49);
      goto LABEL_132;
    }
  }
  [(MPSGraphExecutable *)self convertMPSGraphShapesToMLIRTypes:v101 funcOp:[(MPSGraphExecutable *)self getEntryFuncOpForModule:v40] compilationDescriptor:v13];
  [(MPSGraphExecutable *)self getAttributesFromDescriptors:v13 context:mlir::Attribute::getContext((Operation *)((char *)v40 + 24)) device:v10];
  getSignatureOfModule(&v106, (uint64_t)v40, v107, (v108 - (unsigned char *)v107) >> 4, (uint64_t)&v109);
  [(MPSGraphExecutable *)self getAttributesFromDescriptors:v13 context:mlir::Attribute::getContext((Operation *)((char *)v40 + 24)) device:0];
  getSignatureOfModule(&__p, (uint64_t)v40, v104, (v105 - (unsigned char *)v104) >> 4, (uint64_t)&v109);
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    p_p = &__p;
  }
  else {
    p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
  }
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    std::string::size_type size = HIBYTE(__p.__r_.__value_.__r.__words[2]);
  }
  else {
    std::string::size_type size = __p.__r_.__value_.__l.__size_;
  }
  unint64_t v53 = std::__murmur2_or_cityhash<unsigned long,64ul>::operator()[abi:ne180100]((uint64_t)&v113, (uint64_t *)p_p, size);
  int8x8_t v55 = *(int8x8_t *)((char *)self + 168);
  if (!*(void *)&v55) {
    goto LABEL_99;
  }
  unint64_t v56 = v53;
  uint8x8_t v57 = (uint8x8_t)vcnt_s8(v55);
  v57.i16[0] = vaddlv_u8(v57);
  if (v57.u32[0] > 1uLL)
  {
    unint64_t v58 = v53;
    if (v53 >= *(void *)&v55) {
      unint64_t v58 = v53 % *(void *)&v55;
    }
  }
  else
  {
    unint64_t v58 = (*(void *)&v55 - 1) & v53;
  }
  uint64_t v59 = *(uint64_t ***)(*((void *)self + 20) + 8 * v58);
  if (!v59 || (unint64_t v60 = *v59) == 0)
  {
LABEL_99:
    long long v102 = 0;
    unint64_t v111 = 0;
    goto LABEL_100;
  }
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    std::string::size_type v61 = HIBYTE(__p.__r_.__value_.__r.__words[2]);
  }
  else {
    std::string::size_type v61 = __p.__r_.__value_.__l.__size_;
  }
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    uint64_t v62 = &__p;
  }
  else {
    uint64_t v62 = (std::string *)__p.__r_.__value_.__r.__words[0];
  }
  if (v57.u32[0] < 2uLL)
  {
    uint64_t v63 = *(void *)&v55 - 1;
    while (1)
    {
      uint64_t v68 = v60[1];
      if (v68 == v56)
      {
        uint64_t v69 = *((unsigned __int8 *)v60 + 39);
        if ((v69 & 0x80u) == 0) {
          uint64_t v70 = *((unsigned __int8 *)v60 + 39);
        }
        else {
          uint64_t v70 = v60[3];
        }
        if (v70 == v61)
        {
          if ((v69 & 0x80) != 0)
          {
            if (!memcmp((const void *)v60[2], v62, v60[3])) {
              goto LABEL_98;
            }
          }
          else
          {
            if (!*((unsigned char *)v60 + 39)) {
              goto LABEL_98;
            }
            uint64_t v71 = 0;
            while (*((unsigned __int8 *)v60 + v71 + 16) == v62->__r_.__value_.__s.__data_[v71])
            {
              if (v69 == ++v71) {
                goto LABEL_118;
              }
            }
          }
        }
      }
      else if ((v68 & v63) != v58)
      {
        goto LABEL_99;
      }
      unint64_t v60 = (uint64_t *)*v60;
      if (!v60) {
        goto LABEL_99;
      }
    }
  }
  while (1)
  {
    unint64_t v64 = v60[1];
    if (v64 == v56) {
      break;
    }
    if (v64 >= *(void *)&v55) {
      v64 %= *(void *)&v55;
    }
    if (v64 != v58) {
      goto LABEL_99;
    }
LABEL_68:
    unint64_t v60 = (uint64_t *)*v60;
    if (!v60) {
      goto LABEL_99;
    }
  }
  uint64_t v65 = *((unsigned __int8 *)v60 + 39);
  if ((v65 & 0x80u) == 0) {
    uint64_t v66 = *((unsigned __int8 *)v60 + 39);
  }
  else {
    uint64_t v66 = v60[3];
  }
  if (v66 != v61) {
    goto LABEL_68;
  }
  if ((v65 & 0x80) != 0)
  {
    if (!memcmp((const void *)v60[2], v62, v60[3])) {
      goto LABEL_98;
    }
    goto LABEL_68;
  }
  if (!*((unsigned char *)v60 + 39))
  {
LABEL_98:
    long long v102 = 0;
    unint64_t v111 = 0;
    id v10 = v98;
    id v13 = v99;
    goto LABEL_119;
  }
  uint64_t v67 = 0;
  do
  {
    if (*((unsigned __int8 *)v60 + v67 + 16) != v62->__r_.__value_.__s.__data_[v67]) {
      goto LABEL_68;
    }
    ++v67;
  }
  while (v65 != v67);
LABEL_118:
  id v10 = v98;
  id v13 = v99;
  long long v102 = 0;
  unint64_t v111 = 0;
  if (!v60)
  {
LABEL_100:
    LazyLoadableModuleRef::get((LazyLoadableModuleRef *)((char *)self + 40), v54);
    mlir::Op<mlir::ModuleOp,mlir::OpTrait::OneRegion,mlir::OpTrait::ZeroResults,mlir::OpTrait::ZeroSuccessors,mlir::OpTrait::ZeroOperands,mlir::OpTrait::NoRegionArguments,mlir::OpTrait::NoTerminator,mlir::OpTrait::SingleBlock,mlir::OpTrait::OpInvariants,mlir::BytecodeOpInterface::Trait,mlir::OpTrait::AffineScope,mlir::OpTrait::IsIsolatedFromAbove,mlir::OpTrait::SymbolTable,mlir::SymbolOpInterface::Trait,mlir::OpAsmOpInterface::Trait,mlir::RegionKindInterface::Trait,mlir::OpTrait::HasOnlyGraphRegion>::clone((mlir::Operation::CloneOptions *)((char *)self + 56));
  }
LABEL_119:
  unint64_t v111 = LazyLoadableModuleRef::get((LazyLoadableModuleRef *)(v60 + 5), v54);
  if (v10)
  {
    if ([(MPSGraphCompilationDescriptor *)v13 compilerOptions])
    {
      int v112 = [(MPSGraphExecutable *)self getEntryFuncOpForModule:v111];
      int64_t v72 = (mlir::MLIRContext *)*((void *)self + 2);
      mlir::ValueRange::ValueRange(v118, (uint64_t)v109, (v110 - (unsigned char *)v109) >> 3);
      v113._ctx.__ptr_ = (MLIRContext *)mlir::func::FuncOp::getFunctionType((mlir::func::FuncOp *)&v112);
      uint64_t Results = mlir::FunctionType::getResults((mlir::FunctionType *)&v113);
      mlir::ValueRange::ValueRange(v117, Results, v74);
      uint64_t v75 = mlir::FunctionType::get(v72, v118[0], v118[1], v117[0], v117[1]);
      uint64_t v76 = v112;
      if (v112)
      {
        uint64_t InterfaceFor = mlir::OpInterface<mlir::FunctionOpInterface,mlir::detail::FunctionOpInterfaceInterfaceTraits>::getInterfaceFor((uint64_t)v112);
        if (!InterfaceFor) {
          __assert_rtn("Interface", "InterfaceSupport.h", 110, "(!t || conceptImpl) && \"expected value to provide interface instance\"");
        }
      }
      else
      {
        uint64_t InterfaceFor = 0;
      }
      mlir::function_interface_impl::setFunctionType((uint64_t)v76, InterfaceFor, v75);
      v113._ctx.__ptr_ = (MLIRContext *)mlir::func::FuncOp::getFunctionType((mlir::func::FuncOp *)&v112);
      mlir::FunctionType::getInputs((mlir::FunctionType *)&v113);
      size_t v79 = (unsigned int *)v112;
      uint64_t v80 = v78;
      if (v78)
      {
        unint64_t v81 = 0;
        id v82 = v109;
        long long v83 = "index < numRegions && \"invalid region index\"";
        uint64_t v78 = "Operation.h";
        uint64_t v84 = "getRegion";
        while (1)
        {
          unint64_t v85 = v79[11];
          if ((v85 & 0x7FFFFF) == 0)
          {
            int v96 = 666;
            goto LABEL_141;
          }
          unint64_t v86 = (unint64_t)&v79[4 * ((v85 >> 23) & 1) + 16] + ((v85 >> 21) & 0x7F8);
          if (v86 > 0xFFFFFFFFFFFFFFF8)
          {
            int v96 = 191;
            uint64_t v84 = "alignAddr";
            uint64_t v78 = "Alignment.h";
            long long v83 = "static_cast<uintptr_t>(ArithAddr + Alignment.value() - 1) >= ArithAddr && \"Overflow\"";
            goto LABEL_141;
          }
          unint64_t v87 = (void *)(((v86 + 7) & 0xFFFFFFFFFFFFFFF8) + 32 * v79[10]);
          if ((void *)*v87 == v87) {
            break;
          }
          uint64_t v88 = v87[1];
          uint64_t v89 = v88 - 8;
          if (!v88) {
            uint64_t v89 = 0;
          }
          uint64_t v90 = *(void *)(v89 + 48);
          if (v81 >= (*(void *)(v89 + 56) - v90) >> 3) {
            break;
          }
          uint64_t v91 = v82[v81];
          if ((v91 & 7) != 0)
          {
            int v96 = 203;
            uint64_t v84 = "updatePointer";
            uint64_t v78 = "PointerIntPair.h";
            long long v83 = "(PtrWord & ~PointerBitMask) == 0 && \"Pointer is not sufficiently aligned\"";
            goto LABEL_141;
          }
          *(void *)(*(void *)(v90 + 8 * v81) + 8) = *(void *)(*(void *)(v90 + 8 * v81) + 8) & 7 | v91;
          if (v80 == ++v81) {
            goto LABEL_116;
          }
        }
        int v96 = 443;
        uint64_t v84 = "operator[]";
        uint64_t v78 = "ArrayRef.h";
        long long v83 = "Index < this->size() && \"Invalid index!\"";
LABEL_141:
        __assert_rtn(v84, v78, v96, v83);
      }
LABEL_116:
      mlir::mps::inferTypes((mlir::mps *)v79, (mlir::Operation *)v78);
    }
    [(MPSGraphExecutable *)self optimizationPassesWithDevice:v10 sourceModule:&v111 compilationID:(*((void *)self + 63))++ compilationDescriptor:v13];
    operator new();
  }
  int v92 = [(MPSGraphCompilationDescriptor *)v13 compilationCompletionHandler];
  BOOL v93 = v92 == 0;

  if (!v93)
  {
    uint64_t v94 = [(MPSGraphCompilationDescriptor *)v13 compilationCompletionHandler];
    ((void (**)(void, MPSGraphExecutable *, void))v94)[2](v94, self, 0);
  }
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  if (v104)
  {
    long long v105 = v104;
    operator delete(v104);
  }
  if (SHIBYTE(v106.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v106.__r_.__value_.__l.__data_);
  }
  if (v107)
  {
    int v108 = v107;
    operator delete(v107);
  }
  if (v109)
  {
    uint64_t v110 = v109;
    operator delete(v109);
  }
LABEL_132:

  if (v119 != v120) {
    free(v119);
  }
  if ((void *)v121[0] != v122) {
    free(v121[0]);
  }
  std::recursive_mutex::unlock(v100);
LABEL_137:

  return (ModuleOp)v111;
}

- (void)specializeWithDevice:(MPSGraphDevice *)device inputTypes:(NSArray *)inputTypes compilationDescriptor:(MPSGraphCompilationDescriptor *)compilationDescriptor
{
  id v10 = device;
  unint64_t v8 = compilationDescriptor;
  id v9 = getShapesFromTypes(inputTypes);
  [(MPSGraphExecutable *)self specializeWithDevice:v10 inputShapes:v9 compilationDescriptor:v8];
}

- (void)specializeForMultipleInputTypesWithDevice:(id)a3 multipleInputTypes:(id)a4 compilationDescriptor:(id)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  [v9 count];
  if (![v9 count] && MTLReportFailureTypeEnabled()) {
    MTLReportFailure();
  }
  if ([v10 waitForCompilationCompletion])
  {
    memset(v26.__cv_.__opaque, 0, sizeof(v26.__cv_.__opaque));
    v26.__cv_.__sig = 1018212795;
    memset(v25.__m_.__opaque, 0, sizeof(v25.__m_.__opaque));
    uint64_t v24 = [v9 count];
    v25.__m_.__sig = 850045863;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __105__MPSGraphExecutable_specializeForMultipleInputTypesWithDevice_multipleInputTypes_compilationDescriptor___block_invoke;
    v17[3] = &unk_1E4FC1800;
    id v18 = v10;
    objc_super v19 = self;
    id v20 = v8;
    char v21 = &v25;
    id v22 = &v24;
    unint64_t v23 = &v26;
    [v9 enumerateObjectsUsingBlock:v17];
    __lk.__m_ = &v25;
    __lk.__owns_ = 1;
    std::mutex::lock(&v25);
    while (atomic_load((unint64_t *)&v24))
      std::condition_variable::wait(&v26, &__lk);
    if (__lk.__owns_) {
      std::mutex::unlock(__lk.__m_);
    }

    std::mutex::~mutex(&v25);
    std::condition_variable::~condition_variable(&v26);
  }
  else
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __105__MPSGraphExecutable_specializeForMultipleInputTypesWithDevice_multipleInputTypes_compilationDescriptor___block_invoke_3;
    v13[3] = &unk_1E4FC1828;
    v13[4] = self;
    id v14 = v8;
    id v15 = v10;
    [v9 enumerateObjectsUsingBlock:v13];
  }
}

void __105__MPSGraphExecutable_specializeForMultipleInputTypesWithDevice_multipleInputTypes_compilationDescriptor___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) dispatchQueue];
  if (v4)
  {
    id v5 = [*(id *)(a1 + 32) dispatchQueue];
    uint64_t v6 = *(void *)(a1 + 40);
  }
  else
  {
    uint64_t v6 = *(void *)(a1 + 40);
    id v5 = *(NSObject **)(v6 + 328);
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __105__MPSGraphExecutable_specializeForMultipleInputTypesWithDevice_multipleInputTypes_compilationDescriptor___block_invoke_2;
  block[3] = &unk_1E4FC17D8;
  block[4] = v6;
  id v9 = *(id *)(a1 + 48);
  id v10 = v3;
  id v11 = *(id *)(a1 + 32);
  long long v12 = *(_OWORD *)(a1 + 56);
  uint64_t v13 = *(void *)(a1 + 72);
  id v7 = v3;
  dispatch_async(v5, block);
  if (v4) {
}
  }

void __105__MPSGraphExecutable_specializeForMultipleInputTypesWithDevice_multipleInputTypes_compilationDescriptor___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) specializeWithDevice:*(void *)(a1 + 40) inputTypes:*(void *)(a1 + 48) compilationDescriptor:*(void *)(a1 + 56)];
  v2 = *(std::mutex **)(a1 + 64);
  std::mutex::lock(v2);
  atomic_fetch_add(*(atomic_ullong *volatile *)(a1 + 72), 0xFFFFFFFFFFFFFFFFLL);
  if (atomic_load(*(unint64_t **)(a1 + 72)))
  {
    id v4 = v2;
  }
  else
  {
    std::condition_variable::notify_all(*(std::condition_variable **)(a1 + 80));
    id v4 = v2;
  }
  std::mutex::unlock(v4);
}

uint64_t __105__MPSGraphExecutable_specializeForMultipleInputTypesWithDevice_multipleInputTypes_compilationDescriptor___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) specializeWithDevice:*(void *)(a1 + 40) inputTypes:a2 compilationDescriptor:*(void *)(a1 + 48)];
}

- (NSArray)getOutputTypesWithDevice:(MPSGraphDevice *)device inputTypes:(NSArray *)inputTypes compilationDescriptor:(MPSGraphCompilationDescriptor *)compilationDescriptor
{
  id v8 = device;
  id v9 = inputTypes;
  id v10 = compilationDescriptor;
  id v11 = getShapesFromTypes(v9);
  if (*((MPSGraphCompilationDescriptor **)self + 12) != v10) {
    overrideCompilationDescriptorWithEV(v10);
  }
  v12.var0 = (Operation *)[(MPSGraphExecutable *)self returnOpForFunctionInModule:[(MPSGraphExecutable *)self specializedModuleWithDevice:v8 inputShapes:v11 compilationDescriptor:v10 fallingBack:0 fallbackRuntimeKey:0]];
  if ((*((unsigned char *)v12.var0 + 46) & 0x80) != 0) {
    uint64_t v13 = *((unsigned int *)v12.var0 + 17);
  }
  else {
    uint64_t v13 = 0;
  }
  id v14 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v13];
  if ((*((unsigned char *)v12.var0 + 46) & 0x80) != 0)
  {
    uint64_t v15 = -1;
    uint64_t v16 = 24;
    do
    {
      if (++v15 >= (unint64_t)*((unsigned int *)v12.var0 + 17)) {
        break;
      }
      BOOL v17 = getMPSGraphShapedType((uint64_t **)(*(void *)(*(void *)(*((void *)v12.var0 + 9) + v16) + 8) & 0xFFFFFFFFFFFFFFF8));
      [v14 addObject:v17];
      v16 += 32;
    }
    while ((*((unsigned char *)v12.var0 + 46) & 0x80) != 0);
  }

  return (NSArray *)v14;
}

- (void)specializeWithDevice:(id)a3 inputShapes:(id)a4 compilationDescriptor:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v10 waitForCompilationCompletion])
  {
    [(MPSGraphExecutable *)self specializedModuleWithDevice:v8 inputShapes:v9 compilationDescriptor:v10 fallingBack:0 fallbackRuntimeKey:0];
  }
  else
  {
    std::mutex::lock((std::mutex *)((char *)self + 336));
    atomic_fetch_add((atomic_uint *volatile)self + 112, 1u);
    std::mutex::unlock((std::mutex *)((char *)self + 336));
    id v11 = [v10 dispatchQueue];
    if (v11)
    {
      ReturnOp v12 = [v10 dispatchQueue];
    }
    else
    {
      ReturnOp v12 = *((void *)self + 41);
    }
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __77__MPSGraphExecutable_specializeWithDevice_inputShapes_compilationDescriptor___block_invoke;
    v13[3] = &unk_1E4FC1878;
    v13[4] = self;
    id v14 = v8;
    id v15 = v9;
    id v16 = v10;
    dispatch_async(v12, v13);
    if (v11) {
  }
    }
}

void __77__MPSGraphExecutable_specializeWithDevice_inputShapes_compilationDescriptor___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) specializedModuleWithDevice:*(void *)(a1 + 40) inputShapes:*(void *)(a1 + 48) compilationDescriptor:*(void *)(a1 + 56) fallingBack:0 fallbackRuntimeKey:0];
  v2 = (std::mutex *)(*(void *)(a1 + 32) + 336);
  std::mutex::lock(v2);
  if (atomic_fetch_add((atomic_uint *volatile)(*(void *)(a1 + 32) + 448), 0xFFFFFFFF) == 1) {
    std::condition_variable::notify_all((std::condition_variable *)(*(void *)(a1 + 32) + 400));
  }

  std::mutex::unlock(v2);
}

- (ModuleOp)specializeWithDevice:(id)a3 inputsArray:(id)a4 compilationDescriptor:(id)a5
{
  return (ModuleOp)[(MPSGraphExecutable *)self specializedModuleWithDevice:a3 inputShapes:a4 compilationDescriptor:a5 fallingBack:0 fallbackRuntimeKey:0];
}

- (void)checkCallablesForModule:(void *)a3
{
  uint64_t v54 = 0;
  uint64_t v55 = 0;
  unint64_t v53 = &v54;
  uint64_t v3 = *(void *)a3;
  unint64_t v4 = *(unsigned int *)(*(void *)a3 + 44);
  if ((v4 & 0x7FFFFF) == 0)
  {
    int v46 = "index < numRegions && \"invalid region index\"";
    int v47 = 666;
    BOOL v48 = "Operation.h";
    unint64_t v49 = "getRegion";
    goto LABEL_62;
  }
  unint64_t v5 = v3 + 16 * ((v4 >> 23) & 1) + ((v4 >> 21) & 0x7F8) + 64;
  if (v5 > 0xFFFFFFFFFFFFFFF8)
  {
    int v46 = "static_cast<uintptr_t>(ArithAddr + Alignment.value() - 1) >= ArithAddr && \"Overflow\"";
    int v47 = 191;
    BOOL v48 = "Alignment.h";
    unint64_t v49 = "alignAddr";
    goto LABEL_62;
  }
  uint64_t v6 = (void *)(((v5 + 7) & 0xFFFFFFFFFFFFFFF8) + 32 * *(unsigned int *)(v3 + 40));
  if ((void *)*v6 == v6)
  {
    int v46 = "!region.empty() && \"unexpected empty region\"";
    int v47 = 895;
    BOOL v48 = "OpDefinition.h";
    unint64_t v49 = "getBody";
LABEL_62:
    __assert_rtn(v49, v48, v47, v46);
  }
  uint64_t v8 = v6[1];
  if (v8) {
    uint64_t v9 = v8 - 8;
  }
  else {
    uint64_t v9 = 0;
  }
  unint64_t v60 = &v53;
  id v10 = (mlir::GenericProgramPoint *)(v9 + 32);
  id v11 = *(mlir::GenericProgramPoint **)(v9 + 40);
  if (v11 != (mlir::GenericProgramPoint *)(v9 + 32))
  {
    do
    {
      ReturnOp v12 = (mlir::GenericProgramPoint *)*((void *)v11 + 1);
      mlir::GenericProgramPoint::~GenericProgramPoint(v11);
      v56[0] = &v60;
      mlir::detail::walk<mlir::ForwardIterator>(v13, (mlir::Operation *)_ZN4llvm12function_refIFvPN4mlir9OperationEEE11callback_fnIZNS1_6detail4walkILNS1_9WalkOrderE1ENS1_15ForwardIteratorERZ46__MPSGraphExecutable_checkCallablesForModule__E3__8NS1_3mps6CallOpEvEENSt3__19enable_ifIXaantsr4llvm9is_one_ofIT2_S3_PNS1_6RegionEPNS1_5BlockEEE5valuesr3std7is_sameIT3_vEE5valueESM_E4typeES3_OT1_EUlS3_E_EEvlS3_, (uint64_t)v56, 1);
      id v11 = v12;
    }
    while (v12 != v10);
    if (v55)
    {
      id v14 = v53;
      if (v53 != &v54)
      {
        uint64_t v51 = self;
        do
        {
          if (*((char *)v14 + 55) < 0) {
            id v15 = (char **)v14[4];
          }
          else {
            id v15 = v14 + 4;
          }
          id v16 = objc_msgSend(NSString, "stringWithUTF8String:", v15, v50);
          BOOL v17 = [*((id *)self + 12) callables];
          id v18 = [v17 objectForKeyedSubscript:v16];

          if (v18)
          {
            [v18 optimizeOriginalModule];
            unint64_t v60 = (void *)[v18 getEntryFuncOp];
            int v59 = 0;
            unint64_t Body = mlir::anec::A11Legacy::getBody((mlir::anec::A11Legacy *)&v60);
            unint64_t v58 = &v59;
            for (uint64_t i = *(void *)(Body + 8); i != Body; uint64_t i = *(void *)(i + 8))
            {
              uint64_t v21 = i - 8;
              if (!i) {
                uint64_t v21 = 0;
              }
              id v22 = (mlir::GenericProgramPoint *)(v21 + 32);
              unint64_t v23 = *(mlir::GenericProgramPoint **)(v21 + 40);
              if (v23 != (mlir::GenericProgramPoint *)(v21 + 32))
              {
                do
                {
                  uint64_t v24 = (mlir::GenericProgramPoint *)*((void *)v23 + 1);
                  mlir::GenericProgramPoint::~GenericProgramPoint(v23);
                  v56[0] = &v58;
                  mlir::detail::walk<mlir::ForwardIterator>(v25, (mlir::Operation *)_ZN4llvm12function_refIFvPN4mlir9OperationEEE11callback_fnIZNS1_6detail4walkILNS1_9WalkOrderE1ENS1_15ForwardIteratorERZZ46__MPSGraphExecutable_checkCallablesForModule__ENK3__9clENS1_4func6FuncOpEEUlNS1_3mps6CallOpEE_SF_vEENSt3__19enable_ifIXaantsr4llvm9is_one_ofIT2_S3_PNS1_6RegionEPNS1_5BlockEEE5valuesr3std7is_sameIT3_vEE5valueESP_E4typeES3_OT1_EUlS3_E_EEvlS3_, (uint64_t)v56, 1);
                  unint64_t v23 = v24;
                }
                while (v24 != v22);
              }
            }
            if (v59 && MTLReportFailureTypeEnabled())
            {
              unint64_t v50 = v16;
              MTLReportFailure();
            }
          }
          else
          {
            std::condition_variable v26 = (char *)*((unsigned __int8 *)v14 + 55);
            uint64_t v27 = v14[4];
            id v28 = v14[5];
            uint64_t v29 = *(unsigned int **)a3;
            Context = (mlir::StringAttr *)mlir::Attribute::getContext((mlir::Attribute *)(*(void *)a3 + 24));
            if ((char)v26 >= 0) {
              unint64_t v31 = v26;
            }
            else {
              unint64_t v31 = v28;
            }
            __int16 v57 = 261;
            if ((char)v26 >= 0) {
              int v32 = v14 + 4;
            }
            else {
              int v32 = (char **)v27;
            }
            v56[0] = v32;
            v56[1] = v31;
            uint64_t v33 = mlir::StringAttr::get(Context, (mlir::MLIRContext *)v56);
            uint64_t v34 = mlir::SymbolTable::lookupSymbolIn(v29, v33);
            if (!v34
              || (uint64_t v35 = llvm::DefaultDoCastIfPossible<mlir::func::FuncOp,mlir::Operation &,llvm::CastInfo<mlir::func::FuncOp,mlir::Operation,void>>::doCastIfPossible(v34)) == 0)
            {
              if (MTLReportFailureTypeEnabled())
              {
                unint64_t v50 = v16;
                MTLReportFailure();
              }
              uint64_t v35 = 0;
            }
            unint64_t v60 = (void *)v35;
            int v59 = 0;
            unint64_t v36 = mlir::anec::A11Legacy::getBody((mlir::anec::A11Legacy *)&v60);
            unint64_t v58 = &v59;
            for (uint64_t j = *(void *)(v36 + 8); j != v36; uint64_t j = *(void *)(j + 8))
            {
              uint64_t v38 = j - 8;
              if (!j) {
                uint64_t v38 = 0;
              }
              unint64_t v39 = (mlir::GenericProgramPoint *)(v38 + 32);
              id v40 = *(mlir::GenericProgramPoint **)(v38 + 40);
              if (v40 != (mlir::GenericProgramPoint *)(v38 + 32))
              {
                do
                {
                  uint64_t v41 = (mlir::GenericProgramPoint *)*((void *)v40 + 1);
                  mlir::GenericProgramPoint::~GenericProgramPoint(v40);
                  v56[0] = &v58;
                  mlir::detail::walk<mlir::ForwardIterator>(v42, (mlir::Operation *)_ZN4llvm12function_refIFvPN4mlir9OperationEEE11callback_fnIZNS1_6detail4walkILNS1_9WalkOrderE1ENS1_15ForwardIteratorERZZ46__MPSGraphExecutable_checkCallablesForModule__ENK3__9clENS1_4func6FuncOpEEUlNS1_3mps6CallOpEE_SF_vEENSt3__19enable_ifIXaantsr4llvm9is_one_ofIT2_S3_PNS1_6RegionEPNS1_5BlockEEE5valuesr3std7is_sameIT3_vEE5valueESP_E4typeES3_OT1_EUlS3_E_EEvlS3_, (uint64_t)v56, 1);
                  id v40 = v41;
                }
                while (v41 != v39);
              }
            }
            if (v59 && MTLReportFailureTypeEnabled())
            {
              unint64_t v50 = v16;
              MTLReportFailure();
            }
            self = v51;
          }

          size_t v43 = v14[1];
          if (v43)
          {
            do
            {
              int v44 = (char **)v43;
              size_t v43 = *(char **)v43;
            }
            while (v43);
          }
          else
          {
            do
            {
              int v44 = (char **)v14[2];
              BOOL v45 = *v44 == (char *)v14;
              id v14 = v44;
            }
            while (!v45);
          }
          id v14 = v44;
        }
        while (v44 != &v54);
      }
    }
  }
  std::__tree<std::string>::destroy((uint64_t)&v53, v54);
}

- (OwningOpRef<mlir::ModuleOp>)optimizationPassesWithDevice:(id)a3 sourceModule:(void *)a4 compilationID:(unint64_t)a5 compilationDescriptor:(id)a6
{
}

- (void)dumpCompiledProducts
{
  uint64_t v2 = *((void *)self + 68);
  if (v2)
  {
    [*((id *)self + 69) createDirectoryAtPath:v2 withIntermediateDirectories:1 attributes:0 error:0];
    char v17 = 0;
    unint64_t v4 = (void *)*((void *)self + 68);
    unint64_t v5 = [*((id *)self + 67) lastPathComponent];
    uint64_t v6 = [v4 stringByAppendingFormat:@"/%@", v5];

    if ([*((id *)self + 69) fileExistsAtPath:v6 isDirectory:&v17])
    {
      id v7 = (void *)*((void *)self + 69);
      id v16 = 0;
      [v7 removeItemAtPath:v6 error:&v16];
      id v8 = v16;
    }
    else
    {
      id v8 = 0;
    }
    uint64_t v9 = (void *)*((void *)self + 69);
    uint64_t v10 = *((void *)self + 67);
    id v15 = v8;
    int v11 = [v9 copyItemAtPath:v10 toPath:v6 error:&v15];
    id v12 = v15;

    if (v11) {
      uint64_t v13 = @"Copying compiled products to %@";
    }
    else {
      uint64_t v13 = @"Copying compiled products failed, %@";
    }
    if (v11) {
      id v14 = v6;
    }
    else {
      id v14 = v12;
    }
    NSLog(&v13->isa, v14);
  }
}

- (void)aneRegionOpsHashSet:(void *)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)a3;
  unint64_t v4 = *(unsigned int *)(*(void *)a3 + 44);
  if ((v4 & 0x7FFFFF) == 0) {
    __assert_rtn("getRegion", "Operation.h", 666, "index < numRegions && \"invalid region index\"");
  }
  unint64_t v5 = v3 + 16 * ((v4 >> 23) & 1) + ((v4 >> 21) & 0x7F8) + 64;
  if (v5 >= 0xFFFFFFFFFFFFFFF9) {
    __assert_rtn("alignAddr", "Alignment.h", 191, "static_cast<uintptr_t>(ArithAddr + Alignment.value() - 1) >= ArithAddr && \"Overflow\"");
  }
  uint64_t v6 = (void *)(((v5 + 7) & 0xFFFFFFFFFFFFFFF8) + 32 * *(unsigned int *)(v3 + 40));
  if ((void *)*v6 == v6) {
    __assert_rtn("getBody", "OpDefinition.h", 895, "!region.empty() && \"unexpected empty region\"");
  }
  uint64_t v8 = v6[1];
  if (v8) {
    uint64_t v9 = v8 - 8;
  }
  else {
    uint64_t v9 = 0;
  }
  uint64_t v10 = (std::recursive_mutex *)((char *)self + 200);
  std::recursive_mutex::lock((std::recursive_mutex *)((char *)self + 200));
  CC_SHA256_Init(&c);
  CC_SHA256_Init(&v23);
  v21[0] = 0;
  v21[1] = 0;
  uint64_t v22 = 0;
  mlir::OpPrintingFlags::OpPrintingFlags((mlir::OpPrintingFlags *)v20);
  mlir::OpPrintingFlags::elideLargeElementsAttrs((uint64_t)v20, 0);
  mlir::OpPrintingFlags::elideLargeResourceString((uint64_t)v20, 0);
  int v11 = operator new(0x82uLL);
  id v18 = (char *)v11 + 130;
  objc_super v19 = (char *)v11 + 130;
  _OWORD *v11 = 0u;
  v11[1] = 0u;
  v11[2] = 0u;
  v11[3] = 0u;
  v11[4] = 0u;
  v11[5] = 0u;
  v11[6] = 0u;
  v11[7] = 0u;
  *((_WORD *)v11 + 64) = 0;
  unint64_t v16[2] = (void **)a3;
  std::string __p = v11;
  v16[0] = &__p;
  v16[1] = (void **)&v26;
  v15[0] = a3;
  v15[1] = v21;
  v15[2] = v20;
  v15[3] = &c;
  void v15[4] = &v23;
  v15[5] = v16;
  id v12 = *(mlir::GenericProgramPoint **)(v9 + 40);
  if (v12 != (mlir::GenericProgramPoint *)(v9 + 32))
  {
    do
    {
      uint64_t v13 = (mlir::GenericProgramPoint *)*((void *)v12 + 1);
      mlir::GenericProgramPoint::~GenericProgramPoint(v12);
      std::mutex v25 = v15;
      mlir::detail::walk<mlir::ForwardIterator>(v14, (mlir::Operation *)_ZN4llvm12function_refIFvPN4mlir9OperationEEE11callback_fnIZNS1_6detail4walkILNS1_9WalkOrderE1ENS1_15ForwardIteratorERZ42__MPSGraphExecutable_aneRegionOpsHashSet__E4__15NS1_4func6FuncOpEvEENSt3__19enable_ifIXaantsr4llvm9is_one_ofIT2_S3_PNS1_6RegionEPNS1_5BlockEEE5valuesr3std7is_sameIT3_vEE5valueESM_E4typeES3_OT1_EUlS3_E_EEvlS3_, (uint64_t)&v25, 1);
      id v12 = v13;
    }
    while (v13 != (mlir::GenericProgramPoint *)(v9 + 32));
  }
  -[MPSGraphExecutable aneRegionOpsHashSet:]::$_14::operator()(v16, &c, &v23, *(void *)a3, (uint64_t)"mps.aneRegionsSHA", 17);
  if (__p)
  {
    id v18 = __p;
    operator delete(__p);
  }
  if (SHIBYTE(v22) < 0) {
    operator delete(v21[0]);
  }
  std::recursive_mutex::unlock(v10);
}

- (void)aneRegionOpsHashSet:
{
  id v12 = *a1;
  uint64_t v13 = **a1;
  int64_t v14 = (unsigned char *)v12[1] - v13;
  if (v14 >= 1) {
    bzero(v13, v14);
  }
  CC_SHA256_Final((unsigned __int8 *)a1[1], c);
  id v15 = (char *)**a1;
  snprintf(v15, 3uLL, "%02X", *(unsigned __int8 *)a1[1]);
  snprintf(v15 + 2, 3uLL, "%02X", *((unsigned __int8 *)a1[1] + 1));
  snprintf(v15 + 4, 3uLL, "%02X", *((unsigned __int8 *)a1[1] + 2));
  snprintf(v15 + 6, 3uLL, "%02X", *((unsigned __int8 *)a1[1] + 3));
  snprintf(v15 + 8, 3uLL, "%02X", *((unsigned __int8 *)a1[1] + 4));
  snprintf(v15 + 10, 3uLL, "%02X", *((unsigned __int8 *)a1[1] + 5));
  snprintf(v15 + 12, 3uLL, "%02X", *((unsigned __int8 *)a1[1] + 6));
  snprintf(v15 + 14, 3uLL, "%02X", *((unsigned __int8 *)a1[1] + 7));
  snprintf(v15 + 16, 3uLL, "%02X", *((unsigned __int8 *)a1[1] + 8));
  snprintf(v15 + 18, 3uLL, "%02X", *((unsigned __int8 *)a1[1] + 9));
  snprintf(v15 + 20, 3uLL, "%02X", *((unsigned __int8 *)a1[1] + 10));
  snprintf(v15 + 22, 3uLL, "%02X", *((unsigned __int8 *)a1[1] + 11));
  snprintf(v15 + 24, 3uLL, "%02X", *((unsigned __int8 *)a1[1] + 12));
  snprintf(v15 + 26, 3uLL, "%02X", *((unsigned __int8 *)a1[1] + 13));
  snprintf(v15 + 28, 3uLL, "%02X", *((unsigned __int8 *)a1[1] + 14));
  snprintf(v15 + 30, 3uLL, "%02X", *((unsigned __int8 *)a1[1] + 15));
  snprintf(v15 + 32, 3uLL, "%02X", *((unsigned __int8 *)a1[1] + 16));
  snprintf(v15 + 34, 3uLL, "%02X", *((unsigned __int8 *)a1[1] + 17));
  snprintf(v15 + 36, 3uLL, "%02X", *((unsigned __int8 *)a1[1] + 18));
  snprintf(v15 + 38, 3uLL, "%02X", *((unsigned __int8 *)a1[1] + 19));
  snprintf(v15 + 40, 3uLL, "%02X", *((unsigned __int8 *)a1[1] + 20));
  snprintf(v15 + 42, 3uLL, "%02X", *((unsigned __int8 *)a1[1] + 21));
  snprintf(v15 + 44, 3uLL, "%02X", *((unsigned __int8 *)a1[1] + 22));
  snprintf(v15 + 46, 3uLL, "%02X", *((unsigned __int8 *)a1[1] + 23));
  snprintf(v15 + 48, 3uLL, "%02X", *((unsigned __int8 *)a1[1] + 24));
  snprintf(v15 + 50, 3uLL, "%02X", *((unsigned __int8 *)a1[1] + 25));
  snprintf(v15 + 52, 3uLL, "%02X", *((unsigned __int8 *)a1[1] + 26));
  snprintf(v15 + 54, 3uLL, "%02X", *((unsigned __int8 *)a1[1] + 27));
  snprintf(v15 + 56, 3uLL, "%02X", *((unsigned __int8 *)a1[1] + 28));
  snprintf(v15 + 58, 3uLL, "%02X", *((unsigned __int8 *)a1[1] + 29));
  snprintf(v15 + 60, 3uLL, "%02X", *((unsigned __int8 *)a1[1] + 30));
  snprintf(v15 + 62, 3uLL, "%02X", *((unsigned __int8 *)a1[1] + 31));
  v15[64] = 95;
  CC_SHA256_Final((unsigned __int8 *)a1[1], a3);
  snprintf(v15 + 65, 3uLL, "%02X", *(unsigned __int8 *)a1[1]);
  snprintf(v15 + 67, 3uLL, "%02X", *((unsigned __int8 *)a1[1] + 1));
  snprintf(v15 + 69, 3uLL, "%02X", *((unsigned __int8 *)a1[1] + 2));
  snprintf(v15 + 71, 3uLL, "%02X", *((unsigned __int8 *)a1[1] + 3));
  snprintf(v15 + 73, 3uLL, "%02X", *((unsigned __int8 *)a1[1] + 4));
  snprintf(v15 + 75, 3uLL, "%02X", *((unsigned __int8 *)a1[1] + 5));
  snprintf(v15 + 77, 3uLL, "%02X", *((unsigned __int8 *)a1[1] + 6));
  snprintf(v15 + 79, 3uLL, "%02X", *((unsigned __int8 *)a1[1] + 7));
  snprintf(v15 + 81, 3uLL, "%02X", *((unsigned __int8 *)a1[1] + 8));
  snprintf(v15 + 83, 3uLL, "%02X", *((unsigned __int8 *)a1[1] + 9));
  snprintf(v15 + 85, 3uLL, "%02X", *((unsigned __int8 *)a1[1] + 10));
  snprintf(v15 + 87, 3uLL, "%02X", *((unsigned __int8 *)a1[1] + 11));
  snprintf(v15 + 89, 3uLL, "%02X", *((unsigned __int8 *)a1[1] + 12));
  snprintf(v15 + 91, 3uLL, "%02X", *((unsigned __int8 *)a1[1] + 13));
  snprintf(v15 + 93, 3uLL, "%02X", *((unsigned __int8 *)a1[1] + 14));
  snprintf(v15 + 95, 3uLL, "%02X", *((unsigned __int8 *)a1[1] + 15));
  snprintf(v15 + 97, 3uLL, "%02X", *((unsigned __int8 *)a1[1] + 16));
  snprintf(v15 + 99, 3uLL, "%02X", *((unsigned __int8 *)a1[1] + 17));
  snprintf(v15 + 101, 3uLL, "%02X", *((unsigned __int8 *)a1[1] + 18));
  snprintf(v15 + 103, 3uLL, "%02X", *((unsigned __int8 *)a1[1] + 19));
  snprintf(v15 + 105, 3uLL, "%02X", *((unsigned __int8 *)a1[1] + 20));
  snprintf(v15 + 107, 3uLL, "%02X", *((unsigned __int8 *)a1[1] + 21));
  snprintf(v15 + 109, 3uLL, "%02X", *((unsigned __int8 *)a1[1] + 22));
  snprintf(v15 + 111, 3uLL, "%02X", *((unsigned __int8 *)a1[1] + 23));
  snprintf(v15 + 113, 3uLL, "%02X", *((unsigned __int8 *)a1[1] + 24));
  snprintf(v15 + 115, 3uLL, "%02X", *((unsigned __int8 *)a1[1] + 25));
  snprintf(v15 + 117, 3uLL, "%02X", *((unsigned __int8 *)a1[1] + 26));
  snprintf(v15 + 119, 3uLL, "%02X", *((unsigned __int8 *)a1[1] + 27));
  snprintf(v15 + 121, 3uLL, "%02X", *((unsigned __int8 *)a1[1] + 28));
  snprintf(v15 + 123, 3uLL, "%02X", *((unsigned __int8 *)a1[1] + 29));
  snprintf(v15 + 125, 3uLL, "%02X", *((unsigned __int8 *)a1[1] + 30));
  snprintf(v15 + 127, 3uLL, "%02X", *((unsigned __int8 *)a1[1] + 31));
  Context = (mlir::StringAttr *)mlir::Attribute::getContext((mlir::Attribute *)((char *)*a1[2] + 24));
  char v17 = 1;
  char v23 = 1;
  if (*v15)
  {
    uint64_t v21 = v15;
    char v17 = 3;
  }
  char v22 = v17;
  uint64_t v18 = mlir::StringAttr::get(Context, (mlir::MLIRContext *)&v21);
  objc_super v19 = (mlir::StringAttr *)mlir::Attribute::getContext((mlir::Attribute *)(a4 + 24));
  __int16 v25 = 261;
  v24[0] = a5;
  v24[1] = a6;
  uint64_t v20 = mlir::StringAttr::get(v19, (mlir::MLIRContext *)v24);
  mlir::Operation::setAttr(a4, v20, v18);
}

- (id)emitViewerSPI
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (std::recursive_mutex *)((char *)self + 264);
  std::recursive_mutex::lock((std::recursive_mutex *)((char *)self + 264));
  id WeakRetained = objc_loadWeakRetained((id *)self + 1);
  uint64_t v6 = LazyLoadableModuleRef::get((LazyLoadableModuleRef *)((char *)self + 40), v5);
  EmitViewerSPI::EmitViewerSPI((uint64_t)v9, WeakRetained, self, v6);

  id v7 = EmitViewerSPI::emitGraph((EmitViewerSPI *)v9);
  EmitViewerSPI::~EmitViewerSPI((EmitViewerSPI *)v9);
  std::recursive_mutex::unlock(v3);

  return v7;
}

- (id)emitViewerSPIWithDevice:(id)a3 inputShapes:(id)a4 compilationDescriptor:(id)a5
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = [(MPSGraphExecutable *)self specializedModuleWithDevice:a3 inputShapes:a4 compilationDescriptor:a5 fallingBack:0 fallbackRuntimeKey:0];
  std::recursive_mutex::lock((std::recursive_mutex *)((char *)self + 200));
  id WeakRetained = objc_loadWeakRetained((id *)self + 1);
  EmitViewerSPI::EmitViewerSPI((uint64_t)v10, WeakRetained, self, v6);

  uint64_t v8 = EmitViewerSPI::emitGraph((EmitViewerSPI *)v10);
  EmitViewerSPI::~EmitViewerSPI((EmitViewerSPI *)v10);
  std::recursive_mutex::unlock((std::recursive_mutex *)((char *)self + 200));

  return v8;
}

- (void)emitViewerSPIToURL:(id)a3
{
  v9[34] = *(id *)MEMORY[0x1E4F143B8];
  id v4 = a3;
  std::recursive_mutex::lock((std::recursive_mutex *)((char *)self + 264));
  id WeakRetained = objc_loadWeakRetained((id *)self + 1);
  id v7 = LazyLoadableModuleRef::get((LazyLoadableModuleRef *)((char *)self + 40), v6);
  EmitViewerSPI::EmitViewerSPI((uint64_t)v9, WeakRetained, self, v7);

  if (v4)
  {
    uint64_t v8 = [v4 path];
    EmitViewerSPI::emitJSONDump(v9, v8);
  }
  EmitViewerSPI::~EmitViewerSPI((EmitViewerSPI *)v9);
  std::recursive_mutex::unlock((std::recursive_mutex *)((char *)self + 264));
}

- (id)emitObjCToURL:(id)a3 test:(BOOL)a4
{
  BOOL v4 = a4;
  v17[40] = *(id *)MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (std::recursive_mutex *)((char *)self + 264);
  std::recursive_mutex::lock((std::recursive_mutex *)((char *)self + 264));
  id WeakRetained = objc_loadWeakRetained((id *)self + 1);
  uint64_t v10 = LazyLoadableModuleRef::get((LazyLoadableModuleRef *)((char *)self + 40), v9);
  __int16 v14 = 256;
  id v15 = @"getMPSGraphExecutable";
  int v16 = 65537;
  EmitObjC::EmitObjC((uint64_t)v17, WeakRetained, self, v10, (uint64_t)&v14);

  if (v6)
  {
    uint64_t v11 = [v6 path];
    EmitObjC::emitObjCDump(v17, v11);
  }
  if (v4)
  {
    id v12 = EmitObjC::runEmitObjCCompile((EmitObjC *)v17, 0, 0);
  }
  else
  {
    id v12 = 0;
  }
  EmitObjC::~EmitObjC(v17);
  std::recursive_mutex::unlock(v7);

  return v12;
}

- (void)emitObjUnitTestToUrl:(id)a3
{
  v17[40] = *(id *)MEMORY[0x1E4F143B8];
  id v4 = a3;
  unint64_t v5 = [v4 path];
  id v6 = [v5 lastPathComponent];
  id v7 = [v6 stringByDeletingPathExtension];

  uint64_t v8 = [NSString stringWithFormat:@"test_%@_buildExecutable", v7];
  std::recursive_mutex::lock((std::recursive_mutex *)((char *)self + 264));
  id WeakRetained = objc_loadWeakRetained((id *)self + 1);
  uint64_t v11 = LazyLoadableModuleRef::get((LazyLoadableModuleRef *)((char *)self + 40), v10);
  __int16 v13 = 0;
  id v12 = v8;
  id v14 = v12;
  int v15 = 16777472;
  EmitObjC::EmitObjC((uint64_t)v17, WeakRetained, self, v11, (uint64_t)&v13);

  uint64_t v16 = 0;
  [v17[27] writeToFile:v5 atomically:1 encoding:4 error:&v16];
  EmitObjC::~EmitObjC(v17);
  std::recursive_mutex::unlock((std::recursive_mutex *)((char *)self + 264));
}

- (void)dealloc
{
  char v10 = 0;
  if (![*((id *)self + 69) fileExistsAtPath:*((void *)self + 67) isDirectory:&v10])
  {
    id v5 = 0;
    uint64_t v6 = *((void *)self + 4);
    if (!v6) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  uint64_t v3 = (void *)*((void *)self + 69);
  uint64_t v4 = *((void *)self + 67);
  id v9 = 0;
  [v3 removeItemAtPath:v4 error:&v9];
  id v5 = v9;
  uint64_t v6 = *((void *)self + 4);
  if (v6) {
LABEL_5:
  }
    MEMORY[0x1852FDE70](v6, 0x20C40DC1BFBCFLL);
LABEL_6:
  id v7 = (MPSSymbolTable *)*((void *)self + 11);
  if (v7)
  {
    MPSSymbolTable::~MPSSymbolTable(v7);
    MEMORY[0x1852FDE70]();
  }

  v8.receiver = self;
  v8.super_class = (Class)MPSGraphExecutable;
  [(MPSGraphExecutable *)&v8 dealloc];
}

- (void)dump
{
  uint64_t v2 = self;
  uint64_t v3 = (std::recursive_mutex *)((char *)self + 264);
  std::recursive_mutex::lock((std::recursive_mutex *)((char *)self + 264));
  uint64_t v2 = (MPSGraphExecutable *)((char *)v2 + 40);
  LazyLoadableModuleRef::get((LazyLoadableModuleRef *)v2, v4);
  mlir::Operation::dump(*((mlir::Operation **)v2 + 2));

  std::recursive_mutex::unlock(v3);
}

- (id)getIR
{
  v19[0] = 0;
  v19[1] = 0;
  uint64_t v20 = 0;
  int v11 = 0;
  char v15 = 0;
  uint64_t v16 = 0;
  int v17 = 1;
  uint64_t v13 = 0;
  uint64_t v14 = 0;
  uint64_t v12 = 0;
  char v10 = &unk_1EC9A38B8;
  uint64_t v18 = v19;
  llvm::raw_ostream::SetBufferAndMode((uint64_t)&v10, 0, 0, 0);
  uint64_t v3 = (std::recursive_mutex *)((char *)self + 264);
  std::recursive_mutex::lock((std::recursive_mutex *)((char *)self + 264));
  self = (MPSGraphExecutable *)((char *)self + 40);
  LazyLoadableModuleRef::get((LazyLoadableModuleRef *)self, v4);
  mlir::OpPrintingFlags::OpPrintingFlags((mlir::OpPrintingFlags *)v9);
  mlir::Operation::print(*((mlir::Operation **)self + 2), (llvm::raw_ostream *)&v10, (const mlir::OpPrintingFlags *)v9);
  id v5 = v18;
  if (*((char *)v18 + 23) < 0) {
    id v5 = *v18;
  }
  uint64_t v6 = objc_msgSend(NSString, "stringWithFormat:", @"%s", v5);
  std::recursive_mutex::unlock(v3);
  llvm::raw_ostream::~raw_ostream((llvm::raw_ostream *)&v10);
  if (SHIBYTE(v20) < 0)
  {
    operator delete(v19[0]);
    id v7 = (void *)v6;
  }
  else
  {
    id v7 = (void *)v6;
  }
  return v7;
}

- (id)createMLIRLibraryWithMPSGraphPackage:(id)a3 packageKey:(id)a4 appendOptimizedModules:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  id v57 = a3;
  id v53 = a4;
  [v57 getMLIRLibrary];
  uint64_t v64 = 0;
  id v65 = (id)objc_claimAutoreleasedReturnValue();
  id v7 = (NSString *)v53;
  MPSGraphOperatingSystemVersion::MPSGraphOperatingSystemVersion(&v71, v7);
  if (v71.var0 < 4 || v71.var0 == 4 && !v71.var1 && v71.var2 <= 20)
  {
    *(_OWORD *)&v71.var0 = xmmword_1811306C0;
    v71.var2 = 21;
  }
  MPSGraphOperatingSystemVersion::MPSGraphOperatingSystemVersion(&v66, v7);
  if (v66.var0 >= 4)
  {
    if (v66.var0 == 4)
    {
      BOOL v9 = v66.var2 >= 0;
      if (v66.var1 != 4) {
        BOOL v9 = 1;
      }
      uint64_t v8 = v66.var1 >= 4 && v9;
    }
    else
    {
      uint64_t v8 = 1;
    }
  }
  else
  {
    uint64_t v8 = 0;
  }
  uint64_t v54 = v7;

  uint64_t v64 = v8;
  unint64_t v10 = 0x1E4F1C000uLL;
  id v63 = (id)objc_opt_new();
  v66.var0 = (int64_t)&v64;
  v66.int var1 = (int64_t)&v63;
  v66.var2 = (int64_t)&v65;
  std::recursive_mutex::lock((std::recursive_mutex *)((char *)self + 264));
  if (([v65 originalFileExists] & 1) == 0)
  {
    [(MPSGraphExecutable *)self optimizeOriginalModule];
    int v11 = [v57 createFileHandle];
    uint64_t v13 = LazyLoadableModuleRef::get((LazyLoadableModuleRef *)((char *)self + 40), v12);
    objc_msgSend(v57, "createVersionedBytecodeFromMlirModule:packageKey:fileHandle:resourceStorageMode:downgradedModuleCallback:", v13, v54, v11, v64, llvm::function_ref<void ()(mlir::mps::serialization::ModuleOp)>::callback_fn<-[MPSGraphExecutable createMLIRLibraryWithMPSGraphPackage:packageKey:appendOptimizedModules:]::$_16>, &v66);
    [v65 addOriginalMLIRFile:v11];
  }
  std::recursive_mutex::unlock((std::recursive_mutex *)((char *)self + 264));
  if (v5)
  {
    uint64_t v14 = *((void *)self + 17);
    unsigned int v15 = *((_DWORD *)self + 38);
    if (*((_DWORD *)self + 36))
    {
      v71.var0 = *((void *)self + 17);
      v71.int var1 = v14 + 104 * v15;
      llvm::DenseMapIterator<MPSGraphModuleKey,std::unique_ptr<LazyLoadableModuleRef>,MPSGraphModuleKeyInfo,llvm::detail::DenseMapPair<MPSGraphModuleKey,std::unique_ptr<LazyLoadableModuleRef>>,false>::AdvancePastEmptyBuckets(&v71.var0);
      int64x2_t v16 = *(int64x2_t *)&v71.var0;
      uint64_t v14 = *((void *)self + 17);
      unsigned int v15 = *((_DWORD *)self + 38);
    }
    else
    {
      int64x2_t v16 = vdupq_n_s64(v14 + 104 * (unint64_t)v15);
    }
    *(int64x2_t *)uint64_t v62 = v16;
    int v17 = (MPSGraphModuleKey *)(v14 + 104 * v15);
    uint64_t v55 = v17;
    while (1)
    {
      uint64_t v18 = v62[0];
      if (v62[0] == v17) {
        break;
      }
      if (v62[0] == v62[1]) {
        __assert_rtn("operator*", "DenseMap.h", 1263, "Ptr != End && \"dereferencing end() iterator\"");
      }
      objc_super v19 = MPSGraphModuleKeyToJSONString(v62[0]);
      if (([v65 optimizedFileExistsWithSignature:v19] & 1) == 0)
      {
        uint64_t v20 = [v57 createFileHandle];
        char v22 = LazyLoadableModuleRef::get(*((LazyLoadableModuleRef **)v18 + 12), v21);
        [v57 createBytecodeFromMlirModule:v22 fileHandle:v20 resourceStorageMode:v64];
        [v65 addOptimizedMLIRFile:v20 withSignature:v19];
        if (v64 == 1)
        {
          uint64_t v69 = LazyLoadableModuleRef::get(*((LazyLoadableModuleRef **)v18 + 12), v23);
          id v24 = (id)objc_opt_new();
          id v68 = v24;
          unint64_t Body = mlir::anec::A11Legacy::getBody((mlir::anec::A11Legacy *)&v69);
          uint64_t v67 = &v68;
          uint64_t v26 = *(void *)(Body + 8);
          if (v26 != Body)
          {
            unint64_t v27 = v10;
            do
            {
              uint64_t v28 = v26 - 8;
              if (!v26) {
                uint64_t v28 = 0;
              }
              uint64_t v29 = (mlir::GenericProgramPoint *)(v28 + 32);
              uint64_t v30 = *(mlir::GenericProgramPoint **)(v28 + 40);
              if (v30 != (mlir::GenericProgramPoint *)(v28 + 32))
              {
                do
                {
                  unint64_t v31 = (mlir::GenericProgramPoint *)*((void *)v30 + 1);
                  mlir::GenericProgramPoint::~GenericProgramPoint(v30);
                  v71.var0 = (int64_t)&v67;
                  mlir::detail::walk<mlir::ForwardIterator>(v32, (mlir::Operation *)_ZN4llvm12function_refIFvPN4mlir9OperationEEE11callback_fnIZNS1_6detail4walkILNS1_9WalkOrderE1ENS1_15ForwardIteratorERZ32getConstantResourcesUsedInModuleINS1_8ModuleOpEEP7NSArrayIP8NSStringET_EUlNS1_3mps10ConstantOpEE_SK_vEENSt3__19enable_ifIXaantsr4llvm9is_one_ofIT2_S3_PNS1_6RegionEPNS1_5BlockEEE5valuesr3std7is_sameIT3_vEE5valueESU_E4typeES3_OT1_EUlS3_E_EEvlS3_, (uint64_t)&v71, 1);
                  uint64_t v30 = v31;
                }
                while (v31 != v29);
              }
              uint64_t v26 = *(void *)(v26 + 8);
            }
            while (v26 != Body);
            id v24 = v68;
            unint64_t v10 = v27;
            int v17 = v55;
          }
          uint64_t v33 = [v24 allObjects];

          [v63 addObjectsFromArray:v33];
          [v65 addOptimizedResourcesUsed:v33 withSignature:v19];
        }
      }

      v62[0] = (MPSGraphModuleKey *)((char *)v18 + 104);
      llvm::DenseMapIterator<MPSGraphModuleKey,std::unique_ptr<LazyLoadableModuleRef>,MPSGraphModuleKeyInfo,llvm::detail::DenseMapPair<MPSGraphModuleKey,std::unique_ptr<LazyLoadableModuleRef>>,false>::AdvancePastEmptyBuckets((uint64_t *)v62);
    }
  }
  [v65 setCallablesDescription:*((void *)self + 13)];
  [v65 setResourceStorageMode:v64];
  if ([v63 count])
  {
    uint64_t Manager = mlir::mps::MPSResourceBlobManagerInterface::getManager(*((mlir::mps::MPSResourceBlobManagerInterface **)self + 2), v34);
    unint64_t v36 = [v65 getResourceOffsetsLibrary];
    v71.var0 = (int64_t)&v71.var2;
    v71.int var1 = 0xA00000000;
    long long v58 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    id v37 = v63;
    uint64_t v38 = [v37 countByEnumeratingWithState:&v58 objects:v70 count:16];
    if (v38)
    {
      uint64_t v39 = *(void *)v59;
      do
      {
        for (uint64_t i = 0; i != v38; ++i)
        {
          if (*(void *)v59 != v39) {
            objc_enumerationMutation(v37);
          }
          uint64_t v41 = *(void **)(*((void *)&v58 + 1) + 8 * i);
          uint64_t v42 = [v36 objectForKeyedSubscript:v41];
          BOOL v43 = v42 == 0;

          if (v43)
          {
            int v44 = (const char *)[v41 UTF8String];
            BOOL v45 = (int8x16_t *)v44;
            if (v44) {
              int v46 = (const unsigned __int8 *)strlen(v44);
            }
            else {
              int v46 = 0;
            }
            uint64_t v47 = mlir::mps::MPSResourceBlobManagerInterface::lookup(Manager, v45, v46);
            uint64_t v48 = v47;
            if ((!v47 || !*(unsigned char *)(v47 + 96)) && MTLReportFailureTypeEnabled()) {
              MTLReportFailure();
            }
            if (LODWORD(v71.var1) >= (unint64_t)HIDWORD(v71.var1))
            {
              llvm::SmallVectorBase<unsigned int>::grow_pod((uint64_t)&v71, &v71.var2, LODWORD(v71.var1) + 1, 8);
              *(void *)(v71.var0 + 8 * LODWORD(v71.var1)) = v48;
              int var1 = v71.var1;
              if (LODWORD(v71.var1) >= HIDWORD(v71.var1)) {
LABEL_65:
              }
                __assert_rtn("set_size", "SmallVector.h", 102, "N <= capacity()");
            }
            else
            {
              *(void *)(v71.var0 + 8 * LODWORD(v71.var1)) = v48;
              int var1 = v71.var1;
              if (LODWORD(v71.var1) >= HIDWORD(v71.var1)) {
                goto LABEL_65;
              }
            }
            LODWORD(v71.var1) = var1 + 1;
          }
        }
        uint64_t v38 = [v37 countByEnumeratingWithState:&v58 objects:v70 count:16];
      }
      while (v38);
    }

    unint64_t v50 = objc_msgSend(v57, "writeResources:", v71.var0, LODWORD(v71.var1));
    [v36 addEntriesFromDictionary:v50];

    if ((int64_t *)v71.var0 != &v71.var2) {
      free((void *)v71.var0);
    }
  }
  id v51 = v65;

  return v51;
}

- (void)serializeToMPSGraphPackageAtURL:(NSURL *)url descriptor:(MPSGraphExecutableSerializationDescriptor *)descriptor
{
  uint64_t v38 = url;
  uint64_t v6 = descriptor;
  if (v6)
  {
    id v7 = v6;
  }
  else
  {
    id v7 = objc_alloc_init(MPSGraphExecutableSerializationDescriptor);
    if (!v7)
    {
      long long v44 = 0u;
      long long v45 = 0u;
      goto LABEL_5;
    }
  }
  [(MPSGraphExecutableSerializationDescriptor *)v7 getUserSetMinimumDeploymentTarget];
LABEL_5:
  v43[0] = v44;
  v43[1] = v45;
  +[MPSGraphExecutableSerializationDescriptor validateMinimumDeploymentTargetVersion:v43 forPlatform:[(MPSGraphExecutableSerializationDescriptor *)v7 deploymentPlatform]];
  uint64_t v8 = (void *)*((void *)self + 69);
  id v42 = 0;
  BOOL v9 = [v8 URLForDirectory:99 inDomain:1 appropriateForURL:v38 create:0 error:&v42];
  id v10 = v42;
  id v37 = v9;
  if (!v9 && MTLReportFailureTypeEnabled())
  {
    uint64_t v26 = [(NSURL *)v38 absoluteString];
    unint64_t v27 = [v10 localizedFailureReason];
    unint64_t v31 = [v10 description];
    uint64_t v32 = [v10 code];
    uint64_t v28 = v26;
    uint64_t v30 = v27;
    MTLReportFailure();
  }
  int v11 = objc_msgSend(v9, "URLByAppendingPathComponent:", @"temporary.mpsgraphpackage", v28, v30, v31, v32);
  uint64_t v12 = [[MPSGraphPackage alloc] initWithPackageURL:v38 temporaryPackageURL:v11 append:[(MPSGraphExecutableSerializationDescriptor *)v7 append]];
  __lk.__m_ = (std::unique_lock<std::mutex>::mutex_type *)((char *)self + 336);
  __lk.__owns_ = 1;
  std::mutex::lock((std::mutex *)((char *)self + 336));
  while (atomic_load((unsigned int *)self + 112))
    std::condition_variable::wait((std::condition_variable *)((char *)self + 400), &__lk);
  if (__lk.__owns_) {
    std::mutex::unlock(__lk.__m_);
  }
  uint64_t v15 = [(MPSGraphExecutableSerializationDescriptor *)v7 deploymentPlatform];
  v40[0] = v44;
  v40[1] = v45;
  int64x2_t v16 = [(MPSGraphPackage *)v12 getPackageKeyForPlatform:v15 andMinimumDeploymentTarget:v40];
  uint64_t v17 = [(MPSGraphExecutableSerializationDescriptor *)v7 deploymentPlatform];
  active_platforunint64_t m = dyld_get_active_platform();
  uint64_t v19 = active_platform;
  if (active_platform != 1)
  {
    if ((active_platform & 0xFFFFFFFB) == 2)
    {
      uint64_t v20 = 1;
      goto LABEL_21;
    }
    if (active_platform == 3)
    {
      uint64_t v20 = 2;
      goto LABEL_21;
    }
    if (active_platform == 11)
    {
      uint64_t v20 = 3;
      goto LABEL_21;
    }
    if (MTLReportFailureTypeEnabled())
    {
      uint64_t v29 = v19;
      MTLReportFailure();
      uint64_t v20 = 0;
      goto LABEL_21;
    }
  }
  uint64_t v20 = 0;
LABEL_21:
  uint64_t v21 = -[MPSGraphExecutable createMLIRLibraryWithMPSGraphPackage:packageKey:appendOptimizedModules:](self, "createMLIRLibraryWithMPSGraphPackage:packageKey:appendOptimizedModules:", v12, v16, v17 == v20, v29);
  [(MPSGraphPackage *)v12 setMLIRLibrary:v21 withPackageKey:v16];
  char v22 = [(MPSGraphPackage *)v12 getPlistData];
  uint64_t v23 = [v11 URLByAppendingPathComponent:@"manifest.plist"];
  [v22 writeToURL:v23 atomically:1];

  id v24 = (void *)*((void *)self + 69);
  id v39 = 0;
  LOBYTE(v23) = [v24 moveItemAtURL:v11 toURL:v38 error:&v39];
  id v25 = v39;
  if ((v23 & 1) == 0 && MTLReportFailureTypeEnabled())
  {
    unint64_t v36 = [(NSURL *)v38 absoluteString];
    uint64_t v35 = [v11 absoluteString];
    uint64_t v34 = [v25 localizedFailureReason];
    uint64_t v33 = [v25 description];
    [v25 code];
    MTLReportFailure();
  }
}

- (id)debugDescription
{
  uint64_t v3 = mlir::OpPrintingFlags::OpPrintingFlags((mlir::OpPrintingFlags *)v26);
  mlir::OpPrintingFlags::elideLargeElementsAttrs(v3, 256);
  mlir::OpPrintingFlags::elideLargeResourceString((uint64_t)v26, 0);
  mlir::OpPrintingFlags::enableDebugInfo((uint64_t)v26, 1, 0);
  v24[0] = 0;
  v24[1] = 0;
  uint64_t v25 = 0;
  int v16 = 0;
  char v20 = 0;
  uint64_t v21 = 0;
  int v22 = 1;
  uint64_t v18 = 0;
  uint64_t v19 = 0;
  uint64_t v17 = 0;
  uint64_t v15 = &unk_1EC9A38B8;
  uint64_t v23 = v24;
  llvm::raw_ostream::SetBufferAndMode((uint64_t)&v15, 0, 0, 0);
  uint64_t v4 = (std::recursive_mutex *)((char *)self + 264);
  std::recursive_mutex::lock((std::recursive_mutex *)((char *)self + 264));
  LazyLoadableModuleRef::get((LazyLoadableModuleRef *)((char *)self + 40), v5);
  v13[0] = v26[0];
  v13[1] = v26[1];
  uint64_t v14 = v27;
  mlir::Operation::print(*((mlir::Operation **)self + 7), (llvm::raw_ostream *)&v15, (const mlir::OpPrintingFlags *)v13);
  uint64_t v6 = NSString;
  v12.receiver = self;
  v12.super_class = (Class)MPSGraphExecutable;
  uint64_t v7 = [(MPSGraphExecutable *)&v12 debugDescription];
  uint64_t v8 = (void *)v7;
  BOOL v9 = v23;
  if (*((char *)v23 + 23) < 0) {
    BOOL v9 = *v23;
  }
  id v10 = [v6 stringWithFormat:@"%@ : \n\nIR: %s \n\n", v7, v9];

  std::recursive_mutex::unlock(v4);
  llvm::raw_ostream::~raw_ostream((llvm::raw_ostream *)&v15);
  if (SHIBYTE(v25) < 0) {
    operator delete(v24[0]);
  }

  return v10;
}

- (id)getInputShapes
{
  uint64_t v3 = (std::recursive_mutex *)((char *)self + 264);
  std::recursive_mutex::lock((std::recursive_mutex *)((char *)self + 264));
  v4.var0 = (Operation *)[(MPSGraphExecutable *)self getEntryFuncOp];
  if (!v4.var0) {
    __assert_rtn("-[MPSGraphExecutable getInputShapes]", "MPSGraphExecutable.mm", 3389, "funcOp");
  }
  BOOL v5 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
  unint64_t v6 = *((unsigned int *)v4.var0 + 11);
  if ((v6 & 0x7FFFFF) == 0)
  {
    uint64_t v19 = "index < numRegions && \"invalid region index\"";
    int v20 = 666;
    uint64_t v21 = "Operation.h";
    int v22 = "getRegion";
    goto LABEL_17;
  }
  unint64_t v7 = (unint64_t)v4.var0 + 16 * ((v6 >> 23) & 1) + ((v6 >> 21) & 0x7F8) + 64;
  if (v7 >= 0xFFFFFFFFFFFFFFF9)
  {
    uint64_t v19 = "static_cast<uintptr_t>(ArithAddr + Alignment.value() - 1) >= ArithAddr && \"Overflow\"";
    int v20 = 191;
    uint64_t v21 = "Alignment.h";
    int v22 = "alignAddr";
LABEL_17:
    __assert_rtn(v22, v21, v20, v19);
  }
  uint64_t v8 = (void *)(((v7 + 7) & 0xFFFFFFFFFFFFFFF8) + 32 * *((unsigned int *)v4.var0 + 10));
  if ((void *)*v8 != v8)
  {
    uint64_t v9 = v8[1];
    uint64_t v10 = v9 ? v9 - 8 : 0;
    int v11 = *(uint64_t **)(v10 + 48);
    uint64_t v12 = *(void *)(v10 + 56) - (void)v11;
    if (v12)
    {
      uint64_t v13 = 8 * (v12 >> 3);
      do
      {
        uint64_t v14 = *v11;
        uint64_t v15 = [MPSGraphShapedType alloc];
        int v16 = getMPSShapeFromMLIR((uint64_t **)(*(void *)(v14 + 8) & 0xFFFFFFFFFFFFFFF8));
        uint64_t v17 = [(MPSGraphShapedType *)v15 initWithShape:v16 dataType:getMPSDataType((void *)(*(void *)(v14 + 8) & 0xFFFFFFFFFFFFFFF8))];
        [v5 addObject:v17];

        ++v11;
        v13 -= 8;
      }
      while (v13);
    }
  }
  std::recursive_mutex::unlock(v3);

  return v5;
}

- (id)getOutputShapes
{
  uint64_t v3 = (std::recursive_mutex *)((char *)self + 264);
  std::recursive_mutex::lock((std::recursive_mutex *)((char *)self + 264));
  v15.var0 = (Operation *)[(MPSGraphExecutable *)self getEntryFuncOp];
  if (!v15.var0) {
    __assert_rtn("-[MPSGraphExecutable getOutputShapes]", "MPSGraphExecutable.mm", 3401, "funcOp");
  }
  FuncOp v4 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
  uint64_t FunctionType = mlir::func::FuncOp::getFunctionType((mlir::func::FuncOp *)&v15);
  uint64_t Results = mlir::FunctionType::getResults((mlir::FunctionType *)&FunctionType);
  if (v6)
  {
    unint64_t v7 = (uint64_t ***)Results;
    uint64_t v8 = 8 * v6;
    do
    {
      uint64_t v9 = *v7;
      uint64_t v10 = [MPSGraphShapedType alloc];
      int v11 = getMPSShapeFromMLIR(v9);
      uint64_t v12 = [(MPSGraphShapedType *)v10 initWithShape:v11 dataType:getMPSDataType(v9)];
      [v4 addObject:v12];

      ++v7;
      v8 -= 8;
    }
    while (v8);
  }
  std::recursive_mutex::unlock(v3);

  return v4;
}

- (id)getTargetShapesForDevice:(id)a3 inputsArray:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8.var0 = (Operation *)[(MPSGraphExecutable *)self returnOpForFunctionInModule:[(MPSGraphExecutable *)self specializeWithDevice:v6 inputsArray:v7 compilationDescriptor:0]];
  if ((*((unsigned char *)v8.var0 + 46) & 0x80) != 0) {
    uint64_t v9 = *((unsigned int *)v8.var0 + 17);
  }
  else {
    uint64_t v9 = 0;
  }
  uint64_t v10 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v9];
  if ((*((unsigned char *)v8.var0 + 46) & 0x80) != 0)
  {
    uint64_t v11 = -1;
    uint64_t v12 = 24;
    do
    {
      if (++v11 >= (unint64_t)*((unsigned int *)v8.var0 + 17)) {
        break;
      }
      uint64_t v13 = getMPSGraphShapedType((uint64_t **)(*(void *)(*(void *)(*((void *)v8.var0 + 9) + v12) + 8) & 0xFFFFFFFFFFFFFFF8));
      [v10 addObject:v13];
      v12 += 32;
    }
    while ((*((unsigned char *)v8.var0 + 46) & 0x80) != 0);
  }

  return v10;
}

- (id)getTensorDataArraysWithDevice:(id)a3 feedsDictionary:(id)a4 resultsDictionary:(id)a5 inputsArray:(id)a6 resultsArray:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  uint64_t v17 = (void *)*((void *)self + 59);
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __111__MPSGraphExecutable_getTensorDataArraysWithDevice_feedsDictionary_resultsDictionary_inputsArray_resultsArray___block_invoke;
  v36[3] = &unk_1E4FC1580;
  id v18 = v15;
  id v37 = v18;
  id v38 = v13;
  id v32 = v38;
  [v17 enumerateObjectsUsingBlock:v36];
  if (v14)
  {
    id v19 = v14;
  }
  else
  {
    id v31 = v12;
    int v20 = [(MPSGraphExecutable *)self allocateTensorDataTargetsForDevice:v12 inputsArray:v18];
    uint64_t v21 = [MEMORY[0x1E4F1CA60] dictionary];
    for (unint64_t i = 0; [*((id *)self + 57) count] > i; ++i)
    {
      uint64_t v23 = [v20 objectAtIndexedSubscript:i];
      id v24 = [*((id *)self + 57) objectAtIndexedSubscript:i];
      [v21 setObject:v23 forKey:v24];
    }
    id v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithDictionary:v21];

    id v12 = v31;
  }
  uint64_t v25 = (void *)*((void *)self + 57);
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __111__MPSGraphExecutable_getTensorDataArraysWithDevice_feedsDictionary_resultsDictionary_inputsArray_resultsArray___block_invoke_2;
  v33[3] = &unk_1E4FC1580;
  id v26 = v16;
  id v34 = v26;
  id v27 = v19;
  id v35 = v27;
  [v25 enumerateObjectsUsingBlock:v33];
  uint64_t v28 = v35;
  id v29 = v27;

  return v29;
}

void __111__MPSGraphExecutable_getTensorDataArraysWithDevice_feedsDictionary_resultsDictionary_inputsArray_resultsArray___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) objectForKeyedSubscript:a2];
  objc_msgSend(v2, "addObject:");
}

void __111__MPSGraphExecutable_getTensorDataArraysWithDevice_feedsDictionary_resultsDictionary_inputsArray_resultsArray___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) objectForKeyedSubscript:a2];
  objc_msgSend(v2, "addObject:");
}

- (id)runWithMTLCommandQueue:(id)a3 inputsArray:(id)a4 resultsArray:(id)a5
{
  BOOL v5 = [(MPSGraphExecutable *)self runWithMTLCommandQueue:a3 inputsArray:a4 resultsArray:a5 executionDescriptor:0];

  return v5;
}

- (id)runWithDevice:(id)a3 inputsArray:(id)a4 resultsArray:(id)a5 executionDescriptor:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = v13;
  if (v13) {
    id v15 = v13;
  }
  else {
    id v15 = (id)objc_opt_new();
  }
  id v16 = v15;
  [v15 setWaitUntilCompleted:1];
  uint64_t v17 = [(MPSGraphExecutable *)self runAsyncWithDevice:v10 inputsArray:v11 resultsArray:v12 executionDescriptor:v16];

  return v17;
}

- (id)runAsyncWithDevice:(id)a3 inputsArray:(id)a4 resultsArray:(id)a5 executionDescriptor:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = (void *)MEMORY[0x1852FE5D0]();
  if (!v13) {
    id v13 = (id)objc_opt_new();
  }
  id v15 = [(MPSGraphExecutable *)self runInternalWithDevice:v10 commandBuffer:0 feeds:v11 results:v12 executableExecutionDescriptor:v13 mpsGraphOwnedCommandBuffer:1];

  return v15;
}

- (NSArray)runWithMTLCommandQueue:(id)commandQueue inputsArray:(NSArray *)inputsArray resultsArray:(NSArray *)resultsArray executionDescriptor:(MPSGraphExecutableExecutionDescriptor *)executionDescriptor
{
  id v10 = commandQueue;
  id v11 = inputsArray;
  id v12 = resultsArray;
  id v13 = executionDescriptor;
  id v14 = v13;
  if (v13) {
    id v15 = (void *)[(MPSGraphExecutableExecutionDescriptor *)v13 copy];
  }
  else {
    id v15 = objc_opt_new();
  }
  id v16 = v15;
  [v15 setWaitUntilCompleted:1];
  uint64_t v17 = [(MPSGraphExecutable *)self runAsyncWithMTLCommandQueue:v10 inputsArray:v11 resultsArray:v12 executionDescriptor:v16];

  return (NSArray *)v17;
}

- (NSArray)runAsyncWithMTLCommandQueue:(id)commandQueue inputsArray:(NSArray *)inputsArray resultsArray:(NSArray *)resultsArray executionDescriptor:(MPSGraphExecutableExecutionDescriptor *)executionDescriptor
{
  id v10 = inputsArray;
  id v11 = resultsArray;
  id v12 = executionDescriptor;
  id v13 = (void *)MEMORY[0x1852FE5D0]();
  id v14 = [MEMORY[0x1E4F35520] commandBufferFromCommandQueue:commandQueue];
  if (!v12) {
    id v12 = (MPSGraphExecutableExecutionDescriptor *)objc_opt_new();
  }
  id v15 = [v14 device];
  id v16 = +[MPSGraphDevice deviceWithMTLDevice:v15];

  uint64_t v17 = [(MPSGraphExecutable *)self runInternalWithDevice:v16 commandBuffer:v14 feeds:v10 results:v11 executableExecutionDescriptor:v12 mpsGraphOwnedCommandBuffer:1];

  return (NSArray *)v17;
}

- (id)runAsyncWithCommandQueue:(id)a3 inputsArray:(id)a4 resultsArray:(id)a5 executionDescriptor:(id)a6
{
  id v6 = [(MPSGraphExecutable *)self runAsyncWithMTLCommandQueue:a3 inputsArray:a4 resultsArray:a5 executionDescriptor:a6];

  return v6;
}

- (NSArray)encodeToCommandBuffer:(MPSCommandBuffer *)commandBuffer inputsArray:(NSArray *)inputsArray resultsArray:(NSArray *)resultsArray executionDescriptor:(MPSGraphExecutableExecutionDescriptor *)executionDescriptor
{
  id v6 = [(MPSGraphExecutable *)self encodeWithMPSCommandBuffer:commandBuffer inputsArray:inputsArray resultsArray:resultsArray executionDescriptor:executionDescriptor];

  return (NSArray *)v6;
}

- (id)encodeWithMPSCommandBuffer:(id)a3 inputsArray:(id)a4 resultsArray:(id)a5 executionDescriptor:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (!v13) {
    id v13 = (id)objc_opt_new();
  }
  id v14 = [v10 device];
  id v15 = +[MPSGraphDevice deviceWithMTLDevice:v14];

  id v16 = [(MPSGraphExecutable *)self runInternalWithDevice:v15 commandBuffer:v10 feeds:v11 results:v12 executableExecutionDescriptor:v13 mpsGraphOwnedCommandBuffer:0];

  return v16;
}

- (void)getNewRuntimeForDevice:(id)a3 module:(ModuleOp)a4 inputsArray:(id)a5 compilationDescriptor:(id)a6
{
  return [(MPSGraphExecutable *)self getNewRuntimeForDevice:a3 module:a4.state inputShapes:a5 compilationDescriptor:a6 fallingBack:0 fallbackRuntimeKey:0];
}

- (void)getNewRuntimeForDevice:(id)a3 module:(ModuleOp)a4 inputShapes:(id)a5 compilationDescriptor:(id)a6 fallingBack:(BOOL)a7 fallbackRuntimeKey:(const void *)a8
{
  BOOL v9 = a7;
  unint64_t state = (unint64_t)a4.state;
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  unint64_t v50 = self;
  id v51 = a4.state;
  id v49 = a3;
  id v48 = a5;
  id v47 = a6;
  BOOL v46 = v9;
  if (v9) {
    unint64_t state = (unint64_t)a8;
  }
  unint64_t v45 = state;
  id v14 = (std::recursive_mutex *)((char *)self + 200);
  std::recursive_mutex::lock((std::recursive_mutex *)((char *)self + 200));
  uint64_t v15 = *((void *)self + 14);
  uint64_t v16 = *((unsigned int *)self + 32);
  if (!v16) {
    goto LABEL_18;
  }
  if ((state | 0x1000) == 0xFFFFFFFFFFFFF000)
  {
    uint64_t v23 = "!KeyInfoT::isEqual(Val, EmptyKey) && !KeyInfoT::isEqual(Val, TombstoneKey) && \"Empty/Tombstone value shouldn'"
          "t be inserted into map!\"";
    int v24 = 651;
    uint64_t v25 = "LookupBucketFor";
    goto LABEL_13;
  }
  LODWORD(v17) = (v16 - 1) & ((state >> 4) ^ (state >> 9));
  id v18 = (void **)(v15 + 16 * v17);
  id v19 = *v18;
  if (*v18 == (void *)state)
  {
    int v20 = (void **)(v15 + 16 * v16);
    uint64_t v21 = v20;
    if (v18 != v20) {
      goto LABEL_7;
    }
LABEL_18:
    operator new();
  }
  int v26 = 1;
  do
  {
    if (v19 == (void *)-4096) {
      goto LABEL_18;
    }
    int v27 = v17 + v26++;
    uint64_t v17 = v27 & (v16 - 1);
    id v19 = *(void **)(v15 + 16 * v17);
  }
  while (v19 != (void *)state);
  id v18 = (void **)(v15 + 16 * v17);
  int v20 = (void **)(v15 + 16 * v16);
  uint64_t v21 = v20;
  if (v18 == v20) {
    goto LABEL_18;
  }
LABEL_7:
  if (v18 == v20)
  {
    uint64_t v23 = "Ptr != End && \"dereferencing end() iterator\"";
    int v24 = 1270;
    uint64_t v25 = "operator->";
LABEL_13:
    __assert_rtn(v25, "DenseMap.h", v24, v23);
  }
  int v22 = (char *)v18[1];
  std::recursive_mutex::unlock(v14);
  if (!v22)
  {
    if (!MTLReportFailureTypeEnabled())
    {
      int v22 = 0;
      if (byte_1E8EBD9F5) {
        goto LABEL_20;
      }
LABEL_22:
      id v29 = v47;
      unint64_t v28 = ((unint64_t)[v47 compilerOptions] >> 7) & 1;
      goto LABEL_23;
    }
    MTLReportFailure();
    int v22 = 0;
  }
  if (!byte_1E8EBD9F5) {
    goto LABEL_22;
  }
LABEL_20:
  LOBYTE(v28) = byte_1E8EBD9F4 != 0;
  id v29 = v47;
LABEL_23:
  char v43 = v28;
  char v42 = [v29 compilerOptions] & 1;
  BOOL v41 = ([v29 compilerOptions] & 0x2000) != 0;
  if (v18 != v21 && !v46) {
    goto LABEL_39;
  }
  uint64_t v30 = operator new(0x58uLL);
  *uint64_t v30 = &unk_1EC9D21A0;
  v30[1] = &v50;
  v30[2] = &v49;
  v30[3] = &v43;
  v30[4] = &v42;
  v30[5] = &v41;
  v30[6] = &v51;
  v30[7] = &v46;
  v30[8] = &v47;
  v30[9] = &v48;
  v30[10] = &v45;
  uint64_t v54 = v30;
  unsigned __int8 v31 = atomic_load((unsigned __int8 *)v22 + 112);
  if ((v31 & 1) == 0)
  {
    id v39 = "_initializing";
    int v40 = 137;
    goto LABEL_49;
  }
  if (*((void *)v22 + 15))
  {
    id v39 = "!_runtime";
    int v40 = 138;
LABEL_49:
    __assert_rtn("initializeRuntime", "BaseRuntime_Project.h", v40, v39);
  }
  LOBYTE(v44) = 0;
  if (!v54) {
    std::__throw_bad_function_call[abi:ne180100]();
  }
  (*(void (**)(std::unique_lock<std::mutex> *__return_ptr))(*v54 + 48))(&__lk);
  if ((_BYTE)v44)
  {
    if (!*((void *)v22 + 15)) {
      __assert_rtn("initializeRuntime", "BaseRuntime_Project.h", 145, "_runtime");
    }
  }
  else
  {
    unint64_t m = __lk.__m_;
    __lk.__m_ = 0;
    uint64_t v33 = *((void *)v22 + 15);
    *((void *)v22 + 15) = m;
    if (v33) {
      (*(void (**)(uint64_t))(*(void *)v33 + 56))(v33);
    }
  }
  std::mutex::lock((std::mutex *)v22);
  atomic_store(0, (unsigned __int8 *)v22 + 112);
  std::condition_variable::notify_all((std::condition_variable *)(v22 + 64));
  std::mutex::unlock((std::mutex *)v22);
  id v34 = __lk.__m_;
  __lk.__m_ = 0;
  if (v34) {
    (*(void (**)(std::unique_lock<std::mutex>::mutex_type *))(v34->__m_.__sig + 56))(v34);
  }
  if (v54 == v53)
  {
    (*(void (**)(void *))(v53[0] + 32))(v53);
  }
  else if (v54)
  {
    (*(void (**)(void))(*v54 + 40))();
  }
LABEL_39:
  __lk.__m_ = (std::unique_lock<std::mutex>::mutex_type *)v22;
  __lk.__owns_ = 1;
  std::mutex::lock((std::mutex *)v22);
  unsigned __int8 v35 = atomic_load((unsigned __int8 *)v22 + 112);
  if (v35)
  {
    do
    {
      std::condition_variable::wait((std::condition_variable *)(v22 + 64), &__lk);
      unsigned __int8 v36 = atomic_load((unsigned __int8 *)v22 + 112);
    }
    while ((v36 & 1) != 0);
  }
  if (__lk.__owns_) {
    std::mutex::unlock(__lk.__m_);
  }
  id v37 = (void *)*((void *)v22 + 15);
  if (!v37 && MTLReportFailureTypeEnabled()) {
    MTLReportFailure();
  }
  [(MPSGraphExecutable *)v50 dumpCompiledProducts];

  return v37;
}

- (id)allocateTensorDataTargetsForDevice:(id)a3 inputsArray:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  ReturnOp v8 = [MEMORY[0x1E4F1CA48] array];
  v9.unint64_t state = (Operation *)[(MPSGraphExecutable *)self specializeWithDevice:v6 inputsArray:v7 compilationDescriptor:0];
  id v10 = [(MPSGraphExecutable *)self getNewRuntimeForDevice:v6 module:v9.state inputsArray:v7 compilationDescriptor:0];
  id v11 = (*(void (**)(void *, uint64_t))(*(void *)v10 + 40))(v10, [(MPSGraphExecutable *)self returnOpForFunctionInModule:v9.state]);

  return v11;
}

- (id)runInternalWithDevice:(id)a3 commandBuffer:(id)a4 feedsDictionary:(id)a5 resultsDictionary:(id)a6 executableExecutionDescriptor:(id)a7 mpsGraphOwnedCommandBuffer:(BOOL)a8
{
  BOOL v8 = a8;
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v32 = a5;
  id v33 = a6;
  id v35 = a7;
  unsigned __int8 v36 = v15;
  id v38 = v14;
  unsigned int v16 = [v14 type];
  uint64_t v17 = [v15 commandBuffer];
  id v18 = [v17 device];
  uint64_t v46 = 0x2B2B07EC2B2B07E8;
  id v47 = self;
  uint64_t v48 = v16;
  uint64_t v49 = [v18 registryID];
  unint64_t v50 = self;
  kdebug_trace();

  id v37 = [MEMORY[0x1E4F1CA48] array];
  id v34 = [MEMORY[0x1E4F1CA48] array];
  unsigned __int8 v31 = -[MPSGraphExecutable getTensorDataArraysWithDevice:feedsDictionary:resultsDictionary:inputsArray:resultsArray:](self, "getTensorDataArraysWithDevice:feedsDictionary:resultsDictionary:inputsArray:resultsArray:", v14, v32, v33, v37);
  if (![v14 type])
  {
    if (!v15)
    {
      id v19 = [v14 metalDevice];
      int v20 = (void *)[v19 newCommandQueue];

      unsigned __int8 v36 = [MEMORY[0x1E4F35520] commandBufferFromCommandQueue:v20];

      BOOL v8 = 1;
    }
    uint64_t v21 = [v35 scheduledGraphHandler];

    if (v21)
    {
      v43[0] = MEMORY[0x1E4F143A8];
      v43[1] = 3221225472;
      _OWORD v43[2] = __149__MPSGraphExecutable_runInternalWithDevice_commandBuffer_feedsDictionary_resultsDictionary_executableExecutionDescriptor_mpsGraphOwnedCommandBuffer___block_invoke;
      v43[3] = &unk_1E4FC18A0;
      id v44 = v35;
      id v45 = v31;
      [v36 addScheduledHandler:v43];
    }
  }
  int v22 = [(MPSGraphExecutable *)self runInternalWithDevice:v14 commandBuffer:v36 feeds:v37 results:v34 executableExecutionDescriptor:v35 mpsGraphOwnedCommandBuffer:v8];
  uint64_t v23 = (void *)[MEMORY[0x1E4F1CC08] mutableCopy];
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v24 = v31;
  uint64_t v25 = [v24 countByEnumeratingWithState:&v39 objects:v51 count:16];
  if (v25)
  {
    uint64_t v26 = *(void *)v40;
    do
    {
      for (uint64_t i = 0; i != v25; ++i)
      {
        if (*(void *)v40 != v26) {
          objc_enumerationMutation(v24);
        }
        uint64_t v28 = *(void *)(*((void *)&v39 + 1) + 8 * i);
        id v29 = objc_msgSend(v22, "objectAtIndexedSubscript:", objc_msgSend(*((id *)self + 57), "indexOfObject:", v28));
        [v23 setObject:v29 forKeyedSubscript:v28];
      }
      uint64_t v25 = [v24 countByEnumeratingWithState:&v39 objects:v51 count:16];
    }
    while (v25);
  }

  kdebug_trace();

  return v23;
}

void __149__MPSGraphExecutable_runInternalWithDevice_commandBuffer_feedsDictionary_resultsDictionary_executableExecutionDescriptor_mpsGraphOwnedCommandBuffer___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  id v3 = [*(id *)(a1 + 32) scheduledGraphHandler];
  uint64_t v4 = *(void *)(a1 + 40);
  BOOL v5 = [v6 error];
  ((void (**)(void, uint64_t, void *))v3)[2](v3, v4, v5);
}

- (id)runInternalWithDevice:(id)a3 commandBuffer:(id)a4 feeds:(id)a5 results:(id)a6 executableExecutionDescriptor:(id)a7 mpsGraphOwnedCommandBuffer:(BOOL)a8
{
  BOOL v81 = a8;
  uint64_t v134 = *MEMORY[0x1E4F143B8];
  id v83 = a3;
  id v13 = a4;
  id v86 = a5;
  id v14 = a6;
  uint64_t v88 = a7;
  uint64_t v80 = v13;
  if (v88[5])
  {
    id v15 = [[MPSGraphInternalCommandBuffer alloc] initWithMPSCommandBuffer:v13 executableExecutionDescriptor:v88];
    if (v15)
    {
LABEL_3:
      [(MPSGraphInternalCommandBuffer *)v15 mpsCommandBufferDescriptor];
      uint64_t v79 = v127;
      goto LABEL_6;
    }
  }
  else
  {
    id v15 = (MPSGraphInternalCommandBuffer *)v13;
    if (v15) {
      goto LABEL_3;
    }
  }
  uint64_t v79 = 0;
LABEL_6:
  unsigned int v16 = [v83 type];
  uint64_t v17 = [(MPSCommandBuffer *)v15 commandBuffer];
  id v18 = [v17 device];
  uint64_t v125 = 0x2B2B07EC2B2B07E8;
  unint64_t v126 = self;
  uint64_t v127 = v16;
  uint64_t v128 = [v18 registryID];
  v129 = self;
  kdebug_trace();

  char v19 = [v88 enableProfilingOpNames];
  if (byte_1E8EBDA00) {
    char v20 = 1;
  }
  else {
    char v20 = v19;
  }
  *((unsigned char *)self + 577) = v20;
  *((unsigned char *)self + 578) = [v88 briefProfilingOpNames];
  if (*((unsigned char *)self + 585)) {
    char v21 = 1;
  }
  else {
    char v21 = [v88 generateRuntimeExecutionReport];
  }
  *((unsigned char *)self + 585) = v21;
  *((unsigned char *)self + 579) = [v88 simulateANECompileFailure];
  *((unsigned char *)self + 580) = [v88 simulateANELoadModelFailure];
  *((unsigned char *)self + 591) = [v88 disableANECaching];
  *((unsigned char *)self + 592) = [v88 disableANEFallback];
  if (v14)
  {
    id v87 = v14;
  }
  else
  {
    id v87 = [(MPSGraphExecutable *)self allocateTensorDataTargetsForDevice:v83 inputsArray:v86];

    if (!v87)
    {
      if (MTLReportFailureTypeEnabled()) {
        MTLReportFailure();
      }
      id v87 = 0;
    }
  }
  v22.unint64_t state = (Operation *)[(MPSGraphExecutable *)self specializeWithDevice:v83 inputsArray:v86 compilationDescriptor:0];
  __lk.__m_ = (std::unique_lock<std::mutex>::mutex_type *)((char *)self + 336);
  __lk.__owns_ = 1;
  std::mutex::lock((std::mutex *)((char *)self + 336));
  while (atomic_load((unsigned int *)self + 112))
    std::condition_variable::wait((std::condition_variable *)((char *)self + 400), &__lk);
  if (__lk.__owns_) {
    std::mutex::unlock(__lk.__m_);
  }
  id v85 = v83;

  id v82 = [(MPSGraphExecutable *)self getNewRuntimeForDevice:v85 module:v22.state inputsArray:v86 compilationDescriptor:0];
  if (qword_1E8EBF220 == -1)
  {
    uint64_t v25 = (unsigned char *)qword_1E8EBF210;
    if (!qword_1E8EBF210)
    {
LABEL_42:
      uint64_t v84 = 0;
      goto LABEL_43;
    }
  }
  else
  {
    dispatch_once(&qword_1E8EBF220, &__block_literal_global_603);
    uint64_t v25 = (unsigned char *)qword_1E8EBF210;
    if (!qword_1E8EBF210) {
      goto LABEL_42;
    }
  }
  if (!*v25) {
    goto LABEL_42;
  }
  unint64_t v77 = objc_msgSend(NSString, "stringWithUTF8String:");
  if (qword_1E8EBF218 && *(unsigned char *)qword_1E8EBF218)
  {
    objc_msgSend(NSString, "stringWithUTF8String:");
    uint64_t v78 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v78 = @"MPSGraph";
  }
  uint64_t v84 = [[MPSGraphCaptureContext alloc] initWithOutputFolderPath:v77 graphName:v78];
  uint64_t v26 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v86, "count"));
  long long v123 = 0u;
  long long v124 = 0u;
  long long v121 = 0u;
  long long v122 = 0u;
  int v27 = [(MPSGraphExecutable *)self feedTensors];
  uint64_t v28 = [v27 countByEnumeratingWithState:&v121 objects:v133 count:16];
  if (v28)
  {
    uint64_t v29 = *(void *)v122;
    do
    {
      for (uint64_t i = 0; i != v28; ++i)
      {
        if (*(void *)v122 != v29) {
          objc_enumerationMutation(v27);
        }
        unsigned __int8 v31 = [*(id *)(*((void *)&v121 + 1) + 8 * i) name];
        [v26 addObject:v31];
      }
      uint64_t v28 = [v27 countByEnumeratingWithState:&v121 objects:v133 count:16];
    }
    while (v28);
  }

  [(MPSGraphCaptureContext *)v84 setFeeds:v86 names:v26];
  id v32 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v14, "count"));
  long long v119 = 0u;
  long long v120 = 0u;
  long long v117 = 0u;
  long long v118 = 0u;
  id v33 = [(MPSGraphExecutable *)self targetTensors];
  uint64_t v34 = [v33 countByEnumeratingWithState:&v117 objects:v132 count:16];
  if (v34)
  {
    uint64_t v35 = *(void *)v118;
    do
    {
      for (uint64_t j = 0; j != v34; ++j)
      {
        if (*(void *)v118 != v35) {
          objc_enumerationMutation(v33);
        }
        id v37 = [*(id *)(*((void *)&v117 + 1) + 8 * j) name];
        [v32 addObject:v37];
      }
      uint64_t v34 = [v33 countByEnumeratingWithState:&v117 objects:v132 count:16];
    }
    while (v34);
  }

  [(MPSGraphCaptureContext *)v84 setResults:v14 names:v32];
  objc_storeStrong(v82 + 26, v84);

LABEL_43:
  if (![v85 type] || *((unsigned char *)self + 581))
  {
    if (!v15)
    {
      id v38 = (void *)MEMORY[0x1E4F35520];
      long long v39 = [v85 metalDevice];
      long long v40 = (void *)[v39 newCommandQueue];
      id v15 = [v38 commandBufferFromCommandQueue:v40];

      BOOL v81 = 1;
    }
    long long v41 = [(MPSCommandBuffer *)v15 commandBuffer];
    uint64_t v42 = [v41 globalTraceObjectID];
    __lk.__m_ = (std::unique_lock<std::mutex>::mutex_type *)0x2B2B07E42B2B07E0;
    *(void *)&__lk.__owns_ = self;
    uint64_t v114 = v42;
    id v115 = v82;
    uint64_t v116 = 0;
    kdebug_trace();

    char v43 = [v88 completionGraphHandler];
    if (v43)
    {
    }
    else
    {
      id v44 = [v88 scheduledGraphHandler];
      BOOL v45 = v44 == 0;

      if (v45)
      {
        id v48 = 0;
LABEL_51:
        if ([v88 enableCommitAndContinue]) {
          BOOL v49 = *((unsigned char *)self + 576) != 0;
        }
        else {
          BOOL v49 = 0;
        }
        unsigned int v50 = [v88 breakUpMetalEncoders];
        if (byte_1E8EBDA01) {
          uint64_t v51 = 1;
        }
        else {
          uint64_t v51 = v50;
        }
        uint64_t v52 = [v88 scheduledGraphHandler];
        if (v52)
        {
        }
        else
        {
          id v53 = [v88 scheduledHandler];
          BOOL v54 = v53 == 0;

          if (v54)
          {
LABEL_61:
            v105[0] = MEMORY[0x1E4F143A8];
            v105[1] = 3221225472;
            v105[2] = __129__MPSGraphExecutable_runInternalWithDevice_commandBuffer_feeds_results_executableExecutionDescriptor_mpsGraphOwnedCommandBuffer___block_invoke_3;
            v105[3] = &unk_1E4FC12D0;
            v105[4] = self;
            [(MPSGraphInternalCommandBuffer *)v15 addScheduledHandler:v105];
            char v104 = 1;
            (*((void (**)(id *, id, id, void *, MPSGraphInternalCommandBuffer *, BOOL, uint64_t, BOOL, char *))*v82
            unint64_t v56 = + 9))(v82, v86, v87, v88, v15, v49, v51, v81, &v104);

            id v87 = v56;
            id v57 = v87;
            if ([v88 disableSynchronizeResults] & 1) == 0 && v104 && (*((void *)self + 78))
            {
              long long v102 = 0u;
              long long v103 = 0u;
              long long v100 = 0u;
              long long v101 = 0u;
              id v58 = v87;
              uint64_t v59 = [v58 countByEnumeratingWithState:&v100 objects:v131 count:16];
              if (v59)
              {
                uint64_t v60 = *(void *)v101;
                do
                {
                  for (uint64_t k = 0; k != v59; ++k)
                  {
                    if (*(void *)v101 != v60) {
                      objc_enumerationMutation(v58);
                    }
                    uint64_t v62 = [*(id *)(*((void *)&v100 + 1) + 8 * k) mpsndarray];
                    [v62 synchronizeOnCommandBuffer:v15];
                  }
                  uint64_t v59 = [v58 countByEnumeratingWithState:&v100 objects:v131 count:16];
                }
                while (v59);
              }

              long long v98 = 0u;
              long long v99 = 0u;
              long long v96 = 0u;
              long long v97 = 0u;
              id v63 = v58;
              uint64_t v64 = [v63 countByEnumeratingWithState:&v96 objects:v130 count:16];
              if (v64)
              {
                uint64_t v65 = *(void *)v97;
                do
                {
                  for (uint64_t m = 0; m != v64; ++m)
                  {
                    if (*(void *)v97 != v65) {
                      objc_enumerationMutation(v63);
                    }
                    uint64_t v67 = [*(id *)(*((void *)&v96 + 1) + 8 * m) mpsndarray];
                    [v67 synchronizeOnCommandBuffer:v15];
                  }
                  uint64_t v64 = [v63 countByEnumeratingWithState:&v96 objects:v130 count:16];
                }
                while (v64);
              }

              id v57 = v87;
            }
            id v68 = [(MPSCommandBuffer *)v15 commandBuffer];
            uint64_t v69 = [v88 completionGraphHandler];
            if (v69
              || ([v88 completionHandler], (uint64_t v69 = objc_claimAutoreleasedReturnValue()) != 0))
            {

              id v57 = v87;
            }
            else if (!v88[4])
            {
              goto LABEL_83;
            }
            v91[0] = MEMORY[0x1E4F143A8];
            v91[1] = 3221225472;
            v91[2] = __129__MPSGraphExecutable_runInternalWithDevice_commandBuffer_feeds_results_executableExecutionDescriptor_mpsGraphOwnedCommandBuffer___block_invoke_4;
            v91[3] = &unk_1E4FC18F0;
            int v92 = v88;
            id v93 = v48;
            id v94 = v57;
            uint64_t v95 = self;
            [(MPSGraphInternalCommandBuffer *)v15 addCompletedHandler:v91];
            char v104 = 1;

LABEL_83:
            v90[0] = MEMORY[0x1E4F143A8];
            v90[1] = 3221225472;
            v90[2] = __129__MPSGraphExecutable_runInternalWithDevice_commandBuffer_feeds_results_executableExecutionDescriptor_mpsGraphOwnedCommandBuffer___block_invoke_5;
            v90[3] = &unk_1E4FC12D0;
            v90[4] = self;
            [(MPSGraphInternalCommandBuffer *)v15 addCompletedHandler:v90];
            if (v104)
            {
              if (v81) {
                [(MPSGraphInternalCommandBuffer *)v15 commit];
              }
              if ([v88 waitUntilCompleted])
              {
                if (!v81) {
                  [(MPSGraphInternalCommandBuffer *)v15 commitAndContinue];
                }
                [v68 waitUntilCompleted];
              }
            }
            if (v15)
            {
              [(MPSGraphInternalCommandBuffer *)v15 mpsCommandBufferDescriptor];
              uint64_t v70 = v89;
            }
            else
            {
              uint64_t v70 = 0;
            }
            v88[7] = v70 - v79;

            kdebug_trace();
            id v14 = v87;
            goto LABEL_94;
          }
        }
        uint64_t v55 = [(MPSCommandBuffer *)v15 commandBuffer];
        v106[0] = MEMORY[0x1E4F143A8];
        v106[1] = 3221225472;
        _OWORD v106[2] = __129__MPSGraphExecutable_runInternalWithDevice_commandBuffer_feeds_results_executableExecutionDescriptor_mpsGraphOwnedCommandBuffer___block_invoke_2;
        v106[3] = &unk_1E4FC18C8;
        __int16 v107 = v88;
        id v108 = v48;
        id v109 = v87;
        [v55 addScheduledHandler:v106];

        goto LABEL_61;
      }
    }
    uint64_t v46 = objc_opt_new();
    id v47 = (void *)*((void *)self + 57);
    v110[0] = MEMORY[0x1E4F143A8];
    v110[1] = 3221225472;
    v110[2] = __129__MPSGraphExecutable_runInternalWithDevice_commandBuffer_feeds_results_executableExecutionDescriptor_mpsGraphOwnedCommandBuffer___block_invoke;
    v110[3] = &unk_1E4FC1580;
    id v48 = v46;
    id v111 = v48;
    id v112 = v87;
    [v47 enumerateObjectsUsingBlock:v110];

    goto LABEL_51;
  }
  if ([v85 type] == 1)
  {
    (*((void (**)(id *, id, id, void *))*v82 + 2))(v82, v86, v87, v88);
  }
  else if (MTLReportFailureTypeEnabled())
  {
    MTLReportFailure();
  }
LABEL_94:
  if (v84) {
    [(MPSGraphCaptureContext *)v84 writejsonFile:@"mpsgraph.json"];
  }
  if (qword_1E8EBF230 == -1)
  {
    if (_MergedGlobals_59 != 1) {
      goto LABEL_99;
    }
    goto LABEL_98;
  }
  dispatch_once(&qword_1E8EBF230, &__block_literal_global_607);
  if (_MergedGlobals_59 == 1)
  {
LABEL_98:
    MPSGraphOperatingSystemVersion v71 = (void *)MEMORY[0x1E4F1CB10];
    uint64_t v72 = [NSString stringWithUTF8String:qword_1E8EBF228];
    unint64_t v73 = [v71 URLWithString:v72];
    [(MPSGraphExecutable *)self emitObjUnitTestToUrl:v73];
  }
LABEL_99:
  unint64_t v74 = v87;
  if (v14) {
    unint64_t v74 = v14;
  }
  id v75 = v74;

  kdebug_trace();

  return v75;
}

void __129__MPSGraphExecutable_runInternalWithDevice_commandBuffer_feeds_results_executableExecutionDescriptor_mpsGraphOwnedCommandBuffer___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v6 = a2;
  BOOL v5 = [*(id *)(a1 + 40) objectAtIndexedSubscript:a3];
  [*(id *)(a1 + 32) setObject:v5 forKeyedSubscript:v6];
}

void __129__MPSGraphExecutable_runInternalWithDevice_commandBuffer_feeds_results_executableExecutionDescriptor_mpsGraphOwnedCommandBuffer___block_invoke_2(uint64_t a1, void *a2)
{
  id v11 = a2;
  id v3 = [*(id *)(a1 + 32) scheduledGraphHandler];

  if (v3)
  {
    uint64_t v4 = [*(id *)(a1 + 32) scheduledGraphHandler];
    uint64_t v5 = *(void *)(a1 + 40);
    id v6 = [v11 error];
    ((void (**)(void, uint64_t, void *))v4)[2](v4, v5, v6);
  }
  id v7 = [*(id *)(a1 + 32) scheduledHandler];

  if (v7)
  {
    BOOL v8 = [*(id *)(a1 + 32) scheduledHandler];
    uint64_t v9 = *(void *)(a1 + 48);
    id v10 = [v11 error];
    ((void (**)(void, uint64_t, void *))v8)[2](v8, v9, v10);
  }
}

void __129__MPSGraphExecutable_runInternalWithDevice_commandBuffer_feeds_results_executableExecutionDescriptor_mpsGraphOwnedCommandBuffer___block_invoke_3(uint64_t a1)
{
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 560));
  ++*(void *)(*(void *)(a1 + 32) + 568);
  uint64_t v2 = (os_unfair_lock_s *)(*(void *)(a1 + 32) + 560);

  os_unfair_lock_unlock(v2);
}

void __129__MPSGraphExecutable_runInternalWithDevice_commandBuffer_feeds_results_executableExecutionDescriptor_mpsGraphOwnedCommandBuffer___block_invoke_4(uint64_t a1, void *a2)
{
  id v15 = a2;
  id v3 = [*(id *)(a1 + 32) completionGraphHandler];

  if (v3)
  {
    uint64_t v4 = [*(id *)(a1 + 32) completionGraphHandler];
    uint64_t v5 = *(void *)(a1 + 40);
    id v6 = [v15 error];
    ((void (**)(void, uint64_t, void *))v4)[2](v4, v5, v6);
  }
  id v7 = [*(id *)(a1 + 32) completionHandler];

  if (v7)
  {
    BOOL v8 = [*(id *)(a1 + 32) completionHandler];
    uint64_t v9 = *(void *)(a1 + 48);
    id v10 = [v15 error];
    ((void (**)(void, uint64_t, void *))v8)[2](v8, v9, v10);
  }
  uint64_t v11 = *(void *)(a1 + 32);
  uint64_t v12 = *(void *)(v11 + 32);
  if (v12)
  {
    uint64_t v13 = *(void *)(v11 + 40);
    id v14 = [v15 error];
    (*(void (**)(uint64_t, uint64_t, void *))(v12 + 16))(v12, v13, v14);
  }
  kdebug_trace();
}

void __129__MPSGraphExecutable_runInternalWithDevice_commandBuffer_feeds_results_executableExecutionDescriptor_mpsGraphOwnedCommandBuffer___block_invoke_5(uint64_t a1)
{
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 560));
  --*(void *)(*(void *)(a1 + 32) + 568);
  uint64_t v2 = (os_unfair_lock_s *)(*(void *)(a1 + 32) + 560);

  os_unfair_lock_unlock(v2);
}

- (unint64_t)getOptimizedModuleCacheSize
{
  return *((unsigned int *)self + 36);
}

- (unint64_t)getOptimizedNoDeviceModuleCacheSize
{
  return *((void *)self + 23);
}

- (unint64_t)getResourcesTotalSize
{
  uint64_t Manager = mlir::mps::MPSResourceBlobManagerInterface::getManager(*((mlir::mps::MPSResourceBlobManagerInterface **)self + 2), (mlir::MLIRContext *)a2);
  id v3 = (pthread_rwlock_t **)(Manager + 48);
  llvm::sys::RWMutexImpl::lock((pthread_rwlock_t **)(Manager + 48));
  uint64_t v4 = *(void **)(Manager + 24);
  uint64_t v5 = *(unsigned int *)(Manager + 32);
  if (v5)
  {
    id v6 = *(uint64_t **)(Manager + 24);
    if (*v4) {
      BOOL v7 = *v4 == -8;
    }
    else {
      BOOL v7 = 1;
    }
    if (v7)
    {
      do
      {
        uint64_t v9 = v6[1];
        ++v6;
        uint64_t v8 = v9;
        if (v9) {
          BOOL v10 = v8 == -8;
        }
        else {
          BOOL v10 = 1;
        }
      }
      while (v10);
    }
    uint64_t v11 = &v4[v5];
    if (v6 != v11) {
      goto LABEL_12;
    }
LABEL_22:
    unint64_t v12 = 0;
    goto LABEL_23;
  }
  id v6 = *(uint64_t **)(Manager + 24);
  uint64_t v11 = &v4[v5];
  if (v6 == v11) {
    goto LABEL_22;
  }
LABEL_12:
  unint64_t v12 = 0;
  uint64_t v13 = *v6;
  do
  {
    if (*(unsigned char *)(v13 + 88)) {
      v12 += *(void *)(v13 + 32);
    }
    do
    {
      uint64_t v14 = v6[1];
      ++v6;
      uint64_t v13 = v14;
      if (v14) {
        BOOL v15 = v13 == -8;
      }
      else {
        BOOL v15 = 1;
      }
    }
    while (v15);
  }
  while (v6 != v11);
LABEL_23:
  llvm::sys::RWMutexImpl::unlock_shared(v3);
  return v12;
}

- (NSArray)targetTensors
{
  return (NSArray *)objc_getProperty(self, a2, 456, 1);
}

- (NSArray)feedTensors
{
  return (NSArray *)objc_getProperty(self, a2, 472, 1);
}

- (MPSGraphOptions)options
{
  return *((void *)self + 78);
}

- (void)setOptions:(MPSGraphOptions)options
{
  *((void *)self + 78) = options;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)self + 69, 0);
  objc_storeStrong((id *)self + 68, 0);
  objc_storeStrong((id *)self + 67, 0);
  objc_storeStrong((id *)self + 66, 0);
  objc_storeStrong((id *)self + 62, 0);
  objc_storeStrong((id *)self + 60, 0);
  objc_storeStrong((id *)self + 59, 0);
  objc_storeStrong((id *)self + 58, 0);
  objc_storeStrong((id *)self + 57, 0);
  std::condition_variable::~condition_variable((std::condition_variable *)((char *)self + 400));
  std::mutex::~mutex((std::mutex *)((char *)self + 336));
  objc_storeStrong((id *)self + 41, 0);
  std::recursive_mutex::~recursive_mutex((std::recursive_mutex *)((char *)self + 264));
  std::recursive_mutex::~recursive_mutex((std::recursive_mutex *)((char *)self + 200));
  id v3 = (void **)((char *)self + 160);
  uint64_t v4 = (char *)*((void *)self + 22);
  if (v4)
  {
    do
    {
      id v6 = *(char **)v4;
      LazyLoadableModuleRef::~LazyLoadableModuleRef((LazyLoadableModuleRef *)(v4 + 40));
      if (v4[39] < 0) {
        operator delete(*((void **)v4 + 2));
      }
      operator delete(v4);
      uint64_t v4 = v6;
    }
    while (v6);
  }
  uint64_t v5 = *v3;
  void *v3 = 0;
  if (v5) {
    operator delete(v5);
  }
  llvm::DenseMapBase<llvm::DenseMap<MPSGraphModuleKey,std::unique_ptr<LazyLoadableModuleRef>,MPSGraphModuleKeyInfo,llvm::detail::DenseMapPair<MPSGraphModuleKey,std::unique_ptr<LazyLoadableModuleRef>>>,MPSGraphModuleKey,std::unique_ptr<LazyLoadableModuleRef>,MPSGraphModuleKeyInfo,llvm::detail::DenseMapPair<MPSGraphModuleKey,std::unique_ptr<LazyLoadableModuleRef>>>::destroyAll((uint64_t *)self + 17);
  llvm::deallocate_buffer(*((llvm **)self + 17), (void *)(104 * *((unsigned int *)self + 38)));
}

- (id).cxx_construct
{
  *((void *)self + 2) = 0;
  *((void *)self + 3) = 0;
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 56) = 0u;
  *(_OWORD *)((char *)self + 72) = 0u;
  *((void *)self + 14) = 0;
  *((void *)self + 15) = 0;
  *((_DWORD *)self + 32) = 0;
  *((void *)self + 17) = 0;
  *((void *)self + 18) = 0;
  *((_DWORD *)self + 38) = 0;
  *((_OWORD *)self + 10) = 0u;
  *((_OWORD *)self + 11) = 0u;
  *((_DWORD *)self + 48) = 1065353216;
  MEMORY[0x1852FDB50]((char *)self + 200, a2);
  MEMORY[0x1852FDB50]((char *)self + 264);
  *((void *)self + 42) = 850045863;
  *(_OWORD *)((char *)self + 344) = 0u;
  *(_OWORD *)((char *)self + 360) = 0u;
  *(_OWORD *)((char *)self + 376) = 0u;
  *((void *)self + 49) = 0;
  *((void *)self + 50) = 1018212795;
  *(_OWORD *)((char *)self + 408) = 0u;
  *(_OWORD *)((char *)self + 424) = 0u;
  *((void *)self + 55) = 0;
  return self;
}

+ (void)executablesWithMLIRSourceForMultipleModules:executableDescriptor:regionNames:
{
  if (!a2) {
    __assert_rtn("dyn_cast", "Casting.h", 662, "detail::isPresent(Val) && \"dyn_cast on a non-existent value\"");
  }
  uint64_t v49 = llvm::DefaultDoCastIfPossible<mlir::placement::TensorToMemref,mlir::Operation *,llvm::CastInfo<mlir::placement::TensorToMemref,mlir::Operation *,void>>::doCastIfPossible((uint64_t)a2);
  if (v49)
  {
    uint64_t v4 = *(mlir::IRMapping **)a1;
    uint64_t Result = mlir::anec::Broadcast::getResult((mlir::anec::Broadcast *)&v49);
    id v6 = *(mlir::IRMapping **)a1;
    uint64_t Input = mlir::anec::Convolution::getInput((mlir::anec::Convolution *)&v49);
    goto LABEL_6;
  }
  uint64_t v48 = llvm::DefaultDoCastIfPossible<mlir::placement::MemrefToTensor,mlir::Operation *,llvm::CastInfo<mlir::placement::MemrefToTensor,mlir::Operation *,void>>::doCastIfPossible((uint64_t)a2);
  if (v48)
  {
    uint64_t v4 = *(mlir::IRMapping **)a1;
    uint64_t Result = mlir::anec::Broadcast::getResult((mlir::anec::Broadcast *)&v48);
    id v6 = *(mlir::IRMapping **)a1;
    uint64_t Input = mlir::anec::Convolution::getInput((mlir::anec::Convolution *)&v48);
LABEL_6:
    v52[0] = Input;
    std::string __p = 0;
    if (!llvm::DenseMapBase<llvm::DenseMap<mlir::Value,unsigned int,llvm::DenseMapInfo<mlir::Value,void>,llvm::detail::DenseMapPair<mlir::Value,unsigned int>>,mlir::Value,unsigned int,llvm::DenseMapInfo<mlir::Value,void>,llvm::detail::DenseMapPair<mlir::Value,unsigned int>>::LookupBucketFor<mlir::Value>((uint64_t *)v6, (unint64_t *)v52, &__p)|| __p == (void *)(*(void *)v6 + 16 * *((unsigned int *)v6 + 4))|| (uint64_t v8 = *((void *)__p + 1)) == 0)
    {
      __assert_rtn("lookup", "IRMapping.h", 74, "result && \"expected 'from' to be contained within the map\"");
    }
    v52[0] = Result;
    std::string __p = 0;
    char v9 = llvm::DenseMapBase<llvm::DenseMap<mlir::Value,unsigned int,llvm::DenseMapInfo<mlir::Value,void>,llvm::detail::DenseMapPair<mlir::Value,unsigned int>>,mlir::Value,unsigned int,llvm::DenseMapInfo<mlir::Value,void>,llvm::detail::DenseMapPair<mlir::Value,unsigned int>>::LookupBucketFor<mlir::Value>((uint64_t *)v4, (unint64_t *)v52, &__p);
    BOOL v10 = __p;
    if ((v9 & 1) == 0)
    {
      BOOL v10 = llvm::DenseMapBase<llvm::DenseMap<mlir::Value,mlir::Value,llvm::DenseMapInfo<mlir::Value,void>,llvm::detail::DenseMapPair<mlir::Value,mlir::Value>>,mlir::Value,mlir::Value,llvm::DenseMapInfo<mlir::Value,void>,llvm::detail::DenseMapPair<mlir::Value,mlir::Value>>::InsertIntoBucketImpl<mlir::Value>((uint64_t)v4, (uint64_t)v52, (unint64_t *)v52, __p);
      void *v10 = v52[0];
      v10[1] = 0;
    }
    v10[1] = v8;
    return;
  }
  uint64_t v11 = *((void *)a2 + 6);
  unint64_t v12 = *(void **)(v11 + 16);
  if (v12 == &mlir::detail::TypeIDResolver<void,void>::id)
  {
    std::string __p = *(void **)(v11 + 8);
    uint64_t AttrData = mlir::OpaqueAttr::getAttrData((mlir::OpaqueAttr *)&__p);
    if (v44 == 18)
    {
      BOOL v45 = *(void *)AttrData == 0x6765722E7873706DLL && *(void *)(AttrData + 8) == 0x757465725F6E6F69;
      if (v45 && *(_WORD *)(AttrData + 16) == 28274)
      {
        __int16 v53 = 1283;
        v52[0] = (uint64_t)"classof on '";
        v52[2] = (uint64_t)"mpsx.region_return";
        v52[3] = 18;
        v50[0] = (uint64_t)"' failed due to the operation not being registered";
        __int16 v51 = 259;
        llvm::operator+(v52, v50, (uint64_t)&__p);
        llvm::report_fatal_error((llvm::Twine *)&__p, 1);
      }
    }
    goto LABEL_53;
  }
  if (v12 != &mlir::detail::TypeIDResolver<mlir::mpsx::RegionReturnOp,void>::id)
  {
LABEL_53:
    mlir::OpBuilder::clone(**(uint64_t ****)(a1 + 8), a2, *(mlir::IRMapping **)a1);
    return;
  }
  id v47 = a2;
  std::string __p = 0;
  uint64_t v55 = 0;
  unint64_t v56 = 0;
  uint64_t Inputs = mlir::anec::Concat::getInputs((mlir::anec::Concat *)&v47);
  uint64_t v15 = v14;
  if (v14)
  {
    uint64_t v16 = Inputs;
    uint64_t v17 = 0;
    while (1)
    {
      char v19 = *(mlir::IRMapping **)a1;
      v50[0] = *(void *)(v16 + 32 * v17 + 24);
      v52[0] = 0;
      char v20 = llvm::DenseMapBase<llvm::DenseMap<mlir::Value,unsigned int,llvm::DenseMapInfo<mlir::Value,void>,llvm::detail::DenseMapPair<mlir::Value,unsigned int>>,mlir::Value,unsigned int,llvm::DenseMapInfo<mlir::Value,void>,llvm::detail::DenseMapPair<mlir::Value,unsigned int>>::LookupBucketFor<mlir::Value>((uint64_t *)v19, (unint64_t *)v50, v52);
      if (v52[0] == *(void *)v19 + 16 * *((unsigned int *)v19 + 4)) {
        char v21 = 0;
      }
      else {
        char v21 = v20;
      }
      if ((v21 & 1) == 0 || (uint64_t v22 = *(void *)(v52[0] + 8)) == 0) {
        __assert_rtn("lookup", "IRMapping.h", 74, "result && \"expected 'from' to be contained within the map\"");
      }
      uint64_t v23 = v55;
      if (v55 >= v56) {
        break;
      }
      *(void *)uint64_t v55 = v22;
      id v18 = v23 + 8;
LABEL_18:
      uint64_t v55 = v18;
      if (++v17 == v15) {
        goto LABEL_54;
      }
    }
    id v24 = __p;
    int64_t v25 = v55 - (unsigned char *)__p;
    uint64_t v26 = (v55 - (unsigned char *)__p) >> 3;
    unint64_t v27 = v26 + 1;
    if ((unint64_t)(v26 + 1) >> 61) {
      std::vector<long>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v28 = v56 - (unsigned char *)__p;
    if ((v56 - (unsigned char *)__p) >> 2 > v27) {
      unint64_t v27 = v28 >> 2;
    }
    if ((unint64_t)v28 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v29 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v29 = v27;
    }
    if (v29)
    {
      if (v29 >> 61) {
        std::__throw_bad_array_new_length[abi:ne180100]();
      }
      uint64_t v30 = operator new(8 * v29);
      unsigned __int8 v31 = &v30[8 * v26];
      *(void *)unsigned __int8 v31 = v22;
      id v18 = v31 + 8;
      int64_t v32 = v23 - v24;
      if (v23 == v24)
      {
LABEL_34:
        std::string __p = v31;
        uint64_t v55 = v18;
        unint64_t v56 = &v30[8 * v29];
        if (!v23) {
          goto LABEL_18;
        }
        goto LABEL_44;
      }
    }
    else
    {
      uint64_t v30 = 0;
      unsigned __int8 v31 = (char *)(8 * v26);
      id v33 = (void *)(8 * v26);
      *id v33 = v22;
      id v18 = (char *)(v33 + 1);
      int64_t v32 = v23 - v24;
      if (v23 == v24) {
        goto LABEL_34;
      }
    }
    unint64_t v34 = v32 - 8;
    if (v34 < 0x58) {
      goto LABEL_64;
    }
    if ((unint64_t)(v23 - v30 - v25) < 0x20) {
      goto LABEL_64;
    }
    uint64_t v35 = (v34 >> 3) + 1;
    uint64_t v36 = 8 * (v35 & 0x3FFFFFFFFFFFFFFCLL);
    id v37 = &v23[-v36];
    v31 -= v36;
    id v38 = &v30[v25 - 16];
    long long v39 = (long long *)(v23 - 16);
    uint64_t v40 = v35 & 0x3FFFFFFFFFFFFFFCLL;
    do
    {
      long long v41 = *v39;
      *(v38 - 1) = *(v39 - 1);
      *id v38 = v41;
      v38 -= 2;
      v39 -= 2;
      v40 -= 4;
    }
    while (v40);
    uint64_t v23 = v37;
    if (v35 != (v35 & 0x3FFFFFFFFFFFFFFCLL))
    {
LABEL_64:
      do
      {
        uint64_t v42 = *((void *)v23 - 1);
        v23 -= 8;
        *((void *)v31 - 1) = v42;
        v31 -= 8;
      }
      while (v23 != v24);
    }
    uint64_t v23 = __p;
    std::string __p = v31;
    uint64_t v55 = v18;
    unint64_t v56 = &v30[8 * v29];
    if (!v23) {
      goto LABEL_18;
    }
LABEL_44:
    operator delete(v23);
    goto LABEL_18;
  }
LABEL_54:
  mlir::OpBuilder::create<mlir::func::ReturnOp,std::vector<mlir::Value> &>(**(mlir::OpBuilder ***)(a1 + 8), *((void *)v47 + 3), (uint64_t *)&__p);
  if (__p)
  {
    uint64_t v55 = (char *)__p;
    operator delete(__p);
  }
}

- (uint64_t)optimizeOriginalModule
{
  unint64_t v3 = *(void *)(a2 + 8);
  if ((char *)v3 == "Z44-[MPSGraphExecutable optimizeOriginalModule]E3$_6") {
    return a1 + 8;
  }
  if (((v3 & (unint64_t)"Z44-[MPSGraphExecutable optimizeOriginalModule]E3$_6" & 0x8000000000000000) != 0) == __OFSUB__(v3, "Z44-[MPSGraphExecutable optimizeOriginalModule]E3$_6")) {
    return 0;
  }
  if (!strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)((unint64_t)"Z44-[MPSGraphExecutable optimizeOriginalModule]E3$_6" & 0x7FFFFFFFFFFFFFFFLL)))return a1 + 8; {
  return 0;
  }
}

- (void)optimizationPassesWithDevice:sourceModule:compilationID:compilationDescriptor:
{
}

- (uint64_t)optimizationPassesWithDevice:sourceModule:compilationID:compilationDescriptor:
{
  unint64_t v3 = *(void *)(a2 + 8);
  if ((char *)v3 == "Z100-[MPSGraphExecutable optimizationPassesWithDevice:sourceModule:compilationID:compilationDescriptor:]E4$_13") {
    return a1 + 8;
  }
  if (((v3 & (unint64_t)"Z100-[MPSGraphExecutable optimizationPassesWithDevice:sourceModule:compilationID:compila"
                                "tionDescriptor:]E4$_13" & 0x8000000000000000) != 0) == __OFSUB__(v3, "Z100-[MPSGraphExecutable optimizationPassesWithDevice:sourceModule:compilationID:compilationDescriptor:]E4$_13"))return 0;
  if (!strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)((unint64_t)"Z100-[MPSGraphExecutable optimizationPassesWithDevice:sourceModule:compilationID:compilationDescriptor:]E4$_13" & 0x7FFFFFFFFFFFFFFFLL)))return a1 + 8; {
  return 0;
  }
}

- (void)createMLIRLibraryWithMPSGraphPackage:packageKey:appendOptimizedModules:
{
  if (**(void **)a1 == 1)
  {
    uint64_t v14 = a2;
    id v3 = (id)objc_opt_new();
    id v13 = v3;
    unint64_t Body = mlir::anec::A11Legacy::getBody((mlir::anec::A11Legacy *)&v14);
    unint64_t v12 = &v13;
    uint64_t v5 = *(void *)(Body + 8);
    if (v5 != Body)
    {
      do
      {
        uint64_t v6 = v5 - 8;
        if (!v5) {
          uint64_t v6 = 0;
        }
        BOOL v7 = (mlir::GenericProgramPoint *)(v6 + 32);
        uint64_t v8 = *(mlir::GenericProgramPoint **)(v6 + 40);
        if (v8 != (mlir::GenericProgramPoint *)(v6 + 32))
        {
          do
          {
            char v9 = (mlir::GenericProgramPoint *)*((void *)v8 + 1);
            mlir::GenericProgramPoint::~GenericProgramPoint(v8);
            uint64_t v15 = &v12;
            mlir::detail::walk<mlir::ForwardIterator>(v10, (mlir::Operation *)_ZN4llvm12function_refIFvPN4mlir9OperationEEE11callback_fnIZNS1_6detail4walkILNS1_9WalkOrderE1ENS1_15ForwardIteratorERZ32getConstantResourcesUsedInModuleINS1_3mps13serialization8ModuleOpEEP7NSArrayIP8NSStringET_EUlNSC_10ConstantOpEE_SL_vEENSt3__19enable_ifIXaantsr4llvm9is_one_ofIT2_S3_PNS1_6RegionEPNS1_5BlockEEE5valuesr3std7is_sameIT3_vEE5valueESV_E4typeES3_OT1_EUlS3_E_EEvlS3_, (uint64_t)&v15, 1);
            uint64_t v8 = v9;
          }
          while (v9 != v7);
        }
        uint64_t v5 = *(void *)(v5 + 8);
      }
      while (v5 != Body);
      id v3 = v13;
    }
    id v11 = [v3 allObjects];

    [**(id **)(a1 + 8) addObjectsFromArray:v11];
    [**(id **)(a1 + 16) addOriginalResourcesUsed:v11];
  }
}

- (void)getNewRuntimeForDevice:module:inputShapes:compilationDescriptor:fallingBack:fallbackRuntimeKey:
{
}

- (__n128)getNewRuntimeForDevice:module:inputShapes:compilationDescriptor:fallingBack:fallbackRuntimeKey:
{
  *(void *)a2 = &unk_1EC9D21A0;
  *(_OWORD *)(a2 + 8) = *(_OWORD *)(a1 + 8);
  __n128 result = *(__n128 *)(a1 + 24);
  long long v3 = *(_OWORD *)(a1 + 40);
  long long v4 = *(_OWORD *)(a1 + 56);
  *(_OWORD *)(a2 + 72) = *(_OWORD *)(a1 + 72);
  *(_OWORD *)(a2 + 56) = v4;
  *(_OWORD *)(a2 + 40) = v3;
  *(__n128 *)(a2 + 24) = result;
  return result;
}

- (uint64_t)getNewRuntimeForDevice:module:inputShapes:compilationDescriptor:fallingBack:fallbackRuntimeKey:
{
  unint64_t v3 = *(void *)(a2 + 8);
  if ((char *)v3 == "Z117-[MPSGraphExecutable getNewRuntimeForDevice:module:inputShapes:compilationDescriptor:fallingBac"
                     "k:fallbackRuntimeKey:]E4$_18")
    return a1 + 8;
  if (((v3 & (unint64_t)"Z117-[MPSGraphExecutable getNewRuntimeForDevice:module:inputShapes:compilationDescriptor"
                                ":fallingBack:fallbackRuntimeKey:]E4$_18" & 0x8000000000000000) != 0) == __OFSUB__(v3, "Z117-[MPSGraphExecutable getNewRuntimeForDevice:module:inputShapes:compilationDescriptor:fallingBack:fallbackRuntimeKey:]E4$_18"))return 0;
  if (!strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)((unint64_t)"Z117-[MPSGraphExecutable getNewRuntimeForDevice:module:inputShapes:compilationDescriptor:fallingBack:fallbackRuntimeKey:]E4$_18" & 0x7FFFFFFFFFFFFFFFLL)))return a1 + 8; {
  return 0;
  }
}

@end