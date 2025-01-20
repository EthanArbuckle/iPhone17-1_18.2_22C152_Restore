@interface _MTLBinaryArchive
+ (BOOL)deserializeBinaryArchiveDescriptorMachO:(id *)a3 fileData:(id)a4;
+ (BOOL)deserializeBinaryArchiveHeader:(id *)a3 fileData:(id)a4 device:(id)a5;
+ (MTLLoaderSliceIdentifier)sliceIDForSpecializedFunctionsForLLVMVersion:(int)a3;
+ (id)descriptorDataForArchive:(id)a3;
+ (unsigned)archiveTypeAtURL:(id)a3 device:(id)a4 error:(id *)a5;
+ (unsigned)archiveVersionCompatible:(MachOToolsVersion *)a3 isMatchingSlice:(BOOL)a4 device:(id)a5;
- ($2772B1D07D29A72E8557B2574C0AE5C1)reflectionHashWithFunctionId:(SEL)a3 binaryPos:(const void *)a4;
- (BOOL)addComputePipelineFunctionsWithDescriptor:(id)a3 error:(id *)a4;
- (BOOL)addComputePipelineFunctionsWithDescriptor:(id)a3 options:(unint64_t)a4 error:(id *)a5;
- (BOOL)addFunctionWithDescriptor:(id)a3 library:(id)a4 error:(id *)a5;
- (BOOL)addLibraryWithDescriptor:(id)a3 error:(id *)a4;
- (BOOL)addMeshRenderPipelineFunctionsWithDescriptor:(id)a3 error:(id *)a4;
- (BOOL)addMeshRenderPipelineFunctionsWithDescriptor:(id)a3 options:(unint64_t)a4 error:(id *)a5;
- (BOOL)addRenderPipelineFunctionsWithDescriptor:(id)a3 error:(id *)a4;
- (BOOL)addRenderPipelineFunctionsWithDescriptor:(id)a3 options:(unint64_t)a4 error:(id *)a5;
- (BOOL)addTileRenderPipelineFunctionsWithDescriptor:(id)a3 error:(id *)a4;
- (BOOL)addTileRenderPipelineFunctionsWithDescriptor:(id)a3 options:(unint64_t)a4 error:(id *)a5;
- (BOOL)airntSerializeToURL:(id)a3 options:(unint64_t)a4 error:(id *)a5;
- (BOOL)archiveSkipsAIRValidation;
- (BOOL)enumerateArchivesFromBackingFile:(id)a3;
- (BOOL)enumerateArchivesFromBackingFileFromSlice:(const MTLLoaderSliceIdentifier *)a3 version:(unint64_t)a4 verifyKey:(id *)a5 offset:(unint64_t)a6 bytes:(unint64_t)a7 enumerator:(id)a8;
- (BOOL)enumerateArchivesFromPipelineCollection:(id)a3;
- (BOOL)enumerateSpecializedFunctionArchivesFromBackingFile:(id)a3;
- (BOOL)getScriptsWithAIRNTObject:(void *)a3;
- (BOOL)getSpecializedFunctionArchivesToSerialize:(void *)a3;
- (BOOL)legacySerializeToURL:(id)a3 options:(unint64_t)a4 error:(id *)a5;
- (BOOL)loadAirSliceAtOffset:(unint64_t)a3 sliceLength:(unint64_t)a4;
- (BOOL)loadAirntBlocksForSlice:(const MTLLoaderSliceIdentifier *)a3 sliceOffset:(unint64_t)a4 skipAIRValidation:(BOOL)a5;
- (BOOL)loadFileIndex:(void *)a3 expectedSliceId:(const MTLLoaderSliceIdentifier *)a4 expectedVersion:(unint64_t)a5 sliceOffset:(unint64_t)a6;
- (BOOL)loadFromURL:(id)a3 error:(id *)a4;
- (BOOL)recompilationTarget;
- (BOOL)recompilePipelinesToArchive:(id)a3 error:(id *)a4;
- (BOOL)recompileStatelessToArchive:(id)a3 error:(id *)a4;
- (BOOL)recompileToArchive:(id)a3 error:(id *)a4;
- (BOOL)recompileToArchiveWithURL:(id)a3 error:(id *)a4;
- (BOOL)remoteInsertionBegin;
- (BOOL)removeComputePipelineFunctionsWithDescriptor:(id)a3 error:(id *)a4;
- (BOOL)requiresLegacyReflection;
- (BOOL)serializeToURL:(id)a3 error:(id *)a4;
- (BOOL)serializeToURL:(id)a3 options:(unint64_t)a4 error:(id *)a5;
- (BOOL)storeComputePipelineDescriptor:(id)a3;
- (BOOL)storeMeshRenderPipelineDescriptor:(id)a3;
- (BOOL)storeRenderPipelineDescriptor:(id)a3;
- (BOOL)storeTileRenderPipelineDescriptor:(id)a3;
- (BOOL)supportsAIRNT;
- (BOOL)updateReflectionForEntry:(id)a3 binaryKey:(id)a4 requiredReflection:(char)a5;
- (MTLDevice)device;
- (NSArray)keys;
- (NSString)description;
- (_MTLBinaryArchive)initWithDevice:(id)a3 descriptor:(id)a4 error:(id *)a5;
- (_MTLBinaryArchive)initWithOptions:(unint64_t)a3 device:(id)a4 url:(id)a5 error:(id *)a6;
- (const)mapFileToMemoryWithPath:(const char *)a3 fileSize:(unint64_t *)a4;
- (id).cxx_construct;
- (id)archiveFunctionIds;
- (id)flatBufferFromJSON:(id)a3 schema:(const char *)a4 schemaSize:(unint64_t)a5;
- (id)formattedDescription:(unint64_t)a3;
- (id)getArchiveIDWithErrorInternal:(id *)a3;
- (id)getBinaryDataForKey:(id)a3 reflectionType:(char)a4;
- (id)getFunctionNameFromAirDescriptor:(const stitchedAirDescriptor *)a3;
- (id)getLibraryDescriptorWithAirScrpt:(const StitchingScript *)a3;
- (id)getLibraryInArchiveAtPos:(void *)a3 atIndex:(unsigned int)a4 error:(id *)a5;
- (id)getMetalScript;
- (id)localStitchedFunctionLookupWithDescriptor:(const stitchedAirDescriptor *)a3;
- (id)mapFileToMemoryWithPath:(const char *)a3;
- (id)materializeAIRNTBlockForKey:(id)a3 reflectionType:(char)a4;
- (id)materializeAirScript:(void *)a3;
- (id)materializeBitCode:(void *)a3 atIndex:(unsigned int)a4;
- (id)materializeEntryForKey:(id *)a3 fileIndex:(void *)a4 containsEntry:(id)a5 addEntry:(id)a6;
- (id)materializeFromFileOffset:(unint64_t)a3 hash:(id *)a4;
- (id)materializeFromHash:(id *)a3 fileIndex:(void *)a4;
- (id)materializeReflectionBlock:(void *)a3;
- (id)newArchiveDataForKeyInternal:(id *)a3;
- (id)newArchiverIdWithBinaryKey:(id)a3 entry:(id)a4 srcArchiverId:(id)a5 functionType:(unint64_t)a6;
- (id)newComputePipelineDescriptorWithScript:(const PipelineScript *)a3 obj:(void *)a4 destinationArchive:(id)a5 error:(id *)a6;
- (id)newFunctionDescriptorWithAirScript:(const ConstantsSpecializationScript *)a3;
- (id)newMeshRenderPipelineDescriptorWithScript:(const PipelineScript *)a3 obj:(void *)a4 destinationArchive:(id)a5 error:(id *)a6;
- (id)newRecompiledFunctionWithAIRNTObject:(void *)a3 destinationArchive:(id)a4 error:(id *)a5;
- (id)newRecompiledFunctionWithAIRNTObject:(void *)a3 index:(unint64_t)a4 destinationArchive:(id)a5 error:(id *)a6;
- (id)newRenderPipelineDescriptorWithScript:(const PipelineScript *)a3 obj:(void *)a4 destinationArchive:(id)a5 error:(id *)a6;
- (id)newSpecializedFunctionWithHash:(id *)a3 libraryPath:(id)a4;
- (id)newStitchedLibraryWithKey:(id *)a3 descriptors:(const void *)a4;
- (id)newTileRenderPipelineDescriptorWithScript:(const PipelineScript *)a3 obj:(void *)a4 destinationArchive:(id)a5 error:(id *)a6;
- (id)recompileFunction:(id)a3 inLibrary:(id)a4 toArchive:(id)a5 toBinary:(BOOL)a6 error:(id *)a7;
- (unint64_t)options;
- (void)addArchiveEntryInternal:(id)a3 forKey:(id *)a4;
- (void)addBinaryEntryImpl:(id)a3 forKey:(id)a4;
- (void)addBinaryEntryInternal:(id)a3 forKey:(id)a4;
- (void)addStitchedLibraryWithKey:(id *)a3 descriptors:(const void *)a4 inputFunctions:(id)a5 library:(id)a6;
- (void)addStitchingInputsFunction:(id)a3 toEntry:(id)a4;
- (void)clearLibCache;
- (void)dealloc;
- (void)deallocContainers;
- (void)findProgramObjectForFunction:(id *)a3;
- (void)initMetalScriptWithArchive:(id)a3;
- (void)materializeAirNTAllForSlice:(const MTLLoaderSliceIdentifier *)a3 entryList:(shared_ptr<std::vector<machOEntry>>)a4;
- (void)materializeAirNTFromOnlineForSlice:(const MTLLoaderSliceIdentifier *)a3 entryList:(shared_ptr<std::vector<machOEntry>>)a4;
- (void)materializeAirNTSpecializedFunctions:(shared_ptr<std::vector<machOEntry>>)a3;
- (void)materializeAirNTStitchedFunctions:(shared_ptr<std::vector<machOEntry>>)a3;
- (void)materializeAll;
- (void)materializeAllAIRNTLegacy;
- (void)materializeLinkedBitcodes:(void *)a3 hashList:(void *)a4;
- (void)pipelineCollection;
- (void)preloadLibrariesInAirntObject:(void *)a3 error:(id *)a4;
- (void)programObjectForFunction:(id *)a3;
- (void)remoteInsertionEnd;
- (void)setMTLLinkedFunctions:(id)a3 LFS:(const LinkedFunctions *)a4 obj:(void *)a5 destinationArchive:(id)a6 error:(id *)a7;
- (void)setRecompilationTarget:(BOOL)a3;
- (void)updatePipelineWithPipelineArchiverId:(id)a3 key:(id)a4 functionType:(unint64_t)a5;
@end

@implementation _MTLBinaryArchive

- (BOOL)supportsAIRNT
{
  return !self->_isLegacy;
}

- (id)getBinaryDataForKey:(id)a3 reflectionType:(char)a4
{
  v4 = 0;
  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x3052000000;
  v12 = __Block_byref_object_copy_;
  v13 = __Block_byref_object_dispose_;
  uint64_t v14 = 0;
  if ((self->_options & 2) != 0)
  {
    queue = self->_queue;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __82___MTLBinaryArchive_MTLBinaryArchiveInternal__getBinaryDataForKey_reflectionType___block_invoke;
    v7[3] = &unk_1E521FE98;
    v7[5] = a3;
    v7[6] = &v9;
    v7[4] = self;
    char v8 = a4;
    dispatch_sync(queue, v7);
    v4 = (void *)v10[5];
  }
  _Block_object_dispose(&v9, 8);
  return v4;
}

- (void)preloadLibrariesInAirntObject:(void *)a3 error:(id *)a4
{
  if (*((void *)a3 + 1) != *(void *)a3)
  {
    unint64_t v7 = 0;
    do
    {
      [(_MTLBinaryArchive *)self getLibraryInArchiveAtPos:a3 atIndex:v7 error:a4];
      if (a4 && *a4) {
        break;
      }
      unint64_t v7 = (v7 + 1);
    }
    while (v7 < (uint64_t)(*((void *)a3 + 1) - *(void *)a3) >> 3);
  }
}

- (id)getLibraryInArchiveAtPos:(void *)a3 atIndex:(unsigned int)a4 error:(id *)a5
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  uint64_t v8 = a4;
  uint64_t v9 = *(void *)(*(void *)a3 + 8 * a4);
  if (*(void *)(v9 + 8))
  {
    size_t v33 = *((void *)a3 + 7) + *(void *)v9;
    v10 = std::__hash_table<std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,MTLStructTypeInternal *>>>::find<unsigned long>(&self->_libCache.__table_.__bucket_list_.__ptr_.__value_, &v33);
    if (v10) {
      return (id)v10[3];
    }
    subrange = dispatch_data_create_subrange((dispatch_data_t)[(MTLLoadedFileContentsWrapper *)self->_fileData dispatchData], v33, *(void *)(*(void *)(*(void *)a3 + 8 * v8) + 8));
    uint64_t v11 = MTLLibraryBuilder::newLibraryWithData(*((void *)self->_device + 53), (_MTLDevice *)self->_device, subrange, a5, v14, v15, v16, v17);
    __p[0] = &v33;
    std::__hash_table<std::__hash_value_type<unsigned long long,objc_object  {objcproto13MTLLibrarySPI}*>,std::__unordered_map_hasher<unsigned long long,objc_object  {objcproto13MTLLibrarySPI}*,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,objc_object  {objcproto13MTLLibrarySPI}*,std::equal_to,std::hash,true>,std::allocator<objc_object  {objcproto13MTLLibrarySPI}*>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::piecewise_construct_t const&<>>((uint64_t)&self->_libCache, &v33, (uint64_t)&std::piecewise_construct, (void **)__p)[3] = v11;
    v18 = [(_MTLLibrary *)v11 specializedFunctionHashes];
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    uint64_t v19 = [(NSArray *)v18 countByEnumeratingWithState:&v34 objects:__p count:16];
    if (v19)
    {
      uint64_t v20 = *(void *)v35;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v35 != v20) {
            objc_enumerationMutation(v18);
          }
          [*(id *)(*((void *)&v34 + 1) + 8 * i) getValue:v39];
          v38 = v39;
          std::__hash_table<std::__hash_value_type<MTLUINT256_t,objc_object  {objcproto13MTLLibrarySPI}*>,std::__unordered_map_hasher<MTLUINT256_t,objc_object  {objcproto13MTLLibrarySPI}*,UnorderedContainerHash,std::__unordered_map_hasher,true>,std::__unordered_map_equal<MTLUINT256_t,objc_object  {objcproto13MTLLibrarySPI}*,std::__unordered_map_hasher,std::__unordered_map_hasher,true>,std::allocator<objc_object  {objcproto13MTLLibrarySPI}*>>::__emplace_unique_key_args<MTLUINT256_t,std::piecewise_construct_t const&,std::tuple<MTLUINT256_t const&>,std::piecewise_construct_t const&<>>((uint64_t)&self->_specializedLibraryCache, v39, (uint64_t)&std::piecewise_construct, (_OWORD **)&v38)[6] = v11;
        }
        uint64_t v19 = [(NSArray *)v18 countByEnumeratingWithState:&v34 objects:__p count:16];
      }
      while (v19);
    }
    v22 = [(_MTLLibrary *)v11 stitchingFunctionHashes];
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    uint64_t v23 = [(NSArray *)v22 countByEnumeratingWithState:&v34 objects:__p count:16];
    if (v23)
    {
      p_stitchedLibraryCache = &self->_stitchedLibraryCache;
      uint64_t v25 = *(void *)v35;
      do
      {
        for (uint64_t j = 0; j != v23; ++j)
        {
          if (*(void *)v35 != v25) {
            objc_enumerationMutation(v22);
          }
          [*(id *)(*((void *)&v34 + 1) + 8 * j) getValue:v39];
          v38 = v39;
          std::__hash_table<std::__hash_value_type<MTLUINT256_t,objc_object  {objcproto13MTLLibrarySPI}*>,std::__unordered_map_hasher<MTLUINT256_t,objc_object  {objcproto13MTLLibrarySPI}*,UnorderedContainerHash,std::__unordered_map_hasher,true>,std::__unordered_map_equal<MTLUINT256_t,objc_object  {objcproto13MTLLibrarySPI}*,std::__unordered_map_hasher,std::__unordered_map_hasher,true>,std::allocator<objc_object  {objcproto13MTLLibrarySPI}*>>::__emplace_unique_key_args<MTLUINT256_t,std::piecewise_construct_t const&,std::tuple<MTLUINT256_t const&>,std::piecewise_construct_t const&<>>((uint64_t)p_stitchedLibraryCache, v39, (uint64_t)&std::piecewise_construct, (_OWORD **)&v38)[6] = v11;
        }
        uint64_t v23 = [(NSArray *)v22 countByEnumeratingWithState:&v34 objects:__p count:16];
      }
      while (v23);
    }
    dispatch_release(subrange);
    return v11;
  }
  std::string::basic_string[abi:ne180100]<0>(__p, *(char **)(v9 + 16));
  v12 = std::__hash_table<std::__hash_value_type<std::string,DataBlock>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,DataBlock>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,DataBlock>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,DataBlock>>>::find<std::string>(&self->_extLibCache.__table_.__bucket_list_.__ptr_.__value_, (unsigned __int8 *)__p);
  if (v12)
  {
    uint64_t v11 = (_MTLLibrary *)*((void *)v12 + 5);
    goto LABEL_23;
  }
  v31 = [(_MTLBinaryArchive *)self mapFileToMemoryWithPath:*(void *)(*(void *)(*(void *)a3 + 8 * v8) + 16)];
  if (v31)
  {
    uint64_t v11 = MTLLibraryBuilder::newLibraryWithData(*((void *)self->_device + 53), (_MTLDevice *)self->_device, v31, a5, v27, v28, v29, v30);
    *(void *)&long long v34 = __p;
    *((void *)std::__hash_table<std::__hash_value_type<std::string,objc_object  {objcproto13MTLLibrarySPI}*>,std::__unordered_map_hasher<std::string,objc_object  {objcproto13MTLLibrarySPI}*,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,objc_object  {objcproto13MTLLibrarySPI}*,std::equal_to,std::hash,true>,std::allocator<objc_object  {objcproto13MTLLibrarySPI}*>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::piecewise_construct_t const&<>>((uint64_t)&self->_extLibCache, (unsigned __int8 *)__p, (uint64_t)&std::piecewise_construct, (long long **)&v34)+ 5) = v11;
    dispatch_release(v31);
LABEL_23:
    if (v41 < 0) {
      operator delete(__p[0]);
    }
    return v11;
  }
  if (a5) {
    *a5 = newErrorWithMessage((NSString *)objc_msgSend(NSString, "stringWithFormat:", @"Failed to map library at path: %s", *(void *)(*(void *)(*(void *)a3 + 8 * v8) + 16)), MTLBinaryArchiveErrorInvalidFile);
  }
  if (v41 < 0) {
    operator delete(__p[0]);
  }
  return 0;
}

- (id)materializeAIRNTBlockForKey:(id)a3 reflectionType:(char)a4
{
  int v4 = a4;
  v30[4] = *MEMORY[0x1E4F143B8];
  BOOL alwaysReturnDriverReflection = self->_alwaysReturnDriverReflection;
  uint64_t v8 = (MTLHashKey *)[a3 getFunctionId];
  uint64_t v9 = std::__hash_table<std::__hash_value_type<MTLHashKey,std::tuple<unsigned long long,unsigned long long,unsigned long long,unsigned long long>>,std::__unordered_map_hasher<MTLHashKey,std::__hash_value_type<MTLHashKey,std::tuple<unsigned long long,unsigned long long,unsigned long long,unsigned long long>>,CompareFunctionIdHash,CompareFunctionIdHash,true>,std::__unordered_map_equal<MTLHashKey,std::__hash_value_type<MTLHashKey,std::tuple<unsigned long long,unsigned long long,unsigned long long,unsigned long long>>,CompareFunctionIdHash,CompareFunctionIdHash,true>,std::allocator<std::__hash_value_type<MTLHashKey,std::tuple<unsigned long long,unsigned long long,unsigned long long,unsigned long long>>>>::find<MTLHashKey>(&self->_executableFileIndex.__table_.__bucket_list_.__ptr_.__value_, v8);
  if (!v9) {
    return 0;
  }
  v10 = v9;
  char v11 = v4 | 2;
  if (!alwaysReturnDriverReflection) {
    char v11 = v4;
  }
  if (v4) {
    char v12 = v11;
  }
  else {
    char v12 = 0;
  }
  size_t v13 = v9[12];
  size_t v14 = v9[14];
  size_t offset = v9[15];
  size_t v29 = v9[13];
  subrange = dispatch_data_create_subrange((dispatch_data_t)[(MTLLoadedFileContentsWrapper *)self->_fileData dispatchData], v29, v13);
  if ((v12 & 4) == 0)
  {
    uint64_t v16 = 0;
    int v17 = 0;
    goto LABEL_14;
  }
  [(_MTLBinaryArchive *)self reflectionHashWithFunctionId:v8 binaryPos:v29];
  v18 = std::__hash_table<HashKey,KeyHashFunction,std::equal_to<HashKey>,std::allocator<HashKey>>::find<HashKey>(&self->_reflectionsIndex.__table_.__bucket_list_.__ptr_.__value_, (unint64_t *)v30);
  if (!v18) {
    goto LABEL_24;
  }
  size_t v19 = v18[8];
  if (v18[6] == v19)
  {
    uint64_t v16 = 0;
    int v17 = 1;
    goto LABEL_14;
  }
  size_t v20 = v18[9];
  if (!v20)
  {
LABEL_24:
    uint64_t v16 = subrange;
    if (!subrange) {
      return 0;
    }
LABEL_25:
    dispatch_release(v16);
    return 0;
  }
  uint64_t v16 = dispatch_data_create_subrange((dispatch_data_t)[(MTLLoadedFileContentsWrapper *)self->_fileData dispatchData], v19, v20);
  int v17 = 0;
LABEL_14:
  if ((v12 & 2) == 0)
  {
    v21 = 0;
    goto LABEL_19;
  }
  if (!v14)
  {
    if (subrange) {
      dispatch_release(subrange);
    }
    if (!v16) {
      return 0;
    }
    goto LABEL_25;
  }
  v22 = dispatch_data_create_subrange((dispatch_data_t)[(MTLLoadedFileContentsWrapper *)self->_fileData dispatchData], offset, v14);
  v21 = v22;
  if (v17)
  {
    dispatch_retain(v22);
    uint64_t v16 = v21;
  }
LABEL_19:
  if (subrange)
  {
    uint64_t v23 = MTLNewReflectionBlock(0, v21, v16);
    v24 = [[MTLBinaryEntry alloc] initWithData:subrange reflectionBlock:v23 binaryPosition:v29];
    dispatch_release(subrange);
    if (v23) {
      dispatch_release(v23);
    }
    uint64_t v25 = std::__hash_table<std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,MTLStructTypeInternal *>>>::find<unsigned long>(&self->_airntOffsetToIndexMap.__table_.__bucket_list_.__ptr_.__value_, &v29);
    if (v25) {
      uint64_t v26 = v25[3];
    }
    else {
      uint64_t v26 = -1;
    }
    [(MTLBinaryEntry *)v24 setIndex:v26];
    [(NSMutableDictionary *)self->_entries setObject:v24 forKey:a3];

    std::__hash_table<std::__hash_value_type<MTLHashKey,std::tuple<unsigned long long,unsigned long long,unsigned long long,unsigned long long>>,std::__unordered_map_hasher<MTLHashKey,std::__hash_value_type<MTLHashKey,std::tuple<unsigned long long,unsigned long long,unsigned long long,unsigned long long>>,CompareFunctionIdHash,CompareFunctionIdHash,true>,std::__unordered_map_equal<MTLHashKey,std::__hash_value_type<MTLHashKey,std::tuple<unsigned long long,unsigned long long,unsigned long long,unsigned long long>>,CompareFunctionIdHash,CompareFunctionIdHash,true>,std::allocator<std::__hash_value_type<MTLHashKey,std::tuple<unsigned long long,unsigned long long,unsigned long long,unsigned long long>>>>::remove(&self->_executableFileIndex.__table_.__bucket_list_.__ptr_.__value_, v10, (uint64_t)v30);
    std::unique_ptr<std::__hash_node<std::__hash_value_type<MTLHashKey,std::tuple<unsigned long long,unsigned long long,unsigned long long,unsigned long long>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<MTLHashKey,std::tuple<unsigned long long,unsigned long long,unsigned long long,unsigned long long>>,void *>>>>::reset[abi:ne180100](v30, 0);
    if (!v21) {
      goto LABEL_32;
    }
    goto LABEL_31;
  }
  v24 = 0;
  if (v21) {
LABEL_31:
  }
    dispatch_release(v21);
LABEL_32:
  if (v16) {
    dispatch_release(v16);
  }
  return v24;
}

- (BOOL)updateReflectionForEntry:(id)a3 binaryKey:(id)a4 requiredReflection:(char)a5
{
  v16[4] = *MEMORY[0x1E4F143B8];
  if (!a5 || (~[a3 reflectionFlags] & 6) == 0) {
    goto LABEL_14;
  }
  if (self->_alwaysReturnDriverReflection) {
    char v9 = a5 | 2;
  }
  else {
    char v9 = a5;
  }
  uint64_t v10 = [a4 getFunctionId];
  if (([a3 reflectionFlags] & 2) == 0 && (v9 & 2) != 0)
  {
    -[_MTLBinaryArchive reflectionHashWithFunctionId:binaryPos:](self, "reflectionHashWithFunctionId:binaryPos:", v10, [a3 binaryPosition]);
    char v11 = std::__hash_table<HashKey,KeyHashFunction,std::equal_to<HashKey>,std::allocator<HashKey>>::find<HashKey>(&self->_reflectionsIndex.__table_.__bucket_list_.__ptr_.__value_, v16);
    if (!v11) {
      return (char)v11;
    }
    dispatch_data_t subrange = dispatch_data_create_subrange((dispatch_data_t)[(MTLLoadedFileContentsWrapper *)self->_fileData dispatchData], v11[6], v11[7]);
    [a3 addReflectionWithData:subrange flag:2];
  }
  char v13 = [a3 reflectionFlags];
  LOBYTE(v11) = 1;
  if ((v9 & 4) != 0 && (v13 & 4) == 0)
  {
    -[_MTLBinaryArchive reflectionHashWithFunctionId:binaryPos:](self, "reflectionHashWithFunctionId:binaryPos:", v10, [a3 binaryPosition]);
    char v11 = std::__hash_table<HashKey,KeyHashFunction,std::equal_to<HashKey>,std::allocator<HashKey>>::find<HashKey>(&self->_reflectionsIndex.__table_.__bucket_list_.__ptr_.__value_, v16);
    if (v11)
    {
      dispatch_data_t v14 = dispatch_data_create_subrange((dispatch_data_t)[(MTLLoadedFileContentsWrapper *)self->_fileData dispatchData], v11[8], v11[9]);
      [a3 addReflectionWithData:v14 flag:4];

LABEL_14:
      LOBYTE(v11) = 1;
    }
  }
  return (char)v11;
}

- (id)newSpecializedFunctionWithHash:(id *)a3 libraryPath:(id)a4
{
  if (self->_isLegacy)
  {
    unint64_t v7 = [(_MTLBinaryArchive *)self newArchiveDataForKeyInternal:a3];
    if (v7)
    {
LABEL_3:
      char v11 = MTLLibraryBuilder::newLibraryWithData(*((void *)self->_device + 53), (_MTLDevice *)self->_device, v7, (uint64_t)a4, 0, v8, v9, v10);
      id v12 = [(_MTLLibrary *)v11 newSpecializedFunctionWithHash:a3 libraryPath:a4];
      if (!v12) {
        id v12 = [(_MTLLibrary *)v11 newFunctionWithName:[(NSArray *)[(_MTLLibrary *)v11 functionNames] objectAtIndex:0]];
      }

      return v12;
    }
    return 0;
  }
  char v13 = std::__hash_table<HashKey,KeyHashFunction,std::equal_to<HashKey>,std::allocator<HashKey>>::find<HashKey>(&self->_specializedLibraryCache.__table_.__bucket_list_.__ptr_.__value_, (unint64_t *)a3->var0);
  if (!v13)
  {
    uint64_t v16 = std::__hash_table<HashKey,KeyHashFunction,std::equal_to<HashKey>,std::allocator<HashKey>>::find<HashKey>(&self->_specializedFunctionByHash.__table_.__bucket_list_.__ptr_.__value_, (unint64_t *)a3->var0);
    if (v16)
    {
      unint64_t v7 = [(id)v16[6] data];
      goto LABEL_3;
    }
    return 0;
  }
  dispatch_data_t v14 = (void *)v13[6];

  return (id)[v14 newSpecializedFunctionWithHash:a3 libraryPath:a4];
}

- (void).cxx_destruct
{
  std::__hash_table<std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,MTLStructTypeInternal *>>>::~__hash_table((uint64_t)&self->_variantMap);
  std::__tree<unsigned long,flexbuffers::Builder::KeyOffsetCompare,std::allocator<unsigned long>>::destroy((uint64_t)&self->_recompilationArchiveFileIndex, (void *)self->_recompilationArchiveFileIndex.__tree_.__pair1_.__value_.__left_);
  std::__tree<unsigned long,flexbuffers::Builder::KeyOffsetCompare,std::allocator<unsigned long>>::destroy((uint64_t)&self->_legacySpecializedFunctionArchiveFileIndex, (void *)self->_legacySpecializedFunctionArchiveFileIndex.__tree_.__pair1_.__value_.__left_);
  std::__hash_table<std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,MTLStructTypeInternal *>>>::~__hash_table((uint64_t)&self->_legacySpecializedFunctions);
  cntrl = self->_uniqueBitcodeList.__cntrl_;
  if (cntrl) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)cntrl);
  }
  std::unique_ptr<MTLMetalScriptBuilder>::reset[abi:ne180100](&self->_mtlScriptBuilder.__ptr_.__value_, 0);
  std::unique_ptr<MTLPipelineCollection>::reset[abi:ne180100](&self->_pipelineCollection.__ptr_.__value_, 0);
  std::__hash_table<std::__hash_value_type<MTLHashKey,std::tuple<unsigned long long,unsigned long long,unsigned long long,unsigned long long>>,std::__unordered_map_hasher<MTLHashKey,std::__hash_value_type<MTLHashKey,std::tuple<unsigned long long,unsigned long long,unsigned long long,unsigned long long>>,CompareFunctionIdHash,CompareFunctionIdHash,true>,std::__unordered_map_equal<MTLHashKey,std::__hash_value_type<MTLHashKey,std::tuple<unsigned long long,unsigned long long,unsigned long long,unsigned long long>>,CompareFunctionIdHash,CompareFunctionIdHash,true>,std::allocator<std::__hash_value_type<MTLHashKey,std::tuple<unsigned long long,unsigned long long,unsigned long long,unsigned long long>>>>::~__hash_table((uint64_t)&self->_gpuArchiverIDMap);
  std::__hash_table<std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,MTLStructTypeInternal *>>>::~__hash_table((uint64_t)&self->_stitchedFunctionByHash);
  std::__hash_table<std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,MTLStructTypeInternal *>>>::~__hash_table((uint64_t)&self->_specializedFunctionByHash);
  std::__hash_table<std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>,std::__unordered_map_hasher<std::tuple<std::string,unsigned int,unsigned int>,std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>,key_hash,std::equal_to<std::tuple<std::string,unsigned int,unsigned int>>,true>,std::__unordered_map_equal<std::tuple<std::string,unsigned int,unsigned int>,std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>,std::equal_to<std::tuple<std::string,unsigned int,unsigned int>>,key_hash,true>,std::allocator<std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>>>::~__hash_table((uint64_t)&self->_extLibCache);
  std::__hash_table<std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,MTLStructTypeInternal *>>>::~__hash_table((uint64_t)&self->_stitchedLibraryCache);
  std::__hash_table<std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,MTLStructTypeInternal *>>>::~__hash_table((uint64_t)&self->_specializedLibraryCache);
  std::__hash_table<std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,MTLStructTypeInternal *>>>::~__hash_table((uint64_t)&self->_libCache);
  std::__hash_table<std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,MTLStructTypeInternal *>>>::~__hash_table((uint64_t)&self->_airntOffsetToIndexMap);
  begin = self->_airntExtraBinaryEntries.__begin_;
  if (begin)
  {
    self->_airntExtraBinaryEntries.__end_ = begin;
    operator delete(begin);
  }
  std::__tree<unsigned long,flexbuffers::Builder::KeyOffsetCompare,std::allocator<unsigned long>>::destroy((uint64_t)&self->_legacyPipelineFileIndex, (void *)self->_legacyPipelineFileIndex.__tree_.__pair1_.__value_.__left_);
  v5 = self->_airntPipelineList.__begin_;
  if (v5)
  {
    self->_airntPipelineList.__end_ = v5;
    operator delete(v5);
  }
  v6 = self->_airntFromDescriptorFunctionList.__begin_;
  if (v6)
  {
    self->_airntFromDescriptorFunctionList.__end_ = v6;
    operator delete(v6);
  }
  unint64_t v7 = self->_airntObjectList.__begin_;
  if (v7)
  {
    self->_airntObjectList.__end_ = v7;
    operator delete(v7);
  }
  std::__hash_table<std::__hash_value_type<unsigned long long,std::vector<MTLHashKey>>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,std::vector<MTLHashKey>>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,std::vector<MTLHashKey>>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,std::vector<MTLHashKey>>>>::~__hash_table((uint64_t)&self->_airntBinaryList);
  std::__hash_table<std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,MTLStructTypeInternal *>>>::~__hash_table((uint64_t)&self->_reflectionsIndex);

  std::__hash_table<std::__hash_value_type<MTLHashKey,std::tuple<unsigned long long,unsigned long long,unsigned long long,unsigned long long>>,std::__unordered_map_hasher<MTLHashKey,std::__hash_value_type<MTLHashKey,std::tuple<unsigned long long,unsigned long long,unsigned long long,unsigned long long>>,CompareFunctionIdHash,CompareFunctionIdHash,true>,std::__unordered_map_equal<MTLHashKey,std::__hash_value_type<MTLHashKey,std::tuple<unsigned long long,unsigned long long,unsigned long long,unsigned long long>>,CompareFunctionIdHash,CompareFunctionIdHash,true>,std::allocator<std::__hash_value_type<MTLHashKey,std::tuple<unsigned long long,unsigned long long,unsigned long long,unsigned long long>>>>::~__hash_table((uint64_t)&self->_executableFileIndex);
}

+ (BOOL)deserializeBinaryArchiveHeader:(id *)a3 fileData:(id)a4 device:(id)a5
{
  *(void *)&a3->var13.var1 = 0;
  *(_OWORD *)&a3->var9 = 0u;
  *(_OWORD *)&a3->var11 = 0u;
  *(_OWORD *)&a3->var5 = 0u;
  *(_OWORD *)&a3->var7 = 0u;
  *(_OWORD *)&a3->int var0 = 0u;
  *(_OWORD *)&a3->var3 = 0u;
  if (a5)
  {
    unint64_t v8 = +[MTLLoader sliceIDForDevice:andDriverVersion:]((uint64_t)MTLLoader, a5, 0);
    int v9 = v8;
    unint64_t v10 = HIDWORD(v8);
    uint64_t v11 = +[MTLLoader sliceIDForDescriptors]();
    MTLLoaderSliceIdentifier v12 = +[_MTLBinaryArchive sliceIDForSpecializedFunctionsForLLVMVersion:_MTLGetMTLCompilerLLVMVersionForDevice(a5)];
    int var0 = v12.var0;
    unint64_t v14 = HIDWORD(*(unint64_t *)&v12);
  }
  else
  {
    uint64_t v11 = +[MTLLoader sliceIDForDescriptors]();
    int v9 = 0;
    LODWORD(v10) = 0;
    int var0 = 0;
    LODWORD(v14) = 0;
  }
  v47[0] = MEMORY[0x1E4F143A8];
  v47[1] = 3221225472;
  v47[2] = __94___MTLBinaryArchive_MTLBinaryArchiveInternal__deserializeBinaryArchiveHeader_fileData_device___block_invoke;
  v47[3] = &unk_1E521FF88;
  v47[4] = a4;
  uint64_t v41 = 0;
  uint64_t v42 = &v41;
  uint64_t v43 = 0x3052000000;
  v44 = __Block_byref_object_copy_;
  v45 = __Block_byref_object_dispose_;
  id v46 = 0;
  id v46 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v33 = 0;
  long long v34 = (float *)&v33;
  uint64_t v35 = 0x5812000000;
  long long v36 = __Block_byref_object_copy__580;
  memset(v38, 0, sizeof(v38));
  long long v37 = __Block_byref_object_dispose__581;
  uint64_t v39 = 0;
  int v40 = 1065353216;
  v31[0] = 0;
  v31[1] = v31;
  v31[2] = 0x2020000000;
  int v32 = 0;
  *(void *)uint64_t v30 = 0;
  uint64_t v15 = _MTLGetMTLCompilerLLVMVersionForDevice(a5);
  _MTLGetMaxAIRAndLanguageVersions(v15, &v30[1], v30);
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __94___MTLBinaryArchive_MTLBinaryArchiveInternal__deserializeBinaryArchiveHeader_fileData_device___block_invoke_582;
  v23[3] = &unk_1E521FFB0;
  int v24 = v9;
  int v25 = v10;
  uint64_t v26 = v11;
  int v27 = var0;
  int v28 = v14;
  unsigned int v29 = v30[1];
  v23[4] = a4;
  v23[5] = v31;
  v23[6] = &v41;
  v23[7] = &v33;
  v23[8] = a3;
  char v16 = +[MTLLoader deserializeUniversalBinaryHeaderWithHandler:reader:bytes:]((uint64_t)MTLLoader, (uint64_t)v23, (uint64_t)v47, [a4 length]);
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __94___MTLBinaryArchive_MTLBinaryArchiveInternal__deserializeBinaryArchiveHeader_fileData_device___block_invoke_3;
  v22[3] = &unk_1E521FAC0;
  v22[4] = a4;
  v22[5] = a3;
  a3->var12 = +[MTLLoader machOConformsToAIRNTFormat:type:]((uint64_t)MTLLoader, (uint64_t)v22, 0);
  if (a3->var1)
  {
    if (a3->var0)
    {
      a3->var13.int var0 = v9;
      a3->var13.var1 = v10;
    }
    else
    {
      int v17 = (void *)[a5 getMostCompatibleArchitecture:v42[5]];
      if ([v17 cpuType])
      {
        a3->var13.int var0 = [v17 cpuType];
        a3->var13.var1 = [v17 cpuSubtype];
        v18 = v34;
        uint64_t v19 = [v17 cpuType];
        unint64_t v21 = (int)[v17 cpuSubtype] | (unint64_t)(v19 << 32);
        *(_OWORD *)&a3->var2 = *(_OWORD *)std::unordered_map<unsigned long long,+[_MTLBinaryArchive(MTLBinaryArchiveInternal) deserializeBinaryArchiveHeader:fileData:device:]::archSliceId,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<std::pair<unsigned long long const,+[_MTLBinaryArchive(MTLBinaryArchiveInternal) deserializeBinaryArchiveHeader:fileData:device:]::archSliceId>>>::operator[](v18 + 12, &v21);
      }
    }
  }
  [(id)v42[5] removeAllObjects];

  _Block_object_dispose(v31, 8);
  _Block_object_dispose(&v33, 8);
  std::__hash_table<std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,MTLStructTypeInternal *>>>::~__hash_table((uint64_t)&v38[8]);
  _Block_object_dispose(&v41, 8);
  return v16;
}

- (BOOL)loadFromURL:(id)a3 error:(id *)a4
{
  unint64_t v7 = (void *)MEMORY[0x18530C9F0](self, a2);
  if (a3
    && [a3 isFileURL]
    && ([a3 checkResourceIsReachableAndReturnError:a4] & 1) != 0)
  {
    if ([(_MTLBinaryArchive *)self archiveSkipsAIRValidation]
      || (uint64_t v8 = [(MTLDevice *)self->_device lookupRecompiledBinaryArchive:a3]) == 0)
    {
      int v10 = 0;
    }
    else
    {
      int v9 = (void *)v8;
      [(MTLDevice *)self->_device recordBinaryArchiveUsage:a3];
      a3 = v9;
      int v10 = 1;
    }
    unint64_t v14 = (MTLLoadedFile *)-[MTLLoader loadFileWithURL:error:errorDomain:invalidFileErrorCode:](*((void *)self->_device + 59), (NSURL *)a3, (NSError **)a4, &cfstr_Mtlbinaryarchi.isa, 1);
    self->_fileMapping = v14;
    if (v14)
    {
      uint64_t v15 = [[MTLLoadedFileContentsWrapper alloc] initWithData:[(MTLLoadedFile *)self->_fileMapping contents]];
      self->_fileData = v15;
      self->_internalArchiverId = 0;
      if (v15)
      {
        uint64_t v49 = 0;
        int v48 = 0;
        uint64_t v47 = 0;
        long long v45 = 0u;
        long long v46 = 0u;
        long long v43 = 0u;
        long long v44 = 0u;
        long long v41 = 0u;
        long long v42 = 0u;
        BOOL v16 = +[_MTLBinaryArchive deserializeBinaryArchiveHeader:&v41 fileData:self->_fileData device:self->_device];
        unint64_t v40 = 0;
        unint64_t v40 = +[MTLLoader sliceIDForDevice:legacyDriverVersion:airntDriverVersion:]((uint64_t)MTLLoader, self->_device, &v49, &v48);
        int v17 = BYTE8(v46);
        self->_isLegacy = BYTE8(v46) ^ 1;
        if (!v17)
        {
          unint64_t options = self->_options;
          LODWORD(v21) = options & 0xCF;
          self->_unint64_t options = options & 0xFFFFFFFFFFFFFFCFLL;
          if (!(BYTE1(v41) | BYTE8(v42) | v45)) {
            BOOL v16 = 0;
          }
          if ((options & 2) != 0 && (_BYTE)v41)
          {
            if (v16)
            {
              BOOL v16 = [(_MTLBinaryArchive *)self loadFileIndex:&self->_legacyPipelineFileIndex expectedSliceId:&v40 expectedVersion:v49 sliceOffset:*((void *)&v41 + 1)];
              unint64_t v21 = self->_options;
            }
            LOBYTE(v41) = v16;
          }
          if (v21)
          {
            if (BYTE8(v42))
            {
              BOOL v22 = v16
                 && +[_MTLBinaryArchive deserializeBinaryArchiveDescriptorMachO:&v41 fileData:self->_fileData];
              BYTE8(v42) = v22;
            }
            if ((void)v44) {
              [(MTLLoadedFileContentsWrapper *)self->_fileData bytes];
            }
          }
          if ((self->_options & 4) != 0)
          {
            if ((_BYTE)v45)
            {
              unint64_t v31 = v46;
              self->_specializedFunctionArchiveOffset = *((void *)&v45 + 1);
              self->_specializedFunctionArchiveBytes = v31;
              if (v16)
              {
                *(void *)&long long v38 = +[_MTLBinaryArchive sliceIDForSpecializedFunctionsForLLVMVersion:_MTLGetMTLCompilerLLVMVersionForDevice(self->_device)];
                BOOL v16 = [(_MTLBinaryArchive *)self loadFileIndex:&self->_legacySpecializedFunctionArchiveFileIndex expectedSliceId:&v38 expectedVersion:1 sliceOffset:self->_specializedFunctionArchiveOffset];
              }
            }
          }
LABEL_59:
          if (v16)
          {
LABEL_60:
            LOBYTE(a4) = 1;
            goto LABEL_61;
          }
          goto LABEL_62;
        }
        BOOL v18 = [(_MTLBinaryArchive *)self archiveSkipsAIRValidation];
        if (!(_BYTE)v41 && !HIDWORD(v46))
        {
          int v19 = 1;
          BOOL v16 = 1;
          goto LABEL_47;
        }
        long long v38 = 0uLL;
        int v39 = 0;
        v37[0] = MEMORY[0x1E4F143A8];
        v37[1] = 3221225472;
        v37[2] = __39___MTLBinaryArchive_loadFromURL_error___block_invoke;
        v37[3] = &unk_1E521FAC0;
        v37[4] = self;
        v37[5] = *((void *)&v41 + 1);
        unsigned int v23 = +[MTLLoader deserializeAIRNTToolsVersionForSlice:sliceOffset:version:reader:]((uint64_t)MTLLoader, (uint64_t)&v40, *((uint64_t *)&v41 + 1), (uint64_t)&v38, (uint64_t)v37);

        unsigned int v24 = 0;
        if (v23
          && (long long v35 = v38,
              int v36 = v39,
              unsigned int v24 = +[_MTLBinaryArchive archiveVersionCompatible:&v35 isMatchingSlice:v41 device:self->_device], v24 == 2))
        {
          uint64_t v25 = *((void *)&v41 + 1);
          uint64_t v26 = &v40;
          int v27 = self;
          BOOL v28 = v18;
        }
        else
        {
          int v29 = (HIDWORD(v46) != 0) & (LOBYTE(self->_options) >> 4);
          if (!v24) {
            int v29 = 0;
          }
          if ((v29 & v23) != 1)
          {
            int v19 = v29 ^ 1;
            int v30 = v29 ^ 1;
            goto LABEL_37;
          }
          uint64_t v26 = (unint64_t *)((char *)&v46 + 12);
          uint64_t v25 = *((void *)&v41 + 1);
          int v27 = self;
          BOOL v28 = 0;
        }
        int v30 = [(_MTLBinaryArchive *)v27 loadAirntBlocksForSlice:v26 sliceOffset:v25 skipAIRValidation:v28];
        int v19 = 0;
LABEL_37:
        if ((_BYTE)v45) {
          BOOL v16 = 0;
        }
        else {
          BOOL v16 = v30;
        }
        if ((_BYTE)v45 && v30) {
          BOOL v16 = [(_MTLBinaryArchive *)self loadAirSliceAtOffset:*((void *)&v45 + 1) sliceLength:(void)v46];
        }
        if (!(v10 | v18) && !self->_hasBuiltins && v16) {
          [(MTLDevice *)self->_device recordBinaryArchiveUsage:a3];
        }
LABEL_47:
        if (v19 && v16)
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
            -[_MTLBinaryArchive loadFromURL:error:](a3);
          }
          goto LABEL_60;
        }
        goto LABEL_59;
      }
    }
    else
    {
      self->_fileData = 0;
      self->_internalArchiverId = 0;
    }
LABEL_62:
    if (a4)
    {
      id v32 = newErrorWithMessage((NSString *)[NSString stringWithFormat:@"The file %@ has an invalid format.", a3], MTLBinaryArchiveErrorInvalidFile);
      *a4 = v32;
      id v33 = v32;
      LOBYTE(a4) = 0;
    }
    char v11 = 0;
    goto LABEL_65;
  }
  if (!a4)
  {
LABEL_61:
    char v11 = 1;
    goto LABEL_65;
  }
  char v11 = 1;
  id v12 = newErrorWithMessage(&cfstr_InvalidUrl.isa, MTLBinaryArchiveErrorInvalidFile);
  *a4 = v12;
  id v13 = v12;
  LOBYTE(a4) = 0;
LABEL_65:
  return a4 & v11;
}

- (BOOL)archiveSkipsAIRValidation
{
  if ((self->_options & 0x20) != 0)
  {
    LOBYTE(MainBundle) = 1;
  }
  else
  {
    MainBundle = CFBundleGetMainBundle();
    if (MainBundle)
    {
      MainBundle = (__CFBundle *)CFBundleGetIdentifier(MainBundle);
      if (MainBundle) {
        LOBYTE(MainBundle) = CFStringHasPrefix((CFStringRef)MainBundle, @"com.apple.") == 1;
      }
    }
  }
  return (char)MainBundle;
}

- (_MTLBinaryArchive)initWithOptions:(unint64_t)a3 device:(id)a4 url:(id)a5 error:(id *)a6
{
  v18.receiver = self;
  v18.super_class = (Class)_MTLBinaryArchive;
  int v10 = [(_MTLObjectWithLabel *)&v18 init];
  if (v10)
  {
    if (a6)
    {
      *a6 = 0;
      if (!a3)
      {
        *a6 = newErrorWithMessage(&cfstr_AtLeastOneOpti.isa, MTLBinaryArchiveErrorUnexpectedElement);
LABEL_26:

        return 0;
      }
    }
    else if (!a3)
    {
      goto LABEL_26;
    }
    v10->_device = (MTLDevice *)a4;
    v10->_unint64_t options = a3;
    v10->_internalArchiverId = 0;
    v10->_newBinary = 0;
    atomic_store(0, (unsigned __int8 *)&v10->_serializing);
    v10->_archiveIDInt = 0;
    v10->_absoluteOpenPath = 0;
    v10->_metalScript = 0;
    v10->_BOOL alwaysReturnDriverReflection = objc_msgSend((id)objc_msgSend(a4, "targetDeviceArchitecture"), "cpuType") == 16777235;
    v10->_hasBuiltins = 0;
    char v11 = (char *)operator new(0x40uLL);
    *((void *)v11 + 1) = 0;
    *((void *)v11 + 2) = 0;
    *(void *)char v11 = &unk_1ECAC4848;
    *(_OWORD *)(v11 + 40) = 0u;
    *(_OWORD *)(v11 + 24) = 0u;
    *((_DWORD *)v11 + 14) = 1065353216;
    cntrl = (std::__shared_weak_count *)v10->_uniqueBitcodeList.__cntrl_;
    v10->_uniqueBitcodeList.__ptr_ = v11 + 24;
    v10->_uniqueBitcodeList.__cntrl_ = (__shared_weak_count *)v11;
    if (cntrl) {
      std::__shared_weak_count::__release_shared[abi:ne180100](cntrl);
    }
    v10->_reloadingAfterSerialization = 0;
    BOOL v13 = _MTLUseAIRNTBinaryArchive(a4);
    unint64_t options = v10->_options;
    if (v13)
    {
      options |= 8uLL;
      v10->_unint64_t options = options;
    }
    v10->_isLegacy = (options & 8) == 0;
    if (options) {
      operator new();
    }
    if ((options & 2) != 0)
    {
      v10->_entries = (NSMutableDictionary *)objc_opt_new();
      v10->_asynEntries = (NSMutableDictionary *)objc_opt_new();
    }
    if ((a3 & 6) != 0)
    {
      v10->_queue = (OS_dispatch_queue *)dispatch_queue_create("MTLBinaryArchive", 0);
      v10->_serializeQueue = (OS_dispatch_queue *)dispatch_queue_create("MTLBinaryArchive_Serialize", 0);
      if (!v10->_queue) {
        goto LABEL_26;
      }
    }
    if (!v10->_isLegacy) {
      operator new();
    }
    if (a5)
    {
      -[_MTLBinaryArchive initWithOptions:device:url:error:]::shouldPrintBinaryArchiveLoadFromURL = _os_feature_enabled_impl();
      if (-[_MTLBinaryArchive initWithOptions:device:url:error:]::onceToken != -1) {
        dispatch_once(&-[_MTLBinaryArchive initWithOptions:device:url:error:]::onceToken, &__block_literal_global_3);
      }
      v10->_absoluteOpenPath = (NSString *)objc_msgSend([NSString alloc], "initWithString:", objc_msgSend(a5, "absoluteString"));
      BOOL v15 = [(_MTLBinaryArchive *)v10 loadFromURL:a5 error:a6];
      if (-[_MTLBinaryArchive initWithOptions:device:url:error:]::shouldPrintBinaryArchiveLoadFromURL
        && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        -[_MTLBinaryArchive initWithOptions:device:url:error:](a5);
        if (!a6)
        {
LABEL_25:
          if (!v15) {
            goto LABEL_26;
          }
          return v10;
        }
      }
      else if (!a6)
      {
        goto LABEL_25;
      }
      id v16 = *a6;
      goto LABEL_25;
    }
  }
  return v10;
}

- (BOOL)loadAirntBlocksForSlice:(const MTLLoaderSliceIdentifier *)a3 sliceOffset:(unint64_t)a4 skipAIRValidation:(BOOL)a5
{
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __75___MTLBinaryArchive_loadAirntBlocksForSlice_sliceOffset_skipAIRValidation___block_invoke;
  v13[3] = &unk_1E521FC70;
  v13[4] = self;
  v13[5] = a3;
  v13[6] = a4;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __75___MTLBinaryArchive_loadAirntBlocksForSlice_sliceOffset_skipAIRValidation___block_invoke_2;
  v11[3] = &unk_1E521FC98;
  v11[4] = self;
  v11[5] = a4;
  BOOL v12 = a5;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __75___MTLBinaryArchive_loadAirntBlocksForSlice_sliceOffset_skipAIRValidation___block_invoke_3;
  v10[3] = &unk_1E521FCC0;
  v10[4] = self;
  v7[5] = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __75___MTLBinaryArchive_loadAirntBlocksForSlice_sliceOffset_skipAIRValidation___block_invoke_4;
  v8[3] = &unk_1E521FCE8;
  BOOL v9 = a5;
  v8[4] = self;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __75___MTLBinaryArchive_loadAirntBlocksForSlice_sliceOffset_skipAIRValidation___block_invoke_296;
  v7[3] = &unk_1E521FAC0;
  v7[4] = self;
  BOOL result = +[MTLLoader deserializeAirntMachOContainerWithHandler:objectHandler:pipelineHandler:errorHandler:reader:]((uint64_t)MTLLoader, (uint64_t)v13, (uint64_t)v11, (uint64_t)v10, (uint64_t)v8, (uint64_t)v7);
  ++self->_internalArchiverId;
  return result;
}

+ (MTLLoaderSliceIdentifier)sliceIDForSpecializedFunctionsForLLVMVersion:(int)a3
{
  unsigned int v5 = 0;
  unsigned int v4 = 0;
  _MTLGetMaxAIRAndLanguageVersions(*(uint64_t *)&a3, &v5, &v4);
  return (MTLLoaderSliceIdentifier)+[MTLLoader sliceIDForAIRVersion:]((uint64_t)MTLLoader, v5);
}

+ (unsigned)archiveVersionCompatible:(MachOToolsVersion *)a3 isMatchingSlice:(BOOL)a4 device:(id)a5
{
  BOOL v6 = a4;
  int active_platform = dyld_get_active_platform();
  BOOL v9 = (void *)[MEMORY[0x1E4F28F80] processInfo];
  if (v9) {
    [v9 operatingSystemVersion];
  }
  if (active_platform != a3->var1) {
    return 5;
  }
  if (a3->var0) {
    return 6;
  }
  if ((objc_msgSend(a5, "isVendorSliceCompatibleWithDeploymentTarget:platform:sdkVersion:compilerPluginVersion:") & v6) != 0)return 2; {
  return 3;
  }
}

- (BOOL)loadAirSliceAtOffset:(unint64_t)a3 sliceLength:(unint64_t)a4
{
  v30[16] = *(void **)MEMORY[0x1E4F143B8];
  unint64_t v23 = a3;
  dispatch_data_t subrange = dispatch_data_create_subrange((dispatch_data_t)[(MTLLoadedFileContentsWrapper *)self->_fileData dispatchData], a3, a4);
  int v10 = MTLLibraryBuilder::newLibraryWithData(*((void *)self->_device + 53), (_MTLDevice *)self->_device, subrange, 0, v6, v7, v8, v9);
  if (v10)
  {
    v30[0] = &v23;
    std::__hash_table<std::__hash_value_type<unsigned long long,objc_object  {objcproto13MTLLibrarySPI}*>,std::__unordered_map_hasher<unsigned long long,objc_object  {objcproto13MTLLibrarySPI}*,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,objc_object  {objcproto13MTLLibrarySPI}*,std::equal_to,std::hash,true>,std::allocator<objc_object  {objcproto13MTLLibrarySPI}*>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::piecewise_construct_t const&<>>((uint64_t)&self->_libCache, &v23, (uint64_t)&std::piecewise_construct, v30)[3] = v10;
    char v11 = [(_MTLLibrary *)v10 specializedFunctionHashes];
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    uint64_t v12 = [(NSArray *)v11 countByEnumeratingWithState:&v24 objects:v30 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v25 != v14) {
            objc_enumerationMutation(v11);
          }
          [*(id *)(*((void *)&v24 + 1) + 8 * i) getValue:v29];
          BOOL v28 = v29;
          std::__hash_table<std::__hash_value_type<MTLUINT256_t,objc_object  {objcproto13MTLLibrarySPI}*>,std::__unordered_map_hasher<MTLUINT256_t,objc_object  {objcproto13MTLLibrarySPI}*,UnorderedContainerHash,std::__unordered_map_hasher,true>,std::__unordered_map_equal<MTLUINT256_t,objc_object  {objcproto13MTLLibrarySPI}*,std::__unordered_map_hasher,std::__unordered_map_hasher,true>,std::allocator<objc_object  {objcproto13MTLLibrarySPI}*>>::__emplace_unique_key_args<MTLUINT256_t,std::piecewise_construct_t const&,std::tuple<MTLUINT256_t const&>,std::piecewise_construct_t const&<>>((uint64_t)&self->_specializedLibraryCache, v29, (uint64_t)&std::piecewise_construct, (_OWORD **)&v28)[6] = v10;
        }
        uint64_t v13 = [(NSArray *)v11 countByEnumeratingWithState:&v24 objects:v30 count:16];
      }
      while (v13);
    }
    id v16 = [(_MTLLibrary *)v10 stitchingFunctionHashes];
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    uint64_t v17 = [(NSArray *)v16 countByEnumeratingWithState:&v24 objects:v30 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      p_stitchedLibraryCache = &self->_stitchedLibraryCache;
      uint64_t v20 = *(void *)v25;
      do
      {
        for (uint64_t j = 0; j != v18; ++j)
        {
          if (*(void *)v25 != v20) {
            objc_enumerationMutation(v16);
          }
          [*(id *)(*((void *)&v24 + 1) + 8 * j) getValue:v29];
          BOOL v28 = v29;
          std::__hash_table<std::__hash_value_type<MTLUINT256_t,objc_object  {objcproto13MTLLibrarySPI}*>,std::__unordered_map_hasher<MTLUINT256_t,objc_object  {objcproto13MTLLibrarySPI}*,UnorderedContainerHash,std::__unordered_map_hasher,true>,std::__unordered_map_equal<MTLUINT256_t,objc_object  {objcproto13MTLLibrarySPI}*,std::__unordered_map_hasher,std::__unordered_map_hasher,true>,std::allocator<objc_object  {objcproto13MTLLibrarySPI}*>>::__emplace_unique_key_args<MTLUINT256_t,std::piecewise_construct_t const&,std::tuple<MTLUINT256_t const&>,std::piecewise_construct_t const&<>>((uint64_t)p_stitchedLibraryCache, v29, (uint64_t)&std::piecewise_construct, (_OWORD **)&v28)[6] = v10;
        }
        uint64_t v18 = [(NSArray *)v16 countByEnumeratingWithState:&v24 objects:v30 count:16];
      }
      while (v18);
    }
  }
  dispatch_release(subrange);
  return v10 != 0;
}

- (void)dealloc
{
  queue = self->_queue;
  if (queue) {
    dispatch_release(queue);
  }
  serializeQueue = self->_serializeQueue;
  if (serializeQueue) {
    dispatch_release(serializeQueue);
  }
  [(_MTLBinaryArchive *)self deallocContainers];
  metalScript = self->_metalScript;
  if (metalScript) {
    dispatch_release(metalScript);
  }
  self->_metalScript = 0;
  for (uint64_t i = self->_variantMap.__table_.__p1_.__value_.__next_; i; uint64_t i = (void *)*i)
  {
    uint64_t v7 = (MTLProgramObject *)i[6];
    if (v7)
    {
      MTLProgramObject::~MTLProgramObject(v7);
      MEMORY[0x18530C140]();
    }
  }
  std::__hash_table<std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,MTLStructTypeInternal *>>>::clear(&self->_variantMap.__table_.__bucket_list_.__ptr_.__value_);

  v8.receiver = self;
  v8.super_class = (Class)_MTLBinaryArchive;
  [(_MTLObjectWithLabel *)&v8 dealloc];
}

- (void)deallocContainers
{
  std::__hash_table<std::__hash_value_type<MTLHashKey,std::tuple<unsigned long long,unsigned long long,unsigned long long,unsigned long long>>,std::__unordered_map_hasher<MTLHashKey,std::__hash_value_type<MTLHashKey,std::tuple<unsigned long long,unsigned long long,unsigned long long,unsigned long long>>,CompareFunctionIdHash,CompareFunctionIdHash,true>,std::__unordered_map_equal<MTLHashKey,std::__hash_value_type<MTLHashKey,std::tuple<unsigned long long,unsigned long long,unsigned long long,unsigned long long>>,CompareFunctionIdHash,CompareFunctionIdHash,true>,std::allocator<std::__hash_value_type<MTLHashKey,std::tuple<unsigned long long,unsigned long long,unsigned long long,unsigned long long>>>>::clear((uint64_t)&self->_executableFileIndex);
  for (uint64_t i = self->_legacySpecializedFunctions.__table_.__p1_.__value_.__next_; i; uint64_t i = (void *)*i)
  {
    unsigned int v4 = i[6];
    if (v4) {
      dispatch_release(v4);
    }
  }
  std::__hash_table<std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,MTLStructTypeInternal *>>>::clear(&self->_legacySpecializedFunctions.__table_.__bucket_list_.__ptr_.__value_);
  std::__tree<unsigned long,flexbuffers::Builder::KeyOffsetCompare,std::allocator<unsigned long>>::destroy((uint64_t)&self->_legacyPipelineFileIndex, (void *)self->_legacyPipelineFileIndex.__tree_.__pair1_.__value_.__left_);
  self->_legacyPipelineFileIndex.__tree_.__begin_node_ = &self->_legacyPipelineFileIndex.__tree_.__pair1_;
  self->_legacyPipelineFileIndex.__tree_.__pair3_.__value_ = 0;
  self->_legacyPipelineFileIndex.__tree_.__pair1_.__value_.__left_ = 0;
  fileMapping = self->_fileMapping;
  if (fileMapping) {
    -[MTLLoader releaseLoadedFile:](*((void *)self->_device + 59), fileMapping);
  }
  self->_fileMapping = 0;

  self->_fileData = 0;
  entries = self->_entries;
  if (entries) {

  }
  asynEntries = self->_asynEntries;
  if (asynEntries) {

  }
  self->_entries = 0;
  self->_asynEntries = 0;
  begin = self->_airntObjectList.__begin_;
  end = self->_airntObjectList.__end_;
  if (end != begin)
  {
    unint64_t v10 = 0;
    do
    {
      char v11 = begin[v10];
      if (v11)
      {
        MTLAirNTObject::~MTLAirNTObject(v11);
        MEMORY[0x18530C140]();
        begin = self->_airntObjectList.__begin_;
        end = self->_airntObjectList.__end_;
      }
      ++v10;
    }
    while (v10 < end - begin);
  }
  uint64_t v13 = self->_airntExtraBinaryEntries.__begin_;
  uint64_t v12 = self->_airntExtraBinaryEntries.__end_;
  if (v12 != v13)
  {
    uint64_t v14 = 0;
    unint64_t v15 = 0;
    do
    {
      id v16 = *(MTLHashKey **)((char *)v13 + v14);
      if (v16)
      {
        MTLHashKey::~MTLHashKey(v16);
        MEMORY[0x18530C140]();
        uint64_t v13 = self->_airntExtraBinaryEntries.__begin_;
        uint64_t v12 = self->_airntExtraBinaryEntries.__end_;
      }
      ++v15;
      v14 += 16;
    }
    while (v15 < (v12 - v13) >> 4);
  }
  for (uint64_t j = (id *)self->_stitchedFunctionByHash.__table_.__p1_.__value_.__next_; j; uint64_t j = (id *)*j)

  std::__hash_table<std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,MTLStructTypeInternal *>>>::clear(&self->_stitchedFunctionByHash.__table_.__bucket_list_.__ptr_.__value_);
  self->_airntExtraBinaryEntries.__end_ = self->_airntExtraBinaryEntries.__begin_;
  self->_airntObjectList.__end_ = self->_airntObjectList.__begin_;
  self->_airntFromDescriptorFunctionList.__end_ = self->_airntFromDescriptorFunctionList.__begin_;
  int v19 = self->_airntPipelineList.__begin_;
  uint64_t v18 = self->_airntPipelineList.__end_;
  if (v18 == v19)
  {
    int v19 = self->_airntPipelineList.__end_;
  }
  else
  {
    unint64_t v20 = 0;
    do
    {
      unint64_t v21 = v19[v20];
      if (v21)
      {
        MEMORY[0x18530C140](v21, 0x1022C405FDF33A9);
        int v19 = self->_airntPipelineList.__begin_;
        uint64_t v18 = self->_airntPipelineList.__end_;
      }
      ++v20;
    }
    while (v20 < v18 - v19);
  }
  self->_airntPipelineList.__end_ = v19;
  archiveIDInt = self->_archiveIDInt;
  if (archiveIDInt) {
    free(archiveIDInt);
  }
  ptr = self->_uniqueBitcodeList.__ptr_;
  if (ptr)
  {
    long long v24 = (uint64_t **)ptr[2];
    if (v24)
    {
      do
      {

        long long v24 = (uint64_t **)*v24;
      }
      while (v24);
      ptr = self->_uniqueBitcodeList.__ptr_;
    }
    std::__hash_table<std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,MTLStructTypeInternal *>>>::clear(ptr);
  }

  [(_MTLBinaryArchive *)self clearLibCache];
}

- (void)clearLibCache
{
  p_libCache = &self->_libCache;
  for (uint64_t i = (id *)self->_libCache.__table_.__p1_.__value_.__next_; i; uint64_t i = (id *)*i)

  std::__hash_table<std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,MTLStructTypeInternal *>>>::clear(p_libCache);
  for (uint64_t j = (const std::string::value_type *)self->_extLibCache.__table_.__p1_.__value_.__next_;
        j;
        uint64_t j = *(const std::string::value_type **)j)
  {
    if (j[39] < 0) {
      std::string::__init_copy_ctor_external(&__p, *((const std::string::value_type **)j + 2), *((void *)j + 3));
    }
    else {
      std::string __p = *(std::string *)(j + 16);
    }
    id v7 = (id)*((void *)j + 5);

    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p.__r_.__value_.__l.__data_);
    }
  }
  std::__hash_table<std::__hash_value_type<std::string,objc_object  {objcproto13MTLLibrarySPI}*>,std::__unordered_map_hasher<std::string,objc_object  {objcproto13MTLLibrarySPI}*,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,objc_object  {objcproto13MTLLibrarySPI}*,std::equal_to,std::hash,true>,std::allocator<objc_object  {objcproto13MTLLibrarySPI}*>>::clear((uint64_t)&self->_extLibCache);
  std::__hash_table<std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,MTLStructTypeInternal *>>>::clear(&self->_specializedLibraryCache.__table_.__bucket_list_.__ptr_.__value_);
  std::__hash_table<std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,MTLStructTypeInternal *>>>::clear(&self->_stitchedLibraryCache.__table_.__bucket_list_.__ptr_.__value_);
}

- (_MTLBinaryArchive)initWithDevice:(id)a3 descriptor:(id)a4 error:(id *)a5
{
  if (a4)
  {
    uint64_t v9 = [a4 options];
    uint64_t v10 = [a4 url];
    return [(_MTLBinaryArchive *)self initWithOptions:v9 device:a3 url:v10 error:a5];
  }
  else
  {
    if (a5) {
      *a5 = newErrorWithMessage(&cfstr_Mtlbinaryarchi_0.isa, MTLBinaryArchiveErrorUnexpectedElement);
    }

    return 0;
  }
}

- (id)mapFileToMemoryWithPath:(const char *)a3
{
  size_t size = 0;
  unsigned int v4 = [(_MTLBinaryArchive *)self mapFileToMemoryWithPath:a3 fileSize:&size];
  return dispatch_data_create(v4, size, (dispatch_queue_t)self->_queue, (dispatch_block_t)*MEMORY[0x1E4F143F8]);
}

- (const)mapFileToMemoryWithPath:(const char *)a3 fileSize:(unint64_t *)a4
{
  *a4 = 0;
  int v5 = open(a3, 0);
  int v6 = v5;
  if (v5 < 0)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[_MTLBinaryArchive mapFileToMemoryWithPath:fileSize:]();
    }
    goto LABEL_7;
  }
  if (fstat(v5, &v10))
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[_MTLBinaryArchive mapFileToMemoryWithPath:fileSize:]();
    }
LABEL_7:
    close(v6);
    return 0;
  }
  st_size_t size = v10.st_size;
  *a4 = v10.st_size;
  id v7 = (const char *)mmap(0, st_size, 1, 2, v6, 0);
  close(v6);
  if (v7 != (const char *)-1) {
    return v7;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    -[_MTLBinaryArchive mapFileToMemoryWithPath:fileSize:]();
  }
  return 0;
}

- (void)mapFileToMemoryWithPath:fileSize:.cold.1()
{
  __error();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_3_0(&dword_1826F6000, MEMORY[0x1E4F14500], v0, "Unable to open mach-O at path: %s  Error:%i", v1, v2, v3, v4, v5);
}

- (id).cxx_construct
{
  *((_OWORD *)self + 6) = 0u;
  *((_OWORD *)self + 7) = 0u;
  *((_DWORD *)self + 32) = 1065353216;
  *(_OWORD *)((char *)self + 136) = 0u;
  *(_OWORD *)((char *)self + 152) = 0u;
  *((_DWORD *)self + 42) = 1065353216;
  *((_OWORD *)self + 11) = 0u;
  *((_OWORD *)self + 12) = 0u;
  *((_DWORD *)self + 52) = 1065353216;
  *((void *)self + 28) = 0;
  *((void *)self + 29) = 0;
  *((void *)self + 27) = 0;
  *((void *)self + 31) = 0;
  *((void *)self + 32) = 0;
  *((void *)self + 30) = 0;
  *((void *)self + 34) = 0;
  *((void *)self + 35) = 0;
  *((void *)self + 33) = 0;
  *((void *)self + 38) = 0;
  *((void *)self + 37) = 0;
  *((void *)self + 36) = (char *)self + 296;
  *((void *)self + 40) = 0;
  *((void *)self + 41) = 0;
  *((void *)self + 39) = 0;
  *((_OWORD *)self + 21) = 0u;
  *((_OWORD *)self + 22) = 0u;
  *((_DWORD *)self + 92) = 1065353216;
  *((_OWORD *)self + 25) = 0u;
  *((_OWORD *)self + 26) = 0u;
  *((_DWORD *)self + 108) = 1065353216;
  *(_OWORD *)((char *)self + 440) = 0u;
  *(_OWORD *)((char *)self + 456) = 0u;
  *((_DWORD *)self + 118) = 1065353216;
  *((_OWORD *)self + 30) = 0u;
  *((_OWORD *)self + 31) = 0u;
  *((_DWORD *)self + 128) = 1065353216;
  *(_OWORD *)((char *)self + 520) = 0u;
  *(_OWORD *)((char *)self + 536) = 0u;
  *((_DWORD *)self + 138) = 1065353216;
  *((_OWORD *)self + 35) = 0u;
  *((_OWORD *)self + 36) = 0u;
  *((_DWORD *)self + 148) = 1065353216;
  *(_OWORD *)((char *)self + 600) = 0u;
  *(_OWORD *)((char *)self + 616) = 0u;
  *((_DWORD *)self + 158) = 1065353216;
  *(_OWORD *)((char *)self + 648) = 0u;
  *(_OWORD *)((char *)self + 664) = 0u;
  *((_DWORD *)self + 170) = 1065353216;
  *((void *)self + 86) = 0;
  *((void *)self + 87) = 0;
  *((void *)self + 88) = 0;
  *((void *)self + 89) = 0;
  *(_OWORD *)((char *)self + 728) = 0u;
  *(_OWORD *)((char *)self + 744) = 0u;
  *((_DWORD *)self + 190) = 1065353216;
  *((void *)self + 98) = 0;
  *((void *)self + 97) = 0;
  *((void *)self + 96) = (char *)self + 776;
  *((void *)self + 103) = 0;
  *((void *)self + 102) = 0;
  *((void *)self + 101) = (char *)self + 816;
  *((_OWORD *)self + 53) = 0u;
  *((_OWORD *)self + 54) = 0u;
  *((_DWORD *)self + 220) = 1065353216;
  return self;
}

- (id)newStitchedLibraryWithKey:(id *)a3 descriptors:(const void *)a4
{
  if (!self->_isLegacy)
  {
    uint64_t v33 = 0;
    long long v34 = &v33;
    uint64_t v35 = 0x2020000000;
    char v36 = 1;
    uint64_t v26 = 0;
    long long v27 = &v26;
    uint64_t v28 = 0x4812000000;
    int v29 = __Block_byref_object_copy__576;
    int v30 = __Block_byref_object_dispose__577;
    unint64_t v31 = &unk_1828FE28A;
    std::vector<objc_object  {objcproto11MTLFunction}*>::vector(__p, 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(*((void *)a4 + 1) - *(void *)a4) >> 3));
    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __85___MTLBinaryArchive_MTLBinaryArchiveInternal__newStitchedLibraryWithKey_descriptors___block_invoke;
    block[3] = &unk_1E521FEE8;
    block[4] = self;
    block[5] = &v26;
    block[6] = &v33;
    block[7] = a4;
    dispatch_sync(queue, block);
    if (*((unsigned char *)v34 + 24))
    {
      unint64_t v20 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:count:", 0);
      unint64_t v21 = (id *)v27[6];
      BOOL v22 = (id *)v27[7];
      while (v21 != v22)

      unint64_t v23 = MTLLibraryBuilder::newLibraryWithFunctionArray(*((void *)self->_device + 53), (_MTLDevice *)self->_device, v20, &v24, v16, v17, v18, v19);
    }
    else
    {
      unint64_t v23 = 0;
    }
    _Block_object_dispose(&v26, 8);
    if (__p[0])
    {
      __p[1] = __p[0];
      operator delete(__p[0]);
    }
    _Block_object_dispose(&v33, 8);
    return v23;
  }
  uint8_t v5 = -[_MTLBinaryArchive newArchiveDataForKeyInternal:](self, "newArchiveDataForKeyInternal:", a3, a4);
  if (!v5) {
    return 0;
  }
  stat v10 = v5;
  device = (_MTLDevice *)self->_device;
  uint64_t libraryBuilder = (uint64_t)device->_libraryBuilder;

  return MTLLibraryBuilder::newLibraryWithData(libraryBuilder, device, v10, 0, v6, v7, v8, v9);
}

+ (unsigned)archiveTypeAtURL:(id)a3 device:(id)a4 error:(id *)a5
{
  if (a5) {
    *a5 = 0;
  }
  uint64_t v8 = (void *)MEMORY[0x18530C9F0](a1, a2);
  uint64_t v9 = objc_opt_new();
  stat v10 = (MTLLoadedFile *)-[MTLLoader loadFileWithURL:error:errorDomain:invalidFileErrorCode:]((uint64_t)v9, (NSURL *)a3, (NSError **)a5, &cfstr_Mtlbinaryarchi.isa, 1);
  if (v9) {
    BOOL v11 = v10 == 0;
  }
  else {
    BOOL v11 = 1;
  }
  if (!v11)
  {
    uint64_t v13 = v10;
    uint64_t v14 = [[MTLLoadedFileContentsWrapper alloc] initWithData:[(MTLLoadedFile *)v10 contents]];
    uint64_t v28 = 0;
    long long v27 = 0u;
    memset(v26, 0, sizeof(v26));
    if (+[_MTLBinaryArchive deserializeBinaryArchiveHeader:v26 fileData:v14 device:a4])
    {
      uint64_t v25 = 0;
      int v24 = 0;
      unint64_t v23 = +[MTLLoader sliceIDForDevice:legacyDriverVersion:airntDriverVersion:]((uint64_t)MTLLoader, a4, &v25, &v24);
      if (!BYTE8(v27))
      {
        unsigned int v12 = 1;
        goto LABEL_20;
      }
      if (!LOBYTE(v26[0]) && !HIDWORD(v27))
      {
        unsigned int v12 = 4;
LABEL_20:

        -[MTLLoader releaseLoadedFile:]((uint64_t)v9, v13);
        goto LABEL_21;
      }
      long long v21 = 0uLL;
      int v22 = 0;
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __51___MTLBinaryArchive_archiveTypeAtURL_device_error___block_invoke;
      v20[3] = &unk_1E521FAC0;
      v20[4] = v14;
      v20[5] = *((void *)&v26[0] + 1);
      unsigned __int8 v15 = +[MTLLoader deserializeAIRNTToolsVersionForSlice:sliceOffset:version:reader:]((uint64_t)MTLLoader, (uint64_t)&v23, *((uint64_t *)&v26[0] + 1), (uint64_t)&v21, (uint64_t)v20);

      if (v15)
      {
        long long v18 = v21;
        int v19 = v22;
        unsigned int v12 = +[_MTLBinaryArchive archiveVersionCompatible:&v18 isMatchingSlice:LOBYTE(v26[0]) device:a4];
        goto LABEL_20;
      }
      if (a5)
      {
        unsigned int v12 = 0;
        *a5 = newErrorWithMessage((NSString *)[NSString stringWithFormat:@"The file %@ has an invalid format.", a3], MTLBinaryArchiveErrorInvalidFile);
        goto LABEL_20;
      }
    }
    unsigned int v12 = 0;
    goto LABEL_20;
  }
  unsigned int v12 = 0;
LABEL_21:

  if (a5 && *a5) {
    id v16 = *a5;
  }
  return v12;
}

- (id)materializeFromFileOffset:(unint64_t)a3 hash:(id *)a4
{
  uint64_t v29 = 0;
  int v30 = &v29;
  uint64_t v31 = 0x2020000000;
  uint64_t v32 = 0;
  uint64_t v25 = 0;
  uint64_t v26 = &v25;
  uint64_t v27 = 0x2020000000;
  uint64_t v28 = 0;
  uint64_t v19 = 0;
  unint64_t v20 = &v19;
  uint64_t v21 = 0x3052000000;
  int v22 = __Block_byref_object_copy_;
  unint64_t v23 = __Block_byref_object_dispose_;
  uint64_t v24 = 0;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3052000000;
  id v16 = __Block_byref_object_copy_;
  uint64_t v17 = __Block_byref_object_dispose_;
  uint64_t v18 = 0;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __52___MTLBinaryArchive_materializeFromFileOffset_hash___block_invoke;
  v12[3] = &unk_1E521FAE8;
  v12[4] = &v29;
  v12[5] = &v25;
  v12[8] = a3;
  v12[9] = a4;
  v12[6] = &v19;
  v12[7] = &v13;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __52___MTLBinaryArchive_materializeFromFileOffset_hash___block_invoke_2;
  v11[3] = &unk_1E521FAC0;
  v11[4] = self;
  v11[5] = a3;
  if (+[MTLLoader deserializeMachOWrapperWithType:payloadHandler:reader:]((uint64_t)MTLLoader, 0, (uint64_t)v12, (uint64_t)v11)&& (v5 = v26[3]) != 0&& (dispatch_data_t subrange = dispatch_data_create_subrange((dispatch_data_t)[(MTLLoadedFileContentsWrapper *)self->_fileData dispatchData], v30[3], v5)) != 0)
  {
    uint64_t v7 = subrange;
    uint64_t v8 = [MTLBinaryEntry alloc];
    uint64_t v9 = [(MTLBinaryEntry *)v8 initWithData:v7 importedSymbols:v14[5] importedLibraries:v20[5]];
    dispatch_release(v7);
  }
  else
  {
    uint64_t v9 = 0;
  }

  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v29, 8);
  return v9;
}

- (void)materializeAllAIRNTLegacy
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  for (uint64_t i = (char *)self->_executableFileIndex.__table_.__p1_.__value_.__next_; i; uint64_t i = *(char **)i)
  {
    MTLHashKey::MTLHashKey(&v6, (const MTLHashKey *)(i + 16));
    long long v4 = *((_OWORD *)i + 7);
    long long v7 = *((_OWORD *)i + 6);
    long long v8 = v4;
    size_t v5 = [[MTLBinaryKey alloc] initWithHash:&v6];
    if (![(NSMutableDictionary *)self->_entries objectForKey:v5]) {
      [(_MTLBinaryArchive *)self materializeAIRNTBlockForKey:v5 reflectionType:0];
    }

    MTLHashKey::~MTLHashKey(&v6);
  }
}

- (void)materializeAll
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  p_legacyPipelineFileIndex = &self->_legacyPipelineFileIndex;
  p_pair1 = &self->_legacyPipelineFileIndex.__tree_.__pair1_;
  begin_node = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<MTLUINT256_t, std::pair<unsigned int, unsigned long long>>, void *>>> *)self->_legacyPipelineFileIndex.__tree_.__begin_node_;
  if (begin_node != &self->_legacyPipelineFileIndex.__tree_.__pair1_)
  {
    do
    {
      id v6 = [(_MTLBinaryArchive *)self materializeFromFileOffset:begin_node[9].__value_.__left_ hash:v12];
      if (v6)
      {
        MTLHashKey::MTLHashKey((uint64_t)&v11, (uint64_t)v12);
        long long v7 = [[MTLBinaryKey alloc] initWithHash:&v11];
        if (![(NSMutableDictionary *)self->_entries objectForKey:v7]) {
          [(NSMutableDictionary *)self->_entries setObject:v6 forKey:v7];
        }

        MTLHashKey::~MTLHashKey(&v11);
      }
      left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<MTLUINT256_t, std::pair<unsigned int, unsigned long long>>, void *>>> *)begin_node[1].__value_.__left_;
      if (left)
      {
        do
        {
          uint64_t v9 = left;
          left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<MTLUINT256_t, std::pair<unsigned int, unsigned long long>>, void *>>> *)left->__value_.__left_;
        }
        while (left);
      }
      else
      {
        do
        {
          uint64_t v9 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<MTLUINT256_t, std::pair<unsigned int, unsigned long long>>, void *>>> *)begin_node[2].__value_.__left_;
          BOOL v10 = v9->__value_.__left_ == begin_node;
          begin_node = v9;
        }
        while (!v10);
      }
      begin_node = v9;
    }
    while (v9 != p_pair1);
  }
  std::__tree<unsigned long,flexbuffers::Builder::KeyOffsetCompare,std::allocator<unsigned long>>::destroy((uint64_t)p_legacyPipelineFileIndex, (void *)p_legacyPipelineFileIndex->__tree_.__pair1_.__value_.__left_);
  p_legacyPipelineFileIndex->__tree_.__pair1_.__value_.__left_ = 0;
  p_legacyPipelineFileIndex->__tree_.__pair3_.__value_ = 0;
  p_legacyPipelineFileIndex->__tree_.__begin_node_ = p_pair1;
}

- (id)materializeFromHash:(id *)a3 fileIndex:(void *)a4
{
  long long v7 = (unsigned int *)std::__tree<std::__value_type<MTLUINT256_t,std::pair<unsigned int,unsigned long long>>,std::__map_value_compare<MTLUINT256_t,std::__value_type<MTLUINT256_t,std::pair<unsigned int,unsigned long long>>,CompareHash,true>,std::allocator<std::__value_type<MTLUINT256_t,std::pair<unsigned int,unsigned long long>>>>::lower_bound[abi:ne180100]<MTLUINT256_t>((uint64_t)a4, (unint64_t *)a3->var0);
  if ((char *)a4 + 8 == (char *)v7) {
    return 0;
  }
  long long v8 = (uint64_t *)v7;
  if (memcmp(v7 + 8, a3, v7[16])) {
    return 0;
  }
  id v10 = [(_MTLBinaryArchive *)self materializeFromFileOffset:v8[9] hash:a3];
  std::__tree<std::__value_type<MTLUINT256_t,std::pair<unsigned int,unsigned long long>>,std::__map_value_compare<MTLUINT256_t,std::__value_type<MTLUINT256_t,std::pair<unsigned int,unsigned long long>>,CompareHash,true>,std::allocator<std::__value_type<MTLUINT256_t,std::pair<unsigned int,unsigned long long>>>>::__remove_node_pointer((uint64_t **)a4, v8);
  operator delete(v8);
  return v10;
}

- (id)formattedDescription:(unint64_t)a3
{
  uint64_t v7 = 0;
  long long v8 = &v7;
  uint64_t v9 = 0x3052000000;
  id v10 = __Block_byref_object_copy_;
  MTLHashKey v11 = __Block_byref_object_dispose_;
  uint64_t v12 = 0;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42___MTLBinaryArchive_formattedDescription___block_invoke;
  block[3] = &unk_1E521FB10;
  block[5] = &v7;
  block[6] = a3;
  block[4] = self;
  queue = self->_queue;
  if (queue) {
    dispatch_sync(queue, block);
  }
  else {
    __42___MTLBinaryArchive_formattedDescription___block_invoke((uint64_t)block);
  }
  long long v4 = (void *)v8[5];
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (NSString)description
{
  return (NSString *)[(_MTLBinaryArchive *)self formattedDescription:0];
}

- (BOOL)storeComputePipelineDescriptor:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (self->_isLegacy
    || a3
    && (self->_options & 0x40) == 0
    && (MTLMetalScriptBuilder::addComputePipelineWithDescriptor(self->_mtlScriptBuilder.__ptr_.__value_, (MTLComputePipelineDescriptor *)a3), self->_isLegacy))
  {
    if (self->_options)
    {
      long long v14 = 0u;
      long long v15 = 0u;
      long long v12 = 0u;
      long long v13 = 0u;
      size_t v5 = objc_msgSend(a3, "preloadedLibraries", 0);
      uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6)
      {
        uint64_t v7 = v6;
        uint64_t v8 = *(void *)v13;
        do
        {
          uint64_t v9 = 0;
          do
          {
            if (*(void *)v13 != v8) {
              objc_enumerationMutation(v5);
            }
            MTLPipelineCollection::addDynamicLibraryData((uint64_t)self->_pipelineCollection.__ptr_.__value_, self->_collectArchives, !self->_collectArchives, *(void *)(*((void *)&v12 + 1) + 8 * v9++));
          }
          while (v7 != v9);
          uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
        }
        while (v7);
      }
      id v10 = (MTLLibraryData *)objc_msgSend((id)objc_msgSend(a3, "computeFunction"), "libraryData");
      MTLPipelineCollection::addLibraryData(self->_pipelineCollection.__ptr_.__value_, self->_collectArchives, !self->_collectArchives, v10);
      MTLPipelineCollection::addFunction((uint64_t)self->_pipelineCollection.__ptr_.__value_, [a3 computeFunction], (uint64_t)v10, 0);
      MTLPipelineCollection::addComputePipeline(self->_pipelineCollection.__ptr_.__value_, (MTLComputePipelineDescriptor *)a3);
    }
  }
  return 1;
}

- (BOOL)storeRenderPipelineDescriptor:(id)a3
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  if (self->_isLegacy
    || a3
    && (self->_options & 0x40) == 0
    && (MTLMetalScriptBuilder::addRenderPipelineWithDescriptor(self->_mtlScriptBuilder.__ptr_.__value_, (MTLRenderPipelineDescriptor *)a3), self->_isLegacy))
  {
    if (self->_options)
    {
      long long v44 = 0u;
      long long v45 = 0u;
      long long v42 = 0u;
      long long v43 = 0u;
      size_t v5 = (void *)[a3 vertexPreloadedLibraries];
      uint64_t v6 = [v5 countByEnumeratingWithState:&v42 objects:v49 count:16];
      if (v6)
      {
        uint64_t v7 = v6;
        uint64_t v8 = *(void *)v43;
        do
        {
          uint64_t v9 = 0;
          do
          {
            if (*(void *)v43 != v8) {
              objc_enumerationMutation(v5);
            }
            MTLPipelineCollection::addDynamicLibraryData((uint64_t)self->_pipelineCollection.__ptr_.__value_, self->_collectArchives, !self->_collectArchives, *(void *)(*((void *)&v42 + 1) + 8 * v9++));
          }
          while (v7 != v9);
          uint64_t v7 = [v5 countByEnumeratingWithState:&v42 objects:v49 count:16];
        }
        while (v7);
      }
      long long v40 = 0u;
      long long v41 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      id v10 = (void *)[a3 fragmentPreloadedLibraries];
      uint64_t v11 = [v10 countByEnumeratingWithState:&v38 objects:v48 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v39;
        do
        {
          uint64_t v14 = 0;
          do
          {
            if (*(void *)v39 != v13) {
              objc_enumerationMutation(v10);
            }
            MTLPipelineCollection::addDynamicLibraryData((uint64_t)self->_pipelineCollection.__ptr_.__value_, self->_collectArchives, !self->_collectArchives, *(void *)(*((void *)&v38 + 1) + 8 * v14++));
          }
          while (v12 != v14);
          uint64_t v12 = [v10 countByEnumeratingWithState:&v38 objects:v48 count:16];
        }
        while (v12);
      }
      long long v36 = 0u;
      long long v37 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      long long v15 = (void *)[a3 objectPreloadedLibraries];
      uint64_t v16 = [v15 countByEnumeratingWithState:&v34 objects:v47 count:16];
      if (v16)
      {
        uint64_t v17 = v16;
        uint64_t v18 = *(void *)v35;
        do
        {
          uint64_t v19 = 0;
          do
          {
            if (*(void *)v35 != v18) {
              objc_enumerationMutation(v15);
            }
            MTLPipelineCollection::addDynamicLibraryData((uint64_t)self->_pipelineCollection.__ptr_.__value_, self->_collectArchives, !self->_collectArchives, *(void *)(*((void *)&v34 + 1) + 8 * v19++));
          }
          while (v17 != v19);
          uint64_t v17 = [v15 countByEnumeratingWithState:&v34 objects:v47 count:16];
        }
        while (v17);
      }
      long long v32 = 0u;
      long long v33 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      unint64_t v20 = objc_msgSend(a3, "meshPreloadedLibraries", 0);
      uint64_t v21 = [v20 countByEnumeratingWithState:&v30 objects:v46 count:16];
      if (v21)
      {
        uint64_t v22 = v21;
        uint64_t v23 = *(void *)v31;
        do
        {
          uint64_t v24 = 0;
          do
          {
            if (*(void *)v31 != v23) {
              objc_enumerationMutation(v20);
            }
            MTLPipelineCollection::addDynamicLibraryData((uint64_t)self->_pipelineCollection.__ptr_.__value_, self->_collectArchives, !self->_collectArchives, *(void *)(*((void *)&v30 + 1) + 8 * v24++));
          }
          while (v22 != v24);
          uint64_t v22 = [v20 countByEnumeratingWithState:&v30 objects:v46 count:16];
        }
        while (v22);
      }
      uint64_t v25 = (MTLLibraryData *)objc_msgSend((id)objc_msgSend(a3, "vertexFunction"), "libraryData");
      uint64_t v26 = (MTLLibraryData *)objc_msgSend((id)objc_msgSend(a3, "fragmentFunction"), "libraryData");
      MTLPipelineCollection::addLibraryData(self->_pipelineCollection.__ptr_.__value_, self->_collectArchives, !self->_collectArchives, v25);
      MTLPipelineCollection::addLibraryData(self->_pipelineCollection.__ptr_.__value_, self->_collectArchives, !self->_collectArchives, v26);
      MTLPipelineCollection::addFunction((uint64_t)self->_pipelineCollection.__ptr_.__value_, [a3 vertexFunction], (uint64_t)v25, 0);
      MTLPipelineCollection::addFunction((uint64_t)self->_pipelineCollection.__ptr_.__value_, [a3 fragmentFunction], (uint64_t)v26, 0);
      uint64_t v27 = (MTLLibraryData *)objc_msgSend((id)objc_msgSend(a3, "objectFunction"), "libraryData");
      uint64_t v28 = (MTLLibraryData *)objc_msgSend((id)objc_msgSend(a3, "meshFunction"), "libraryData");
      MTLPipelineCollection::addLibraryData(self->_pipelineCollection.__ptr_.__value_, self->_collectArchives, !self->_collectArchives, v27);
      MTLPipelineCollection::addLibraryData(self->_pipelineCollection.__ptr_.__value_, self->_collectArchives, !self->_collectArchives, v28);
      MTLPipelineCollection::addFunction((uint64_t)self->_pipelineCollection.__ptr_.__value_, [a3 objectFunction], (uint64_t)v27, 0);
      MTLPipelineCollection::addFunction((uint64_t)self->_pipelineCollection.__ptr_.__value_, [a3 meshFunction], (uint64_t)v28, 0);
      MTLPipelineCollection::addRenderPipeline(self->_pipelineCollection.__ptr_.__value_, (MTLRenderPipelineDescriptor *)a3);
    }
  }
  return 1;
}

- (BOOL)storeTileRenderPipelineDescriptor:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (self->_isLegacy
    || a3
    && (self->_options & 0x40) == 0
    && (MTLMetalScriptBuilder::addTileRenderPipelineWithDescriptor(self->_mtlScriptBuilder.__ptr_.__value_, (MTLTileRenderPipelineDescriptor *)a3), self->_isLegacy))
  {
    if (self->_options)
    {
      long long v14 = 0u;
      long long v15 = 0u;
      long long v12 = 0u;
      long long v13 = 0u;
      size_t v5 = objc_msgSend(a3, "preloadedLibraries", 0);
      uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6)
      {
        uint64_t v7 = v6;
        uint64_t v8 = *(void *)v13;
        do
        {
          uint64_t v9 = 0;
          do
          {
            if (*(void *)v13 != v8) {
              objc_enumerationMutation(v5);
            }
            MTLPipelineCollection::addDynamicLibraryData((uint64_t)self->_pipelineCollection.__ptr_.__value_, self->_collectArchives, !self->_collectArchives, *(void *)(*((void *)&v12 + 1) + 8 * v9++));
          }
          while (v7 != v9);
          uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
        }
        while (v7);
      }
      id v10 = (MTLLibraryData *)objc_msgSend((id)objc_msgSend(a3, "tileFunction"), "libraryData");
      MTLPipelineCollection::addLibraryData(self->_pipelineCollection.__ptr_.__value_, self->_collectArchives, !self->_collectArchives, v10);
      MTLPipelineCollection::addFunction((uint64_t)self->_pipelineCollection.__ptr_.__value_, [a3 tileFunction], (uint64_t)v10, 0);
      MTLPipelineCollection::addTileRenderPipeline(self->_pipelineCollection.__ptr_.__value_, (MTLTileRenderPipelineDescriptor *)a3);
    }
  }
  return 1;
}

- (BOOL)storeMeshRenderPipelineDescriptor:(id)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  if (self->_options)
  {
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    size_t v5 = (void *)[a3 objectPreloadedLibraries];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v32 objects:v38 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v33;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v33 != v8) {
            objc_enumerationMutation(v5);
          }
          MTLPipelineCollection::addDynamicLibraryData((uint64_t)self->_pipelineCollection.__ptr_.__value_, self->_collectArchives, !self->_collectArchives, *(void *)(*((void *)&v32 + 1) + 8 * v9++));
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v32 objects:v38 count:16];
      }
      while (v7);
    }
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v10 = (void *)[a3 meshPreloadedLibraries];
    uint64_t v11 = [v10 countByEnumeratingWithState:&v28 objects:v37 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v29;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v29 != v13) {
            objc_enumerationMutation(v10);
          }
          MTLPipelineCollection::addDynamicLibraryData((uint64_t)self->_pipelineCollection.__ptr_.__value_, self->_collectArchives, !self->_collectArchives, *(void *)(*((void *)&v28 + 1) + 8 * v14++));
        }
        while (v12 != v14);
        uint64_t v12 = [v10 countByEnumeratingWithState:&v28 objects:v37 count:16];
      }
      while (v12);
    }
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v15 = objc_msgSend(a3, "fragmentPreloadedLibraries", 0);
    uint64_t v16 = [v15 countByEnumeratingWithState:&v24 objects:v36 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v25;
      do
      {
        uint64_t v19 = 0;
        do
        {
          if (*(void *)v25 != v18) {
            objc_enumerationMutation(v15);
          }
          MTLPipelineCollection::addDynamicLibraryData((uint64_t)self->_pipelineCollection.__ptr_.__value_, self->_collectArchives, !self->_collectArchives, *(void *)(*((void *)&v24 + 1) + 8 * v19++));
        }
        while (v17 != v19);
        uint64_t v17 = [v15 countByEnumeratingWithState:&v24 objects:v36 count:16];
      }
      while (v17);
    }
    unint64_t v20 = (MTLLibraryData *)objc_msgSend((id)objc_msgSend(a3, "objectFunction"), "libraryData");
    uint64_t v21 = (MTLLibraryData *)objc_msgSend((id)objc_msgSend(a3, "meshFunction"), "libraryData");
    uint64_t v22 = (MTLLibraryData *)objc_msgSend((id)objc_msgSend(a3, "fragmentFunction"), "libraryData");
    MTLPipelineCollection::addLibraryData(self->_pipelineCollection.__ptr_.__value_, self->_collectArchives, !self->_collectArchives, v20);
    MTLPipelineCollection::addLibraryData(self->_pipelineCollection.__ptr_.__value_, self->_collectArchives, !self->_collectArchives, v21);
    MTLPipelineCollection::addLibraryData(self->_pipelineCollection.__ptr_.__value_, self->_collectArchives, !self->_collectArchives, v22);
    MTLPipelineCollection::addFunction((uint64_t)self->_pipelineCollection.__ptr_.__value_, [a3 objectFunction], (uint64_t)v20, 0);
    MTLPipelineCollection::addFunction((uint64_t)self->_pipelineCollection.__ptr_.__value_, [a3 meshFunction], (uint64_t)v21, 0);
    MTLPipelineCollection::addFunction((uint64_t)self->_pipelineCollection.__ptr_.__value_, [a3 fragmentFunction], (uint64_t)v22, 0);
    MTLPipelineCollection::addMeshRenderPipeline(self->_pipelineCollection.__ptr_.__value_, (MTLMeshRenderPipelineDescriptor *)a3);
  }
  return 1;
}

- (BOOL)addComputePipelineFunctionsWithDescriptor:(id)a3 error:(id *)a4
{
  if (a3)
  {
    return -[_MTLBinaryArchive addComputePipelineFunctionsWithDescriptor:options:error:](self, "addComputePipelineFunctionsWithDescriptor:options:error:");
  }
  else
  {
    if (a4) {
      *a4 = newErrorWithMessage(&cfstr_ComputePipelin.isa, MTLBinaryArchiveErrorUnexpectedElement);
    }
    return 0;
  }
}

- (BOOL)addComputePipelineFunctionsWithDescriptor:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  -[_MTLBinaryArchive storeComputePipelineDescriptor:](self, "storeComputePipelineDescriptor:");
  if ((self->_options & 2) == 0) {
    return 1;
  }
  id v10 = (void *)[(MTLDevice *)self->_device compiler];

  return [v10 addComputePipelineStateWithDescriptor:a3 destinationBinaryArchive:self options:a4 error:a5];
}

- (BOOL)addRenderPipelineFunctionsWithDescriptor:(id)a3 error:(id *)a4
{
  if (a3)
  {
    return -[_MTLBinaryArchive addRenderPipelineFunctionsWithDescriptor:options:error:](self, "addRenderPipelineFunctionsWithDescriptor:options:error:");
  }
  else
  {
    if (a4) {
      *a4 = newErrorWithMessage(&cfstr_RenderPipeline.isa, MTLBinaryArchiveErrorUnexpectedElement);
    }
    return 0;
  }
}

- (BOOL)addRenderPipelineFunctionsWithDescriptor:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  -[_MTLBinaryArchive storeRenderPipelineDescriptor:](self, "storeRenderPipelineDescriptor:");
  if ((self->_options & 2) == 0) {
    return 1;
  }
  id v10 = (void *)[(MTLDevice *)self->_device compiler];

  return [v10 addRenderPipelineStateWithDescriptor:a3 destinationBinaryArchive:self options:a4 error:a5];
}

- (BOOL)addTileRenderPipelineFunctionsWithDescriptor:(id)a3 error:(id *)a4
{
  if (a3)
  {
    return -[_MTLBinaryArchive addTileRenderPipelineFunctionsWithDescriptor:options:error:](self, "addTileRenderPipelineFunctionsWithDescriptor:options:error:");
  }
  else
  {
    if (a4) {
      *a4 = newErrorWithMessage(&cfstr_TilePipelineDe.isa, MTLBinaryArchiveErrorUnexpectedElement);
    }
    return 0;
  }
}

- (BOOL)addTileRenderPipelineFunctionsWithDescriptor:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  -[_MTLBinaryArchive storeTileRenderPipelineDescriptor:](self, "storeTileRenderPipelineDescriptor:");
  if ((self->_options & 2) == 0) {
    return 1;
  }
  id v10 = (void *)[(MTLDevice *)self->_device compiler];

  return [v10 addTileRenderPipelineStateWithDescriptor:a3 destinationBinaryArchive:self options:a4 error:a5];
}

- (BOOL)addMeshRenderPipelineFunctionsWithDescriptor:(id)a3 error:(id *)a4
{
  if (a3)
  {
    return -[_MTLBinaryArchive addMeshRenderPipelineFunctionsWithDescriptor:options:error:](self, "addMeshRenderPipelineFunctionsWithDescriptor:options:error:");
  }
  else
  {
    if (a4) {
      *a4 = newErrorWithMessage(&cfstr_MeshPipelineDe.isa, MTLBinaryArchiveErrorUnexpectedElement);
    }
    return 0;
  }
}

- (BOOL)addMeshRenderPipelineFunctionsWithDescriptor:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  -[_MTLBinaryArchive storeMeshRenderPipelineDescriptor:](self, "storeMeshRenderPipelineDescriptor:");
  if ((self->_options & 2) == 0) {
    return 1;
  }
  id v10 = (void *)[(MTLDevice *)self->_device compiler];

  return [v10 addMeshRenderPipelineStateWithDescriptor:a3 destinationBinaryArchive:self options:a4 error:a5];
}

- (BOOL)addFunctionWithDescriptor:(id)a3 library:(id)a4 error:(id *)a5
{
  if (self->_isLegacy && (unint64_t options = self->_options, (options & 6) == 0))
  {
    if ((options & 1) == 0) {
      return 1;
    }
    uint64_t v10 = [a4 newFunctionWithDescriptor:a3 error:a5];
  }
  else
  {
    uint64_t v10 = [a4 newFunctionWithDescriptor:a3 destinationArchive:self error:a5];
  }
  uint64_t v11 = (void *)v10;
  if (!v10) {
    return 0;
  }
  if (self->_isLegacy
    || (BOOL v14 = 1, a3)
    && (self->_options & 0x40) == 0
    && (MTLMetalScriptBuilder::addFunctionWithDescriptor((NSObject ***)self->_mtlScriptBuilder.__ptr_.__value_, v10, (uint64_t)a4, (uint64_t)a3), self->_isLegacy))
  {
    if (self->_options)
    {
      uint64_t v12 = objc_msgSend(a4, "newFunctionWithName:", objc_msgSend(a3, "name"));
      if (!v12)
      {
        BOOL v14 = 0;
        if (a5) {
          *a5 = newErrorWithMessage((NSString *)[NSString stringWithFormat:@"library does not contain base function '%@'", objc_msgSend(a3, "name")], MTLBinaryArchiveErrorUnexpectedElement);
        }
        goto LABEL_10;
      }
      uint64_t v13 = v12;
      MTLPipelineCollection::addLibraryData(self->_pipelineCollection.__ptr_.__value_, self->_collectArchives, !self->_collectArchives, (MTLLibraryData *)[v12 libraryData]);
      MTLPipelineCollection::addSpecializedFunction((uint64_t)self->_pipelineCollection.__ptr_.__value_, (uint64_t)v13, (uint64_t)v11, (uint64_t)a4, (uint64_t)a3);
    }
    BOOL v14 = 1;
  }
LABEL_10:

  return v14;
}

- (BOOL)addLibraryWithDescriptor:(id)a3 error:(id *)a4
{
  if (!self->_isLegacy || (self->_options & 4) != 0)
  {
    uint64_t v6 = [(MTLDevice *)self->_device newLibraryWithStitchedDescriptor:a3 destinationBinaryArchive:self error:a4];
    if (v6)
    {
      uint64_t v7 = (void *)v6;
      if (!self->_isLegacy && a3 && (self->_options & 0x40) == 0) {
        MTLMetalScriptBuilder::addLibraryWithDescriptor((NSObject ***)self->_mtlScriptBuilder.__ptr_.__value_, v6, (uint64_t)a3);
      }

      LOBYTE(v6) = 1;
    }
  }
  else
  {
    LOBYTE(v6) = 0;
  }
  return v6;
}

- (BOOL)removeComputePipelineFunctionsWithDescriptor:(id)a3 error:(id *)a4
{
  return 0;
}

- (BOOL)serializeToURL:(id)a3 error:(id *)a4
{
  return [(_MTLBinaryArchive *)self serializeToURL:a3 options:87 error:a4];
}

- (BOOL)getSpecializedFunctionArchivesToSerialize:(void *)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  next = self->_legacySpecializedFunctions.__table_.__p1_.__value_.__next_;
  if (next)
  {
    char v6 = 1;
    do
    {
      long long v7 = *((_OWORD *)next + 2);
      v12[0] = *((_OWORD *)next + 1);
      v12[1] = v7;
      dispatch_object_t object = (dispatch_object_t)*((void *)next + 6);
      if (object)
      {
        std::__hash_table<std::__hash_value_type<MTLUINT256_t,NSObject  {objcproto16OS_dispatch_data}*>,std::__unordered_map_hasher<MTLUINT256_t,std::__hash_value_type<MTLUINT256_t,NSObject  {objcproto16OS_dispatch_data}*>,UnorderedContainerHash,UnorderedContainerHash,true>,std::__unordered_map_equal<MTLUINT256_t,std::__hash_value_type<MTLUINT256_t,NSObject  {objcproto16OS_dispatch_data}*>,UnorderedContainerHash,UnorderedContainerHash,true>,std::allocator<std::__hash_value_type<MTLUINT256_t,NSObject  {objcproto16OS_dispatch_data}*>>>::__emplace_unique_key_args<MTLUINT256_t,std::pair<MTLUINT256_t const,NSObject  {objcproto16OS_dispatch_data}*> const&>((uint64_t)a3, (unint64_t *)v12, (uint64_t)v12);
        char v9 = v8;
        if (v8) {
          dispatch_retain(object);
        }
        v6 &= v9;
      }
      next = *(void **)next;
    }
    while (next);
    if ((v6 & 1) == 0) {
      return 0;
    }
  }
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __63___MTLBinaryArchive_getSpecializedFunctionArchivesToSerialize___block_invoke;
  v11[3] = &__block_descriptor_40_e49_B24__0r_____32C__8__NSObject_OS_dispatch_data__16l;
  v11[4] = a3;
  return [(_MTLBinaryArchive *)self enumerateSpecializedFunctionArchivesFromBackingFile:v11];
}

- (id)flatBufferFromJSON:(id)a3 schema:(const char *)a4 schemaSize:(unint64_t)a5
{
  size_t size_ptr = 0;
  buffer_ptr = 0;
  size_t v5 = dispatch_data_create_map((dispatch_data_t)a3, (const void **)&buffer_ptr, &size_ptr);
  if (size_ptr)
  {
    flatbuffers::IDLOptions::IDLOptions((flatbuffers::IDLOptions *)&v7);
    flatbuffers::Parser::Parser((flatbuffers::Parser *)v8, (const flatbuffers::IDLOptions *)&v7);
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    -[_MTLBinaryArchive flatBufferFromJSON:schema:schemaSize:]();
    if (!v5) {
      return 0;
    }
    goto LABEL_5;
  }
  if (v5) {
LABEL_5:
  }
    dispatch_release(v5);
  return 0;
}

- (id)materializeAirScript:(void *)a3
{
  size_t v5 = *((void *)a3 + 4);
  if (!v5)
  {
    char v9 = [(_MTLBinaryArchive *)self mapFileToMemoryWithPath:*((void *)a3 + 11)];
    if (!v9) {
      return 0;
    }
    uint64_t v10 = v9;
    uint64_t v11 = (const char *)*((void *)a3 + 11);
    if (hasFileExtension(v11, ".airp-json"))
    {
      uint64_t v12 = &Air::PipelineScriptBinarySchema::data(void)::bfbsData;
      uint64_t v13 = self;
      uint64_t v14 = v10;
      uint64_t v15 = 33416;
    }
    else if (hasFileExtension(v11, ".aird-json"))
    {
      uint64_t v12 = &Air::DylibScriptBinarySchema::data(void)::bfbsData;
      uint64_t v13 = self;
      uint64_t v14 = v10;
      uint64_t v15 = 712;
    }
    else
    {
      if (!hasFileExtension(v11, ".airf-json"))
      {
        id v16 = 0;
        goto LABEL_14;
      }
      uint64_t v12 = &Air::ConstantsSpecializationScriptBinarySchema::data(void)::bfbsData;
      uint64_t v13 = self;
      uint64_t v14 = v10;
      uint64_t v15 = 12584;
    }
    id v16 = [(_MTLBinaryArchive *)v13 flatBufferFromJSON:v14 schema:v12 schemaSize:v15];
LABEL_14:
    dispatch_release(v10);
    return v16;
  }
  size_t v6 = *((void *)a3 + 7) + *((void *)a3 + 3);
  uint64_t v7 = [(MTLLoadedFileContentsWrapper *)self->_fileData dispatchData];

  return dispatch_data_create_subrange((dispatch_data_t)v7, v6, v5);
}

- (id)materializeBitCode:(void *)a3 atIndex:(unsigned int)a4
{
  char v9 = 0;
  id v6 = [(_MTLBinaryArchive *)self getLibraryInArchiveAtPos:a3 atIndex:*(void *)&a4 error:&v9];
  uint64_t v7 = v9;
  if (v9 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    -[_MTLBinaryArchive materializeBitCode:atIndex:](v7);
  }
  return (id)[v6 bitCodeWithHash:*(void *)(*(void *)(*(void *)a3 + 8 * a4) + 24)];
}

- (id)materializeReflectionBlock:(void *)a3
{
  if ((*((unsigned char *)a3 + 80) & 0x20) != 0)
  {
    return (id)MTLNewReflectionBlock(0, 0, 0);
  }
  else
  {
    if (*((void *)a3 + 12)) {
      dispatch_data_t subrange = -[_MTLBinaryArchive mapFileToMemoryWithPath:](self, "mapFileToMemoryWithPath:");
    }
    else {
      dispatch_data_t subrange = dispatch_data_create_subrange((dispatch_data_t)[(MTLLoadedFileContentsWrapper *)self->_fileData dispatchData], *((void *)a3 + 7) + *((unsigned int *)a3 + 16), *((unsigned int *)a3 + 17));
    }
    dispatch_data_t v7 = subrange;
    if (*((void *)a3 + 13))
    {
      dispatch_data_t v8 = -[_MTLBinaryArchive mapFileToMemoryWithPath:](self, "mapFileToMemoryWithPath:");
    }
    else
    {
      uint64_t v9 = *((void *)a3 + 7);
      uint64_t v10 = *((unsigned int *)a3 + 18);
      dispatch_data_t v8 = dispatch_data_create_subrange((dispatch_data_t)[(MTLLoadedFileContentsWrapper *)self->_fileData dispatchData], v9 + v10, *((unsigned int *)a3 + 19));
    }
    dispatch_data_t v11 = v8;
    uint64_t v12 = (void *)MTLNewReflectionBlock(0, v7, v8);

    return v12;
  }
}

- (void)materializeAirNTFromOnlineForSlice:(const MTLLoaderSliceIdentifier *)a3 entryList:(shared_ptr<std::vector<machOEntry>>)a4
{
  int var0 = (uint64_t **)a4.var0;
  long long v4 = self;
  uint64_t v124 = *MEMORY[0x1E4F143B8];
  p_airntExtraBinaryEntries = &self->_airntExtraBinaryEntries;
  v115 = 0;
  uint64_t v116 = 0;
  v114 = 0;
  std::vector<functionIdExtended>::__init_with_size[abi:ne180100]<functionIdExtended*,functionIdExtended*>(&v114, self->_airntExtraBinaryEntries.__begin_, (uint64_t)self->_airntExtraBinaryEntries.__end_, (self->_airntExtraBinaryEntries.__end_ - self->_airntExtraBinaryEntries.__begin_) >> 4);
  std::unordered_map<MTLUINT256_t,MTLAirEntry *,UnorderedContainerHash,UnorderedContainerHash,std::allocator<std::pair<MTLUINT256_t const,MTLAirEntry *>>>::unordered_map((uint64_t)v112, (uint64_t)&v4->_specializedFunctionByHash);
  std::unordered_map<MTLUINT256_t,MTLAirEntry *,UnorderedContainerHash,UnorderedContainerHash,std::allocator<std::pair<MTLUINT256_t const,MTLAirEntry *>>>::unordered_map((uint64_t)v110, (uint64_t)&v4->_stitchedFunctionByHash);
  p_airntExtraBinaryEntries->__end_ = p_airntExtraBinaryEntries->__begin_;
  std::__hash_table<std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,MTLStructTypeInternal *>>>::clear(&v4->_specializedFunctionByHash.__table_.__bucket_list_.__ptr_.__value_);
  std::__hash_table<std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,MTLStructTypeInternal *>>>::clear(&v4->_stitchedFunctionByHash.__table_.__bucket_list_.__ptr_.__value_);
  v103 = v4;
  if (v115 != v114)
  {
    uint64_t v6 = 0;
    unsigned int v7 = 0;
    do
    {
      dispatch_data_t v8 = [MTLBinaryKey alloc];
      uint64_t v9 = [(MTLBinaryKey *)v8 initWithHash:*((void *)v114 + 2 * v6)];
      uint64_t v10 = (void *)[(NSMutableDictionary *)v4->_entries objectForKey:v9];
      if (v10)
      {
        dispatch_data_t v11 = *var0;
        unint64_t v12 = (*var0)[1];
        uint64_t v13 = (unint64_t *)(*var0 + 2);
        if (v12 >= *v13)
        {
          unint64_t v15 = 0x8E38E38E38E38E39 * ((uint64_t)(v12 - *v11) >> 3);
          unint64_t v16 = v15 + 1;
          if (v15 + 1 > 0x38E38E38E38E38ELL) {
            std::vector<std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>>::__throw_length_error[abi:ne180100]();
          }
          if (0x1C71C71C71C71C72 * ((uint64_t)(*v13 - *v11) >> 3) > v16) {
            unint64_t v16 = 0x1C71C71C71C71C72 * ((uint64_t)(*v13 - *v11) >> 3);
          }
          if (0x8E38E38E38E38E39 * ((uint64_t)(*v13 - *v11) >> 3) >= 0x1C71C71C71C71C7) {
            unint64_t v17 = 0x38E38E38E38E38ELL;
          }
          else {
            unint64_t v17 = v16;
          }
          uint64_t v123 = (uint64_t)(*var0 + 2);
          if (v17) {
            uint64_t v18 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<machOEntry>>((uint64_t)v13, v17);
          }
          else {
            uint64_t v18 = 0;
          }
          uint64_t v19 = &v18[72 * v15];
          *(void *)&long long v121 = v18;
          *((void *)&v121 + 1) = v19;
          *((void *)&v122 + 1) = &v18[72 * v17];
          *(_OWORD *)uint64_t v19 = 0u;
          *((_OWORD *)v19 + 1) = 0u;
          *((_OWORD *)v19 + 2) = 0u;
          *((_OWORD *)v19 + 3) = 0u;
          *((void *)v19 + 8) = 0;
          *(void *)&long long v122 = v19 + 72;
          std::vector<machOEntry>::__swap_out_circular_buffer(v11, &v121);
          uint64_t v14 = v11[1];
          std::__split_buffer<machOEntry>::~__split_buffer((uint64_t)&v121);
        }
        else
        {
          *(void *)(v12 + 64) = 0;
          *(_OWORD *)(v12 + 32) = 0u;
          *(_OWORD *)(v12 + 48) = 0u;
          *(_OWORD *)unint64_t v12 = 0u;
          *(_OWORD *)(v12 + 16) = 0u;
          uint64_t v14 = v12 + 72;
          v11[1] = v12 + 72;
        }
        v11[1] = v14;
        *(void *)(v14 - 72) = a3->var1 | ((unint64_t)a3->var0 << 32);
        unint64_t v20 = [v10 data];
        *(void *)(v14 - 40) = v20;
        dispatch_retain(v20);
        operator new();
      }

      uint64_t v6 = ++v7;
    }
    while (v7 < (unint64_t)((v115 - (unsigned char *)v114) >> 4));
  }
  for (uint64_t i = v113; i; uint64_t i = (uint64_t *)*i)
  {
    long long v22 = *((_OWORD *)i + 1);
    long long v23 = *((_OWORD *)i + 2);
    id v120 = (id)i[6];
    *(_OWORD *)std::string __p = v22;
    long long v119 = v23;
    long long v24 = *var0;
    unint64_t v25 = (*var0)[1];
    long long v26 = (unint64_t *)(*var0 + 2);
    if (v25 >= *v26)
    {
      unint64_t v28 = 0x8E38E38E38E38E39 * ((uint64_t)(v25 - *v24) >> 3);
      unint64_t v29 = v28 + 1;
      if (v28 + 1 > 0x38E38E38E38E38ELL) {
        std::vector<std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>>::__throw_length_error[abi:ne180100]();
      }
      if (0x1C71C71C71C71C72 * ((uint64_t)(*v26 - *v24) >> 3) > v29) {
        unint64_t v29 = 0x1C71C71C71C71C72 * ((uint64_t)(*v26 - *v24) >> 3);
      }
      if (0x8E38E38E38E38E39 * ((uint64_t)(*v26 - *v24) >> 3) >= 0x1C71C71C71C71C7) {
        unint64_t v30 = 0x38E38E38E38E38ELL;
      }
      else {
        unint64_t v30 = v29;
      }
      uint64_t v123 = (uint64_t)(*var0 + 2);
      if (v30) {
        long long v31 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<machOEntry>>((uint64_t)v26, v30);
      }
      else {
        long long v31 = 0;
      }
      long long v32 = &v31[72 * v28];
      *(void *)&long long v121 = v31;
      *((void *)&v121 + 1) = v32;
      *((void *)&v122 + 1) = &v31[72 * v30];
      *(_OWORD *)long long v32 = 0u;
      *((_OWORD *)v32 + 1) = 0u;
      *((_OWORD *)v32 + 2) = 0u;
      *((_OWORD *)v32 + 3) = 0u;
      *((void *)v32 + 8) = 0;
      *(void *)&long long v122 = v32 + 72;
      std::vector<machOEntry>::__swap_out_circular_buffer(v24, &v121);
      uint64_t v27 = v24[1];
      std::__split_buffer<machOEntry>::~__split_buffer((uint64_t)&v121);
    }
    else
    {
      *(void *)(v25 + 64) = 0;
      *(_OWORD *)(v25 + 32) = 0u;
      *(_OWORD *)(v25 + 48) = 0u;
      *(_OWORD *)unint64_t v25 = 0u;
      *(_OWORD *)(v25 + 16) = 0u;
      uint64_t v27 = v25 + 72;
      v24[1] = v25 + 72;
    }
    v24[1] = v27;
    *(void *)(v27 - 72) = a3->var1 | ((unint64_t)a3->var0 << 32);
    id v33 = v120;
    device = (_MTLDevice *)v4->_device;
    uint64_t libraryBuilder = (uint64_t)device->_libraryBuilder;
    long long v36 = [v120 data];
    long long v41 = MTLLibraryBuilder::newLibraryWithData(libraryBuilder, device, v36, 0, v37, v38, v39, v40);
    long long v4 = v103;
    id v42 = [(_MTLLibrary *)v41 newSpecializedFunctionWithHash:__p];
    if (!v42) {
      id v42 = [(_MTLLibrary *)v41 newFunctionWithName:[(NSArray *)[(_MTLLibrary *)v41 functionNames] objectAtIndex:0]];
    }
    *(void *)(v27 - 48) = [v33 bitcode];
    *(void *)(v27 - 40) = [v42 bitcodeDataInternal];
    long long v43 = [v33 airScript];
    *(void *)(v27 - 56) = v43;
    dispatch_retain(v43);
    dispatch_retain(*(dispatch_object_t *)(v27 - 48));
  }
  long long v44 = v111;
  if (v111)
  {
    do
    {
      long long v45 = *var0;
      unint64_t v46 = (*var0)[1];
      uint64_t v47 = (unint64_t *)(*var0 + 2);
      if (v46 >= *v47)
      {
        unint64_t v49 = 0x8E38E38E38E38E39 * ((uint64_t)(v46 - *v45) >> 3);
        unint64_t v50 = v49 + 1;
        if (v49 + 1 > 0x38E38E38E38E38ELL) {
          std::vector<std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>>::__throw_length_error[abi:ne180100]();
        }
        if (0x1C71C71C71C71C72 * ((uint64_t)(*v47 - *v45) >> 3) > v50) {
          unint64_t v50 = 0x1C71C71C71C71C72 * ((uint64_t)(*v47 - *v45) >> 3);
        }
        if (0x8E38E38E38E38E39 * ((uint64_t)(*v47 - *v45) >> 3) >= 0x1C71C71C71C71C7) {
          unint64_t v51 = 0x38E38E38E38E38ELL;
        }
        else {
          unint64_t v51 = v50;
        }
        uint64_t v123 = (uint64_t)(*var0 + 2);
        if (v51) {
          v52 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<machOEntry>>((uint64_t)v47, v51);
        }
        else {
          v52 = 0;
        }
        v53 = &v52[72 * v49];
        *(void *)&long long v121 = v52;
        *((void *)&v121 + 1) = v53;
        *((void *)&v122 + 1) = &v52[72 * v51];
        *(_OWORD *)v53 = 0u;
        *((_OWORD *)v53 + 1) = 0u;
        *((_OWORD *)v53 + 2) = 0u;
        *((_OWORD *)v53 + 3) = 0u;
        *((void *)v53 + 8) = 0;
        *(void *)&long long v122 = v53 + 72;
        std::vector<machOEntry>::__swap_out_circular_buffer(v45, &v121);
        uint64_t v48 = v45[1];
        std::__split_buffer<machOEntry>::~__split_buffer((uint64_t)&v121);
      }
      else
      {
        *(void *)(v46 + 64) = 0;
        *(_OWORD *)(v46 + 32) = 0u;
        *(_OWORD *)(v46 + 48) = 0u;
        *(_OWORD *)unint64_t v46 = 0u;
        *(_OWORD *)(v46 + 16) = 0u;
        uint64_t v48 = v46 + 72;
        v45[1] = v46 + 72;
      }
      v45[1] = v48;
      *(void *)(v48 - 72) = 0;
      v54 = (void *)v44[6];
      v55 = [v54 airScript];
      *(void *)(v48 - 56) = v55;
      dispatch_retain(v55);
      v56 = (_MTLDevice *)v103->_device;
      uint64_t v57 = (uint64_t)v56->_libraryBuilder;
      v58 = [v54 data];
      v63 = MTLLibraryBuilder::newLibraryWithData(v57, v56, v58, 0, v59, v60, v61, v62);
      size_t size_ptr = 0;
      buffer_ptr = 0;
      v64 = dispatch_data_create_map((dispatch_data_t)[v54 airScript], (const void **)&buffer_ptr, &size_ptr);
      v65 = (int *)((char *)buffer_ptr + *(unsigned int *)buffer_ptr);
      v66 = (unsigned __int16 *)((char *)v65 - *v65);
      if (*v66 >= 9u && (uint64_t v67 = v66[4]) != 0) {
        v68 = (int *)((char *)v65 + v67 + *(unsigned int *)((char *)v65 + v67));
      }
      else {
        v68 = 0;
      }
      v69 = (unsigned __int16 *)((char *)v68 - *v68);
      if (*v69 >= 7u && (uint64_t v70 = v69[3]) != 0) {
        v71 = (int *)((char *)v68 + v70 + *(unsigned int *)((char *)v68 + v70));
      }
      else {
        v71 = 0;
      }
      v72 = (unsigned int *)((char *)v71 + *(unsigned __int16 *)((char *)v71 - *v71 + 4));
      std::string::basic_string[abi:ne180100](__p, (char *)v72 + *v72 + 4, *(unsigned int *)((char *)v72 + *v72));
      id v73 = [NSString alloc];
      if ((SBYTE7(v119) & 0x80u) == 0) {
        v74 = __p;
      }
      else {
        v74 = (void **)__p[0];
      }
      uint64_t v75 = [v73 initWithUTF8String:v74];
      v96 = v63;
      id v97 = [(_MTLLibrary *)v63 newFunctionWithName:v75];
      v98 = (void *)v75;
      v102 = v44;
      *(void *)(v48 - 40) = [v97 bitcodeDataInternal];
      dispatch_release(v64);
      long long v106 = 0u;
      long long v107 = 0u;
      long long v104 = 0u;
      long long v105 = 0u;
      v100 = v54;
      v76 = (void *)[v54 linkedBitcodes];
      uint64_t v77 = [v76 countByEnumeratingWithState:&v104 objects:v117 count:16];
      if (v77)
      {
        uint64_t v78 = *(void *)v105;
        v79 = (char **)(v48 - 24);
        do
        {
          for (uint64_t j = 0; j != v77; ++j)
          {
            if (*(void *)v105 != v78) {
              objc_enumerationMutation(v76);
            }
            [*(id *)(*((void *)&v104 + 1) + 8 * j) getValue:&v121];
            v81 = *(_OWORD **)(v48 - 16);
            unint64_t v82 = *(void *)(v48 - 8);
            if ((unint64_t)v81 >= v82)
            {
              uint64_t v85 = ((char *)v81 - *v79) >> 5;
              unint64_t v86 = v85 + 1;
              if ((unint64_t)(v85 + 1) >> 59) {
                std::vector<std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>>::__throw_length_error[abi:ne180100]();
              }
              uint64_t v87 = v82 - (void)*v79;
              if (v87 >> 4 > v86) {
                unint64_t v86 = v87 >> 4;
              }
              if ((unint64_t)v87 >= 0x7FFFFFFFFFFFFFE0) {
                unint64_t v88 = 0x7FFFFFFFFFFFFFFLL;
              }
              else {
                unint64_t v88 = v86;
              }
              if (v88) {
                v89 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::tuple<std::string,unsigned int,unsigned int>>>(v48 - 8, v88);
              }
              else {
                v89 = 0;
              }
              v90 = &v89[32 * v85];
              long long v91 = v122;
              *(_OWORD *)v90 = v121;
              *((_OWORD *)v90 + 1) = v91;
              v93 = *(char **)(v48 - 24);
              v92 = *(char **)(v48 - 16);
              v94 = v90;
              if (v92 != v93)
              {
                do
                {
                  long long v95 = *((_OWORD *)v92 - 1);
                  *((_OWORD *)v94 - 2) = *((_OWORD *)v92 - 2);
                  *((_OWORD *)v94 - 1) = v95;
                  v94 -= 32;
                  v92 -= 32;
                }
                while (v92 != v93);
                v92 = *v79;
              }
              v84 = v90 + 32;
              *(void *)(v48 - 24) = v94;
              *(void *)(v48 - 16) = v90 + 32;
              *(void *)(v48 - 8) = &v89[32 * v88];
              if (v92) {
                operator delete(v92);
              }
            }
            else
            {
              long long v83 = v122;
              _OWORD *v81 = v121;
              v81[1] = v83;
              v84 = v81 + 2;
            }
            *(void *)(v48 - 16) = v84;
          }
          uint64_t v77 = [v76 countByEnumeratingWithState:&v104 objects:v117 count:16];
        }
        while (v77);
      }

      if (SBYTE7(v119) < 0) {
        operator delete(__p[0]);
      }
      long long v44 = (void *)*v102;
    }
    while (*v102);
  }
  std::__hash_table<std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,MTLStructTypeInternal *>>>::~__hash_table((uint64_t)v110);
  std::__hash_table<std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,MTLStructTypeInternal *>>>::~__hash_table((uint64_t)v112);
  if (v114)
  {
    v115 = v114;
    operator delete(v114);
  }
}

- (void)materializeAirNTStitchedFunctions:(shared_ptr<std::vector<machOEntry>>)a3
{
  int var0 = (uint64_t **)a3.var0;
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  for (uint64_t i = self->_stitchedLibraryCache.__table_.__p1_.__value_.__next_; i; uint64_t i = *(_OWORD **)i)
  {
    long long v5 = i[1];
    long long v6 = i[2];
    id v29 = (id)*((void *)i + 6);
    v28[0] = v5;
    v28[1] = v6;
    unsigned int v7 = *var0;
    unint64_t v8 = (*var0)[1];
    uint64_t v9 = (unint64_t *)(*var0 + 2);
    if (v8 >= *v9)
    {
      unint64_t v11 = 0x8E38E38E38E38E39 * ((uint64_t)(v8 - *v7) >> 3);
      unint64_t v12 = v11 + 1;
      if (v11 + 1 > 0x38E38E38E38E38ELL) {
        std::vector<std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>>::__throw_length_error[abi:ne180100]();
      }
      if (0x1C71C71C71C71C72 * ((uint64_t)(*v9 - *v7) >> 3) > v12) {
        unint64_t v12 = 0x1C71C71C71C71C72 * ((uint64_t)(*v9 - *v7) >> 3);
      }
      if (0x8E38E38E38E38E39 * ((uint64_t)(*v9 - *v7) >> 3) >= 0x1C71C71C71C71C7) {
        unint64_t v13 = 0x38E38E38E38E38ELL;
      }
      else {
        unint64_t v13 = v12;
      }
      uint64_t v32 = (uint64_t)(*var0 + 2);
      if (v13) {
        uint64_t v14 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<machOEntry>>((uint64_t)v9, v13);
      }
      else {
        uint64_t v14 = 0;
      }
      unint64_t v15 = &v14[72 * v11];
      *(void *)&long long v30 = v14;
      *((void *)&v30 + 1) = v15;
      *((void *)&v31 + 1) = &v14[72 * v13];
      *(_OWORD *)unint64_t v15 = 0u;
      *((_OWORD *)v15 + 1) = 0u;
      *((_OWORD *)v15 + 2) = 0u;
      *((_OWORD *)v15 + 3) = 0u;
      *((void *)v15 + 8) = 0;
      *(void *)&long long v31 = v15 + 72;
      std::vector<machOEntry>::__swap_out_circular_buffer(v7, &v30);
      uint64_t v10 = v7[1];
      std::__split_buffer<machOEntry>::~__split_buffer((uint64_t)&v30);
    }
    else
    {
      *(void *)(v8 + 64) = 0;
      *(_OWORD *)(v8 + 32) = 0u;
      *(_OWORD *)(v8 + 48) = 0u;
      *(_OWORD *)unint64_t v8 = 0u;
      *(_OWORD *)(v8 + 16) = 0u;
      uint64_t v10 = v8 + 72;
      v7[1] = v8 + 72;
    }
    v7[1] = v10;
    *(void *)(v10 - 72) = 0;
    id v16 = v29;
    unint64_t v17 = objc_msgSend(v29, "newStitchedFunctionWithHash:", v28, a3.var1, var0);
    *(void *)(v10 - 40) = [v17 bitcodeDataInternal];
    (*(void (**)(void **__return_ptr))(*(void *)[v17 libraryData] + 272))(&__p);
    *(void *)(v10 - 56) = (id)[v17 stitchingAirScript];
    if ((void **)(v10 - 24) != &__p) {
      std::vector<MTLUINT256_t>::__assign_with_size[abi:ne180100]<MTLUINT256_t*,MTLUINT256_t*>((char *)(v10 - 24), (char *)__p, (uint64_t)v26, ((char *)v26 - (unsigned char *)__p) >> 5);
    }
    uint64_t v19 = (long long *)__p;
    uint64_t v18 = v26;
    if (__p != v26)
    {
      do
      {
        long long v20 = v19[1];
        long long v30 = *v19;
        long long v31 = v20;
        if (!std::__hash_table<std::__hash_value_type<MTLUINT256_t,NSObject  {objcproto16OS_dispatch_data}*>,std::__unordered_map_hasher<MTLUINT256_t,std::__hash_value_type<MTLUINT256_t,NSObject  {objcproto16OS_dispatch_data}*>,UnorderedContainerHash,UnorderedContainerHash,true>,std::__unordered_map_equal<MTLUINT256_t,std::__hash_value_type<MTLUINT256_t,NSObject  {objcproto16OS_dispatch_data}*>,UnorderedContainerHash,UnorderedContainerHash,true>,std::allocator<std::__hash_value_type<MTLUINT256_t,NSObject  {objcproto16OS_dispatch_data}*>>>::find<MTLUINT256_t>((void *)self->_uniqueBitcodeList.__ptr_, (unint64_t *)&v30))
        {
          uint64_t v21 = (void *)[v16 newFunctionWithHash:&v30];
          uint64_t v22 = [v21 bitcodeDataInternal];
          ptr = self->_uniqueBitcodeList.__ptr_;
          uint64_t v27 = &v30;
          std::__hash_table<std::__hash_value_type<MTLUINT256_t,NSObject  {objcproto16OS_dispatch_data}*>,std::__unordered_map_hasher<MTLUINT256_t,std::__hash_value_type<MTLUINT256_t,NSObject  {objcproto16OS_dispatch_data}*>,UnorderedContainerHash,UnorderedContainerHash,true>,std::__unordered_map_equal<MTLUINT256_t,std::__hash_value_type<MTLUINT256_t,NSObject  {objcproto16OS_dispatch_data}*>,UnorderedContainerHash,UnorderedContainerHash,true>,std::allocator<std::__hash_value_type<MTLUINT256_t,NSObject  {objcproto16OS_dispatch_data}*>>>::__emplace_unique_key_args<MTLUINT256_t,std::piecewise_construct_t const&,std::tuple<MTLUINT256_t const&>,std::tuple<>>((uint64_t)ptr, (unint64_t *)&v30, (uint64_t)&std::piecewise_construct, &v27)[6] = v22;
        }
        v19 += 2;
      }
      while (v19 != v18);
    }

    if (__p)
    {
      long long v26 = (long long *)__p;
      operator delete(__p);
    }
  }
}

- (void)materializeAirNTSpecializedFunctions:(shared_ptr<std::vector<machOEntry>>)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  next = self->_specializedLibraryCache.__table_.__p1_.__value_.__next_;
  if (next)
  {
    int var0 = (uint64_t **)a3.var0;
    do
    {
      long long v5 = next[1];
      long long v6 = next[2];
      id v23 = (id)*((void *)next + 6);
      long long v21 = v5;
      long long v22 = v6;
      unsigned int v7 = *var0;
      unint64_t v8 = (*var0)[1];
      uint64_t v9 = (unint64_t *)(*var0 + 2);
      if (v8 >= *v9)
      {
        unint64_t v11 = 0x8E38E38E38E38E39 * ((uint64_t)(v8 - *v7) >> 3);
        unint64_t v12 = v11 + 1;
        if (v11 + 1 > 0x38E38E38E38E38ELL) {
          std::vector<std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>>::__throw_length_error[abi:ne180100]();
        }
        if (0x1C71C71C71C71C72 * ((uint64_t)(*v9 - *v7) >> 3) > v12) {
          unint64_t v12 = 0x1C71C71C71C71C72 * ((uint64_t)(*v9 - *v7) >> 3);
        }
        if (0x8E38E38E38E38E39 * ((uint64_t)(*v9 - *v7) >> 3) >= 0x1C71C71C71C71C7) {
          unint64_t v13 = 0x38E38E38E38E38ELL;
        }
        else {
          unint64_t v13 = v12;
        }
        uint64_t v26 = (uint64_t)(*var0 + 2);
        if (v13) {
          uint64_t v14 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<machOEntry>>((uint64_t)v9, v13);
        }
        else {
          uint64_t v14 = 0;
        }
        unint64_t v15 = &v14[72 * v11];
        *(void *)&long long v24 = v14;
        *((void *)&v24 + 1) = v15;
        *((void *)&v25 + 1) = &v14[72 * v13];
        *(_OWORD *)unint64_t v15 = 0u;
        *((_OWORD *)v15 + 1) = 0u;
        *((_OWORD *)v15 + 2) = 0u;
        *((_OWORD *)v15 + 3) = 0u;
        *((void *)v15 + 8) = 0;
        *(void *)&long long v25 = v15 + 72;
        std::vector<machOEntry>::__swap_out_circular_buffer(v7, &v24);
        uint64_t v10 = v7[1];
        std::__split_buffer<machOEntry>::~__split_buffer((uint64_t)&v24);
      }
      else
      {
        *(void *)(v8 + 64) = 0;
        *(_OWORD *)(v8 + 32) = 0u;
        *(_OWORD *)(v8 + 48) = 0u;
        *(_OWORD *)unint64_t v8 = 0u;
        *(_OWORD *)(v8 + 16) = 0u;
        uint64_t v10 = v8 + 72;
        v7[1] = v8 + 72;
      }
      v7[1] = v10;
      *(void *)(v10 - 72) = 0;
      id v16 = v23;
      unint64_t v17 = objc_msgSend(v23, "newSpecializedFunctionWithHash:", &v21, a3.var1);
      uint64_t v18 = v17;
      long long v24 = 0u;
      long long v25 = 0u;
      if (v17) {
        objc_msgSend(v17, "baseFunctionHash", v21, v22);
      }
      uint64_t v19 = objc_msgSend(v16, "newFunctionWithHash:", &v24, v21, v22);
      *(void *)(v10 - 48) = [v19 bitcodeDataInternal];
      *(void *)(v10 - 40) = [v18 bitcodeDataInternal];
      long long v20 = [v18 specializationAirScript];
      *(void *)(v10 - 56) = v20;
      dispatch_retain(v20);

      next = *(_OWORD **)next;
    }
    while (next);
  }
}

- (void)materializeLinkedBitcodes:(void *)a3 hashList:(void *)a4
{
  uint64_t v4 = *(void *)a3;
  if (*((void *)a3 + 1) - *(void *)a3 >= 0x10uLL)
  {
    unint64_t v8 = (char *)a4 + 16;
    unint64_t v9 = 1;
    do
    {
      uint64_t v10 = *(void *)(v4 + 8 * v9);
      if (*(unsigned char *)(v10 + 32)) {
        break;
      }
      unint64_t v11 = *(_OWORD **)(v10 + 24);
      unint64_t v12 = (_OWORD *)*((void *)a4 + 1);
      unint64_t v13 = *((void *)a4 + 2);
      if ((unint64_t)v12 >= v13)
      {
        uint64_t v16 = ((uint64_t)v12 - *(void *)a4) >> 5;
        unint64_t v17 = v16 + 1;
        if ((unint64_t)(v16 + 1) >> 59) {
          std::vector<std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>>::__throw_length_error[abi:ne180100]();
        }
        uint64_t v18 = v13 - *(void *)a4;
        if (v18 >> 4 > v17) {
          unint64_t v17 = v18 >> 4;
        }
        if ((unint64_t)v18 >= 0x7FFFFFFFFFFFFFE0) {
          unint64_t v19 = 0x7FFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v19 = v17;
        }
        if (v19) {
          long long v20 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::tuple<std::string,unsigned int,unsigned int>>>((uint64_t)v8, v19);
        }
        else {
          long long v20 = 0;
        }
        long long v21 = &v20[32 * v16];
        long long v22 = v11[1];
        *(_OWORD *)long long v21 = *v11;
        *((_OWORD *)v21 + 1) = v22;
        long long v24 = *(char **)a4;
        id v23 = (char *)*((void *)a4 + 1);
        long long v25 = v21;
        if (v23 != *(char **)a4)
        {
          do
          {
            long long v26 = *((_OWORD *)v23 - 1);
            *((_OWORD *)v25 - 2) = *((_OWORD *)v23 - 2);
            *((_OWORD *)v25 - 1) = v26;
            v25 -= 32;
            v23 -= 32;
          }
          while (v23 != v24);
          id v23 = *(char **)a4;
        }
        unint64_t v15 = v21 + 32;
        *(void *)a4 = v25;
        *((void *)a4 + 1) = v21 + 32;
        *((void *)a4 + 2) = &v20[32 * v19];
        if (v23) {
          operator delete(v23);
        }
      }
      else
      {
        long long v14 = v11[1];
        _OWORD *v12 = *v11;
        v12[1] = v14;
        unint64_t v15 = v12 + 2;
      }
      *((void *)a4 + 1) = v15;
      if (!std::__hash_table<std::__hash_value_type<MTLUINT256_t,NSObject  {objcproto16OS_dispatch_data}*>,std::__unordered_map_hasher<MTLUINT256_t,std::__hash_value_type<MTLUINT256_t,NSObject  {objcproto16OS_dispatch_data}*>,UnorderedContainerHash,UnorderedContainerHash,true>,std::__unordered_map_equal<MTLUINT256_t,std::__hash_value_type<MTLUINT256_t,NSObject  {objcproto16OS_dispatch_data}*>,UnorderedContainerHash,UnorderedContainerHash,true>,std::allocator<std::__hash_value_type<MTLUINT256_t,NSObject  {objcproto16OS_dispatch_data}*>>>::find<MTLUINT256_t>((void *)self->_uniqueBitcodeList.__ptr_, (unint64_t *)v11))
      {
        id v27 = [(_MTLBinaryArchive *)self materializeBitCode:a3 atIndex:v9];
        ptr = self->_uniqueBitcodeList.__ptr_;
        id v29 = v11;
        std::__hash_table<std::__hash_value_type<MTLUINT256_t,NSObject  {objcproto16OS_dispatch_data}*>,std::__unordered_map_hasher<MTLUINT256_t,std::__hash_value_type<MTLUINT256_t,NSObject  {objcproto16OS_dispatch_data}*>,UnorderedContainerHash,UnorderedContainerHash,true>,std::__unordered_map_equal<MTLUINT256_t,std::__hash_value_type<MTLUINT256_t,NSObject  {objcproto16OS_dispatch_data}*>,UnorderedContainerHash,UnorderedContainerHash,true>,std::allocator<std::__hash_value_type<MTLUINT256_t,NSObject  {objcproto16OS_dispatch_data}*>>>::__emplace_unique_key_args<MTLUINT256_t,std::piecewise_construct_t const&,std::tuple<MTLUINT256_t const&>,std::tuple<>>((uint64_t)ptr, (unint64_t *)v11, (uint64_t)&std::piecewise_construct, &v29)[6] = v27;
      }
      unint64_t v9 = (v9 + 1);
      uint64_t v4 = *(void *)a3;
    }
    while (v9 < (uint64_t)(*((void *)a3 + 1) - *(void *)a3) >> 3);
  }
}

- (void)materializeAirNTAllForSlice:(const MTLLoaderSliceIdentifier *)a3 entryList:(shared_ptr<std::vector<machOEntry>>)a4
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (std::__shared_weak_count *)*((void *)a4.var0 + 1);
  int var0 = (uint64_t **)a4.var0;
  uint64_t v59 = *(void *)a4.var0;
  uint64_t v60 = v4;
  if (v4) {
    atomic_fetch_add_explicit(&v4->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  [(_MTLBinaryArchive *)self materializeAirNTSpecializedFunctions:&v59];
  if (v60) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v60);
  }
  long long v5 = (std::__shared_weak_count *)var0[1];
  uint64_t v57 = *var0;
  v58 = v5;
  if (v5) {
    atomic_fetch_add_explicit(&v5->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  [(_MTLBinaryArchive *)self materializeAirNTStitchedFunctions:&v57];
  if (v58) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v58);
  }
  p_airntObjectList = &self->_airntObjectList;
  end = self->_airntObjectList.__end_;
  if (end != self->_airntObjectList.__begin_)
  {
    unint64_t v8 = 0;
    do
    {
      unint64_t v9 = *var0;
      unint64_t v10 = (*var0)[1];
      unint64_t v11 = (unint64_t *)(*var0 + 2);
      if (v10 >= *v11)
      {
        unint64_t v13 = 0x8E38E38E38E38E39 * ((uint64_t)(v10 - *v9) >> 3);
        unint64_t v14 = v13 + 1;
        if (v13 + 1 > 0x38E38E38E38E38ELL) {
          std::vector<std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>>::__throw_length_error[abi:ne180100]();
        }
        if (0x1C71C71C71C71C72 * ((uint64_t)(*v11 - *v9) >> 3) > v14) {
          unint64_t v14 = 0x1C71C71C71C71C72 * ((uint64_t)(*v11 - *v9) >> 3);
        }
        if (0x8E38E38E38E38E39 * ((uint64_t)(*v11 - *v9) >> 3) >= 0x1C71C71C71C71C7) {
          unint64_t v15 = 0x38E38E38E38E38ELL;
        }
        else {
          unint64_t v15 = v14;
        }
        *(void *)&v61.var1.var0[8] = *var0 + 2;
        if (v15) {
          uint64_t v16 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<machOEntry>>((uint64_t)v11, v15);
        }
        else {
          uint64_t v16 = 0;
        }
        unint64_t v17 = (unint64_t)&v16[72 * v13];
        v61.var0.int var0 = (unint64_t)v16;
        v61.var0.var1 = v17;
        *(void *)v61.var1.int var0 = &v16[72 * v15];
        *(_OWORD *)unint64_t v17 = 0u;
        *(_OWORD *)(v17 + 16) = 0u;
        *(_OWORD *)(v17 + 32) = 0u;
        *(_OWORD *)(v17 + 48) = 0u;
        *(void *)(v17 + 64) = 0;
        *(void *)&v61.var0.var2 = v17 + 72;
        std::vector<machOEntry>::__swap_out_circular_buffer(v9, &v61);
        uint64_t v12 = v9[1];
        std::__split_buffer<machOEntry>::~__split_buffer((uint64_t)&v61);
      }
      else
      {
        *(void *)(v10 + 64) = 0;
        *(_OWORD *)(v10 + 32) = 0u;
        *(_OWORD *)(v10 + 48) = 0u;
        *(_OWORD *)unint64_t v10 = 0u;
        *(_OWORD *)(v10 + 16) = 0u;
        uint64_t v12 = v10 + 72;
        v9[1] = v10 + 72;
      }
      v9[1] = v12;
      *(void *)(v12 - 72) = a3->var1 | ((unint64_t)a3->var0 << 32);
      *(void *)(v12 - 56) = -[_MTLBinaryArchive materializeAirScript:](self, "materializeAirScript:", p_airntObjectList->__begin_[v8], v47);
      *(void *)(v12 - 48) = [(_MTLBinaryArchive *)self materializeBitCode:p_airntObjectList->__begin_[v8] atIndex:0];
      [(_MTLBinaryArchive *)self materializeLinkedBitcodes:p_airntObjectList->__begin_[v8] hashList:v12 - 24];
      *(void *)(v12 - 32) = [(_MTLBinaryArchive *)self materializeReflectionBlock:p_airntObjectList->__begin_[v8]];
      uint64_t v18 = p_airntObjectList->__begin_[v8];
      *(void *)(v12 - 40) = dispatch_data_create_subrange((dispatch_data_t)[(MTLLoadedFileContentsWrapper *)self->_fileData dispatchData], *((void *)v18 + 7) + *((void *)v18 + 5), *((void *)v18 + 6));
      v61.var0.int var0 = *((void *)p_airntObjectList->__begin_[v8] + 7)
                    + *((void *)p_airntObjectList->__begin_[v8] + 5);
      unint64_t v19 = std::__hash_table<std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,MTLStructTypeInternal *>>>::find<unsigned long>(&self->_airntBinaryList.__table_.__bucket_list_.__ptr_.__value_, &v61.var0.var0);
      long long v20 = v19;
      if (v19)
      {
        uint64_t v21 = v19[3];
        uint64_t v47 = v19 + 3;
        uint64_t v22 = v19[4] - v21;
        if (v22)
        {
          unint64_t v23 = 0xCCCCCCCCCCCCCCCDLL * (v22 >> 4);
          unint64_t v24 = v23 - 1;
          if (v23 < v23 - 1) {
LABEL_64:
          }
            std::vector<MTLHashKey>::__throw_out_of_range[abi:ne180100]();
          while (1)
          {
            unint64_t v25 = v24;
            MTLHashKey::MTLHashKey(&v61, (const MTLHashKey *)(v21 + 80 * v24));
            std::string __p = 0;
            v55 = 0;
            v56 = 0;
            uint64_t v26 = *(void *)p_airntObjectList->__begin_[v8];
            if ((unint64_t)(*((void *)p_airntObjectList->__begin_[v8] + 1) - v26) < 9)
            {
              id v27 = 0;
              long long v43 = 0;
            }
            else
            {
              id v27 = 0;
              unint64_t v28 = 1;
              do
              {
                uint64_t v29 = *(void *)(v26 + 8 * v28);
                if (*(unsigned char *)(v29 + 32)) {
                  break;
                }
                long long v30 = *(_OWORD **)(v29 + 24);
                if (v27 >= v56)
                {
                  uint64_t v32 = (char *)__p;
                  uint64_t v33 = (v27 - (unsigned char *)__p) >> 5;
                  unint64_t v34 = v33 + 1;
                  if ((unint64_t)(v33 + 1) >> 59) {
                    std::vector<std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>>::__throw_length_error[abi:ne180100]();
                  }
                  uint64_t v35 = v56 - (unsigned char *)__p;
                  if ((v56 - (unsigned char *)__p) >> 4 > v34) {
                    unint64_t v34 = v35 >> 4;
                  }
                  if ((unint64_t)v35 >= 0x7FFFFFFFFFFFFFE0) {
                    unint64_t v36 = 0x7FFFFFFFFFFFFFFLL;
                  }
                  else {
                    unint64_t v36 = v34;
                  }
                  if (v36)
                  {
                    uint64_t v37 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::tuple<std::string,unsigned int,unsigned int>>>((uint64_t)&v56, v36);
                    uint64_t v32 = (char *)__p;
                    id v27 = v55;
                  }
                  else
                  {
                    uint64_t v37 = 0;
                  }
                  long long v38 = v30[1];
                  uint64_t v39 = &v37[32 * v33];
                  *(_OWORD *)uint64_t v39 = *v30;
                  *((_OWORD *)v39 + 1) = v38;
                  if (v27 == v32)
                  {
                    id v42 = &v37[32 * v33];
                  }
                  else
                  {
                    uint64_t v40 = &v37[32 * v33];
                    do
                    {
                      long long v41 = *((_OWORD *)v27 - 1);
                      id v42 = v40 - 32;
                      *((_OWORD *)v40 - 2) = *((_OWORD *)v27 - 2);
                      *((_OWORD *)v40 - 1) = v41;
                      v27 -= 32;
                      v40 -= 32;
                    }
                    while (v27 != v32);
                  }
                  id v27 = v39 + 32;
                  std::string __p = v42;
                  v55 = v39 + 32;
                  v56 = &v37[32 * v36];
                  if (v32) {
                    operator delete(v32);
                  }
                }
                else
                {
                  long long v31 = v30[1];
                  *(_OWORD *)id v27 = *v30;
                  *((_OWORD *)v27 + 1) = v31;
                  v27 += 32;
                }
                v55 = v27;
                unint64_t v28 = (v28 + 1);
                uint64_t v26 = *(void *)p_airntObjectList->__begin_[v8];
              }
              while (v28 < (*((void *)p_airntObjectList->__begin_[v8] + 1) - v26) >> 3);
              long long v43 = __p;
            }
            long long v44 = *(uint64_t **)(*(void *)v26 + 24);
            v52 = 0;
            uint64_t v53 = 0;
            unint64_t v51 = 0;
            std::vector<MTLUINT256_t>::__init_with_size[abi:ne180100]<MTLUINT256_t*,MTLUINT256_t*>(&v51, v43, (uint64_t)v27, (v27 - (unsigned char *)v43) >> 5);
            BOOL v45 = MTLHashKey::areBitcodesEqual((uint64_t)&v61, v44, (uint64_t)&v51);
            if (v51)
            {
              v52 = v51;
              operator delete(v51);
            }
            if (v45) {
              operator new();
            }
            if (__p)
            {
              v55 = (char *)__p;
              operator delete(__p);
            }
            MTLHashKey::~MTLHashKey(&v61);
            if (!v25) {
              break;
            }
            uint64_t v21 = v20[3];
            unint64_t v24 = v25 - 1;
            if (0xCCCCCCCCCCCCCCCDLL * ((v20[4] - v21) >> 4) <= v25 - 1) {
              goto LABEL_64;
            }
          }
        }
      }
      end = p_airntObjectList->__begin_;
      unint64_t v46 = p_airntObjectList->__begin_[v8];
      if (v46)
      {
        MTLAirNTObject::~MTLAirNTObject(v46);
        MEMORY[0x18530C140]();
        end = p_airntObjectList->__begin_;
      }
      ++v8;
    }
    while (v8 < self->_airntObjectList.__end_ - end);
  }
  self->_airntObjectList.__end_ = end;
  self->_airntFromDescriptorFunctionList.__end_ = self->_airntFromDescriptorFunctionList.__begin_;
}

- (BOOL)airntSerializeToURL:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  id v6 = a3;
  uint64_t v24 = 0;
  unint64_t v25 = &v24;
  uint64_t v26 = 0x2020000000;
  char v27 = 0;
  if (a5) {
    *a5 = 0;
  }
  uint64_t v18 = 0;
  unint64_t v19 = &v18;
  uint64_t v20 = 0x3052000000;
  uint64_t v21 = __Block_byref_object_copy_;
  uint64_t v22 = __Block_byref_object_dispose_;
  uint64_t v23 = 0;
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x3052000000;
  v17[3] = __Block_byref_object_copy_;
  v17[4] = __Block_byref_object_dispose_;
  v17[5] = 0;
  if (!objc_msgSend(a3, "path", a3, a4) || !objc_msgSend(v6, "filePathURL"))
  {
    if (a5)
    {
      id v12 = newErrorWithMessage(&cfstr_InvalidUrl.isa, MTLBinaryArchiveErrorInvalidFile);
LABEL_14:
      LOBYTE(v6) = 0;
      *a5 = v12;
      goto LABEL_24;
    }
LABEL_17:
    LOBYTE(v6) = 0;
    goto LABEL_24;
  }
  if (stat((const char *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v6, "URLByDeletingLastPathComponent"), "path"), "UTF8String"), &v16) == -1)
  {
    if (a5)
    {
      id v12 = newErrorWithMessage(&cfstr_InvalidUrl.isa, MTLBinaryArchiveErrorInvalidFile);
      goto LABEL_14;
    }
    goto LABEL_17;
  }
  unint64_t v8 = (void *)MEMORY[0x18530C9F0]();
  atomic_store(1u, (unsigned __int8 *)&self->_serializing);
  serializeQueue = self->_serializeQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55___MTLBinaryArchive_airntSerializeToURL_options_error___block_invoke;
  block[3] = &unk_1E521FB80;
  block[4] = self;
  block[5] = v6;
  block[6] = v17;
  void block[7] = &v24;
  void block[8] = &v18;
  dispatch_sync(serializeQueue, block);
  atomic_store(0, (unsigned __int8 *)&self->_serializing);
  unint64_t v10 = (void *)v19[5];
  if (v10)
  {
    if (a5) {
      *a5 = v10;
    }
    if (!*((unsigned char *)v25 + 24) && *a5) {
      id v11 = *a5;
    }
  }
  else
  {
    LOBYTE(v6) = *((unsigned char *)v25 + 24) != 0;
  }
  if (v10)
  {
    if (a5 && *a5) {
      id v13 = *a5;
    }
    LOBYTE(v6) = *((unsigned char *)v25 + 24) != 0;
  }
LABEL_24:
  _Block_object_dispose(v17, 8);
  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v24, 8);
  return v6 & 1;
}

- (BOOL)serializeToURL:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  if (self->_isLegacy) {
    return [(_MTLBinaryArchive *)self legacySerializeToURL:a3 options:a4 error:a5];
  }
  else {
    return [(_MTLBinaryArchive *)self airntSerializeToURL:a3 options:a4 error:a5];
  }
}

- (void)setMTLLinkedFunctions:(id)a3 LFS:(const LinkedFunctions *)a4 obj:(void *)a5 destinationArchive:(id)a6 error:(id *)a7
{
  if (a4)
  {
    memset(v114, 0, sizeof(v114));
    int v115 = 1065353216;
    memset(v112, 0, sizeof(v112));
    int v113 = 1065353216;
    memset(v110, 0, sizeof(v110));
    int v111 = 1065353216;
    uint64_t v7 = *(int *)a4->var0;
    uint64_t v8 = -v7;
    unint64_t v9 = &a4[-v7];
    if (*(unsigned __int16 *)v9->var0 >= 5u)
    {
      uint64_t v10 = *(unsigned __int16 *)v9[4].var0;
      if (v10)
      {
        id v11 = &a4[v10];
        uint64_t v12 = *(unsigned int *)v11->var0;
        unint64_t v14 = &v11[v12 + 4];
        uint64_t v13 = *(unsigned int *)v11[v12].var0;
        if (v13)
        {
          v99 = a4;
          int var0 = (unsigned int *)v14[4 * v13].var0;
          do
          {
            std::string::basic_string[abi:ne180100](&__p, (void *)&v14[*(unsigned int *)v14->var0 + 4], *(unsigned int *)v14[*(unsigned int *)v14->var0].var0);
            int v15 = (char)v109;
            stat v16 = (void **)__p;
            if ((v109 & 0x80u) == 0) {
              uint64_t v17 = v109;
            }
            else {
              uint64_t v17 = v108;
            }
            if ((v109 & 0x80u) == 0) {
              p_p = (char *)&__p;
            }
            else {
              p_p = (char *)__p;
            }
            if (v17 >= 18)
            {
              unint64_t v19 = &p_p[v17];
              uint64_t v20 = v17;
              uint64_t v21 = p_p;
              do
              {
                uint64_t v22 = (char *)memchr(v21, 95, v20 - 17);
                if (!v22) {
                  break;
                }
                if (*(void *)v22 == 0x65725F7269615F5FLL
                  && *((void *)v22 + 1) == 0x5F5F6465766C6F73
                  && *((_WORD *)v22 + 8) == 14906)
                {
                  if (v22 != v19 && v22 == p_p)
                  {
                    uint64_t v25 = 0;
                    uint64_t v26 = p_p - 1;
                    while (v17 != v25)
                    {
                      int v27 = v26[v17];
                      ++v25;
                      --v26;
                      if (v27 == 95)
                      {
                        unint64_t v28 = v17 - v25 - 18;
                        uint64_t v29 = &__p;
                        if (v15 < 0) {
                          uint64_t v29 = v16;
                        }
                        long long v30 = (char *)v29 + 18;
                        if (v17 - 18 < v28) {
                          unint64_t v28 = v17 - 18;
                        }
                        if (v17 + 1 != v25)
                        {
                          p_p = v30;
                          uint64_t v17 = v28;
                        }
                        break;
                      }
                    }
                    MEMORY[0x18530BF40](&__p, p_p, v17);
                  }
                  break;
                }
                uint64_t v21 = v22 + 1;
                uint64_t v20 = v19 - (unsigned char *)v21;
              }
              while (v19 - (unsigned char *)v21 >= 18);
            }
            std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::__emplace_unique_key_args<std::string,std::string const&>((uint64_t)v114, (unsigned __int8 *)&__p, (uint64_t)&__p);
            if ((char)v109 < 0) {
              operator delete(__p);
            }
            v14 += 4;
          }
          while (v14 != (const LinkedFunctions *)var0);
          a4 = v99;
          uint64_t v8 = -(uint64_t)*(int *)v99->var0;
        }
      }
    }
    if (*(unsigned __int16 *)a4[v8].var0 >= 7u)
    {
      if (*(_WORD *)a4[v8 + 6].var0)
      {
        long long v31 = &a4[*(unsigned __int16 *)a4[v8 + 6].var0];
        uint64_t v32 = *(unsigned int *)v31->var0;
        unint64_t v34 = &v31[v32 + 4];
        uint64_t v33 = *(unsigned int *)v31[v32].var0;
        if (v33)
        {
          v100 = a4;
          long long v104 = (unsigned int *)v34[4 * v33].var0;
          do
          {
            std::string::basic_string[abi:ne180100](&__p, (void *)&v34[*(unsigned int *)v34->var0 + 4], *(unsigned int *)v34[*(unsigned int *)v34->var0].var0);
            int v35 = (char)v109;
            unint64_t v36 = (void **)__p;
            if ((v109 & 0x80u) == 0) {
              uint64_t v37 = v109;
            }
            else {
              uint64_t v37 = v108;
            }
            if ((v109 & 0x80u) == 0) {
              long long v38 = (char *)&__p;
            }
            else {
              long long v38 = (char *)__p;
            }
            if (v37 >= 18)
            {
              uint64_t v39 = &v38[v37];
              uint64_t v40 = v37;
              long long v41 = v38;
              do
              {
                id v42 = (char *)memchr(v41, 95, v40 - 17);
                if (!v42) {
                  break;
                }
                if (*(void *)v42 == 0x65725F7269615F5FLL
                  && *((void *)v42 + 1) == 0x5F5F6465766C6F73
                  && *((_WORD *)v42 + 8) == 14906)
                {
                  if (v42 != v39 && v42 == v38)
                  {
                    uint64_t v45 = 0;
                    unint64_t v46 = v38 - 1;
                    while (v37 != v45)
                    {
                      int v47 = v46[v37];
                      ++v45;
                      --v46;
                      if (v47 == 95)
                      {
                        unint64_t v48 = v37 - v45 - 18;
                        unint64_t v49 = &__p;
                        if (v35 < 0) {
                          unint64_t v49 = v36;
                        }
                        unint64_t v50 = (char *)v49 + 18;
                        if (v37 - 18 < v48) {
                          unint64_t v48 = v37 - 18;
                        }
                        if (v37 + 1 != v45)
                        {
                          long long v38 = v50;
                          uint64_t v37 = v48;
                        }
                        break;
                      }
                    }
                    MEMORY[0x18530BF40](&__p, v38, v37);
                  }
                  break;
                }
                long long v41 = v42 + 1;
                uint64_t v40 = v39 - (unsigned char *)v41;
              }
              while (v39 - (unsigned char *)v41 >= 18);
            }
            std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::__emplace_unique_key_args<std::string,std::string const&>((uint64_t)v112, (unsigned __int8 *)&__p, (uint64_t)&__p);
            if ((char)v109 < 0) {
              operator delete(__p);
            }
            v34 += 4;
          }
          while (v34 != (const LinkedFunctions *)v104);
          a4 = v100;
          uint64_t v8 = -(uint64_t)*(int *)v100->var0;
        }
      }
    }
    unint64_t v51 = &a4[v8];
    if (*(unsigned __int16 *)v51->var0 >= 9u)
    {
      uint64_t v52 = *(unsigned __int16 *)v51[8].var0;
      if (v52)
      {
        uint64_t v53 = &a4[v52 + *(unsigned int *)a4[v52].var0];
        unsigned int v56 = *(_DWORD *)v53->var0;
        v55 = v53 + 4;
        uint64_t v54 = v56;
        if (v56)
        {
          long long v95 = (unsigned int *)v55[4 * v54].var0;
          do
          {
            v101 = v55;
            uint64_t v57 = &v55[*(unsigned int *)v55->var0];
            v58 = &v57[-*(int *)v57->var0];
            unsigned int v59 = *(unsigned __int16 *)v58->var0;
            uint64_t v60 = &v57[*(unsigned __int16 *)v58[4].var0 + *(unsigned int *)v57[*(unsigned __int16 *)v58[4].var0].var0];
            uint64_t v61 = *(unsigned int *)v60->var0;
            *(void *)&long long v106 = v60 + 4;
            *((void *)&v106 + 1) = v61;
            if (v59 >= 7)
            {
              uint64_t v62 = *(unsigned __int16 *)v58[6].var0;
              if (v62)
              {
                v63 = &v57[v62];
                uint64_t v64 = *(unsigned int *)v63->var0;
                v66 = (unsigned int *)v63[v64 + 4].var0;
                uint64_t v65 = *(unsigned int *)v63[v64].var0;
                if (v65)
                {
                  long long v105 = &v66[v65];
                  do
                  {
                    std::string::basic_string[abi:ne180100](&__p, (char *)v66 + *v66 + 4, *(unsigned int *)((char *)v66 + *v66));
                    int v67 = (char)v109;
                    v68 = (void **)__p;
                    if ((v109 & 0x80u) == 0) {
                      uint64_t v69 = v109;
                    }
                    else {
                      uint64_t v69 = v108;
                    }
                    if ((v109 & 0x80u) == 0) {
                      uint64_t v70 = (char *)&__p;
                    }
                    else {
                      uint64_t v70 = (char *)__p;
                    }
                    if (v69 >= 18)
                    {
                      v71 = &v70[v69];
                      uint64_t v72 = v69;
                      id v73 = v70;
                      do
                      {
                        v74 = (char *)memchr(v73, 95, v72 - 17);
                        if (!v74) {
                          break;
                        }
                        if (*(void *)v74 == 0x65725F7269615F5FLL
                          && *((void *)v74 + 1) == 0x5F5F6465766C6F73
                          && *((_WORD *)v74 + 8) == 14906)
                        {
                          if (v74 != v71 && v74 == v70)
                          {
                            uint64_t v77 = 0;
                            uint64_t v78 = v70 - 1;
                            while (v69 != v77)
                            {
                              int v79 = v78[v69];
                              ++v77;
                              --v78;
                              if (v79 == 95)
                              {
                                unint64_t v80 = v69 - v77 - 18;
                                v81 = &__p;
                                if (v67 < 0) {
                                  v81 = v68;
                                }
                                unint64_t v82 = (char *)v81 + 18;
                                if (v69 - 18 < v80) {
                                  unint64_t v80 = v69 - 18;
                                }
                                if (v69 + 1 != v77)
                                {
                                  uint64_t v70 = v82;
                                  uint64_t v69 = v80;
                                }
                                break;
                              }
                            }
                            MEMORY[0x18530BF40](&__p, v70, v69);
                          }
                          break;
                        }
                        id v73 = v74 + 1;
                        uint64_t v72 = v71 - (unsigned char *)v73;
                      }
                      while (v71 - (unsigned char *)v73 >= 18);
                    }
                    std::__hash_table<std::__hash_value_type<std::string,std::string_view>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::string_view>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::string_view>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::string_view>>>::__emplace_multi<std::string&,std::string_view&>(v110, (uint64_t)&__p, &v106);
                    if ((char)v109 < 0) {
                      operator delete(__p);
                    }
                    ++v66;
                  }
                  while (v66 != v105);
                }
              }
            }
            v55 = v101 + 4;
          }
          while (&v101[4] != (const LinkedFunctions *)v95);
        }
      }
    }
    id v83 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v84 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v85 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uint64_t v86 = *(void *)a5;
    if (*((void *)a5 + 1) - *(void *)a5 >= 9uLL)
    {
      unint64_t v87 = 1;
      do
      {
        if (*(unsigned char *)(*(void *)(v86 + 8 * v87) + 32)) {
          break;
        }
        id v88 = [(_MTLBinaryArchive *)self newRecompiledFunctionWithAIRNTObject:a5 index:v87 destinationArchive:a6 error:a7];
        std::string::basic_string[abi:ne180100]<0>(&__p, (char *)objc_msgSend((id)objc_msgSend(v88, "name"), "UTF8String"));
        if (std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::find<std::string>(v114, (unsigned __int8 *)&__p))
        {
          [v83 addObject:v88];
        }
        if (std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::find<std::string>(v112, (unsigned __int8 *)&__p))
        {
          [v84 addObject:v88];
        }
        v89 = std::__hash_table<std::__hash_value_type<std::string,std::string_view>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::string_view>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::string_view>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::string_view>>>::__equal_range_multi<std::string>(v110, (unsigned __int8 *)&__p);
        long long v91 = v90;
        while (v89 != v91)
        {
          v92 = v89 + 16;
          if ((char)v89[39] < 0) {
            v92 = (void *)*v92;
          }
          uint64_t v93 = [NSString stringWithCString:v92];
          if (![v85 objectForKeyedSubscript:v93]) {
            [v85 setObject:objc_alloc_init(MEMORY[0x1E4F1CA48]) forKeyedSubscript:v93];
          }
          objc_msgSend((id)objc_msgSend(v85, "objectForKeyedSubscript:", v93), "addObject:", v88);
          v89 = *(unsigned __int8 **)v89;
        }
        if ((char)v109 < 0) {
          operator delete(__p);
        }
        ++v87;
        uint64_t v86 = *(void *)a5;
      }
      while (v87 < (uint64_t)(*((void *)a5 + 1) - *(void *)a5) >> 3);
    }
    [a3 setFunctions:v83];
    [a3 setPrivateFunctions:v84];
    [a3 setGroups:v85];
    std::__hash_table<std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>,std::__unordered_map_hasher<std::tuple<std::string,unsigned int,unsigned int>,std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>,key_hash,std::equal_to<std::tuple<std::string,unsigned int,unsigned int>>,true>,std::__unordered_map_equal<std::tuple<std::string,unsigned int,unsigned int>,std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>,std::equal_to<std::tuple<std::string,unsigned int,unsigned int>>,key_hash,true>,std::allocator<std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>>>::~__hash_table((uint64_t)v110);
    std::__hash_table<std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>,std::__unordered_map_hasher<std::tuple<std::string,unsigned int,unsigned int>,std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>,key_hash,std::equal_to<std::tuple<std::string,unsigned int,unsigned int>>,true>,std::__unordered_map_equal<std::tuple<std::string,unsigned int,unsigned int>,std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>,std::equal_to<std::tuple<std::string,unsigned int,unsigned int>>,key_hash,true>,std::allocator<std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>>>::~__hash_table((uint64_t)v112);
    std::__hash_table<std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>,std::__unordered_map_hasher<std::tuple<std::string,unsigned int,unsigned int>,std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>,key_hash,std::equal_to<std::tuple<std::string,unsigned int,unsigned int>>,true>,std::__unordered_map_equal<std::tuple<std::string,unsigned int,unsigned int>,std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>,std::equal_to<std::tuple<std::string,unsigned int,unsigned int>>,key_hash,true>,std::allocator<std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>>>::~__hash_table((uint64_t)v114);
  }
}

- (id)newComputePipelineDescriptorWithScript:(const PipelineScript *)a3 obj:(void *)a4 destinationArchive:(id)a5 error:(id *)a6
{
  uint64_t v10 = (int *)Air::PipelineScript::pipeline_as_compute((Air::PipelineScript *)a3);
  id v11 = (unsigned __int16 *)((char *)v10 - *v10);
  if (*v11 >= 7u && (uint64_t v12 = v11[3]) != 0) {
    uint64_t v13 = (int *)((char *)v10 + v12 + *(unsigned int *)((char *)v10 + v12));
  }
  else {
    uint64_t v13 = 0;
  }
  unint64_t v14 = objc_opt_new();
  int v15 = v14;
  stat v16 = (unsigned __int16 *)((char *)v13 - *v13);
  if (*v16 >= 9u && (uint64_t v17 = v16[4]) != 0) {
    uint64_t v18 = *(void *)((char *)v13 + v17);
  }
  else {
    uint64_t v18 = 1;
  }
  [v14 setMaxCallStackDepth:v18];
  unint64_t v19 = (unsigned __int16 *)((char *)v13 - *v13);
  if (*v19 >= 7u && (uint64_t v20 = v19[3]) != 0) {
    uint64_t v21 = *(void *)((char *)v13 + v20);
  }
  else {
    uint64_t v21 = 0;
  }
  [v15 setMaxTotalThreadsPerThreadgroup:v21];
  uint64_t v22 = (unsigned __int16 *)((char *)v13 - *v13);
  v24 = *v22 >= 0x15u && (uint64_t v23 = v22[10]) != 0 && *((unsigned __int8 *)v13 + v23) != 0;
  [v15 setNeedsCustomBorderColorSamplers:v24];
  uint64_t v25 = (unsigned __int16 *)((char *)v13 - *v13);
  BOOL v27 = *v25 >= 0x11u && (v26 = v25[8]) != 0 && *((unsigned __int8 *)v13 + v26) != 0;
  [v15 setSupportAddingBinaryFunctions:v27];
  unint64_t v28 = (unsigned __int16 *)((char *)v13 - *v13);
  v30 = *v28 >= 0xFu && (uint64_t v29 = v28[7]) != 0 && *((unsigned __int8 *)v13 + v29) != 0;
  [v15 setSupportIndirectCommandBuffers:v30];
  long long v31 = (unsigned __int16 *)((char *)v13 - *v13);
  if (*v31 >= 0x13u && (uint64_t v32 = v31[9]) != 0) {
    uint64_t v33 = *((unsigned __int8 *)v13 + v32);
  }
  else {
    uint64_t v33 = 0;
  }
  [v15 setTextureWriteRoundingMode:v33];
  unint64_t v34 = (unsigned __int16 *)((char *)v13 - *v13);
  v36 = *v34 >= 5u && (uint64_t v35 = v34[2]) != 0 && *((unsigned __int8 *)v13 + v35) != 0;
  [v15 setThreadGroupSizeIsMultipleOfThreadExecutionWidth:v36];
  uint64_t v37 = *v13;
  uint64_t v38 = -v37;
  uint64_t v39 = (unsigned __int16 *)((char *)v13 - v37);
  if (*v39 >= 0xDu)
  {
    uint64_t v40 = v39[6];
    if (v40)
    {
      long long v41 = (int *)((char *)v13 + v40 + *(unsigned int *)((char *)v13 + v40));
      id v42 = v41 + 1;
      if (*v41)
      {
        unint64_t v43 = 0;
        do
        {
          uint64_t v44 = *v42;
          uint64_t v45 = v44 - *(int *)((char *)v42 + v44);
          if (*(unsigned __int16 *)((char *)v42 + v45) >= 5u
            && (uint64_t v46 = *(unsigned __int16 *)((char *)v42 + v45 + 4)) != 0)
          {
            uint64_t v47 = *((unsigned __int8 *)v42 + v44 + v46);
          }
          else
          {
            uint64_t v47 = 0;
          }
          objc_msgSend((id)objc_msgSend((id)objc_msgSend(v15, "buffers"), "objectAtIndexedSubscript:", v43++), "setMutability:", v47);
          ++v42;
        }
        while (v43 < *v41);
      }
      uint64_t v38 = -(uint64_t)*v13;
    }
  }
  unint64_t v48 = (unsigned __int16 *)((char *)v13 + v38);
  if (*v48 >= 0xBu && (uint64_t v49 = v48[5]) != 0) {
    unint64_t v50 = (int *)((char *)v13 + v49 + *(unsigned int *)((char *)v13 + v49));
  }
  else {
    unint64_t v50 = 0;
  }
  uint64_t v51 = [v15 linkedFunctions];
  uint64_t v52 = (unsigned __int16 *)((char *)v13 - *v13);
  if (*v52 >= 0x17u && (uint64_t v53 = v52[11]) != 0) {
    uint64_t v54 = (char *)v13 + v53 + *(unsigned int *)((char *)v13 + v53);
  }
  else {
    uint64_t v54 = 0;
  }
  [(_MTLBinaryArchive *)self setMTLLinkedFunctions:v51 LFS:v54 obj:a4 destinationArchive:a5 error:a6];
  if (v50)
  {
    v55 = (unsigned __int16 *)((char *)v50 - *v50);
    unsigned int v56 = *v55;
    if (v56 >= 5)
    {
      if (v55[2]) {
        uint64_t v57 = (int *)((char *)v50 + v55[2] + *(unsigned int *)((char *)v50 + v55[2]));
      }
      else {
        uint64_t v57 = 0;
      }
      if (v56 >= 7 && (uint64_t v58 = v55[3]) != 0)
      {
        unsigned int v59 = (int *)((char *)v50 + v58 + *(unsigned int *)((char *)v50 + v58));
        if (!v57) {
          goto LABEL_76;
        }
      }
      else
      {
        unsigned int v59 = 0;
        if (!v57)
        {
LABEL_76:
          if (v59 && *v59)
          {
            uint64_t v75 = 0;
            unint64_t v76 = 0;
            do
            {
              uint64_t v77 = &v59[v75];
              uint64_t v78 = v59[v75 + 1];
              int v79 = (char *)&v59[v75] + v78 - *(int *)((char *)&v59[v75 + 1] + v78);
              if (*((unsigned __int16 *)v79 + 2) >= 5u && (uint64_t v80 = *((unsigned __int16 *)v79 + 4)) != 0) {
                uint64_t v81 = *((unsigned __int8 *)&v59[v75 + 1] + v78 + v80);
              }
              else {
                uint64_t v81 = 1;
              }
              objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v15, "stageInputDescriptor"), "layouts"), "objectAtIndexedSubscript:", v76), "setStepFunction:", v81);
              uint64_t v82 = v77[1];
              uint64_t v83 = v82 - *(int *)((char *)v77 + v82 + 4);
              if (*(unsigned __int16 *)((char *)v77 + v83 + 4) >= 7u
                && (uint64_t v84 = *(unsigned __int16 *)((char *)&v59[v75 + 2] + v83 + 2)) != 0)
              {
                uint64_t v85 = *(void *)((char *)&v59[v75 + 1] + v82 + v84);
              }
              else
              {
                uint64_t v85 = 1;
              }
              objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v15, "stageInputDescriptor"), "layouts"), "objectAtIndexedSubscript:", v76), "setStepRate:", v85);
              uint64_t v86 = v77[1];
              unint64_t v87 = (char *)&v59[v75] + v86 - *(int *)((char *)&v59[v75 + 1] + v86);
              if (*((unsigned __int16 *)v87 + 2) >= 9u && (uint64_t v88 = *((unsigned __int16 *)v87 + 6)) != 0) {
                uint64_t v89 = *(void *)((char *)&v59[v75 + 1] + v86 + v88);
              }
              else {
                uint64_t v89 = 0;
              }
              objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v15, "stageInputDescriptor"), "layouts"), "objectAtIndexedSubscript:", v76++), "setStride:", v89);
              ++v75;
            }
            while (v76 < *v59);
          }
          return v15;
        }
      }
      if (*v57)
      {
        uint64_t v60 = 0;
        unint64_t v61 = 0;
        do
        {
          uint64_t v62 = &v57[v60];
          uint64_t v63 = v57[v60 + 1];
          uint64_t v64 = (char *)&v57[v60] + v63 - *(int *)((char *)&v57[v60 + 1] + v63);
          if (*((unsigned __int16 *)v64 + 2) >= 9u && (uint64_t v65 = *((unsigned __int16 *)v64 + 6)) != 0) {
            uint64_t v66 = *(unsigned int *)((char *)&v57[v60 + 1] + v63 + v65);
          }
          else {
            uint64_t v66 = 0;
          }
          objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v15, "stageInputDescriptor"), "attributes"), "objectAtIndexedSubscript:", v61), "setBufferIndex:", v66);
          uint64_t v67 = v62[1];
          uint64_t v68 = v67 - *(int *)((char *)v62 + v67 + 4);
          if (*(unsigned __int16 *)((char *)v62 + v68 + 4) >= 7u
            && (uint64_t v69 = *(unsigned __int16 *)((char *)&v57[v60 + 2] + v68 + 2)) != 0)
          {
            uint64_t v70 = *(void *)((char *)&v57[v60 + 1] + v67 + v69);
          }
          else
          {
            uint64_t v70 = 0;
          }
          objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v15, "stageInputDescriptor"), "attributes"), "objectAtIndexedSubscript:", v61), "setOffset:", v70);
          uint64_t v71 = v62[1];
          uint64_t v72 = (char *)&v57[v60] + v71 - *(int *)((char *)&v57[v60 + 1] + v71);
          if (*((unsigned __int16 *)v72 + 2) >= 5u && (uint64_t v73 = *((unsigned __int16 *)v72 + 4)) != 0) {
            uint64_t v74 = *((unsigned __int8 *)&v57[v60 + 1] + v71 + v73);
          }
          else {
            uint64_t v74 = 0;
          }
          objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v15, "stageInputDescriptor"), "attributes"), "objectAtIndexedSubscript:", v61++), "setFormat:", v74);
          ++v60;
        }
        while (v61 < *v57);
      }
      goto LABEL_76;
    }
  }
  return v15;
}

- (id)newRenderPipelineDescriptorWithScript:(const PipelineScript *)a3 obj:(void *)a4 destinationArchive:(id)a5 error:(id *)a6
{
  uint64_t v8 = objc_opt_new();
  unint64_t v9 = (int *)Air::PipelineScript::pipeline_as_render((Air::PipelineScript *)a3);
  uint64_t v10 = (unsigned __int16 *)((char *)v9 - *v9);
  if (*v10 >= 9u && (uint64_t v11 = v10[4]) != 0) {
    uint64_t v12 = (int *)((char *)v9 + v11 + *(unsigned int *)((char *)v9 + v11));
  }
  else {
    uint64_t v12 = 0;
  }
  uint64_t v13 = (unsigned __int16 *)((char *)v12 - *v12);
  v15 = *v13 < 9u || (uint64_t v14 = v13[4]) == 0 || *((unsigned __int8 *)v12 + v14) != 0;
  [v8 setRasterizationEnabled:v15];
  stat v16 = (unsigned __int16 *)((char *)v12 - *v12);
  if (*v16 >= 0x27u && (uint64_t v17 = v16[19]) != 0) {
    uint64_t v18 = *((unsigned __int8 *)v12 + v17);
  }
  else {
    uint64_t v18 = 255;
  }
  [v8 setClipDistanceEnableMask:v18];
  unint64_t v19 = (unsigned __int16 *)((char *)v12 - *v12);
  if (*v19 >= 0x29u && (uint64_t v20 = v19[20]) != 0) {
    uint64_t v21 = *(unsigned int *)((char *)v12 + v20);
  }
  else {
    uint64_t v21 = 0;
  }
  [v8 setVertexDepthCompareClampMask:v21];
  uint64_t v22 = (unsigned __int16 *)((char *)v12 - *v12);
  if (*v22 >= 5u && (uint64_t v23 = v22[2]) != 0) {
    uint64_t v24 = *(void *)((char *)v12 + v23);
  }
  else {
    uint64_t v24 = 1;
  }
  [v8 setMaxVertexCallStackDepth:v24];
  uint64_t v25 = (unsigned __int16 *)((char *)v12 - *v12);
  if (*v25 >= 0xDu && (uint64_t v26 = v25[6]) != 0) {
    uint64_t v27 = *(void *)((char *)v12 + v26);
  }
  else {
    uint64_t v27 = 16;
  }
  [v8 setMaxTessellationFactor:v27];
  unint64_t v28 = (unsigned __int16 *)((char *)v12 - *v12);
  if (*v28 >= 0x1Bu && (uint64_t v29 = v28[13]) != 0) {
    uint64_t v30 = *(void *)((char *)v12 + v29);
  }
  else {
    uint64_t v30 = 1;
  }
  [v8 setMaxVertexAmplificationCount:v30];
  long long v31 = (unsigned __int16 *)((char *)v12 - *v12);
  if (*v31 >= 0x1Du && (uint64_t v32 = v31[14]) != 0) {
    uint64_t v33 = *((unsigned __int8 *)v12 + v32);
  }
  else {
    uint64_t v33 = 0;
  }
  [v8 setVertexAmplificationMode:v33];
  unint64_t v34 = (unsigned __int16 *)((char *)v12 - *v12);
  v36 = *v34 >= 0x2Bu && (uint64_t v35 = v34[21]) != 0 && *((unsigned __int8 *)v12 + v35) != 0;
  [v8 setNeedsCustomBorderColorSamplers:v36];
  uint64_t v37 = (unsigned __int16 *)((char *)v12 - *v12);
  BOOL v39 = *v37 >= 0x23u && (v38 = v37[17]) != 0 && *((unsigned __int8 *)v12 + v38) != 0;
  [v8 setSupportAddingVertexBinaryFunctions:v39];
  uint64_t v40 = (unsigned __int16 *)((char *)v12 - *v12);
  v42 = *v40 >= 0x21u && (uint64_t v41 = v40[16]) != 0 && *((unsigned __int8 *)v12 + v41) != 0;
  [v8 setSupportIndirectCommandBuffers:v42];
  unint64_t v43 = (unsigned __int16 *)((char *)v12 - *v12);
  v45 = *v43 >= 0xFu && (uint64_t v44 = v43[7]) != 0 && *((unsigned __int8 *)v12 + v44) != 0;
  [v8 setTessellationFactorScaleEnabled:v45];
  uint64_t v46 = (unsigned __int16 *)((char *)v12 - *v12);
  if (*v46 >= 0x13u && (uint64_t v47 = v46[9]) != 0) {
    uint64_t v48 = *((unsigned __int8 *)v12 + v47);
  }
  else {
    uint64_t v48 = 0;
  }
  [v8 setTessellationControlPointIndexType:v48];
  uint64_t v49 = (unsigned __int16 *)((char *)v12 - *v12);
  if (*v49 >= 0x11u && (uint64_t v50 = v49[8]) != 0) {
    uint64_t v51 = *((unsigned __int8 *)v12 + v50);
  }
  else {
    uint64_t v51 = 0;
  }
  [v8 setTessellationFactorFormat:v51];
  uint64_t v52 = (unsigned __int16 *)((char *)v12 - *v12);
  if (*v52 >= 0x19u && (uint64_t v53 = v52[12]) != 0) {
    uint64_t v54 = *((unsigned __int8 *)v12 + v53);
  }
  else {
    uint64_t v54 = 0;
  }
  [v8 setTessellationPartitionMode:v54];
  v55 = (unsigned __int16 *)((char *)v12 - *v12);
  if (*v55 >= 0x15u && (uint64_t v56 = v55[10]) != 0) {
    uint64_t v57 = *((unsigned __int8 *)v12 + v56);
  }
  else {
    uint64_t v57 = 0;
  }
  [v8 setTessellationFactorStepFunction:v57];
  uint64_t v58 = (unsigned __int16 *)((char *)v12 - *v12);
  if (*v58 >= 0x17u && (uint64_t v59 = v58[11]) != 0) {
    uint64_t v60 = *((unsigned __int8 *)v12 + v59);
  }
  else {
    uint64_t v60 = 0;
  }
  [v8 setTessellationOutputWindingOrder:v60];
  unint64_t v61 = (unsigned __int16 *)((char *)v12 - *v12);
  if (*v61 >= 0xBu && (uint64_t v62 = v61[5]) != 0) {
    uint64_t v63 = *((unsigned __int8 *)v12 + v62);
  }
  else {
    uint64_t v63 = 0;
  }
  [v8 setInputPrimitiveTopology:v63];
  uint64_t v64 = (unsigned __int16 *)((char *)v12 - *v12);
  if (*v64 >= 0x25u && (uint64_t v65 = v64[18]) != 0) {
    uint64_t v66 = *((unsigned __int8 *)v12 + v65);
  }
  else {
    uint64_t v66 = 0;
  }
  [v8 setTextureWriteRoundingMode:v66];
  uint64_t v67 = *v12;
  uint64_t v68 = -v67;
  uint64_t v69 = (unsigned __int16 *)((char *)v12 - v67);
  if (*v69 >= 0x1Fu)
  {
    uint64_t v70 = v69[15];
    if (v70)
    {
      uint64_t v71 = (int *)((char *)v12 + v70 + *(unsigned int *)((char *)v12 + v70));
      uint64_t v72 = v71 + 1;
      if (*v71)
      {
        unint64_t v73 = 0;
        do
        {
          uint64_t v74 = *v72;
          uint64_t v75 = v74 - *(int *)((char *)v72 + v74);
          if (*(unsigned __int16 *)((char *)v72 + v75) >= 5u
            && (uint64_t v76 = *(unsigned __int16 *)((char *)v72 + v75 + 4)) != 0)
          {
            uint64_t v77 = *((unsigned __int8 *)v72 + v74 + v76);
          }
          else
          {
            uint64_t v77 = 0;
          }
          objc_msgSend((id)objc_msgSend((id)objc_msgSend(v8, "vertexBuffers"), "objectAtIndexedSubscript:", v73++), "setMutability:", v77);
          ++v72;
        }
        while (v73 < *v71);
      }
      uint64_t v68 = -(uint64_t)*v12;
    }
  }
  uint64_t v78 = (unsigned __int16 *)((char *)v12 + v68);
  if (*v78 >= 7u)
  {
    uint64_t v79 = v78[3];
    if (v79)
    {
      uint64_t v80 = (int *)((char *)v12 + v79 + *(unsigned int *)((char *)v12 + v79));
      uint64_t v81 = (unsigned __int16 *)((char *)v80 - *v80);
      unsigned int v82 = *v81;
      if (v82 > 4)
      {
        if (v81[2]) {
          uint64_t v83 = (int *)((char *)v80 + v81[2] + *(unsigned int *)((char *)v80 + v81[2]));
        }
        else {
          uint64_t v83 = 0;
        }
        if (v82 >= 7 && (uint64_t v84 = v81[3]) != 0) {
          uint64_t v85 = (int *)((char *)v80 + v84 + *(unsigned int *)((char *)v80 + v84));
        }
        else {
          uint64_t v85 = 0;
        }
        if (v83 && *v83)
        {
          uint64_t v86 = 0;
          unint64_t v87 = 0;
          do
          {
            uint64_t v88 = &v83[v86];
            uint64_t v89 = v83[v86 + 1];
            v90 = (char *)&v83[v86] + v89 - *(int *)((char *)&v83[v86 + 1] + v89);
            if (*((unsigned __int16 *)v90 + 2) >= 9u && (uint64_t v91 = *((unsigned __int16 *)v90 + 6)) != 0) {
              uint64_t v92 = *(unsigned int *)((char *)&v83[v86 + 1] + v89 + v91);
            }
            else {
              uint64_t v92 = 0;
            }
            objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v8, "vertexDescriptor"), "attributes"), "objectAtIndexedSubscript:", v87), "setBufferIndex:", v92);
            uint64_t v93 = v88[1];
            uint64_t v94 = v93 - *(int *)((char *)v88 + v93 + 4);
            if (*(unsigned __int16 *)((char *)v88 + v94 + 4) >= 7u
              && (uint64_t v95 = *(unsigned __int16 *)((char *)&v83[v86 + 2] + v94 + 2)) != 0)
            {
              uint64_t v96 = *(void *)((char *)&v83[v86 + 1] + v93 + v95);
            }
            else
            {
              uint64_t v96 = 0;
            }
            objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v8, "vertexDescriptor"), "attributes"), "objectAtIndexedSubscript:", v87), "setOffset:", v96);
            uint64_t v97 = v88[1];
            v98 = (char *)&v83[v86] + v97 - *(int *)((char *)&v83[v86 + 1] + v97);
            if (*((unsigned __int16 *)v98 + 2) >= 5u && (uint64_t v99 = *((unsigned __int16 *)v98 + 4)) != 0) {
              uint64_t v100 = *((unsigned __int8 *)&v83[v86 + 1] + v97 + v99);
            }
            else {
              uint64_t v100 = 0;
            }
            objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v8, "vertexDescriptor"), "attributes"), "objectAtIndexedSubscript:", v87++), "setFormat:", v100);
            ++v86;
          }
          while (v87 < *v83);
        }
        if (v85 && *v85)
        {
          uint64_t v101 = 0;
          unint64_t v102 = 0;
          do
          {
            v103 = &v85[v101];
            uint64_t v104 = v85[v101 + 1];
            long long v105 = (char *)&v85[v101] + v104 - *(int *)((char *)&v85[v101 + 1] + v104);
            if (*((unsigned __int16 *)v105 + 2) >= 5u && (uint64_t v106 = *((unsigned __int16 *)v105 + 4)) != 0) {
              uint64_t v107 = *((unsigned __int8 *)&v85[v101 + 1] + v104 + v106);
            }
            else {
              uint64_t v107 = 1;
            }
            objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v8, "vertexDescriptor"), "layouts"), "objectAtIndexedSubscript:", v102), "setStepFunction:", v107);
            uint64_t v108 = v103[1];
            uint64_t v109 = v108 - *(int *)((char *)v103 + v108 + 4);
            if (*(unsigned __int16 *)((char *)v103 + v109 + 4) >= 7u
              && (uint64_t v110 = *(unsigned __int16 *)((char *)&v85[v101 + 2] + v109 + 2)) != 0)
            {
              uint64_t v111 = *(void *)((char *)&v85[v101 + 1] + v108 + v110);
            }
            else
            {
              uint64_t v111 = 1;
            }
            objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v8, "vertexDescriptor"), "layouts"), "objectAtIndexedSubscript:", v102), "setStepRate:", v111);
            uint64_t v112 = v103[1];
            int v113 = (char *)&v85[v101] + v112 - *(int *)((char *)&v85[v101 + 1] + v112);
            if (*((unsigned __int16 *)v113 + 2) >= 9u && (uint64_t v114 = *((unsigned __int16 *)v113 + 6)) != 0) {
              uint64_t v115 = *(void *)((char *)&v85[v101 + 1] + v112 + v114);
            }
            else {
              uint64_t v115 = 0;
            }
            objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v8, "vertexDescriptor"), "layouts"), "objectAtIndexedSubscript:", v102++), "setStride:", v115);
            ++v101;
          }
          while (v102 < *v85);
        }
      }
    }
  }
  uint64_t v116 = [v8 vertexLinkedFunctions];
  v117 = (unsigned __int16 *)((char *)v12 - *v12);
  if (*v117 >= 0x2Du && (uint64_t v118 = v117[22]) != 0) {
    long long v119 = (char *)v12 + v118 + *(unsigned int *)((char *)v12 + v118);
  }
  else {
    long long v119 = 0;
  }
  [(_MTLBinaryArchive *)self setMTLLinkedFunctions:v116 LFS:v119 obj:a4 destinationArchive:a5 error:a6];
  id v120 = (int *)Air::PipelineScript::pipeline_as_render((Air::PipelineScript *)a3);
  long long v121 = (unsigned __int16 *)((char *)v120 - *v120);
  if (*v121 >= 0xBu && (uint64_t v122 = v121[5]) != 0) {
    uint64_t v123 = (int *)((char *)v120 + v122 + *(unsigned int *)((char *)v120 + v122));
  }
  else {
    uint64_t v123 = 0;
  }
  uint64_t v124 = (unsigned __int16 *)((char *)v123 - *v123);
  v126 = *v124 >= 0x29u && (uint64_t v125 = v124[20]) != 0 && *((unsigned __int8 *)v123 + v125) != 0;
  [v8 setAlphaTestEnabled:v126];
  v127 = (unsigned __int16 *)((char *)v123 - *v123);
  if (*v127 >= 0x2Bu && (uint64_t v128 = v127[21]) != 0) {
    uint64_t v129 = *((unsigned __int8 *)v123 + v128);
  }
  else {
    uint64_t v129 = 0;
  }
  [v8 setAlphaTestFunction:v129];
  v130 = (unsigned __int16 *)((char *)v123 - *v123);
  v132 = *v130 >= 9u && (uint64_t v131 = v130[4]) != 0 && *((unsigned __int8 *)v123 + v131) != 0;
  [v8 setAlphaToCoverageEnabled:v132];
  v133 = (unsigned __int16 *)((char *)v123 - *v123);
  v135 = *v133 >= 0xBu && (uint64_t v134 = v133[5]) != 0 && *((unsigned __int8 *)v123 + v134) != 0;
  [v8 setAlphaToOneEnabled:v135];
  v136 = (unsigned __int16 *)((char *)v123 - *v123);
  if (*v136 >= 0xFu && (uint64_t v137 = v136[7]) != 0) {
    uint64_t v138 = *(void *)((char *)v123 + v137);
  }
  else {
    uint64_t v138 = 0;
  }
  [v8 setColorSampleCount:v138];
  v139 = (unsigned __int16 *)((char *)v123 - *v123);
  if (*v139 >= 0x19u && (uint64_t v140 = v139[12]) != 0) {
    uint64_t v141 = *(unsigned __int16 *)((char *)v123 + v140);
  }
  else {
    uint64_t v141 = 0;
  }
  [v8 setDepthAttachmentPixelFormat:v141];
  v142 = (unsigned __int16 *)((char *)v123 - *v123);
  if (*v142 >= 0x35u && (uint64_t v143 = v142[26]) != 0) {
    uint64_t v144 = *(unsigned int *)((char *)v123 + v143);
  }
  else {
    uint64_t v144 = 0;
  }
  [v8 setVertexDepthCompareClampMask:v144];
  v145 = (unsigned __int16 *)((char *)v123 - *v123);
  v147 = *v145 >= 0x2Fu && (uint64_t v146 = v145[23]) != 0 && *((unsigned __int8 *)v123 + v146) != 0;
  [v8 setDepthStencilWriteDisabled:v147];
  v148 = (unsigned __int16 *)((char *)v123 - *v123);
  if (*v148 >= 0x27u && (uint64_t v149 = v148[19]) != 0) {
    uint64_t v150 = *((unsigned __int8 *)v123 + v149);
  }
  else {
    uint64_t v150 = 0;
  }
  [v8 setLogicOperation:v150];
  v151 = (unsigned __int16 *)((char *)v123 - *v123);
  v153 = *v151 >= 0x25u && (uint64_t v152 = v151[18]) != 0 && *((unsigned __int8 *)v123 + v152) != 0;
  [v8 setLogicOperationEnabled:v153];
  v154 = (unsigned __int16 *)((char *)v123 - *v123);
  if (*v154 >= 5u && (uint64_t v155 = v154[2]) != 0) {
    uint64_t v156 = *(void *)((char *)v123 + v155);
  }
  else {
    uint64_t v156 = 1;
  }
  [v8 setMaxFragmentCallStackDepth:v156];
  v157 = (unsigned __int16 *)((char *)v123 - *v123);
  v159 = *v157 >= 0x33u && (uint64_t v158 = v157[25]) != 0 && *((unsigned __int8 *)v123 + v158) != 0;
  [v8 setNeedsCustomBorderColorSamplers:v159];
  v160 = (unsigned __int16 *)((char *)v123 - *v123);
  v162 = *v160 >= 0x31u && (uint64_t v161 = v160[24]) != 0 && *((unsigned __int8 *)v123 + v161) != 0;
  [v8 setOpenGLModeEnabled:v162];
  v163 = (unsigned __int16 *)((char *)v123 - *v123);
  v165 = *v163 >= 0x2Du && (uint64_t v164 = v163[22]) != 0 && *((unsigned __int8 *)v123 + v164) != 0;
  [v8 setPointSmoothEnabled:v165];
  v166 = (unsigned __int16 *)((char *)v123 - *v123);
  if (*v166 >= 0xDu && (uint64_t v167 = v166[6]) != 0) {
    uint64_t v168 = *(void *)((char *)v123 + v167);
  }
  else {
    uint64_t v168 = 1;
  }
  [v8 setRasterSampleCount:v168];
  v169 = (unsigned __int16 *)((char *)v123 - *v123);
  LODWORD(v170) = 1.0;
  if (*v169 >= 0x13u)
  {
    uint64_t v171 = v169[9];
    if (v171) {
      LODWORD(v170) = *(int *)((char *)v123 + v171);
    }
  }
  [v8 setSampleCoverage:v170];
  v172 = (unsigned __int16 *)((char *)v123 - *v123);
  v174 = *v172 >= 0x15u && (uint64_t v173 = v172[10]) != 0 && *((unsigned __int8 *)v123 + v173) != 0;
  [v8 setSampleCoverageInvert:v174];
  v175 = (unsigned __int16 *)((char *)v123 - *v123);
  if (*v175 >= 0x11u && (uint64_t v176 = v175[8]) != 0) {
    uint64_t v177 = *(void *)((char *)v123 + v176);
  }
  else {
    uint64_t v177 = -1;
  }
  [v8 setSampleMask:v177];
  v178 = (unsigned __int16 *)((char *)v123 - *v123);
  if (*v178 >= 0x1Bu && (uint64_t v179 = v178[13]) != 0) {
    uint64_t v180 = *(unsigned __int16 *)((char *)v123 + v179);
  }
  else {
    uint64_t v180 = 0;
  }
  [v8 setStencilAttachmentPixelFormat:v180];
  v181 = (unsigned __int16 *)((char *)v123 - *v123);
  v183 = *v181 >= 0x21u && (uint64_t v182 = v181[16]) != 0 && *((unsigned __int8 *)v123 + v182) != 0;
  [v8 setSupportAddingFragmentBinaryFunctions:v183];
  v184 = (unsigned __int16 *)((char *)v123 - *v123);
  unsigned int v185 = *v184;
  if (v185 >= 0x17)
  {
    if (v184[11]) {
      v186 = (int *)((char *)v123 + v184[11] + *(unsigned int *)((char *)v123 + v184[11]));
    }
    else {
      v186 = 0;
    }
    if (v185 >= 0x1D)
    {
      uint64_t v187 = v184[14];
      if (v187)
      {
        v188 = (int *)((char *)v123 + v187 + *(unsigned int *)((char *)v123 + v187));
        v189 = v188 + 1;
        if (*v188)
        {
          unint64_t v190 = 0;
          do
          {
            uint64_t v191 = *v189;
            uint64_t v192 = v191 - *(int *)((char *)v189 + v191);
            if (*(unsigned __int16 *)((char *)v189 + v192) >= 5u
              && (uint64_t v193 = *(unsigned __int16 *)((char *)v189 + v192 + 4)) != 0)
            {
              uint64_t v194 = *((unsigned __int8 *)v189 + v191 + v193);
            }
            else
            {
              uint64_t v194 = 0;
            }
            objc_msgSend((id)objc_msgSend((id)objc_msgSend(v8, "fragmentBuffers"), "objectAtIndexedSubscript:", v190++), "setMutability:", v194);
            ++v189;
          }
          while (v190 < *v188);
        }
      }
    }
    if (v186 && *v186)
    {
      uint64_t v195 = 0;
      unint64_t v196 = 0;
      do
      {
        v197 = &v186[v195];
        uint64_t v198 = v186[v195 + 1];
        v199 = (char *)&v186[v195] + v198 - *(int *)((char *)&v186[v195 + 1] + v198);
        if (*((unsigned __int16 *)v199 + 2) >= 0xBu && (uint64_t v200 = *((unsigned __int16 *)v199 + 7)) != 0) {
          uint64_t v201 = *((unsigned __int8 *)&v186[v195 + 1] + v198 + v200);
        }
        else {
          uint64_t v201 = 0;
        }
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(v8, "colorAttachments"), "objectAtIndexedSubscript:", v196), "setAlphaBlendOperation:", v201);
        uint64_t v202 = v197[1];
        uint64_t v203 = v202 - *(int *)((char *)v197 + v202 + 4);
        BOOL v205 = *(unsigned __int16 *)((char *)v197 + v203 + 4) >= 9u
            && (uint64_t v204 = *(unsigned __int16 *)((char *)&v186[v195 + 3] + v203)) != 0
            && *((unsigned __int8 *)&v186[v195 + 1] + v202 + v204) != 0;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(v8, "colorAttachments"), "objectAtIndexedSubscript:", v196), "setBlendingEnabled:", v205);
        uint64_t v206 = v197[1];
        v207 = &v186[v195];
        v208 = (char *)&v186[v195] + v206 - *(int *)((char *)&v186[v195 + 1] + v206);
        if (*((unsigned __int16 *)v208 + 2) >= 0xFu && (uint64_t v209 = *((unsigned __int16 *)v208 + 9)) != 0) {
          uint64_t v210 = *((unsigned __int8 *)&v186[v195 + 1] + v206 + v209);
        }
        else {
          uint64_t v210 = 0;
        }
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(v8, "colorAttachments"), "objectAtIndexedSubscript:", v196), "setDestinationAlphaBlendFactor:", v210);
        uint64_t v211 = v197[1];
        uint64_t v212 = v211 - *(int *)((char *)v207 + v211 + 4);
        if (*(unsigned __int16 *)((char *)v207 + v212 + 4) >= 0x11u
          && (uint64_t v213 = *(unsigned __int16 *)((char *)&v186[v195 + 5] + v212)) != 0)
        {
          uint64_t v214 = *((unsigned __int8 *)&v186[v195 + 1] + v211 + v213);
        }
        else
        {
          uint64_t v214 = 0;
        }
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(v8, "colorAttachments"), "objectAtIndexedSubscript:", v196), "setDestinationRGBBlendFactor:", v214);
        uint64_t v215 = v197[1];
        v216 = &v186[v195];
        v217 = (char *)&v186[v195] + v215 - *(int *)((char *)&v186[v195 + 1] + v215);
        if (*((unsigned __int16 *)v217 + 2) >= 5u && (uint64_t v218 = *((unsigned __int16 *)v217 + 4)) != 0) {
          uint64_t v219 = *(unsigned __int16 *)((char *)&v186[v195 + 1] + v215 + v218);
        }
        else {
          uint64_t v219 = 0;
        }
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(v8, "colorAttachments"), "objectAtIndexedSubscript:", v196), "setPixelFormat:", v219);
        uint64_t v220 = v197[1];
        uint64_t v221 = v220 - *(int *)((char *)v216 + v220 + 4);
        if (*(unsigned __int16 *)((char *)v216 + v221 + 4) >= 0x15u
          && (uint64_t v222 = *(unsigned __int16 *)((char *)&v186[v195 + 6] + v221)) != 0)
        {
          uint64_t v223 = *((unsigned __int8 *)&v186[v195 + 1] + v220 + v222);
        }
        else
        {
          uint64_t v223 = 1;
        }
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(v8, "colorAttachments"), "objectAtIndexedSubscript:", v196), "setSourceRGBBlendFactor:", v223);
        uint64_t v224 = v197[1];
        v225 = &v186[v195];
        v226 = (char *)&v186[v195] + v224 - *(int *)((char *)&v186[v195 + 1] + v224);
        if (*((unsigned __int16 *)v226 + 2) >= 0x13u && (uint64_t v227 = *((unsigned __int16 *)v226 + 11)) != 0) {
          uint64_t v228 = *((unsigned __int8 *)&v186[v195 + 1] + v224 + v227);
        }
        else {
          uint64_t v228 = 1;
        }
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(v8, "colorAttachments"), "objectAtIndexedSubscript:", v196), "setSourceAlphaBlendFactor:", v228);
        uint64_t v229 = v197[1];
        uint64_t v230 = v229 - *(int *)((char *)v225 + v229 + 4);
        if (*(unsigned __int16 *)((char *)v225 + v230 + 4) >= 7u
          && (uint64_t v231 = *(unsigned __int16 *)((char *)&v186[v195 + 2] + v230 + 2)) != 0)
        {
          uint64_t v232 = *((unsigned __int8 *)&v186[v195 + 1] + v229 + v231);
        }
        else
        {
          uint64_t v232 = 15;
        }
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(v8, "colorAttachments"), "objectAtIndexedSubscript:", v196++), "setWriteMask:", v232);
        ++v195;
      }
      while (v196 < *v186);
    }
  }
  uint64_t v233 = [v8 fragmentLinkedFunctions];
  v234 = (unsigned __int16 *)((char *)v123 - *v123);
  if (*v234 >= 0x37u && (uint64_t v235 = v234[27]) != 0) {
    v236 = (char *)v123 + v235 + *(unsigned int *)((char *)v123 + v235);
  }
  else {
    v236 = 0;
  }
  [(_MTLBinaryArchive *)self setMTLLinkedFunctions:v233 LFS:v236 obj:a4 destinationArchive:a5 error:a6];
  return v8;
}

- (id)newTileRenderPipelineDescriptorWithScript:(const PipelineScript *)a3 obj:(void *)a4 destinationArchive:(id)a5 error:(id *)a6
{
  uint64_t v11 = objc_opt_new();
  uint64_t v12 = (int *)Air::PipelineScript::pipeline_as_tile_render((Air::PipelineScript *)a3);
  uint64_t v13 = (unsigned __int16 *)((char *)v12 - *v12);
  if (*v13 >= 7u && (uint64_t v14 = v13[3]) != 0) {
    BOOL v15 = (int *)((char *)v12 + v14 + *(unsigned int *)((char *)v12 + v14));
  }
  else {
    BOOL v15 = 0;
  }
  stat v16 = (unsigned __int16 *)((char *)v15 - *v15);
  if (*v16 >= 0xDu && (uint64_t v17 = v16[6]) != 0) {
    uint64_t v18 = *(void *)((char *)v15 + v17);
  }
  else {
    uint64_t v18 = 0;
  }
  [v11 setColorSampleCount:v18];
  unint64_t v19 = (unsigned __int16 *)((char *)v15 - *v15);
  if (*v19 >= 9u && (uint64_t v20 = v19[4]) != 0) {
    uint64_t v21 = *(void *)((char *)v15 + v20);
  }
  else {
    uint64_t v21 = 1;
  }
  [v11 setMaxCallStackDepth:v21];
  uint64_t v22 = (unsigned __int16 *)((char *)v15 - *v15);
  if (*v22 >= 7u && (uint64_t v23 = v22[3]) != 0) {
    uint64_t v24 = *(void *)((char *)v15 + v23);
  }
  else {
    uint64_t v24 = 0;
  }
  [v11 setMaxTotalThreadsPerThreadgroup:v24];
  uint64_t v25 = (unsigned __int16 *)((char *)v15 - *v15);
  if (*v25 >= 0xBu && (uint64_t v26 = v25[5]) != 0) {
    uint64_t v27 = *(void *)((char *)v15 + v26);
  }
  else {
    uint64_t v27 = 1;
  }
  [v11 setRasterSampleCount:v27];
  unint64_t v28 = (unsigned __int16 *)((char *)v15 - *v15);
  v30 = *v28 >= 0x13u && (uint64_t v29 = v28[9]) != 0 && *((unsigned __int8 *)v15 + v29) != 0;
  [v11 setSupportAddingBinaryFunctions:v30];
  long long v31 = (unsigned __int16 *)((char *)v15 - *v15);
  if (*v31 >= 0x15u && (uint64_t v32 = v31[10]) != 0) {
    uint64_t v33 = *((unsigned __int8 *)v15 + v32);
  }
  else {
    uint64_t v33 = 0;
  }
  [v11 setTextureWriteRoundingMode:v33];
  unint64_t v34 = (unsigned __int16 *)((char *)v15 - *v15);
  v36 = *v34 >= 5u && (uint64_t v35 = v34[2]) != 0 && *((unsigned __int8 *)v15 + v35) != 0;
  [v11 setThreadgroupSizeMatchesTileSize:v36];
  uint64_t v37 = [v11 linkedFunctions];
  uint64_t v38 = (unsigned __int16 *)((char *)v15 - *v15);
  if (*v38 >= 0x17u && (uint64_t v39 = v38[11]) != 0) {
    uint64_t v40 = (char *)v15 + v39 + *(unsigned int *)((char *)v15 + v39);
  }
  else {
    uint64_t v40 = 0;
  }
  [(_MTLBinaryArchive *)self setMTLLinkedFunctions:v37 LFS:v40 obj:a4 destinationArchive:a5 error:a6];
  uint64_t v41 = *v15;
  uint64_t v42 = -v41;
  unint64_t v43 = (unsigned __int16 *)((char *)v15 - v41);
  if (*v43 >= 0x11u)
  {
    uint64_t v44 = v43[8];
    if (v44)
    {
      BOOL v45 = (int *)((char *)v15 + v44 + *(unsigned int *)((char *)v15 + v44));
      uint64_t v46 = v45 + 1;
      if (*v45)
      {
        unint64_t v47 = 0;
        do
        {
          uint64_t v48 = *v46;
          uint64_t v49 = v48 - *(int *)((char *)v46 + v48);
          if (*(unsigned __int16 *)((char *)v46 + v49) >= 5u
            && (uint64_t v50 = *(unsigned __int16 *)((char *)v46 + v49 + 4)) != 0)
          {
            uint64_t v51 = *((unsigned __int8 *)v46 + v48 + v50);
          }
          else
          {
            uint64_t v51 = 0;
          }
          objc_msgSend((id)objc_msgSend((id)objc_msgSend(v11, "tileBuffers"), "objectAtIndexedSubscript:", v47++), "setMutability:", v51);
          ++v46;
        }
        while (v47 < *v45);
      }
      uint64_t v42 = -(uint64_t)*v15;
    }
  }
  uint64_t v52 = (unsigned __int16 *)((char *)v15 + v42);
  if (*v52 >= 0xFu)
  {
    uint64_t v53 = v52[7];
    if (v53)
    {
      uint64_t v54 = (int *)((char *)v15 + v53 + *(unsigned int *)((char *)v15 + v53));
      v55 = v54 + 1;
      if (*v54)
      {
        unint64_t v56 = 0;
        do
        {
          uint64_t v57 = *v55;
          uint64_t v58 = v57 - *(int *)((char *)v55 + v57);
          if (*(unsigned __int16 *)((char *)v55 + v58) >= 5u
            && (uint64_t v59 = *(unsigned __int16 *)((char *)v55 + v58 + 4)) != 0)
          {
            uint64_t v60 = *(unsigned __int16 *)((char *)v55 + v57 + v59);
          }
          else
          {
            uint64_t v60 = 0;
          }
          objc_msgSend((id)objc_msgSend((id)objc_msgSend(v11, "colorAttachments"), "objectAtIndexedSubscript:", v56++), "setPixelFormat:", v60);
          ++v55;
        }
        while (v56 < *v54);
      }
    }
  }
  return v11;
}

- (id)newMeshRenderPipelineDescriptorWithScript:(const PipelineScript *)a3 obj:(void *)a4 destinationArchive:(id)a5 error:(id *)a6
{
  uint64_t v10 = objc_opt_new();
  uint64_t v11 = (int *)Air::PipelineScript::pipeline_as_mesh_render((Air::PipelineScript *)a3);
  uint64_t v12 = *v11;
  uint64_t v13 = (_WORD *)((char *)v11 - v12);
  unsigned int v14 = *(unsigned __int16 *)((char *)v11 - v12);
  if (v14 < 5) {
    return v10;
  }
  BOOL v15 = v11;
  if (v14 < 7)
  {
    if (!v13[2]) {
      return v10;
    }
    v236 = a4;
    id v17 = a5;
    uint64_t v18 = a6;
    unint64_t v19 = 0;
    BOOL v16 = 1;
    char v237 = 1;
    goto LABEL_15;
  }
  BOOL v16 = v13[3] == 0;
  if (v14 > 8 && v13[4])
  {
    char v237 = 0;
    if (!v13[2]) {
      goto LABEL_6;
    }
    goto LABEL_11;
  }
  char v237 = 1;
  if (v13[2])
  {
LABEL_11:
    v236 = a4;
    if (v14 >= 0xB && v13[5])
    {
      id v17 = a5;
      uint64_t v18 = a6;
      unint64_t v19 = (int *)((char *)v11 + (unsigned __int16)v13[5] + *(unsigned int *)((char *)v11 + (unsigned __int16)v13[5]));
    }
    else
    {
      id v17 = a5;
      uint64_t v18 = a6;
      unint64_t v19 = 0;
    }
LABEL_15:
    uint64_t v20 = (unsigned __int16 *)((char *)v19 - *v19);
    if (*v20 >= 7u && (uint64_t v21 = v20[3]) != 0) {
      uint64_t v22 = *(void *)((char *)v19 + v21);
    }
    else {
      uint64_t v22 = 0;
    }
    [v10 setMaxTotalThreadsPerObjectThreadgroup:v22];
    uint64_t v23 = (unsigned __int16 *)((char *)v19 - *v19);
    if (*v23 >= 0xDu && (uint64_t v24 = v23[6]) != 0) {
      uint64_t v25 = *(void *)((char *)v19 + v24);
    }
    else {
      uint64_t v25 = 1;
    }
    [v10 setMaxObjectCallStackDepth:v25];
    uint64_t v26 = (unsigned __int16 *)((char *)v19 - *v19);
    if (*v26 >= 0xBu && (uint64_t v27 = v26[5]) != 0) {
      uint64_t v28 = *(void *)((char *)v19 + v27);
    }
    else {
      uint64_t v28 = 0;
    }
    [v10 setMaxTotalThreadgroupsPerMeshGrid:v28];
    uint64_t v29 = (unsigned __int16 *)((char *)v19 - *v19);
    if (*v29 >= 0xFu && (uint64_t v30 = v29[7]) != 0) {
      uint64_t v31 = *(void *)((char *)v19 + v30);
    }
    else {
      uint64_t v31 = 1;
    }
    [v10 setMaxVertexAmplificationCount:v31];
    uint64_t v32 = (unsigned __int16 *)((char *)v19 - *v19);
    v34 = *v32 >= 0x1Bu && (uint64_t v33 = v32[13]) != 0 && *((unsigned __int8 *)v19 + v33) != 0;
    [v10 setNeedsCustomBorderColorSamplers:v34];
    uint64_t v35 = (unsigned __int16 *)((char *)v19 - *v19);
    if (*v35 >= 9u && (uint64_t v36 = v35[4]) != 0) {
      uint64_t v37 = *(void *)((char *)v19 + v36);
    }
    else {
      uint64_t v37 = 0;
    }
    [v10 setPayloadMemoryLength:v37];
    uint64_t v38 = (unsigned __int16 *)((char *)v19 - *v19);
    v40 = *v38 >= 0x17u && (uint64_t v39 = v38[11]) != 0 && *((unsigned __int8 *)v19 + v39) != 0;
    [v10 setSupportAddingObjectBinaryFunctions:v40];
    uint64_t v41 = (unsigned __int16 *)((char *)v19 - *v19);
    v43 = *v41 >= 0x15u && (uint64_t v42 = v41[10]) != 0 && *((unsigned __int8 *)v19 + v42) != 0;
    [v10 setSupportIndirectCommandBuffers:v43];
    uint64_t v44 = (unsigned __int16 *)((char *)v19 - *v19);
    if (*v44 >= 0x19u && (uint64_t v45 = v44[12]) != 0) {
      uint64_t v46 = *((unsigned __int8 *)v19 + v45);
    }
    else {
      uint64_t v46 = 0;
    }
    [v10 setTextureWriteRoundingMode:v46];
    unint64_t v47 = (unsigned __int16 *)((char *)v19 - *v19);
    v49 = *v47 >= 5u && (uint64_t v48 = v47[2]) != 0 && *((unsigned __int8 *)v19 + v48) != 0;
    [v10 setObjectThreadgroupSizeIsMultipleOfThreadExecutionWidth:v49];
    uint64_t v50 = (unsigned __int16 *)((char *)v19 - *v19);
    if (*v50 >= 0x11u && (uint64_t v51 = v50[8]) != 0) {
      uint64_t v52 = *((unsigned __int8 *)v19 + v51);
    }
    else {
      uint64_t v52 = 0;
    }
    [v10 setVertexAmplificationMode:v52];
    uint64_t v53 = (unsigned __int16 *)((char *)v19 - *v19);
    if (*v53 >= 0x13u)
    {
      uint64_t v54 = v53[9];
      if (v54)
      {
        v55 = (int *)((char *)v19 + v54 + *(unsigned int *)((char *)v19 + v54));
        unint64_t v56 = v55 + 1;
        if (*v55)
        {
          unint64_t v57 = 0;
          do
          {
            uint64_t v58 = *v56;
            uint64_t v59 = v58 - *(int *)((char *)v56 + v58);
            if (*(unsigned __int16 *)((char *)v56 + v59) >= 5u
              && (uint64_t v60 = *(unsigned __int16 *)((char *)v56 + v59 + 4)) != 0)
            {
              uint64_t v61 = *((unsigned __int8 *)v56 + v58 + v60);
            }
            else
            {
              uint64_t v61 = 0;
            }
            objc_msgSend((id)objc_msgSend((id)objc_msgSend(v10, "objectBuffers"), "objectAtIndexedSubscript:", v57++), "setMutability:", v61);
            ++v56;
          }
          while (v57 < *v55);
        }
      }
    }
    uint64_t v62 = [v10 objectLinkedFunctions];
    uint64_t v63 = (unsigned __int16 *)((char *)v19 - *v19);
    if (*v63 >= 0x1Du && (uint64_t v64 = v63[14]) != 0) {
      uint64_t v65 = (char *)v19 + v64 + *(unsigned int *)((char *)v19 + v64);
    }
    else {
      uint64_t v65 = 0;
    }
    a6 = v18;
    a5 = v17;
    a4 = v236;
    [(_MTLBinaryArchive *)self setMTLLinkedFunctions:v62 LFS:v65 obj:v236 destinationArchive:a5 error:a6];
    if (v16) {
      goto LABEL_140;
    }
    uint64_t v12 = *v15;
    goto LABEL_74;
  }
LABEL_6:
  if (v13[3])
  {
LABEL_74:
    uint64_t v66 = (unsigned __int16 *)((char *)v15 - v12);
    if (*v66 >= 0xDu && (uint64_t v67 = v66[6]) != 0) {
      uint64_t v68 = (int *)((char *)v15 + v67 + *(unsigned int *)((char *)v15 + v67));
    }
    else {
      uint64_t v68 = 0;
    }
    uint64_t v69 = (unsigned __int16 *)((char *)v68 - *v68);
    if (*v69 >= 7u && (uint64_t v70 = v69[3]) != 0) {
      uint64_t v71 = *(void *)((char *)v68 + v70);
    }
    else {
      uint64_t v71 = 0;
    }
    [v10 setMaxTotalThreadgroupsPerMeshGrid:v71];
    uint64_t v72 = (unsigned __int16 *)((char *)v68 - *v68);
    if (*v72 >= 0x1Bu && (uint64_t v73 = v72[13]) != 0) {
      uint64_t v74 = *((unsigned __int8 *)v68 + v73);
    }
    else {
      uint64_t v74 = 255;
    }
    [v10 setClipDistanceEnableMask:v74];
    uint64_t v75 = (unsigned __int16 *)((char *)v68 - *v68);
    if (*v75 >= 0xBu && (uint64_t v76 = v75[5]) != 0) {
      uint64_t v77 = *(void *)((char *)v68 + v76);
    }
    else {
      uint64_t v77 = 1;
    }
    [v10 setMaxMeshCallStackDepth:v77];
    uint64_t v78 = (unsigned __int16 *)((char *)v68 - *v68);
    if (*v78 >= 0xFu && (uint64_t v79 = v78[7]) != 0) {
      uint64_t v80 = *(void *)((char *)v68 + v79);
    }
    else {
      uint64_t v80 = 1;
    }
    [v10 setMaxVertexAmplificationCount:v80];
    uint64_t v81 = (unsigned __int16 *)((char *)v68 - *v68);
    v83 = *v81 >= 0x1Du && (uint64_t v82 = v81[14]) != 0 && *((unsigned __int8 *)v68 + v82) != 0;
    [v10 setNeedsCustomBorderColorSamplers:v83];
    uint64_t v84 = (unsigned __int16 *)((char *)v68 - *v68);
    if (*v84 >= 9u && (uint64_t v85 = v84[4]) != 0) {
      uint64_t v86 = *(void *)((char *)v68 + v85);
    }
    else {
      uint64_t v86 = 0;
    }
    [v10 setPayloadMemoryLength:v86];
    unint64_t v87 = (unsigned __int16 *)((char *)v68 - *v68);
    v89 = *v87 < 0xDu || (uint64_t v88 = v87[6]) == 0 || *((unsigned __int8 *)v68 + v88) != 0;
    [v10 setRasterizationEnabled:v89];
    v90 = (unsigned __int16 *)((char *)v68 - *v68);
    v92 = *v90 >= 0x17u && (uint64_t v91 = v90[11]) != 0 && *((unsigned __int8 *)v68 + v91) != 0;
    [v10 setSupportAddingMeshBinaryFunctions:v92];
    uint64_t v93 = (unsigned __int16 *)((char *)v68 - *v68);
    BOOL v95 = *v93 >= 0x15u && (v94 = v93[10]) != 0 && *((unsigned __int8 *)v68 + v94) != 0;
    [v10 setSupportIndirectCommandBuffers:v95];
    uint64_t v96 = (unsigned __int16 *)((char *)v68 - *v68);
    if (*v96 >= 0x19u && (uint64_t v97 = v96[12]) != 0) {
      uint64_t v98 = *((unsigned __int8 *)v68 + v97);
    }
    else {
      uint64_t v98 = 0;
    }
    [v10 setTextureWriteRoundingMode:v98];
    uint64_t v99 = (unsigned __int16 *)((char *)v68 - *v68);
    v101 = *v99 >= 5u && (uint64_t v100 = v99[2]) != 0 && *((unsigned __int8 *)v68 + v100) != 0;
    [v10 setMeshThreadgroupSizeIsMultipleOfThreadExecutionWidth:v101];
    unint64_t v102 = (unsigned __int16 *)((char *)v68 - *v68);
    if (*v102 >= 0x11u && (uint64_t v103 = v102[8]) != 0) {
      uint64_t v104 = *((unsigned __int8 *)v68 + v103);
    }
    else {
      uint64_t v104 = 0;
    }
    [v10 setVertexAmplificationMode:v104];
    long long v105 = (unsigned __int16 *)((char *)v68 - *v68);
    if (*v105 >= 0x13u)
    {
      uint64_t v106 = v105[9];
      if (v106)
      {
        uint64_t v107 = (int *)((char *)v68 + v106 + *(unsigned int *)((char *)v68 + v106));
        uint64_t v108 = v107 + 1;
        if (*v107)
        {
          unint64_t v109 = 0;
          do
          {
            uint64_t v110 = *v108;
            uint64_t v111 = v110 - *(int *)((char *)v108 + v110);
            if (*(unsigned __int16 *)((char *)v108 + v111) >= 5u
              && (uint64_t v112 = *(unsigned __int16 *)((char *)v108 + v111 + 4)) != 0)
            {
              uint64_t v113 = *((unsigned __int8 *)v108 + v110 + v112);
            }
            else
            {
              uint64_t v113 = 0;
            }
            objc_msgSend((id)objc_msgSend((id)objc_msgSend(v10, "meshBuffers"), "objectAtIndexedSubscript:", v109++), "setMutability:", v113);
            ++v108;
          }
          while (v109 < *v107);
        }
      }
    }
    uint64_t v114 = [v10 meshLinkedFunctions];
    uint64_t v115 = (unsigned __int16 *)((char *)v68 - *v68);
    if (*v115 >= 0x1Fu && (uint64_t v116 = v115[15]) != 0) {
      v117 = (char *)v68 + v116 + *(unsigned int *)((char *)v68 + v116);
    }
    else {
      v117 = 0;
    }
    [(_MTLBinaryArchive *)self setMTLLinkedFunctions:v114 LFS:v117 obj:a4 destinationArchive:a5 error:a6];
  }
LABEL_140:
  if ((v237 & 1) == 0)
  {
    uint64_t v118 = (unsigned __int16 *)((char *)v15 - *v15);
    if (*v118 >= 0xFu && (uint64_t v119 = v118[7]) != 0) {
      id v120 = (int *)((char *)v15 + v119 + *(unsigned int *)((char *)v15 + v119));
    }
    else {
      id v120 = 0;
    }
    long long v121 = (unsigned __int16 *)((char *)v120 - *v120);
    v123 = *v121 >= 0x29u && (uint64_t v122 = v121[20]) != 0 && *((unsigned __int8 *)v120 + v122) != 0;
    [v10 setAlphaTestEnabled:v123];
    uint64_t v124 = (unsigned __int16 *)((char *)v120 - *v120);
    if (*v124 >= 0x2Bu && (uint64_t v125 = v124[21]) != 0) {
      uint64_t v126 = *((unsigned __int8 *)v120 + v125);
    }
    else {
      uint64_t v126 = 0;
    }
    [v10 setAlphaTestFunction:v126];
    v127 = (unsigned __int16 *)((char *)v120 - *v120);
    v129 = *v127 >= 9u && (uint64_t v128 = v127[4]) != 0 && *((unsigned __int8 *)v120 + v128) != 0;
    [v10 setAlphaToCoverageEnabled:v129];
    v130 = (unsigned __int16 *)((char *)v120 - *v120);
    v132 = *v130 >= 0xBu && (uint64_t v131 = v130[5]) != 0 && *((unsigned __int8 *)v120 + v131) != 0;
    [v10 setAlphaToOneEnabled:v132];
    v133 = (unsigned __int16 *)((char *)v120 - *v120);
    if (*v133 >= 0xFu && (uint64_t v134 = v133[7]) != 0) {
      uint64_t v135 = *(void *)((char *)v120 + v134);
    }
    else {
      uint64_t v135 = 0;
    }
    [v10 setColorSampleCount:v135];
    v136 = (unsigned __int16 *)((char *)v120 - *v120);
    if (*v136 >= 0x19u && (uint64_t v137 = v136[12]) != 0) {
      uint64_t v138 = *(unsigned __int16 *)((char *)v120 + v137);
    }
    else {
      uint64_t v138 = 0;
    }
    [v10 setDepthAttachmentPixelFormat:v138];
    v139 = (unsigned __int16 *)((char *)v120 - *v120);
    if (*v139 >= 0x35u && (uint64_t v140 = v139[26]) != 0) {
      uint64_t v141 = *(unsigned int *)((char *)v120 + v140);
    }
    else {
      uint64_t v141 = 0;
    }
    [v10 setFragmentDepthCompareClampMask:v141];
    v142 = (unsigned __int16 *)((char *)v120 - *v120);
    v144 = *v142 >= 0x2Fu && (uint64_t v143 = v142[23]) != 0 && *((unsigned __int8 *)v120 + v143) != 0;
    [v10 setDepthStencilWriteDisabled:v144];
    v145 = (unsigned __int16 *)((char *)v120 - *v120);
    if (*v145 >= 0x27u && (uint64_t v146 = v145[19]) != 0) {
      uint64_t v147 = *((unsigned __int8 *)v120 + v146);
    }
    else {
      uint64_t v147 = 0;
    }
    [v10 setLogicOperation:v147];
    v148 = (unsigned __int16 *)((char *)v120 - *v120);
    v150 = *v148 >= 0x25u && (uint64_t v149 = v148[18]) != 0 && *((unsigned __int8 *)v120 + v149) != 0;
    [v10 setLogicOperationEnabled:v150];
    v151 = (unsigned __int16 *)((char *)v120 - *v120);
    if (*v151 >= 5u && (uint64_t v152 = v151[2]) != 0) {
      uint64_t v153 = *(void *)((char *)v120 + v152);
    }
    else {
      uint64_t v153 = 1;
    }
    [v10 setMaxFragmentCallStackDepth:v153];
    v154 = (unsigned __int16 *)((char *)v120 - *v120);
    v156 = *v154 >= 0x33u && (uint64_t v155 = v154[25]) != 0 && *((unsigned __int8 *)v120 + v155) != 0;
    [v10 setNeedsCustomBorderColorSamplers:v156];
    v157 = (unsigned __int16 *)((char *)v120 - *v120);
    v159 = *v157 >= 0x31u && (uint64_t v158 = v157[24]) != 0 && *((unsigned __int8 *)v120 + v158) != 0;
    [v10 setOpenGLModeEnabled:v159];
    v160 = (unsigned __int16 *)((char *)v120 - *v120);
    v162 = *v160 >= 0x2Du && (uint64_t v161 = v160[22]) != 0 && *((unsigned __int8 *)v120 + v161) != 0;
    [v10 setPointSmoothEnabled:v162];
    v163 = (unsigned __int16 *)((char *)v120 - *v120);
    if (*v163 >= 0xDu && (uint64_t v164 = v163[6]) != 0) {
      uint64_t v165 = *(void *)((char *)v120 + v164);
    }
    else {
      uint64_t v165 = 1;
    }
    [v10 setRasterSampleCount:v165];
    v166 = (unsigned __int16 *)((char *)v120 - *v120);
    LODWORD(v167) = 1.0;
    if (*v166 >= 0x13u)
    {
      uint64_t v168 = v166[9];
      if (v168) {
        LODWORD(v167) = *(int *)((char *)v120 + v168);
      }
    }
    [v10 setSampleCoverage:v167];
    v169 = (unsigned __int16 *)((char *)v120 - *v120);
    v171 = *v169 >= 0x15u && (uint64_t v170 = v169[10]) != 0 && *((unsigned __int8 *)v120 + v170) != 0;
    [v10 setSampleCoverageInvert:v171];
    v172 = (unsigned __int16 *)((char *)v120 - *v120);
    if (*v172 >= 0x11u && (uint64_t v173 = v172[8]) != 0) {
      uint64_t v174 = *(void *)((char *)v120 + v173);
    }
    else {
      uint64_t v174 = -1;
    }
    [v10 setSampleMask:v174];
    v175 = (unsigned __int16 *)((char *)v120 - *v120);
    if (*v175 >= 0x1Bu && (uint64_t v176 = v175[13]) != 0) {
      uint64_t v177 = *(unsigned __int16 *)((char *)v120 + v176);
    }
    else {
      uint64_t v177 = 0;
    }
    [v10 setStencilAttachmentPixelFormat:v177];
    v178 = (unsigned __int16 *)((char *)v120 - *v120);
    v180 = *v178 >= 0x21u && (uint64_t v179 = v178[16]) != 0 && *((unsigned __int8 *)v120 + v179) != 0;
    objc_msgSend(v10, "setSupportAddingFragmentBinaryFunctions:", v180, a6);
    v181 = (unsigned __int16 *)((char *)v120 - *v120);
    unsigned int v182 = *v181;
    if (v182 >= 0x17)
    {
      if (v181[11]) {
        BOOL v183 = (int *)((char *)v120 + v181[11] + *(unsigned int *)((char *)v120 + v181[11]));
      }
      else {
        BOOL v183 = 0;
      }
      if (v182 >= 0x1D)
      {
        uint64_t v184 = v181[14];
        if (v184)
        {
          unsigned int v185 = (int *)((char *)v120 + v184 + *(unsigned int *)((char *)v120 + v184));
          v186 = v185 + 1;
          if (*v185)
          {
            unint64_t v187 = 0;
            do
            {
              uint64_t v188 = *v186;
              uint64_t v189 = v188 - *(int *)((char *)v186 + v188);
              if (*(unsigned __int16 *)((char *)v186 + v189) >= 5u
                && (uint64_t v190 = *(unsigned __int16 *)((char *)v186 + v189 + 4)) != 0)
              {
                uint64_t v191 = *((unsigned __int8 *)v186 + v188 + v190);
              }
              else
              {
                uint64_t v191 = 0;
              }
              objc_msgSend((id)objc_msgSend((id)objc_msgSend(v10, "fragmentBuffers"), "objectAtIndexedSubscript:", v187++), "setMutability:", v191);
              ++v186;
            }
            while (v187 < *v185);
          }
        }
      }
      if (v183 && *v183)
      {
        uint64_t v192 = 0;
        unint64_t v193 = 0;
        do
        {
          uint64_t v194 = &v183[v192];
          uint64_t v195 = v183[v192 + 1];
          unint64_t v196 = (char *)&v183[v192] + v195 - *(int *)((char *)&v183[v192 + 1] + v195);
          if (*((unsigned __int16 *)v196 + 2) >= 0xBu && (uint64_t v197 = *((unsigned __int16 *)v196 + 7)) != 0) {
            uint64_t v198 = *((unsigned __int8 *)&v183[v192 + 1] + v195 + v197);
          }
          else {
            uint64_t v198 = 0;
          }
          objc_msgSend((id)objc_msgSend((id)objc_msgSend(v10, "colorAttachments"), "objectAtIndexedSubscript:", v193), "setAlphaBlendOperation:", v198);
          uint64_t v199 = v194[1];
          uint64_t v200 = v199 - *(int *)((char *)v194 + v199 + 4);
          BOOL v202 = *(unsigned __int16 *)((char *)v194 + v200 + 4) >= 9u
              && (uint64_t v201 = *(unsigned __int16 *)((char *)&v183[v192 + 3] + v200)) != 0
              && *((unsigned __int8 *)&v183[v192 + 1] + v199 + v201) != 0;
          objc_msgSend((id)objc_msgSend((id)objc_msgSend(v10, "colorAttachments"), "objectAtIndexedSubscript:", v193), "setBlendingEnabled:", v202);
          uint64_t v203 = v194[1];
          uint64_t v204 = &v183[v192];
          BOOL v205 = (char *)&v183[v192] + v203 - *(int *)((char *)&v183[v192 + 1] + v203);
          if (*((unsigned __int16 *)v205 + 2) >= 0xFu && (uint64_t v206 = *((unsigned __int16 *)v205 + 9)) != 0) {
            uint64_t v207 = *((unsigned __int8 *)&v183[v192 + 1] + v203 + v206);
          }
          else {
            uint64_t v207 = 0;
          }
          objc_msgSend((id)objc_msgSend((id)objc_msgSend(v10, "colorAttachments"), "objectAtIndexedSubscript:", v193), "setDestinationAlphaBlendFactor:", v207);
          uint64_t v208 = v194[1];
          uint64_t v209 = v208 - *(int *)((char *)v204 + v208 + 4);
          if (*(unsigned __int16 *)((char *)v204 + v209 + 4) >= 0x11u
            && (uint64_t v210 = *(unsigned __int16 *)((char *)&v183[v192 + 5] + v209)) != 0)
          {
            uint64_t v211 = *((unsigned __int8 *)&v183[v192 + 1] + v208 + v210);
          }
          else
          {
            uint64_t v211 = 0;
          }
          objc_msgSend((id)objc_msgSend((id)objc_msgSend(v10, "colorAttachments"), "objectAtIndexedSubscript:", v193), "setDestinationRGBBlendFactor:", v211);
          uint64_t v212 = v194[1];
          uint64_t v213 = &v183[v192];
          uint64_t v214 = (char *)&v183[v192] + v212 - *(int *)((char *)&v183[v192 + 1] + v212);
          if (*((unsigned __int16 *)v214 + 2) >= 5u && (uint64_t v215 = *((unsigned __int16 *)v214 + 4)) != 0) {
            uint64_t v216 = *(unsigned __int16 *)((char *)&v183[v192 + 1] + v212 + v215);
          }
          else {
            uint64_t v216 = 0;
          }
          objc_msgSend((id)objc_msgSend((id)objc_msgSend(v10, "colorAttachments"), "objectAtIndexedSubscript:", v193), "setPixelFormat:", v216);
          uint64_t v217 = v194[1];
          uint64_t v218 = v217 - *(int *)((char *)v213 + v217 + 4);
          if (*(unsigned __int16 *)((char *)v213 + v218 + 4) >= 0x15u
            && (uint64_t v219 = *(unsigned __int16 *)((char *)&v183[v192 + 6] + v218)) != 0)
          {
            uint64_t v220 = *((unsigned __int8 *)&v183[v192 + 1] + v217 + v219);
          }
          else
          {
            uint64_t v220 = 1;
          }
          objc_msgSend((id)objc_msgSend((id)objc_msgSend(v10, "colorAttachments"), "objectAtIndexedSubscript:", v193), "setSourceRGBBlendFactor:", v220);
          uint64_t v221 = v194[1];
          uint64_t v222 = &v183[v192];
          uint64_t v223 = (char *)&v183[v192] + v221 - *(int *)((char *)&v183[v192 + 1] + v221);
          if (*((unsigned __int16 *)v223 + 2) >= 0x13u && (uint64_t v224 = *((unsigned __int16 *)v223 + 11)) != 0) {
            uint64_t v225 = *((unsigned __int8 *)&v183[v192 + 1] + v221 + v224);
          }
          else {
            uint64_t v225 = 1;
          }
          objc_msgSend((id)objc_msgSend((id)objc_msgSend(v10, "colorAttachments"), "objectAtIndexedSubscript:", v193), "setSourceAlphaBlendFactor:", v225);
          uint64_t v226 = v194[1];
          uint64_t v227 = v226 - *(int *)((char *)v222 + v226 + 4);
          if (*(unsigned __int16 *)((char *)v222 + v227 + 4) >= 7u
            && (uint64_t v228 = *(unsigned __int16 *)((char *)&v183[v192 + 2] + v227 + 2)) != 0)
          {
            uint64_t v229 = *((unsigned __int8 *)&v183[v192 + 1] + v226 + v228);
          }
          else
          {
            uint64_t v229 = 15;
          }
          objc_msgSend((id)objc_msgSend((id)objc_msgSend(v10, "colorAttachments"), "objectAtIndexedSubscript:", v193++), "setWriteMask:", v229);
          ++v192;
        }
        while (v193 < *v183);
      }
    }
    uint64_t v230 = [v10 fragmentLinkedFunctions];
    uint64_t v231 = (unsigned __int16 *)((char *)v120 - *v120);
    if (*v231 >= 0x37u && (uint64_t v232 = v231[27]) != 0) {
      uint64_t v233 = (char *)v120 + v232 + *(unsigned int *)((char *)v120 + v232);
    }
    else {
      uint64_t v233 = 0;
    }
    [(_MTLBinaryArchive *)self setMTLLinkedFunctions:v230 LFS:v233 obj:a4 destinationArchive:a5 error:v235];
  }
  return v10;
}

- (id)archiveFunctionIds
{
  uint64_t v3 = (void *)[MEMORY[0x1E4F1CA48] array];
  for (uint64_t i = self->_airntBinaryList.__table_.__p1_.__value_.__next_; i; uint64_t i = (void *)*i)
  {
    uint64_t v9 = 0;
    uint64_t v10 = 0;
    uint64_t v11 = 0;
    std::vector<MTLHashKey>::__init_with_size[abi:ne180100]<MTLHashKey*,MTLHashKey*>(&v9, i[3], i[4], 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(i[4] - i[3]) >> 4));
    uint64_t v5 = v9;
    if (v10 != v9)
    {
      uint64_t v6 = 0;
      unint64_t v7 = 0;
      do
      {
        objc_msgSend(v3, "addObject:", objc_msgSend(MEMORY[0x1E4F29238], "valueWithPointer:", v5 + v6));
        ++v7;
        uint64_t v5 = v9;
        v6 += 80;
      }
      while (v7 < 0xCCCCCCCCCCCCCCCDLL * ((v10 - v9) >> 4));
    }
    uint64_t v12 = (void **)&v9;
    std::vector<MTLHashKey>::__destroy_vector::operator()[abi:ne180100](&v12);
  }
  return v3;
}

- (id)newFunctionDescriptorWithAirScript:(const ConstantsSpecializationScript *)a3
{
  uint64_t v3 = &a3[-*(int *)a3->var0];
  if (*(unsigned __int16 *)v3->var0 < 9u) {
    return 0;
  }
  uint64_t v4 = *(unsigned __int16 *)v3[8].var0;
  if (!v4) {
    return 0;
  }
  uint64_t v5 = &a3[v4 + *(unsigned int *)a3[v4].var0];
  uint64_t v6 = objc_alloc_init(MTLFunctionDescriptor);
  uint64_t v7 = *(int *)v5->var0;
  uint64_t v8 = -v7;
  uint64_t v9 = &v5[-v7];
  if (*(unsigned __int16 *)v9->var0 >= 5u)
  {
    uint64_t v10 = *(unsigned __int16 *)v9[4].var0;
    if (v10)
    {
      -[MTLFunctionDescriptor setName:](v6, "setName:", [NSString stringWithUTF8String:&v5[v10 + 4 + *(unsigned int *)v5[v10].var0]]);
      uint64_t v8 = -(uint64_t)*(int *)v5->var0;
    }
  }
  if (*(unsigned __int16 *)v5[v8].var0 >= 7u && *(_WORD *)v5[v8 + 6].var0)
  {
    -[MTLFunctionDescriptor setSpecializedName:](v6, "setSpecializedName:", [NSString stringWithUTF8String:&v5[*(unsigned __int16 *)v5[v8 + 6].var0 + 4 + *(unsigned int *)v5[*(unsigned __int16 *)v5[v8 + 6].var0].var0]]);
    uint64_t v8 = -(uint64_t)*(int *)v5->var0;
  }
  uint64_t v11 = &v5[v8];
  if (*(unsigned __int16 *)v11->var0 >= 9u && (uint64_t v12 = *(unsigned __int16 *)v11[8].var0) != 0) {
    uint64_t v13 = &v5[v12 + *(unsigned int *)v5[v12].var0];
  }
  else {
    uint64_t v13 = 0;
  }
  unsigned int v14 = objc_opt_new();
  if (*(_DWORD *)v13->var0)
  {
    uint64_t v15 = 0;
    unint64_t v16 = 0;
    do
    {
      uint64_t v17 = *(unsigned int *)v13[v15 + 4].var0;
      uint64_t v18 = v17 - *(int *)v13[v15 + 4 + v17].var0;
      unint64_t v19 = &v13[v15 + v18];
      unsigned int v20 = *(unsigned __int16 *)v19[4].var0;
      if (v20 >= 5)
      {
        uint64_t v21 = *(unsigned __int16 *)v19[8].var0;
        uint64_t v22 = v21 ? *(unsigned __int16 *)v13[v15 + 4 + v17 + v21].var0 : 0;
        if (v20 >= 7)
        {
          if (*(_WORD *)v13[v15 + 10 + v18].var0) {
            unsigned int v23 = v13[v15 + 4 + v17 + *(unsigned __int16 *)v13[v15 + 10 + v18].var0].var0[0];
          }
          else {
            unsigned int v23 = 0;
          }
          if (v20 >= 9 && (uint64_t v24 = *(unsigned __int16 *)v13[v15 + 12 + v18].var0) != 0) {
            uint64_t v25 = (uint64_t)&v13[v15 + 4 + v17 + v24 + *(unsigned int *)v13[v15 + 4 + v17 + v24].var0];
          }
          else {
            uint64_t v25 = 0;
          }
          uint64_t v26 = v23;
          switch(v23)
          {
            case 3u:
              uint64_t v26 = 3;
              goto LABEL_72;
            case 4u:
              uint64_t v26 = 4;
              goto LABEL_72;
            case 5u:
              uint64_t v26 = 5;
              goto LABEL_72;
            case 6u:
              uint64_t v26 = 6;
              goto LABEL_72;
            case 0x10u:
              uint64_t v26 = 16;
              goto LABEL_72;
            case 0x11u:
              uint64_t v26 = 17;
              goto LABEL_72;
            case 0x12u:
              uint64_t v26 = 18;
              goto LABEL_72;
            case 0x13u:
              uint64_t v26 = 19;
              goto LABEL_72;
            case 0x1Du:
              uint64_t v26 = 29;
              goto LABEL_72;
            case 0x1Eu:
              uint64_t v26 = 30;
              goto LABEL_72;
            case 0x1Fu:
              uint64_t v26 = 31;
              goto LABEL_72;
            case 0x20u:
              uint64_t v26 = 32;
              goto LABEL_72;
            case 0x21u:
              uint64_t v26 = 33;
              goto LABEL_72;
            case 0x22u:
              uint64_t v26 = 34;
              goto LABEL_72;
            case 0x23u:
              uint64_t v26 = 35;
              goto LABEL_72;
            case 0x24u:
              uint64_t v26 = 36;
              goto LABEL_72;
            case 0x25u:
              uint64_t v26 = 37;
              goto LABEL_72;
            case 0x26u:
              uint64_t v26 = 38;
              goto LABEL_72;
            case 0x27u:
              uint64_t v26 = 39;
              goto LABEL_72;
            case 0x28u:
              uint64_t v26 = 40;
              goto LABEL_72;
            case 0x29u:
              uint64_t v26 = 41;
              goto LABEL_72;
            case 0x2Au:
              uint64_t v26 = 42;
              goto LABEL_72;
            case 0x2Bu:
              uint64_t v26 = 43;
              goto LABEL_72;
            case 0x2Cu:
              uint64_t v26 = 44;
              goto LABEL_72;
            case 0x2Du:
              uint64_t v26 = 45;
              goto LABEL_72;
            case 0x2Eu:
              uint64_t v26 = 46;
              goto LABEL_72;
            case 0x2Fu:
              uint64_t v26 = 47;
              goto LABEL_72;
            case 0x30u:
              uint64_t v26 = 48;
              goto LABEL_72;
            case 0x31u:
              uint64_t v26 = 49;
              goto LABEL_72;
            case 0x32u:
              uint64_t v26 = 50;
              goto LABEL_72;
            case 0x33u:
              uint64_t v26 = 51;
              goto LABEL_72;
            case 0x34u:
              uint64_t v26 = 52;
              goto LABEL_72;
            case 0x35u:
              goto LABEL_72;
            case 0x36u:
              uint64_t v26 = 54;
              goto LABEL_72;
            case 0x37u:
              uint64_t v26 = 55;
              goto LABEL_72;
            case 0x38u:
              uint64_t v26 = 56;
              goto LABEL_72;
            case 0x51u:
              uint64_t v26 = 81;
              goto LABEL_72;
            case 0x52u:
              uint64_t v26 = 82;
              goto LABEL_72;
            case 0x53u:
              uint64_t v26 = 83;
              goto LABEL_72;
            case 0x54u:
              uint64_t v26 = 84;
              goto LABEL_72;
            case 0x55u:
              uint64_t v26 = 85;
              goto LABEL_72;
            case 0x56u:
              uint64_t v26 = 86;
              goto LABEL_72;
            case 0x57u:
              uint64_t v26 = 87;
              goto LABEL_72;
            case 0x58u:
              uint64_t v26 = 88;
LABEL_72:
              [v14 setConstantValue:v25 type:v26 atIndex:v22];
              break;
            default:
              break;
          }
        }
      }
      ++v16;
      v15 += 4;
    }
    while (v16 < *(unsigned int *)v13->var0);
  }
  [(MTLFunctionDescriptor *)v6 setConstantValues:v14];

  return v6;
}

- (id)newRecompiledFunctionWithAIRNTObject:(void *)a3 index:(unint64_t)a4 destinationArchive:(id)a5 error:(id *)a6
{
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x3052000000;
  uint64_t v13 = __Block_byref_object_copy_;
  unsigned int v14 = __Block_byref_object_dispose_;
  uint64_t v15 = 0;
  queue = self->_queue;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __89___MTLBinaryArchive_newRecompiledFunctionWithAIRNTObject_index_destinationArchive_error___block_invoke;
  v9[3] = &unk_1E521FBA8;
  v9[8] = a4;
  v9[9] = a6;
  v9[6] = &v10;
  v9[7] = a3;
  v9[4] = self;
  v9[5] = a5;
  dispatch_sync(queue, v9);
  uint64_t v7 = (void *)v11[5];
  _Block_object_dispose(&v10, 8);
  return v7;
}

- (id)newRecompiledFunctionWithAIRNTObject:(void *)a3 destinationArchive:(id)a4 error:(id *)a5
{
  return [(_MTLBinaryArchive *)self newRecompiledFunctionWithAIRNTObject:a3 index:0 destinationArchive:a4 error:a5];
}

- (id)getMetalScript
{
  return self->_metalScript;
}

- (void)initMetalScriptWithArchive:(id)a3
{
  uint64_t v4 = [a3 getMetalScript];
  if (v4)
  {
    uint64_t v5 = v4;
    value = (NSObject ***)self->_mtlScriptBuilder.__ptr_.__value_;
    MTLMetalScriptBuilder::initFromScript(value, v5);
  }
}

- (id)getLibraryDescriptorWithAirScrpt:(const StitchingScript *)a3
{
  v241[1] = *MEMORY[0x1E4F143B8];
  id v4 = (id)objc_opt_new();
  uint64_t v5 = &a3[-*(int *)a3->var0];
  if (*(unsigned __int16 *)v5->var0 < 9u)
  {
    uint64_t v6 = 0;
  }
  else
  {
    uint64_t v6 = (int *)*(unsigned __int16 *)v5[8].var0;
    if (v6) {
      uint64_t v6 = (int *)((char *)v6 + (void)a3 + *(unsigned int *)((char *)v6 + (void)a3));
    }
  }
  uint64_t v7 = (unsigned __int16 *)((char *)v6 - *v6);
  if (*v7 >= 7u && (uint64_t v8 = v7[3]) != 0) {
    uint64_t v9 = (int *)((char *)v6 + v8 + *(unsigned int *)((char *)v6 + v8));
  }
  else {
    uint64_t v9 = 0;
  }
  id v10 = (id)objc_opt_new();
  id v11 = [NSString alloc];
  uint64_t v12 = (unsigned int *)((char *)v9 + *(unsigned __int16 *)((char *)v9 - *v9 + 4));
  std::string::basic_string[abi:ne180100](&__dst, (char *)v12 + *v12 + 4, *(unsigned int *)((char *)v12 + *v12));
  if (SHIBYTE(v240) >= 0) {
    p_dst = (void **)&__dst;
  }
  else {
    p_dst = __dst;
  }
  objc_msgSend(v10, "setFunctionName:", (id)objc_msgSend(v11, "initWithUTF8String:", p_dst));
  if (SHIBYTE(v240) < 0) {
    operator delete(__dst);
  }
  uint64_t v225 = v4;
  id v226 = v10;
  __dst = 0;
  v239 = 0;
  v240 = 0;
  unsigned int v14 = (unsigned __int16 *)((char *)v9 - *v9);
  if (*v14 < 0xBu) {
    goto LABEL_55;
  }
  uint64_t v15 = v14[5];
  if (!v15) {
    goto LABEL_55;
  }
  unint64_t v16 = (int *)((char *)v9 + v15 + *(unsigned int *)((char *)v9 + v15));
  if (!*v16) {
    goto LABEL_55;
  }
  for (unint64_t i = 0; i < v37; ++i)
  {
    uint64_t v18 = (_DWORD *)((char *)&v16[i + 1] + v16[i + 1]);
    unint64_t v19 = (unsigned __int16 *)((char *)v18 - *v18);
    if (*v19 >= 5u)
    {
      uint64_t v20 = v19[2];
      if (v20)
      {
        int v21 = *((unsigned __int8 *)v18 + v20);
        if (v21 == 2)
        {
          uint64_t v22 = [MTLFunctionStitchingAttributeKernel alloc];
          unsigned int v23 = v239;
          if (v239 >= (MTLFunctionStitchingAttributeKernel **)v240)
          {
            uint64_t v29 = ((char *)v239 - (char *)__dst) >> 3;
            if ((unint64_t)(v29 + 1) >> 61) {
              std::vector<std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>>::__throw_length_error[abi:ne180100]();
            }
            unint64_t v30 = (v240 - (char *)__dst) >> 2;
            if (v30 <= v29 + 1) {
              unint64_t v30 = v29 + 1;
            }
            if ((unint64_t)(v240 - (char *)__dst) >= 0x7FFFFFFFFFFFFFF8) {
              unint64_t v26 = 0x1FFFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v26 = v30;
            }
            if (v26) {
              uint64_t v27 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<objc_object  {objcproto18MTLIOScratchBuffer}*>>((uint64_t)&v240, v26);
            }
            else {
              uint64_t v27 = 0;
            }
            uint64_t v31 = (MTLFunctionStitchingAttributeKernel **)&v27[8 * v29];
            unsigned __int16 *v31 = v22;
            uint64_t v28 = v31 + 1;
            uint64_t v35 = __dst;
            uint64_t v32 = (void **)v239;
            if (v239 == (MTLFunctionStitchingAttributeKernel **)__dst) {
              goto LABEL_49;
            }
            do
            {
              uint64_t v36 = (MTLFunctionStitchingAttributeKernel *)*--v32;
              *--uint64_t v31 = v36;
            }
            while (v32 != v35);
            goto LABEL_48;
          }
        }
        else
        {
          if (v21 != 1) {
            goto LABEL_52;
          }
          uint64_t v22 = [MTLFunctionStitchingAttributeAlwaysInline alloc];
          unsigned int v23 = v239;
          if (v239 >= (MTLFunctionStitchingAttributeKernel **)v240)
          {
            uint64_t v24 = ((char *)v239 - (char *)__dst) >> 3;
            if ((unint64_t)(v24 + 1) >> 61) {
              std::vector<std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>>::__throw_length_error[abi:ne180100]();
            }
            unint64_t v25 = (v240 - (char *)__dst) >> 2;
            if (v25 <= v24 + 1) {
              unint64_t v25 = v24 + 1;
            }
            if ((unint64_t)(v240 - (char *)__dst) >= 0x7FFFFFFFFFFFFFF8) {
              unint64_t v26 = 0x1FFFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v26 = v25;
            }
            if (v26) {
              uint64_t v27 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<objc_object  {objcproto18MTLIOScratchBuffer}*>>((uint64_t)&v240, v26);
            }
            else {
              uint64_t v27 = 0;
            }
            uint64_t v31 = (MTLFunctionStitchingAttributeKernel **)&v27[8 * v24];
            unsigned __int16 *v31 = v22;
            uint64_t v28 = v31 + 1;
            uint64_t v33 = __dst;
            uint64_t v32 = (void **)v239;
            if (v239 == (MTLFunctionStitchingAttributeKernel **)__dst) {
              goto LABEL_49;
            }
            do
            {
              BOOL v34 = (MTLFunctionStitchingAttributeKernel *)*--v32;
              *--uint64_t v31 = v34;
            }
            while (v32 != v33);
LABEL_48:
            uint64_t v32 = __dst;
LABEL_49:
            __dst = (void **)v31;
            v239 = v28;
            v240 = &v27[8 * v26];
            if (v32) {
              operator delete(v32);
            }
            goto LABEL_51;
          }
        }
        *unsigned int v23 = v22;
        uint64_t v28 = v23 + 1;
LABEL_51:
        v239 = v28;
      }
    }
LABEL_52:
    unint64_t v37 = *v16;
  }
  if (v37) {
    objc_msgSend(v10, "setAttributes:", (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:count:"));
  }
LABEL_55:
  unint64_t v38 = 0;
  uint64_t v235 = 0;
  v236 = 0;
  char v237 = 0;
  uint64_t v224 = v9;
  uint64_t v39 = (unsigned int *)((char *)v9 + *(unsigned __int16 *)((char *)v9 - *v9 + 6));
  BOOL v40 = (unsigned int *)((char *)v39 + *v39);
  do
  {
    uint64_t v41 = &v40[v38 + 1];
    uint64_t v42 = (AirReflection::Node *)((char *)v41 + *v41);
    BOOL v43 = (unsigned __int16 *)((char *)v42 - *(int *)v42);
    if (*v43 >= 5u)
    {
      uint64_t v44 = v43[2];
      if (v44)
      {
        switch(*(_DWORD *)((char *)v42 + v44))
        {
          case 1:
            uint64_t v45 = [MTLFunctionStitchingInputNode alloc];
            uint64_t v46 = (int *)AirReflection::Node::node_as_FragmentFunction((AirReflection::Node *)((char *)v41 + *v41));
            unint64_t v47 = (unsigned __int16 *)((char *)v46 - *v46);
            if (*v47 >= 5u && (uint64_t v48 = v47[2]) != 0) {
              uint64_t v49 = *(unsigned int *)((char *)v46 + v48);
            }
            else {
              uint64_t v49 = 0;
            }
            uint64_t v59 = -[MTLFunctionStitchingInputNode initWithArgumentIndex:](v45, "initWithArgumentIndex:", v49, v224);
            uint64_t v60 = (MTLFunctionStitchingInputImageblock **)v236;
            if (v236 < (MTLFunctionStitchingFunctionNode **)v237) {
              goto LABEL_212;
            }
            uint64_t v123 = ((char *)v236 - (unsigned char *)v235) >> 3;
            if ((unint64_t)(v123 + 1) >> 61) {
              std::vector<std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>>::__throw_length_error[abi:ne180100]();
            }
            unint64_t v124 = (v237 - (unsigned char *)v235) >> 2;
            if (v124 <= v123 + 1) {
              unint64_t v124 = v123 + 1;
            }
            if ((unint64_t)(v237 - (unsigned char *)v235) >= 0x7FFFFFFFFFFFFFF8) {
              unint64_t v63 = 0x1FFFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v63 = v124;
            }
            if (v63) {
              uint64_t v64 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<objc_object  {objcproto18MTLIOScratchBuffer}*>>((uint64_t)&v237, v63);
            }
            else {
              uint64_t v64 = 0;
            }
            unint64_t v187 = (MTLFunctionStitchingInputImageblock **)&v64[8 * v123];
            *unint64_t v187 = v59;
            uint64_t v143 = (MTLFunctionStitchingFunctionNode **)(v187 + 1);
            uint64_t v199 = (char *)v235;
            uint64_t v188 = (char *)v236;
            if (v236 == v235) {
              goto LABEL_340;
            }
            do
            {
              uint64_t v200 = (MTLFunctionStitchingInputImageblock *)*((void *)v188 - 1);
              v188 -= 8;
              *--unint64_t v187 = v200;
            }
            while (v188 != v199);
            goto LABEL_339;
          case 2:
            uint64_t v80 = (int *)AirReflection::Node::node_as_KernelFunction(v42);
            uint64_t v81 = v80;
            uint64_t v82 = (unsigned __int16 *)((char *)v80 - *v80);
            unsigned int v83 = *v82;
            if (v83 < 9)
            {
              if (v83 <= 6)
              {
                uint64_t v232 = 0;
                uint64_t v233 = 0;
                v234 = 0;
                uint64_t v229 = 0;
                uint64_t v230 = 0;
                uint64_t v231 = 0;
                goto LABEL_272;
              }
            }
            else if (v82[4])
            {
              uint64_t v84 = (int *)((char *)v80 + v82[4] + *(unsigned int *)((char *)v80 + v82[4]));
              goto LABEL_182;
            }
            uint64_t v84 = 0;
LABEL_182:
            uint64_t v129 = v82[3];
            if (v129) {
              v130 = (int *)((char *)v80 + v129 + *(unsigned int *)((char *)v80 + v129));
            }
            else {
              v130 = 0;
            }
            uint64_t v232 = 0;
            uint64_t v233 = 0;
            v234 = 0;
            uint64_t v229 = 0;
            uint64_t v230 = 0;
            uint64_t v231 = 0;
            if (v84 && *v84)
            {
              BOOL v150 = 0;
              unint64_t v151 = 0;
              do
              {
                uint64_t v152 = *((void *)v235 + v84[v151 + 1]);
                if (v150 >= v234)
                {
                  uint64_t v153 = (v150 - (unsigned char *)v232) >> 3;
                  if ((unint64_t)(v153 + 1) >> 61) {
                    std::vector<std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>>::__throw_length_error[abi:ne180100]();
                  }
                  unint64_t v154 = (v234 - (unsigned char *)v232) >> 2;
                  if (v154 <= v153 + 1) {
                    unint64_t v154 = v153 + 1;
                  }
                  if ((unint64_t)(v234 - (unsigned char *)v232) >= 0x7FFFFFFFFFFFFFF8) {
                    unint64_t v155 = 0x1FFFFFFFFFFFFFFFLL;
                  }
                  else {
                    unint64_t v155 = v154;
                  }
                  if (v155) {
                    BOOL v156 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<objc_object  {objcproto18MTLIOScratchBuffer}*>>((uint64_t)&v234, v155);
                  }
                  else {
                    BOOL v156 = 0;
                  }
                  v157 = &v156[8 * v153];
                  *(void *)v157 = v152;
                  BOOL v150 = v157 + 8;
                  BOOL v159 = (char *)v232;
                  uint64_t v158 = v233;
                  if (v233 != v232)
                  {
                    do
                    {
                      uint64_t v160 = *((void *)v158 - 1);
                      v158 -= 8;
                      *((void *)v157 - 1) = v160;
                      v157 -= 8;
                    }
                    while (v158 != v159);
                    uint64_t v158 = (char *)v232;
                  }
                  uint64_t v232 = v157;
                  uint64_t v233 = v150;
                  v234 = &v156[8 * v155];
                  if (v158) {
                    operator delete(v158);
                  }
                }
                else
                {
                  *(void *)BOOL v150 = v152;
                  v150 += 8;
                }
                uint64_t v233 = v150;
                ++v151;
              }
              while (v151 < *v84);
            }
            if (v130 && *v130)
            {
              unint64_t v161 = 0;
              BOOL v162 = v230;
              do
              {
                uint64_t v163 = v130[v161 + 1];
                uint64_t v164 = v235;
                if (v162 >= v231)
                {
                  uint64_t v165 = (v162 - (unsigned char *)v229) >> 3;
                  if ((unint64_t)(v165 + 1) >> 61) {
                    std::vector<std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>>::__throw_length_error[abi:ne180100]();
                  }
                  unint64_t v166 = (v231 - (unsigned char *)v229) >> 2;
                  if (v166 <= v165 + 1) {
                    unint64_t v166 = v165 + 1;
                  }
                  if ((unint64_t)(v231 - (unsigned char *)v229) >= 0x7FFFFFFFFFFFFFF8) {
                    unint64_t v167 = 0x1FFFFFFFFFFFFFFFLL;
                  }
                  else {
                    unint64_t v167 = v166;
                  }
                  if (v167) {
                    uint64_t v168 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<objc_object  {objcproto18MTLIOScratchBuffer}*>>((uint64_t)&v231, v167);
                  }
                  else {
                    uint64_t v168 = 0;
                  }
                  v169 = &v168[8 * v165];
                  *(void *)v169 = v164[v163];
                  BOOL v162 = v169 + 8;
                  BOOL v171 = (char *)v229;
                  uint64_t v170 = v230;
                  if (v230 != v229)
                  {
                    do
                    {
                      uint64_t v172 = *((void *)v170 - 1);
                      v170 -= 8;
                      *((void *)v169 - 1) = v172;
                      v169 -= 8;
                    }
                    while (v170 != v171);
                    uint64_t v170 = (char *)v229;
                  }
                  uint64_t v229 = v169;
                  uint64_t v230 = v162;
                  uint64_t v231 = &v168[8 * v167];
                  if (v170) {
                    operator delete(v170);
                  }
                }
                else
                {
                  *(void *)BOOL v162 = *((void *)v235 + v163);
                  v162 += 8;
                }
                uint64_t v230 = v162;
                ++v161;
              }
              while (v161 < *v130);
            }
LABEL_272:
            id v173 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:count:");
            id v174 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:count:");
            id v175 = [NSString alloc];
            uint64_t v176 = (unsigned int *)((char *)v81 + *(unsigned __int16 *)((char *)v81 - *v81 + 4));
            std::string::basic_string[abi:ne180100](__p, (char *)v176 + *v176 + 4, *(unsigned int *)((char *)v176 + *v176));
            if (v228 >= 0) {
              uint64_t v177 = __p;
            }
            else {
              uint64_t v177 = (void **)__p[0];
            }
            id v178 = (id)objc_msgSend(v175, "initWithUTF8String:", v177, v224);
            id v10 = v226;
            if (v228 < 0) {
              operator delete(__p[0]);
            }
            uint64_t v179 = [[MTLFunctionStitchingFunctionNode alloc] initWithName:v178 arguments:v174 controlDependencies:v173];
            BOOL v180 = v179;
            v181 = v236;
            if (v236 >= (MTLFunctionStitchingFunctionNode **)v237)
            {
              uint64_t v183 = ((char *)v236 - (unsigned char *)v235) >> 3;
              if ((unint64_t)(v183 + 1) >> 61) {
                std::vector<std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>>::__throw_length_error[abi:ne180100]();
              }
              unint64_t v184 = (v237 - (unsigned char *)v235) >> 2;
              if (v184 <= v183 + 1) {
                unint64_t v184 = v183 + 1;
              }
              if ((unint64_t)(v237 - (unsigned char *)v235) >= 0x7FFFFFFFFFFFFFF8) {
                unint64_t v185 = 0x1FFFFFFFFFFFFFFFLL;
              }
              else {
                unint64_t v185 = v184;
              }
              if (v185) {
                v186 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<objc_object  {objcproto18MTLIOScratchBuffer}*>>((uint64_t)&v237, v185);
              }
              else {
                v186 = 0;
              }
              uint64_t v209 = (MTLFunctionStitchingFunctionNode **)&v186[8 * v183];
              *uint64_t v209 = v180;
              unsigned int v182 = v209 + 1;
              uint64_t v211 = (char *)v235;
              uint64_t v210 = (char *)v236;
              if (v236 != v235)
              {
                do
                {
                  uint64_t v212 = (MTLFunctionStitchingFunctionNode *)*((void *)v210 - 1);
                  v210 -= 8;
                  *--uint64_t v209 = v212;
                }
                while (v210 != v211);
                uint64_t v210 = (char *)v235;
              }
              uint64_t v235 = v209;
              v236 = v182;
              char v237 = &v186[8 * v185];
              if (v210) {
                operator delete(v210);
              }
            }
            else
            {
              void *v236 = v179;
              unsigned int v182 = v181 + 1;
            }
            v236 = v182;
            if (v229)
            {
              uint64_t v230 = (char *)v229;
              operator delete(v229);
            }
LABEL_334:
            if (v232)
            {
              uint64_t v233 = (char *)v232;
              operator delete(v232);
            }
            break;
          case 3:
            uint64_t v65 = [MTLFunctionStitchingInputBuffer alloc];
            uint64_t v66 = (int *)AirReflection::Node::node_as_VertexFunction((AirReflection::Node *)((char *)v41 + *v41));
            uint64_t v67 = (unsigned __int16 *)((char *)v66 - *v66);
            if (*v67 >= 7u && (uint64_t v68 = v67[3]) != 0) {
              uint64_t v69 = *(unsigned int *)((char *)v66 + v68);
            }
            else {
              uint64_t v69 = 0;
            }
            uint64_t v59 = -[MTLFunctionStitchingInputBuffer initWithBindIndex:](v65, "initWithBindIndex:", v69, v224);
            uint64_t v60 = (MTLFunctionStitchingInputImageblock **)v236;
            if (v236 < (MTLFunctionStitchingFunctionNode **)v237) {
              goto LABEL_212;
            }
            uint64_t v119 = ((char *)v236 - (unsigned char *)v235) >> 3;
            if ((unint64_t)(v119 + 1) >> 61) {
              std::vector<std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>>::__throw_length_error[abi:ne180100]();
            }
            unint64_t v120 = (v237 - (unsigned char *)v235) >> 2;
            if (v120 <= v119 + 1) {
              unint64_t v120 = v119 + 1;
            }
            if ((unint64_t)(v237 - (unsigned char *)v235) >= 0x7FFFFFFFFFFFFFF8) {
              unint64_t v63 = 0x1FFFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v63 = v120;
            }
            if (v63) {
              uint64_t v64 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<objc_object  {objcproto18MTLIOScratchBuffer}*>>((uint64_t)&v237, v63);
            }
            else {
              uint64_t v64 = 0;
            }
            unint64_t v187 = (MTLFunctionStitchingInputImageblock **)&v64[8 * v119];
            *unint64_t v187 = v59;
            uint64_t v143 = (MTLFunctionStitchingFunctionNode **)(v187 + 1);
            unint64_t v193 = (char *)v235;
            uint64_t v188 = (char *)v236;
            if (v236 == v235) {
              goto LABEL_340;
            }
            do
            {
              uint64_t v194 = (MTLFunctionStitchingInputImageblock *)*((void *)v188 - 1);
              v188 -= 8;
              *--unint64_t v187 = v194;
            }
            while (v188 != v193);
            goto LABEL_339;
          case 4:
            uint64_t v70 = (int *)Air::FunctionStitching::Node::node_as_BufferAddressNode(v42);
            uint64_t v71 = [MTLFunctionStitchingInputBufferAddress alloc];
            uint64_t v72 = (unsigned __int16 *)((char *)v70 - *v70);
            unsigned int v73 = *v72;
            if (v73 < 5)
            {
              uint64_t v74 = 0;
            }
            else
            {
              uint64_t v74 = (int *)v72[2];
              if (v72[2]) {
                uint64_t v74 = (int *)((char *)v74 + (void)v70 + *(unsigned int *)((char *)v74 + (void)v70));
              }
            }
            uint64_t v138 = (unsigned __int16 *)((char *)v74 - *v74);
            if (*v138 >= 7u && (uint64_t v139 = v138[3]) != 0) {
              uint64_t v140 = *(unsigned int *)((char *)v74 + v139);
            }
            else {
              uint64_t v140 = 0;
            }
            if (v73 >= 7 && (uint64_t v141 = v72[3]) != 0) {
              uint64_t v142 = *(void *)((char *)v70 + v141);
            }
            else {
              uint64_t v142 = 0;
            }
            uint64_t v59 = -[MTLFunctionStitchingInputBufferAddress initWithBindIndex:byteOffset:dereference:](v71, "initWithBindIndex:byteOffset:dereference:", v140, v142, 0, v224);
            uint64_t v60 = (MTLFunctionStitchingInputImageblock **)v236;
            if (v236 < (MTLFunctionStitchingFunctionNode **)v237) {
              goto LABEL_212;
            }
            uint64_t v144 = ((char *)v236 - (unsigned char *)v235) >> 3;
            if ((unint64_t)(v144 + 1) >> 61) {
              std::vector<std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>>::__throw_length_error[abi:ne180100]();
            }
            unint64_t v145 = (v237 - (unsigned char *)v235) >> 2;
            if (v145 <= v144 + 1) {
              unint64_t v145 = v144 + 1;
            }
            if ((unint64_t)(v237 - (unsigned char *)v235) >= 0x7FFFFFFFFFFFFFF8) {
              unint64_t v63 = 0x1FFFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v63 = v145;
            }
            if (v63) {
              uint64_t v64 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<objc_object  {objcproto18MTLIOScratchBuffer}*>>((uint64_t)&v237, v63);
            }
            else {
              uint64_t v64 = 0;
            }
            unint64_t v187 = (MTLFunctionStitchingInputImageblock **)&v64[8 * v144];
            *unint64_t v187 = v59;
            uint64_t v143 = (MTLFunctionStitchingFunctionNode **)(v187 + 1);
            uint64_t v195 = (char *)v235;
            uint64_t v188 = (char *)v236;
            if (v236 == v235) {
              goto LABEL_340;
            }
            do
            {
              unint64_t v196 = (MTLFunctionStitchingInputImageblock *)*((void *)v188 - 1);
              v188 -= 8;
              *--unint64_t v187 = v196;
            }
            while (v188 != v195);
            goto LABEL_339;
          case 5:
            uint64_t v50 = (int *)Air::FunctionStitching::Node::node_as_BufferAddressNode(v42);
            uint64_t v51 = [MTLFunctionStitchingInputBufferAddress alloc];
            uint64_t v52 = (unsigned __int16 *)((char *)v50 - *v50);
            unsigned int v53 = *v52;
            if (v53 < 5)
            {
              uint64_t v54 = 0;
            }
            else
            {
              uint64_t v54 = (int *)v52[2];
              if (v52[2]) {
                uint64_t v54 = (int *)((char *)v54 + (void)v50 + *(unsigned int *)((char *)v54 + (void)v50));
              }
            }
            uint64_t v131 = (unsigned __int16 *)((char *)v54 - *v54);
            if (*v131 >= 7u && (uint64_t v132 = v131[3]) != 0) {
              uint64_t v133 = *(unsigned int *)((char *)v54 + v132);
            }
            else {
              uint64_t v133 = 0;
            }
            if (v53 >= 7 && (uint64_t v134 = v52[3]) != 0) {
              uint64_t v135 = *(void *)((char *)v50 + v134);
            }
            else {
              uint64_t v135 = 0;
            }
            uint64_t v59 = -[MTLFunctionStitchingInputBufferAddress initWithBindIndex:byteOffset:dereference:](v51, "initWithBindIndex:byteOffset:dereference:", v133, v135, 1, v224);
            uint64_t v60 = (MTLFunctionStitchingInputImageblock **)v236;
            if (v236 < (MTLFunctionStitchingFunctionNode **)v237) {
              goto LABEL_212;
            }
            uint64_t v136 = ((char *)v236 - (unsigned char *)v235) >> 3;
            if ((unint64_t)(v136 + 1) >> 61) {
              std::vector<std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>>::__throw_length_error[abi:ne180100]();
            }
            unint64_t v137 = (v237 - (unsigned char *)v235) >> 2;
            if (v137 <= v136 + 1) {
              unint64_t v137 = v136 + 1;
            }
            if ((unint64_t)(v237 - (unsigned char *)v235) >= 0x7FFFFFFFFFFFFFF8) {
              unint64_t v63 = 0x1FFFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v63 = v137;
            }
            if (v63) {
              uint64_t v64 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<objc_object  {objcproto18MTLIOScratchBuffer}*>>((uint64_t)&v237, v63);
            }
            else {
              uint64_t v64 = 0;
            }
            unint64_t v187 = (MTLFunctionStitchingInputImageblock **)&v64[8 * v136];
            *unint64_t v187 = v59;
            uint64_t v143 = (MTLFunctionStitchingFunctionNode **)(v187 + 1);
            uint64_t v191 = (char *)v235;
            uint64_t v188 = (char *)v236;
            if (v236 == v235) {
              goto LABEL_340;
            }
            do
            {
              uint64_t v192 = (MTLFunctionStitchingInputImageblock *)*((void *)v188 - 1);
              v188 -= 8;
              *--unint64_t v187 = v192;
            }
            while (v188 != v191);
            goto LABEL_339;
          case 6:
            uint64_t v85 = (int *)AirReflection::Node::node_as_MeshFunction(v42);
            uint64_t v86 = [MTLFunctionStitchingInputTexture alloc];
            unint64_t v87 = (unsigned __int16 *)((char *)v85 - *v85);
            if (*v87 >= 5u && (uint64_t v88 = v87[2]) != 0) {
              uint64_t v89 = *(unsigned int *)((char *)v85 + v88);
            }
            else {
              uint64_t v89 = 0;
            }
            uint64_t v59 = -[MTLFunctionStitchingInputTexture initWithBindIndex:](v86, "initWithBindIndex:", v89, v224);
            uint64_t v60 = (MTLFunctionStitchingInputImageblock **)v236;
            if (v236 < (MTLFunctionStitchingFunctionNode **)v237) {
              goto LABEL_212;
            }
            uint64_t v125 = ((char *)v236 - (unsigned char *)v235) >> 3;
            if ((unint64_t)(v125 + 1) >> 61) {
              std::vector<std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>>::__throw_length_error[abi:ne180100]();
            }
            unint64_t v126 = (v237 - (unsigned char *)v235) >> 2;
            if (v126 <= v125 + 1) {
              unint64_t v126 = v125 + 1;
            }
            if ((unint64_t)(v237 - (unsigned char *)v235) >= 0x7FFFFFFFFFFFFFF8) {
              unint64_t v63 = 0x1FFFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v63 = v126;
            }
            if (v63) {
              uint64_t v64 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<objc_object  {objcproto18MTLIOScratchBuffer}*>>((uint64_t)&v237, v63);
            }
            else {
              uint64_t v64 = 0;
            }
            unint64_t v187 = (MTLFunctionStitchingInputImageblock **)&v64[8 * v125];
            *unint64_t v187 = v59;
            uint64_t v143 = (MTLFunctionStitchingFunctionNode **)(v187 + 1);
            uint64_t v201 = (char *)v235;
            uint64_t v188 = (char *)v236;
            if (v236 == v235) {
              goto LABEL_340;
            }
            do
            {
              BOOL v202 = (MTLFunctionStitchingInputImageblock *)*((void *)v188 - 1);
              v188 -= 8;
              *--unint64_t v187 = v202;
            }
            while (v188 != v201);
            goto LABEL_339;
          case 7:
            v90 = (int *)AirReflection::Node::node_as_ObjectFunction(v42);
            uint64_t v91 = [MTLFunctionStitchingInputSampler alloc];
            BOOL v92 = (unsigned __int16 *)((char *)v90 - *v90);
            if (*v92 >= 5u && (uint64_t v93 = v92[2]) != 0) {
              uint64_t v94 = *(unsigned int *)((char *)v90 + v93);
            }
            else {
              uint64_t v94 = 0;
            }
            uint64_t v59 = -[MTLFunctionStitchingInputSampler initWithBindIndex:](v91, "initWithBindIndex:", v94, v224);
            uint64_t v60 = (MTLFunctionStitchingInputImageblock **)v236;
            if (v236 < (MTLFunctionStitchingFunctionNode **)v237) {
              goto LABEL_212;
            }
            uint64_t v127 = ((char *)v236 - (unsigned char *)v235) >> 3;
            if ((unint64_t)(v127 + 1) >> 61) {
              std::vector<std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>>::__throw_length_error[abi:ne180100]();
            }
            unint64_t v128 = (v237 - (unsigned char *)v235) >> 2;
            if (v128 <= v127 + 1) {
              unint64_t v128 = v127 + 1;
            }
            if ((unint64_t)(v237 - (unsigned char *)v235) >= 0x7FFFFFFFFFFFFFF8) {
              unint64_t v63 = 0x1FFFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v63 = v128;
            }
            if (v63) {
              uint64_t v64 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<objc_object  {objcproto18MTLIOScratchBuffer}*>>((uint64_t)&v237, v63);
            }
            else {
              uint64_t v64 = 0;
            }
            unint64_t v187 = (MTLFunctionStitchingInputImageblock **)&v64[8 * v127];
            *unint64_t v187 = v59;
            uint64_t v143 = (MTLFunctionStitchingFunctionNode **)(v187 + 1);
            uint64_t v203 = (char *)v235;
            uint64_t v188 = (char *)v236;
            if (v236 == v235) {
              goto LABEL_340;
            }
            do
            {
              uint64_t v204 = (MTLFunctionStitchingInputImageblock *)*((void *)v188 - 1);
              v188 -= 8;
              *--unint64_t v187 = v204;
            }
            while (v188 != v203);
            goto LABEL_339;
          case 8:
            uint64_t v75 = (int *)Air::FunctionStitching::Node::node_as_ThreadgroupNode(v42);
            uint64_t v76 = [MTLFunctionStitchingInputThreadgroup alloc];
            uint64_t v77 = (unsigned __int16 *)((char *)v75 - *v75);
            if (*v77 >= 5u && (uint64_t v78 = v77[2]) != 0) {
              uint64_t v79 = *(unsigned int *)((char *)v75 + v78);
            }
            else {
              uint64_t v79 = 0;
            }
            uint64_t v59 = -[MTLFunctionStitchingInputThreadgroup initWithBindIndex:](v76, "initWithBindIndex:", v79, v224);
            uint64_t v60 = (MTLFunctionStitchingInputImageblock **)v236;
            if (v236 < (MTLFunctionStitchingFunctionNode **)v237) {
              goto LABEL_212;
            }
            uint64_t v121 = ((char *)v236 - (unsigned char *)v235) >> 3;
            if ((unint64_t)(v121 + 1) >> 61) {
              std::vector<std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>>::__throw_length_error[abi:ne180100]();
            }
            unint64_t v122 = (v237 - (unsigned char *)v235) >> 2;
            if (v122 <= v121 + 1) {
              unint64_t v122 = v121 + 1;
            }
            if ((unint64_t)(v237 - (unsigned char *)v235) >= 0x7FFFFFFFFFFFFFF8) {
              unint64_t v63 = 0x1FFFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v63 = v122;
            }
            if (v63) {
              uint64_t v64 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<objc_object  {objcproto18MTLIOScratchBuffer}*>>((uint64_t)&v237, v63);
            }
            else {
              uint64_t v64 = 0;
            }
            unint64_t v187 = (MTLFunctionStitchingInputImageblock **)&v64[8 * v121];
            *unint64_t v187 = v59;
            uint64_t v143 = (MTLFunctionStitchingFunctionNode **)(v187 + 1);
            uint64_t v197 = (char *)v235;
            uint64_t v188 = (char *)v236;
            if (v236 == v235) {
              goto LABEL_340;
            }
            do
            {
              uint64_t v198 = (MTLFunctionStitchingInputImageblock *)*((void *)v188 - 1);
              v188 -= 8;
              *--unint64_t v187 = v198;
            }
            while (v188 != v197);
            goto LABEL_339;
          case 9:
            uint64_t v59 = [[MTLFunctionStitchingInputImageblock alloc] initWithBindIndex:0];
            uint64_t v60 = (MTLFunctionStitchingInputImageblock **)v236;
            if (v236 < (MTLFunctionStitchingFunctionNode **)v237) {
              goto LABEL_212;
            }
            uint64_t v111 = ((char *)v236 - (unsigned char *)v235) >> 3;
            if ((unint64_t)(v111 + 1) >> 61) {
              std::vector<std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>>::__throw_length_error[abi:ne180100]();
            }
            unint64_t v112 = (v237 - (unsigned char *)v235) >> 2;
            if (v112 <= v111 + 1) {
              unint64_t v112 = v111 + 1;
            }
            if ((unint64_t)(v237 - (unsigned char *)v235) >= 0x7FFFFFFFFFFFFFF8) {
              unint64_t v63 = 0x1FFFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v63 = v112;
            }
            if (v63) {
              uint64_t v64 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<objc_object  {objcproto18MTLIOScratchBuffer}*>>((uint64_t)&v237, v63);
            }
            else {
              uint64_t v64 = 0;
            }
            unint64_t v187 = (MTLFunctionStitchingInputImageblock **)&v64[8 * v111];
            *unint64_t v187 = v59;
            uint64_t v143 = (MTLFunctionStitchingFunctionNode **)(v187 + 1);
            uint64_t v189 = (char *)v235;
            uint64_t v188 = (char *)v236;
            if (v236 == v235) {
              goto LABEL_340;
            }
            do
            {
              uint64_t v190 = (MTLFunctionStitchingInputImageblock *)*((void *)v188 - 1);
              v188 -= 8;
              *--unint64_t v187 = v190;
            }
            while (v188 != v189);
            goto LABEL_339;
          case 0xA:
            v55 = (int *)Air::FunctionStitching::Node::node_as_BuiltinNode(v42);
            unint64_t v56 = (unsigned __int16 *)((char *)v55 - *v55);
            if (*v56 < 5u) {
              goto LABEL_69;
            }
            uint64_t v57 = v56[2];
            if (!v57) {
              goto LABEL_69;
            }
            int v58 = *(int *)((char *)v55 + v57);
            if (v58 == 1)
            {
              uint64_t v59 = objc_alloc_init(MTLFunctionStitchingBuiltinThreadPositionInThreadgroup);
              uint64_t v60 = (MTLFunctionStitchingInputImageblock **)v236;
              if (v236 < (MTLFunctionStitchingFunctionNode **)v237) {
                goto LABEL_212;
              }
              uint64_t v215 = ((char *)v236 - (unsigned char *)v235) >> 3;
              if ((unint64_t)(v215 + 1) >> 61) {
                std::vector<std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>>::__throw_length_error[abi:ne180100]();
              }
              unint64_t v216 = (v237 - (unsigned char *)v235) >> 2;
              if (v216 <= v215 + 1) {
                unint64_t v216 = v215 + 1;
              }
              if ((unint64_t)(v237 - (unsigned char *)v235) >= 0x7FFFFFFFFFFFFFF8) {
                unint64_t v63 = 0x1FFFFFFFFFFFFFFFLL;
              }
              else {
                unint64_t v63 = v216;
              }
              if (v63) {
                uint64_t v64 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<objc_object  {objcproto18MTLIOScratchBuffer}*>>((uint64_t)&v237, v63);
              }
              else {
                uint64_t v64 = 0;
              }
              unint64_t v187 = (MTLFunctionStitchingInputImageblock **)&v64[8 * v215];
              *unint64_t v187 = v59;
              uint64_t v143 = (MTLFunctionStitchingFunctionNode **)(v187 + 1);
              uint64_t v217 = (char *)v235;
              uint64_t v188 = (char *)v236;
              if (v236 != v235)
              {
                do
                {
                  uint64_t v218 = (MTLFunctionStitchingInputImageblock *)*((void *)v188 - 1);
                  v188 -= 8;
                  *--unint64_t v187 = v218;
                }
                while (v188 != v217);
                goto LABEL_339;
              }
            }
            else
            {
              if (v58) {
                break;
              }
LABEL_69:
              uint64_t v59 = objc_alloc_init(MTLFunctionStitchingBuiltinThreadPositionInGrid);
              uint64_t v60 = (MTLFunctionStitchingInputImageblock **)v236;
              if (v236 < (MTLFunctionStitchingFunctionNode **)v237)
              {
LABEL_212:
                *uint64_t v60 = v59;
                uint64_t v143 = (MTLFunctionStitchingFunctionNode **)(v60 + 1);
                goto LABEL_342;
              }
              uint64_t v61 = ((char *)v236 - (unsigned char *)v235) >> 3;
              if ((unint64_t)(v61 + 1) >> 61) {
                std::vector<std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>>::__throw_length_error[abi:ne180100]();
              }
              unint64_t v62 = (v237 - (unsigned char *)v235) >> 2;
              if (v62 <= v61 + 1) {
                unint64_t v62 = v61 + 1;
              }
              if ((unint64_t)(v237 - (unsigned char *)v235) >= 0x7FFFFFFFFFFFFFF8) {
                unint64_t v63 = 0x1FFFFFFFFFFFFFFFLL;
              }
              else {
                unint64_t v63 = v62;
              }
              if (v63) {
                uint64_t v64 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<objc_object  {objcproto18MTLIOScratchBuffer}*>>((uint64_t)&v237, v63);
              }
              else {
                uint64_t v64 = 0;
              }
              unint64_t v187 = (MTLFunctionStitchingInputImageblock **)&v64[8 * v61];
              *unint64_t v187 = v59;
              uint64_t v143 = (MTLFunctionStitchingFunctionNode **)(v187 + 1);
              uint64_t v213 = (char *)v235;
              uint64_t v188 = (char *)v236;
              if (v236 != v235)
              {
                do
                {
                  uint64_t v214 = (MTLFunctionStitchingInputImageblock *)*((void *)v188 - 1);
                  v188 -= 8;
                  *--unint64_t v187 = v214;
                }
                while (v188 != v213);
LABEL_339:
                uint64_t v188 = (char *)v235;
              }
            }
LABEL_340:
            uint64_t v235 = v187;
            v236 = v143;
            char v237 = &v64[8 * v63];
            if (v188) {
              operator delete(v188);
            }
LABEL_342:
            v236 = v143;
            break;
          case 0xB:
            BOOL v95 = (int *)Air::FunctionStitching::Node::node_as_EarlyReturnNode(v42);
            uint64_t v96 = v95;
            uint64_t v97 = (unsigned __int16 *)((char *)v95 - *v95);
            if (*v97 >= 7u && (uint64_t v98 = v97[3]) != 0)
            {
              uint64_t v99 = (int *)((char *)v95 + v98 + *(unsigned int *)((char *)v95 + v98));
              uint64_t v232 = 0;
              uint64_t v233 = 0;
              v234 = 0;
              if (*v99)
              {
                uint64_t v100 = 0;
                unint64_t v101 = 0;
                do
                {
                  uint64_t v102 = *((void *)v235 + v99[v101 + 1]);
                  if (v100 >= v234)
                  {
                    uint64_t v103 = (v100 - (unsigned char *)v232) >> 3;
                    if ((unint64_t)(v103 + 1) >> 61) {
                      std::vector<std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>>::__throw_length_error[abi:ne180100]();
                    }
                    unint64_t v104 = (v234 - (unsigned char *)v232) >> 2;
                    if (v104 <= v103 + 1) {
                      unint64_t v104 = v103 + 1;
                    }
                    if ((unint64_t)(v234 - (unsigned char *)v232) >= 0x7FFFFFFFFFFFFFF8) {
                      unint64_t v105 = 0x1FFFFFFFFFFFFFFFLL;
                    }
                    else {
                      unint64_t v105 = v104;
                    }
                    if (v105) {
                      uint64_t v106 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<objc_object  {objcproto18MTLIOScratchBuffer}*>>((uint64_t)&v234, v105);
                    }
                    else {
                      uint64_t v106 = 0;
                    }
                    uint64_t v107 = &v106[8 * v103];
                    *(void *)uint64_t v107 = v102;
                    uint64_t v100 = v107 + 8;
                    unint64_t v109 = (char *)v232;
                    uint64_t v108 = v233;
                    if (v233 != v232)
                    {
                      do
                      {
                        uint64_t v110 = *((void *)v108 - 1);
                        v108 -= 8;
                        *((void *)v107 - 1) = v110;
                        v107 -= 8;
                      }
                      while (v108 != v109);
                      uint64_t v108 = (char *)v232;
                    }
                    uint64_t v232 = v107;
                    uint64_t v233 = v100;
                    v234 = &v106[8 * v105];
                    if (v108) {
                      operator delete(v108);
                    }
                  }
                  else
                  {
                    *(void *)uint64_t v100 = v102;
                    v100 += 8;
                  }
                  uint64_t v233 = v100;
                  ++v101;
                }
                while (v101 < *v99);
              }
            }
            else
            {
              uint64_t v232 = 0;
              uint64_t v233 = 0;
              v234 = 0;
            }
            id v113 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:count:");
            uint64_t v114 = [MTLFunctionStitchingEarlyReturnNode alloc];
            id v10 = v226;
            uint64_t v115 = [(MTLFunctionStitchingEarlyReturnNode *)v114 initWithCondition:*((void *)v235 + *(unsigned int *)((char *)v96 + *(unsigned __int16 *)((char *)v96 - *v96 + 4))) controlDependencies:v113];
            uint64_t v116 = v115;
            v117 = v236;
            if (v236 >= (MTLFunctionStitchingFunctionNode **)v237)
            {
              uint64_t v146 = ((char *)v236 - (unsigned char *)v235) >> 3;
              if ((unint64_t)(v146 + 1) >> 61) {
                std::vector<std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>>::__throw_length_error[abi:ne180100]();
              }
              unint64_t v147 = (v237 - (unsigned char *)v235) >> 2;
              if (v147 <= v146 + 1) {
                unint64_t v147 = v146 + 1;
              }
              if ((unint64_t)(v237 - (unsigned char *)v235) >= 0x7FFFFFFFFFFFFFF8) {
                unint64_t v148 = 0x1FFFFFFFFFFFFFFFLL;
              }
              else {
                unint64_t v148 = v147;
              }
              if (v148) {
                uint64_t v149 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<objc_object  {objcproto18MTLIOScratchBuffer}*>>((uint64_t)&v237, v148);
              }
              else {
                uint64_t v149 = 0;
              }
              BOOL v205 = (MTLFunctionStitchingEarlyReturnNode **)&v149[8 * v146];
              *BOOL v205 = v116;
              uint64_t v118 = (MTLFunctionStitchingFunctionNode **)(v205 + 1);
              uint64_t v207 = (char *)v235;
              uint64_t v206 = (char *)v236;
              if (v236 != v235)
              {
                do
                {
                  uint64_t v208 = (MTLFunctionStitchingEarlyReturnNode *)*((void *)v206 - 1);
                  v206 -= 8;
                  *--BOOL v205 = v208;
                }
                while (v206 != v207);
                uint64_t v206 = (char *)v235;
              }
              uint64_t v235 = v205;
              v236 = v118;
              char v237 = &v149[8 * v148];
              if (v206) {
                operator delete(v206);
              }
            }
            else
            {
              void *v236 = &v115->super;
              uint64_t v118 = v117 + 1;
            }
            v236 = v118;
            goto LABEL_334;
          default:
            break;
        }
      }
    }
    ++v38;
  }
  while (v38 < *v40);
  [v10 setOutputNode:*((void *)v235 + *(unsigned int *)((char *)v224 + *(unsigned __int16 *)((char *)v224 - *v224 + 8)))];
  id v219 = (id)objc_opt_new();
  uint64_t v220 = (MTLFunctionStitchingFunctionNode **)v235;
  uint64_t v221 = v236;
  while (v220 != v221)
  {
    uint64_t v222 = (uint64_t)*v220;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [v219 addObject:v222];
    }
    ++v220;
  }
  [v10 setNodes:v219];
  v241[0] = v10;
  objc_msgSend(v225, "setFunctionGraphs:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v241, 1));
  if (v235)
  {
    v236 = (MTLFunctionStitchingFunctionNode **)v235;
    operator delete(v235);
  }
  if (__dst)
  {
    v239 = (MTLFunctionStitchingAttributeKernel **)__dst;
    operator delete(__dst);
  }
  return v225;
}

- (id)recompileFunction:(id)a3 inLibrary:(id)a4 toArchive:(id)a5 toBinary:(BOOL)a6 error:(id *)a7
{
  BOOL v8 = a6;
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  uint64_t v12 = [a3 airScript];
  if (!v12 && !v8)
  {
    return a3;
  }
  if (!v12 && v8)
  {
    *(void *)&long long v62 = 0;
    int v58 = 0;
    objc_msgSend(a4, "getFunctionAliasAndNameForHash:functionName:alias:", objc_msgSend(a3, "bitCodeHash"), &v62, &v58);
    if (v58) {
      unsigned int v14 = v58;
    }
    else {
      unsigned int v14 = (void *)v62;
    }
    uint64_t v15 = objc_alloc_init(MTLFunctionDescriptor);
    [(MTLFunctionDescriptor *)v15 setName:v14];
    [(MTLFunctionDescriptor *)v15 setOptions:[(MTLFunctionDescriptor *)v15 options] | 1];
    id v16 = (id)[a4 newFunctionWithDescriptor:v15 destinationArchive:a5 error:a7];

    return v16;
  }
  buffer_ptr = 0;
  size_t size_ptr = 0;
  uint64_t v17 = dispatch_data_create_map(v12, (const void **)&buffer_ptr, &size_ptr);
  uint64_t v18 = (unsigned int *)buffer_ptr;
  if (!strncmp((const char *)buffer_ptr + 4, "AIRC", 4uLL))
  {
    id v40 = [(_MTLBinaryArchive *)self newFunctionDescriptorWithAirScript:(char *)v18 + *v18];
    uint64_t v41 = v40;
    if (v8) {
      objc_msgSend(v40, "setOptions:", objc_msgSend(v40, "options") | 1);
    }
    dispatch_release(v17);
    [a3 bitCodeHash];
    long long v62 = 0u;
    long long v63 = 0u;
    if (a3) {
      [a3 baseFunctionHash];
    }
    id v42 = (id)[a4 newFunctionWithHash:&v62];
    id v43 = [(_MTLBinaryArchive *)self recompileFunction:v42 inLibrary:a4 toArchive:a5 toBinary:0 error:a7];
    uint64_t v44 = v43;
    if (v43)
    {
      if (v43 == v42)
      {
        int v58 = 0;
        std::string __p = 0;
        [a4 getFunctionAliasAndNameForHash:&v62 functionName:&v58 alias:&__p];
        if (__p) {
          uint64_t v52 = __p;
        }
        else {
          uint64_t v52 = v58;
        }
        [v41 setName:v52];
        id v16 = (id)[a4 newFunctionWithDescriptor:v41 destinationArchive:a5 error:a7];

        if (v58) {
        if (__p)
        }
      }
      else
      {

        uint64_t v45 = [v44 libraryData];
        uint64_t v46 = (*(uint64_t (**)(uint64_t))(*(void *)v45 + 128))(v45);
        uint64_t v51 = MTLLibraryBuilder::newLibraryWithData(*((void *)self->_device + 53), (_MTLDevice *)self->_device, v46, 0, v47, v48, v49, v50);
        objc_msgSend(v41, "setName:", objc_msgSend(v44, "name"));
        id v16 = [(_MTLLibrary *)v51 newFunctionWithDescriptor:v41 destinationArchive:a5 error:a7];
      }
    }
    else
    {

      return 0;
    }
    return v16;
  }
  [a3 bitCodeHash];
  unint64_t v19 = (*(void *(**)(void **__return_ptr))(*(void *)[a3 libraryData] + 272))(&v58);
  uint64_t v54 = v17;
  std::string __p = 0;
  unint64_t v56 = 0;
  uint64_t v57 = 0;
  uint64_t v20 = (long long *)v58;
  int v21 = v59;
  if (v58 == v59)
  {
LABEL_37:
    uint64_t v35 = (char *)buffer_ptr;
    uint64_t v36 = *(unsigned int *)buffer_ptr;
    unint64_t v37 = (void *)MEMORY[0x18530C9F0](v19);
    id v38 = [(_MTLBinaryArchive *)self getLibraryDescriptorWithAirScrpt:&v35[v36]];
    dispatch_release(v54);
    objc_msgSend(v38, "setFunctions:", (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:count:"));
    id v16 = (id)[(MTLDevice *)self->_device newLibraryWithStitchedDescriptor:v38 destinationBinaryArchive:a5 error:a7];
    for (unint64_t i = (id *)__p; i != (id *)v56; ++i)

    if (v16) {
      id v16 = (id)objc_msgSend(v16, "newFunctionWithName:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(v38, "functionGraphs"), "objectAtIndexedSubscript:", 0), "functionName"));
    }
LABEL_51:
    uint64_t v27 = (id *)__p;
    if (__p) {
      goto LABEL_52;
    }
    goto LABEL_53;
  }
  while (1)
  {
    long long v22 = v20[1];
    long long v62 = *v20;
    long long v63 = v22;
    unsigned int v23 = (void *)[a4 newFunctionWithHash:&v62];
    id v24 = [(_MTLBinaryArchive *)self recompileFunction:v23 inLibrary:a4 toArchive:a5 toBinary:0 error:a7];
    if (!v24) {
      break;
    }

    unint64_t v25 = v56;
    if (v56 >= v57)
    {
      uint64_t v28 = (v56 - (unsigned char *)__p) >> 3;
      if ((unint64_t)(v28 + 1) >> 61) {
        std::vector<std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>>::__throw_length_error[abi:ne180100]();
      }
      unint64_t v29 = (v57 - (unsigned char *)__p) >> 2;
      if (v29 <= v28 + 1) {
        unint64_t v29 = v28 + 1;
      }
      if ((unint64_t)(v57 - (unsigned char *)__p) >= 0x7FFFFFFFFFFFFFF8) {
        unint64_t v30 = 0x1FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v30 = v29;
      }
      if (v30) {
        unint64_t v19 = std::__allocate_at_least[abi:ne180100]<std::allocator<objc_object  {objcproto18MTLIOScratchBuffer}*>>((uint64_t)&v57, v30);
      }
      else {
        unint64_t v19 = 0;
      }
      uint64_t v31 = (char *)&v19[v28];
      *(void *)uint64_t v31 = v24;
      unint64_t v26 = v31 + 8;
      uint64_t v33 = (char *)__p;
      uint64_t v32 = v56;
      if (v56 != __p)
      {
        do
        {
          uint64_t v34 = *((void *)v32 - 1);
          v32 -= 8;
          *((void *)v31 - 1) = v34;
          v31 -= 8;
        }
        while (v32 != v33);
        uint64_t v32 = (char *)__p;
      }
      std::string __p = v31;
      unint64_t v56 = v26;
      uint64_t v57 = (char *)&v19[v30];
      if (v32) {
        operator delete(v32);
      }
    }
    else
    {
      *(void *)unint64_t v56 = v24;
      unint64_t v26 = v25 + 8;
    }
    unint64_t v56 = v26;
LABEL_35:
    if (!v24)
    {
      id v16 = 0;
      goto LABEL_51;
    }
    v20 += 2;
    if (v20 == v21) {
      goto LABEL_37;
    }
  }

  uint64_t v27 = (id *)__p;
  if (__p != v56)
  {
    do

    while (v27 != (id *)v56);
    goto LABEL_35;
  }
  id v16 = 0;
  if (!__p) {
    goto LABEL_53;
  }
LABEL_52:
  unint64_t v56 = (char *)v27;
  operator delete(v27);
LABEL_53:
  if (v58)
  {
    uint64_t v59 = (long long *)v58;
    operator delete(v58);
  }
  return v16;
}

- (BOOL)recompileStatelessToArchive:(id)a3 error:(id *)a4
{
  begin = self->_airntFromDescriptorFunctionList.__begin_;
  end = self->_airntFromDescriptorFunctionList.__end_;
  if (begin == end) {
    return 1;
  }
  uint64_t v7 = MEMORY[0x1E4F143A8];
  while (1)
  {
    BOOL v8 = *begin;
    uint64_t v21 = 0;
    long long v22 = &v21;
    uint64_t v23 = 0x3052000000;
    id v24 = __Block_byref_object_copy_;
    unint64_t v25 = __Block_byref_object_dispose_;
    uint64_t v26 = 0;
    uint64_t v15 = 0;
    id v16 = &v15;
    uint64_t v17 = 0x3052000000;
    uint64_t v18 = __Block_byref_object_copy_;
    unint64_t v19 = __Block_byref_object_dispose_;
    uint64_t v20 = 0;
    queue = self->_queue;
    block[0] = v7;
    block[1] = 3221225472;
    block[2] = __55___MTLBinaryArchive_recompileStatelessToArchive_error___block_invoke;
    block[3] = &unk_1E521FBD0;
    block[4] = self;
    block[5] = &v21;
    void block[7] = v8;
    void block[8] = a4;
    block[6] = &v15;
    dispatch_sync(queue, block);
    id v10 = (void *)v22[5];
    if (v10)
    {
      if ([v10 isStub]) {
        goto LABEL_11;
      }
      if (v22[5] && v16[5]) {
        break;
      }
    }
LABEL_9:
    _Block_object_dispose(&v15, 8);
    _Block_object_dispose(&v21, 8);
    if (++begin == end) {
      return 1;
    }
  }
  id v11 = -[_MTLBinaryArchive recompileFunction:inLibrary:toArchive:toBinary:error:](self, "recompileFunction:inLibrary:toArchive:toBinary:error:");

  if (v11)
  {

    goto LABEL_9;
  }
LABEL_11:
  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v21, 8);
  return 0;
}

- (BOOL)recompilePipelinesToArchive:(id)a3 error:(id *)a4
{
  begin = self->_airntPipelineList.__begin_;
  end = self->_airntPipelineList.__end_;
  if (begin == end) {
    return 1;
  }
  uint64_t v35 = self->_airntPipelineList.__end_;
  while (2)
  {
    uint64_t v9 = *begin;
    id v10 = self->_airntObjectList.__begin_[*((unsigned int *)*begin + 2 * (*(_DWORD *)*begin == 3) + 2)];
    id v11 = [(_MTLBinaryArchive *)self materializeAirScript:v10];
    if (!v11)
    {
      if (!a4) {
        return 0;
      }
      id v33 = newErrorWithMessage((NSString *)[NSString stringWithFormat:@"Failed to materialize AirScript for pipeline"], MTLBinaryArchiveErrorInvalidFile);
      BOOL result = 0;
      *a4 = v33;
      return result;
    }
    uint64_t v12 = v11;
    size_t size_ptr = 0;
    buffer_ptr = 0;
    uint64_t v13 = dispatch_data_create_map(v11, (const void **)&buffer_ptr, &size_ptr);
    dispatch_object_t object = v13;
    unsigned int v14 = (char *)buffer_ptr + *(unsigned int *)buffer_ptr;
    switch(*(_DWORD *)v9)
    {
      case 0:
        id v15 = [(_MTLBinaryArchive *)self newRenderPipelineDescriptorWithScript:v14 obj:v10 destinationArchive:a3 error:a4];
        uint64_t v16 = *((unsigned int *)v9 + 4);
        if (v16 == -1) {
          uint64_t v17 = 0;
        }
        else {
          uint64_t v17 = self->_airntObjectList.__begin_[v16];
        }
        id v25 = [(_MTLBinaryArchive *)self newRecompiledFunctionWithAIRNTObject:v10 destinationArchive:a3 error:a4];
        uint64_t v26 = v25;
        if (v25) {
          BOOL v27 = v17 == 0;
        }
        else {
          BOOL v27 = 1;
        }
        if (v27)
        {
          if (!v25)
          {

            dispatch_release(object);
            dispatch_release(v12);
            if (a4)
            {
              uint64_t v34 = @"Failed to materialize vertex function bitcode for render pipeline";
LABEL_45:
              *a4 = newErrorWithMessage((NSString *)[NSString stringWithFormat:v34], MTLBinaryArchiveErrorCompilationFailure);
            }
            return 0;
          }
          id v28 = 0;
        }
        else
        {
          id v28 = [(_MTLBinaryArchive *)self newRecompiledFunctionWithAIRNTObject:v17 destinationArchive:a3 error:a4];
        }
        [v15 setVertexFunction:v26];
        [v15 setFragmentFunction:v28];
        char v18 = [a3 addRenderPipelineFunctionsWithDescriptor:v15 error:a4];

        goto LABEL_33;
      case 1:
        id v15 = [(_MTLBinaryArchive *)self newComputePipelineDescriptorWithScript:v14 obj:v10 destinationArchive:a3 error:a4];
        id v19 = [(_MTLBinaryArchive *)self newRecompiledFunctionWithAIRNTObject:v10 destinationArchive:a3 error:a4];
        if (!v19)
        {

          dispatch_release(object);
          dispatch_release(v12);
          if (a4)
          {
            uint64_t v34 = @"Failed to materialize function bitcode for compute pipeline";
            goto LABEL_45;
          }
          return 0;
        }
        uint64_t v20 = v19;
        [v15 setComputeFunction:v19];
        char v21 = [a3 addComputePipelineFunctionsWithDescriptor:v15 error:a4];
        goto LABEL_12;
      case 2:
        id v15 = [(_MTLBinaryArchive *)self newTileRenderPipelineDescriptorWithScript:v14 obj:v10 destinationArchive:a3 error:a4];
        id v22 = [(_MTLBinaryArchive *)self newRecompiledFunctionWithAIRNTObject:v10 destinationArchive:a3 error:a4];
        if (v22)
        {
          uint64_t v20 = v22;
          [v15 setTileFunction:v22];
          char v21 = [a3 addTileRenderPipelineFunctionsWithDescriptor:v15 error:a4];
LABEL_12:
          char v18 = v21;

LABEL_33:
          uint64_t v13 = object;
LABEL_34:
          dispatch_release(v13);
          dispatch_release(v12);
          if ((v18 & 1) == 0) {
            return 0;
          }
          if (++begin == end) {
            return 1;
          }
          continue;
        }

        dispatch_release(object);
        dispatch_release(v12);
        if (a4)
        {
          uint64_t v34 = @"Failed to materialize function bitcode for tile render pipeline";
          goto LABEL_45;
        }
        return 0;
      case 3:
        id v15 = [(_MTLBinaryArchive *)self newMeshRenderPipelineDescriptorWithScript:v14 obj:v10 destinationArchive:a3 error:a4];
        uint64_t v23 = *((unsigned int *)v9 + 6);
        if (v23 == -1) {
          id v24 = 0;
        }
        else {
          id v24 = self->_airntObjectList.__begin_[v23];
        }
        uint64_t v29 = *((unsigned int *)v9 + 2);
        if (v29 == -1) {
          unint64_t v30 = 0;
        }
        else {
          unint64_t v30 = self->_airntObjectList.__begin_[v29];
        }
        id v31 = [(_MTLBinaryArchive *)self newRecompiledFunctionWithAIRNTObject:v10 destinationArchive:a3 error:a4];
        if (v24) {
          id v24 = [(_MTLBinaryArchive *)self newRecompiledFunctionWithAIRNTObject:v24 destinationArchive:a3 error:a4];
        }
        if (v30) {
          unint64_t v30 = [(_MTLBinaryArchive *)self newRecompiledFunctionWithAIRNTObject:v30 destinationArchive:a3 error:a4];
        }
        [v15 setMeshFunction:v31];
        [v15 setObjectFunction:v30];
        [v15 setFragmentFunction:v24];
        char v18 = [a3 addMeshRenderPipelineFunctionsWithDescriptor:v15 error:a4];

        end = v35;
        goto LABEL_33;
      default:
        char v18 = 1;
        goto LABEL_34;
    }
  }
}

- (BOOL)recompileToArchiveWithURL:(id)a3 error:(id *)a4
{
  uint64_t v7 = objc_opt_new();
  BOOL v8 = (void *)[(MTLDevice *)self->_device newBinaryArchiveWithDescriptor:v7 error:a4];

  if (!v8) {
    return 0;
  }
  [v8 setRecompilationTarget:1];
  if ([(_MTLBinaryArchive *)self recompileToArchive:v8 error:a4]) {
    char v9 = [v8 serializeToURL:a3 error:a4];
  }
  else {
    char v9 = 0;
  }

  return v9;
}

- (BOOL)recompileToArchive:(id)a3 error:(id *)a4
{
  if (self == a3)
  {
    if (a4)
    {
      uint64_t v6 = NSString;
      uint64_t v7 = @"Archive cannot be recompiled in place";
      goto LABEL_10;
    }
    return 0;
  }
  if (self->_isLegacy)
  {
    if (a4)
    {
      uint64_t v6 = NSString;
      uint64_t v7 = @"Legacy archive cannot be recompiled";
LABEL_10:
      *a4 = newErrorWithMessage((NSString *)[v6 stringWithFormat:v7], MTLBinaryArchiveErrorInvalidFile);
      return 0;
    }
    return 0;
  }
  if (self->_hasBuiltins)
  {
    if (a4)
    {
      uint64_t v6 = NSString;
      uint64_t v7 = @"Archive containting builtin objects cannot be recompiled";
      goto LABEL_10;
    }
    return 0;
  }
  if (!self->_airntBinaryList.__table_.__p2_.__value_
    && self->_airntObjectList.__begin_ == self->_airntObjectList.__end_
    && self->_airntFromDescriptorFunctionList.__begin_ == self->_airntFromDescriptorFunctionList.__end_
    && self->_airntPipelineList.__begin_ == self->_airntPipelineList.__end_)
  {
    if (!a4) {
      return 0;
    }
    uint64_t v6 = NSString;
    uint64_t v7 = @"No recompilable artifacts found";
    goto LABEL_10;
  }
  [a3 initMetalScriptWithArchive:self];
  if (![(_MTLBinaryArchive *)self recompilePipelinesToArchive:a3 error:a4]) {
    return 0;
  }

  return [(_MTLBinaryArchive *)self recompileStatelessToArchive:a3 error:a4];
}

- (BOOL)legacySerializeToURL:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  v182[3] = *MEMORY[0x1E4F143B8];
  if (a5) {
    *a5 = 0;
  }
  char v9 = (void *)MEMORY[0x18530C9F0](self, a2);
  id v10 = (void *)[MEMORY[0x1E4F28CB8] defaultManager];
  id v11 = v10;
  id v12 = a3;
  if (a4)
  {
    uint64_t v13 = (void *)[v10 URLForDirectory:99 inDomain:1 appropriateForURL:a3 create:1 error:a5];
    id v12 = (id)objc_msgSend(v13, "URLByAppendingPathComponent:", objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F29128], "UUID"), "UUIDString"));
  }
  if (!v12)
  {
    if (!a5)
    {
      return 0;
    }
    id v16 = newErrorWithMessage(&cfstr_OutputUrlIsInv.isa, MTLBinaryArchiveErrorInvalidFile);
    BOOL v17 = 0;
    *a5 = v16;
    if (!v16) {
      goto LABEL_226;
    }
    goto LABEL_225;
  }
  uint64_t v157 = [MEMORY[0x1E4F28CB0] fileHandleForWritingToURL:v12 error:0];
  if (!v157)
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "createFileAtPath:contents:attributes:", objc_msgSend(v12, "path"), 0, 0);
    uint64_t v157 = [MEMORY[0x1E4F28CB0] fileHandleForWritingToURL:v12 error:a5];
    if (!v157)
    {
      char v27 = a4;
      int v28 = 0;
      if ((v27 & 1) == 0) {
        goto LABEL_222;
      }
      goto LABEL_221;
    }
  }
  if ((a4 & 0xC) != 0)
  {
    if ((self->_options & 2) == 0)
    {
      int v14 = 0;
      BOOL v15 = (a4 & 8) == 0;
      goto LABEL_17;
    }
    int v14 = 1;
  }
  else
  {
    int v14 = 0;
  }
  BOOL v15 = 1;
LABEL_17:
  uint64_t v158 = self;
  id v154 = v12;
  id v155 = a3;
  if ((a4 & 0x30) != 0)
  {
    if (self->_options)
    {
      int v18 = 1;
    }
    else
    {
      int v18 = 0;
      if ((a4 & 0x20) != 0) {
        BOOL v15 = 0;
      }
    }
  }
  else
  {
    int v18 = 0;
  }
  if ((a4 & 0xC0) == 0)
  {
    int v19 = 0;
    if (!a5) {
      goto LABEL_35;
    }
    goto LABEL_33;
  }
  if ((v158->_options & 4) != 0)
  {
    int v19 = 1;
    if (!a5) {
      goto LABEL_35;
    }
    goto LABEL_33;
  }
  int v19 = 0;
  if ((a4 & 0x80) != 0) {
    BOOL v15 = 0;
  }
  if (a5)
  {
LABEL_33:
    if (!v15) {
      *a5 = newErrorWithMessage(&cfstr_SerializationO.isa, MTLBinaryArchiveErrorUnexpectedElement);
    }
  }
LABEL_35:
  unint64_t v177 = 0;
  uint64_t v178 = 0;
  id v175 = 0;
  uint64_t v176 = 0;
  if (v158->_legacyPipelineFileIndex.__tree_.__pair3_.__value_) {
    BOOL v20 = 1;
  }
  else {
    BOOL v20 = [(NSMutableDictionary *)v158->_entries count] != 0;
  }
  int v21 = v14 & v20;
  if (v21 == 1)
  {
    unint64_t v22 = +[MTLLoader sliceIDForDevice:andDriverVersion:]((uint64_t)MTLLoader, v158->_device, &v178);
    uint64_t v23 = v176 - v175;
    if ((unint64_t)(v23 + 1) >> 61) {
      std::vector<std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>>::__throw_length_error[abi:ne180100]();
    }
    unint64_t v24 = (uint64_t)(v177 - (void)v175) >> 2;
    if (v24 <= v23 + 1) {
      unint64_t v24 = v23 + 1;
    }
    if (v177 - (unint64_t)v175 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v25 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v25 = v24;
    }
    if (v25) {
      uint64_t v26 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<objc_object  {objcproto18MTLIOScratchBuffer}*>>((uint64_t)&v177, v25);
    }
    else {
      uint64_t v26 = 0;
    }
    uint64_t v29 = (unint64_t *)&v26[8 * v23];
    unint64_t v30 = &v26[8 * v25];
    *uint64_t v29 = v22;
    id v31 = v29 + 1;
    id v33 = v175;
    uint64_t v32 = v176;
    if (v176 != v175)
    {
      do
      {
        unint64_t v34 = *--v32;
        *--uint64_t v29 = v34;
      }
      while (v32 != v33);
      uint64_t v32 = v175;
    }
    id v175 = v29;
    uint64_t v176 = v31;
    unint64_t v177 = (unint64_t)v30;
    if (v32) {
      operator delete(v32);
    }
    uint64_t v176 = v31;
  }
  if (v18)
  {
    uint64_t v35 = +[MTLLoader sliceIDForDescriptors]();
    uint64_t v36 = v35;
    unint64_t v37 = v176;
    if ((unint64_t)v176 >= v177)
    {
      uint64_t v39 = v176 - v175;
      if ((unint64_t)(v39 + 1) >> 61) {
        std::vector<std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>>::__throw_length_error[abi:ne180100]();
      }
      unint64_t v40 = (uint64_t)(v177 - (void)v175) >> 2;
      if (v40 <= v39 + 1) {
        unint64_t v40 = v39 + 1;
      }
      if (v177 - (unint64_t)v175 >= 0x7FFFFFFFFFFFFFF8) {
        unint64_t v41 = 0x1FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v41 = v40;
      }
      if (v41) {
        id v42 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<objc_object  {objcproto18MTLIOScratchBuffer}*>>((uint64_t)&v177, v41);
      }
      else {
        id v42 = 0;
      }
      id v43 = (unint64_t *)&v42[8 * v39];
      uint64_t v44 = &v42[8 * v41];
      *id v43 = v36;
      id v38 = v43 + 1;
      uint64_t v46 = v175;
      uint64_t v45 = v176;
      if (v176 != v175)
      {
        do
        {
          unint64_t v47 = *--v45;
          *--id v43 = v47;
        }
        while (v45 != v46);
        uint64_t v45 = v175;
      }
      id v175 = v43;
      uint64_t v176 = v38;
      unint64_t v177 = (unint64_t)v44;
      if (v45) {
        operator delete(v45);
      }
    }
    else
    {
      *uint64_t v176 = v35;
      id v38 = v37 + 1;
    }
    uint64_t v176 = v38;
  }
  if (v158->_legacySpecializedFunctions.__table_.__p2_.__value_) {
    BOOL v48 = 1;
  }
  else {
    BOOL v48 = v158->_legacySpecializedFunctionArchiveFileIndex.__tree_.__pair3_.__value_ != 0;
  }
  int v49 = v19 & v48;
  if (v19 & v48)
  {
    MTLLoaderSliceIdentifier v50 = +[_MTLBinaryArchive sliceIDForSpecializedFunctionsForLLVMVersion:_MTLGetMTLCompilerLLVMVersionForDevice(v158->_device)];
    MTLLoaderSliceIdentifier v51 = v50;
    uint64_t v52 = v176;
    if ((unint64_t)v176 >= v177)
    {
      uint64_t v54 = v176 - v175;
      if ((unint64_t)(v54 + 1) >> 61) {
        std::vector<std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>>::__throw_length_error[abi:ne180100]();
      }
      unint64_t v55 = (uint64_t)(v177 - (void)v175) >> 2;
      if (v55 <= v54 + 1) {
        unint64_t v55 = v54 + 1;
      }
      if (v177 - (unint64_t)v175 >= 0x7FFFFFFFFFFFFFF8) {
        unint64_t v56 = 0x1FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v56 = v55;
      }
      if (v56) {
        uint64_t v57 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<objc_object  {objcproto18MTLIOScratchBuffer}*>>((uint64_t)&v177, v56);
      }
      else {
        uint64_t v57 = 0;
      }
      int v58 = (unint64_t *)&v57[8 * v54];
      uint64_t v59 = &v57[8 * v56];
      unint64_t *v58 = (unint64_t)v51;
      unsigned int v53 = v58 + 1;
      uint64_t v61 = v175;
      uint64_t v60 = v176;
      if (v176 != v175)
      {
        do
        {
          unint64_t v62 = *--v60;
          *--int v58 = v62;
        }
        while (v60 != v61);
        uint64_t v60 = v175;
      }
      id v175 = v58;
      uint64_t v176 = v53;
      unint64_t v177 = (unint64_t)v59;
      if (v60) {
        operator delete(v60);
      }
    }
    else
    {
      *uint64_t v176 = (unint64_t)v50;
      unsigned int v53 = v52 + 1;
    }
    uint64_t v176 = v53;
  }
  else
  {
    unsigned int v53 = v176;
  }
  BOOL v63 = v175 != v53 && v15;
  if (v175 != v53 || a5 == 0)
  {
    uint64_t v66 = (void *)v157;
  }
  else
  {
    id v65 = newErrorWithMessage(&cfstr_TheBinaryArchi.isa, MTLBinaryArchiveErrorInvalidFile);
    uint64_t v66 = (void *)v157;
    BOOL v63 = 0;
    *a5 = v65;
  }
  memset(v182, 0, 24);
  memset(v181, 0, sizeof(v181));
  uint64_t v171 = 0;
  uint64_t v172 = &v171;
  uint64_t v173 = 0x2020000000;
  uint64_t v174 = 0;
  v170[0] = MEMORY[0x1E4F143A8];
  v170[1] = 3221225472;
  v170[2] = __56___MTLBinaryArchive_legacySerializeToURL_options_error___block_invoke;
  v170[3] = &unk_1E521FBF8;
  v170[4] = v66;
  v170[5] = &v171;
  v170[6] = a5;
  char v156 = a4;
  if (!v63)
  {
LABEL_207:
    int v143 = 0;
    uint64_t v144 = 0;
    uint64_t v142 = 0;
    goto LABEL_213;
  }
  int v152 = v49;
  p_superclass = &OBJC_METACLASS___MTLIOAccelResource.superclass;
  int v68 = +[MTLLoader serializeUniversalBinaryHeaderWithSlice:offset:length:count:writer:]((uint64_t)MTLLoader, (uint64_t)v175, 0, 0, (unint64_t)((char *)v176 - (char *)v175) >> 3, (uint64_t)v170);
  if ((v21 & v68) == 1)
  {
    *(void *)&long long v163 = 0;
    *((void *)&v163 + 1) = &v163;
    *(void *)&long long v164 = 0x4812000000;
    *((void *)&v164 + 1) = __Block_byref_object_copy__275;
    uint64_t v165 = __Block_byref_object_dispose__276;
    unint64_t v166 = &unk_1828FE28A;
    uint64_t v168 = 0;
    uint64_t v169 = 0;
    queue = v158->_queue;
    std::string __p = 0;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __56___MTLBinaryArchive_legacySerializeToURL_options_error___block_invoke_278;
    block[3] = &unk_1E521FC48;
    block[4] = v158;
    block[5] = &v163;
    block[6] = v178;
    void block[7] = a4;
    dispatch_sync(queue, block);
    v182[0] = v172[3];
    uint64_t v70 = v182[0];
    int v68 = +[MTLLoader serializeMachOContainerWithSlice:payload:count:writer:]((uint64_t)MTLLoader, *v175, *(void *)(*((void *)&v163 + 1) + 48), -1227133513* ((*(void *)(*((void *)&v163 + 1) + 56) - *(void *)(*((void *)&v163 + 1) + 48)) >> 4), v170);
    uint64_t v71 = v172[3];
    v181[0] = v71 - v70;
    if ((unint64_t)((char *)v176 - (char *)v175) >= 9) {
      +[MTLLoader serializePaddingForOffset:writer:]((uint64_t)MTLLoader, v71, (uint64_t)v170);
    }
    if (a5 && v68 != 1) {
      *a5 = newErrorWithMessage(&cfstr_SerializationO_0.isa, MTLBinaryArchiveErrorInvalidFile);
    }
    _Block_object_dispose(&v163, 8);
    if (__p)
    {
      uint64_t v168 = __p;
      operator delete(__p);
    }
    unsigned int v153 = 1;
  }
  else
  {
    unsigned int v153 = 0;
  }
  unint64_t v151 = v11;
  if ((v18 & v68) == 1)
  {
    uint64_t v72 = (void *)MTLPipelineCollection::JSONData(v158->_pipelineCollection.__ptr_.__value_);
    unsigned int v73 = v72;
    if (v72) {
      dispatch_data_t v74 = _MTLNSDataToDispatchData(v72, 0);
    }
    else {
      dispatch_data_t v74 = 0;
    }

    long long v163 = 0u;
    long long v164 = 0u;
    LODWORD(v165) = 1065353216;
    BOOL v159 = 0;
    uint64_t v160 = 0;
    unint64_t v161 = 0;
    std::vector<MTLLoaderMachOPayload>::reserve(&v159, v74 != 0);
    if (v74)
    {
      uint64_t v77 = v160;
      if (v160 >= v161)
      {
        uint64_t v79 = 0x6DB6DB6DB6DB6DB7 * ((v160 - (unsigned char *)v159) >> 4);
        unint64_t v80 = v79 + 1;
        if ((unint64_t)(v79 + 1) > 0x249249249249249) {
          std::vector<std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>>::__throw_length_error[abi:ne180100]();
        }
        if (0xDB6DB6DB6DB6DB6ELL * ((v161 - (unsigned char *)v159) >> 4) > v80) {
          unint64_t v80 = 0xDB6DB6DB6DB6DB6ELL * ((v161 - (unsigned char *)v159) >> 4);
        }
        if ((unint64_t)(0x6DB6DB6DB6DB6DB7 * ((v161 - (unsigned char *)v159) >> 4)) >= 0x124924924924924) {
          unint64_t v81 = 0x249249249249249;
        }
        else {
          unint64_t v81 = v80;
        }
        if (v81) {
          uint64_t v82 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<MTLLoaderMachOPayload>>((uint64_t)&v161, v81);
        }
        else {
          uint64_t v82 = 0;
        }
        unsigned int v83 = &v82[112 * v79];
        uint64_t v84 = &v82[112 * v81];
        *(void *)unsigned int v83 = v74;
        *(_OWORD *)(v83 + 8) = 0u;
        *(_OWORD *)(v83 + 24) = 0u;
        v83[40] = (a4 & 2) != 0;
        *((_DWORD *)v83 + 11) = 0;
        *(_DWORD *)(v83 + 41) = 0;
        *((void *)v83 + 6) = 1;
        *(_OWORD *)(v83 + 56) = 0u;
        *(_OWORD *)(v83 + 72) = 0u;
        *(_OWORD *)(v83 + 88) = 0u;
        *((void *)v83 + 13) = 0;
        uint64_t v78 = v83 + 112;
        uint64_t v86 = (char *)v159;
        uint64_t v85 = v160;
        if (v160 != v159)
        {
          do
          {
            long long v87 = *((_OWORD *)v85 - 7);
            long long v88 = *((_OWORD *)v85 - 5);
            *((_OWORD *)v83 - 6) = *((_OWORD *)v85 - 6);
            *((_OWORD *)v83 - 5) = v88;
            *((_OWORD *)v83 - 7) = v87;
            long long v89 = *((_OWORD *)v85 - 4);
            long long v90 = *((_OWORD *)v85 - 3);
            long long v91 = *((_OWORD *)v85 - 1);
            *((_OWORD *)v83 - 2) = *((_OWORD *)v85 - 2);
            *((_OWORD *)v83 - 1) = v91;
            *((_OWORD *)v83 - 4) = v89;
            *((_OWORD *)v83 - 3) = v90;
            v83 -= 112;
            v85 -= 112;
          }
          while (v85 != v86);
          uint64_t v85 = v86;
        }
        BOOL v159 = v83;
        uint64_t v160 = v78;
        unint64_t v161 = v84;
        if (v85) {
          operator delete(v85);
        }
      }
      else
      {
        *(void *)uint64_t v160 = v74;
        *(_OWORD *)(v77 + 8) = 0u;
        *(_OWORD *)(v77 + 24) = 0u;
        v77[40] = (a4 & 2) != 0;
        *(_DWORD *)(v77 + 41) = 0;
        *((_DWORD *)v77 + 11) = 0;
        *((void *)v77 + 6) = 1;
        *(_OWORD *)(v77 + 56) = 0u;
        *(_OWORD *)(v77 + 72) = 0u;
        *(_OWORD *)(v77 + 88) = 0u;
        uint64_t v78 = v77 + 112;
        *((void *)v77 + 13) = 0;
      }
      uint64_t v160 = v78;
    }
    BOOL v92 = (uint64_t *)v164;
    if ((void)v164)
    {
      unsigned int v93 = (a4 >> 1) & 1;
      do
      {
        uint64_t v94 = v92[6];
        if (v94)
        {
          long long v95 = *((_OWORD *)v92 + 2);
          long long v179 = *((_OWORD *)v92 + 1);
          long long v180 = v95;
          uint64_t v96 = v160;
          if (v160 >= v161)
          {
            uint64_t v99 = 0x6DB6DB6DB6DB6DB7 * ((v160 - (unsigned char *)v159) >> 4);
            unint64_t v100 = v99 + 1;
            if ((unint64_t)(v99 + 1) > 0x249249249249249) {
              std::vector<std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>>::__throw_length_error[abi:ne180100]();
            }
            if (0xDB6DB6DB6DB6DB6ELL * ((v161 - (unsigned char *)v159) >> 4) > v100) {
              unint64_t v100 = 0xDB6DB6DB6DB6DB6ELL * ((v161 - (unsigned char *)v159) >> 4);
            }
            if ((unint64_t)(0x6DB6DB6DB6DB6DB7 * ((v161 - (unsigned char *)v159) >> 4)) >= 0x124924924924924) {
              unint64_t v101 = 0x249249249249249;
            }
            else {
              unint64_t v101 = v100;
            }
            if (v101) {
              uint64_t v102 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<MTLLoaderMachOPayload>>((uint64_t)&v161, v101);
            }
            else {
              uint64_t v102 = 0;
            }
            long long v103 = v180;
            unint64_t v104 = &v102[112 * v99];
            *(_OWORD *)(v104 + 8) = v179;
            *(void *)unint64_t v104 = v94;
            *(_OWORD *)(v104 + 24) = v103;
            v104[40] = v93;
            *((_DWORD *)v104 + 11) = 0;
            *(_DWORD *)(v104 + 41) = 0;
            *((void *)v104 + 6) = 1;
            *(_OWORD *)(v104 + 56) = 0u;
            *(_OWORD *)(v104 + 72) = 0u;
            *(_OWORD *)(v104 + 88) = 0u;
            *((void *)v104 + 13) = 0;
            uint64_t v106 = (char *)v159;
            unint64_t v105 = v160;
            uint64_t v107 = v104;
            if (v160 != v159)
            {
              do
              {
                long long v108 = *((_OWORD *)v105 - 7);
                long long v109 = *((_OWORD *)v105 - 5);
                *((_OWORD *)v107 - 6) = *((_OWORD *)v105 - 6);
                *((_OWORD *)v107 - 5) = v109;
                *((_OWORD *)v107 - 7) = v108;
                long long v110 = *((_OWORD *)v105 - 4);
                long long v111 = *((_OWORD *)v105 - 3);
                long long v112 = *((_OWORD *)v105 - 1);
                *((_OWORD *)v107 - 2) = *((_OWORD *)v105 - 2);
                *((_OWORD *)v107 - 1) = v112;
                *((_OWORD *)v107 - 4) = v110;
                *((_OWORD *)v107 - 3) = v111;
                v107 -= 112;
                v105 -= 112;
              }
              while (v105 != v106);
              unint64_t v105 = v106;
            }
            uint64_t v98 = v104 + 112;
            BOOL v159 = v107;
            uint64_t v160 = v104 + 112;
            unint64_t v161 = &v102[112 * v101];
            if (v105) {
              operator delete(v105);
            }
          }
          else
          {
            *(void *)uint64_t v160 = v94;
            long long v97 = v180;
            *(_OWORD *)(v96 + 8) = v179;
            *(_OWORD *)(v96 + 24) = v97;
            v96[40] = v93;
            *(_DWORD *)(v96 + 41) = 0;
            *((_DWORD *)v96 + 11) = 0;
            *((void *)v96 + 6) = 1;
            *(_OWORD *)(v96 + 56) = 0u;
            *(_OWORD *)(v96 + 72) = 0u;
            *(_OWORD *)(v96 + 88) = 0u;
            uint64_t v98 = v96 + 112;
            *((void *)v96 + 13) = 0;
          }
          uint64_t v160 = v98;
        }
        BOOL v92 = (uint64_t *)*v92;
      }
      while (v92);
    }
    std::__hash_table<std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,MTLStructTypeInternal *>>>::clear(&v163);
    id v113 = (NSObject **)v159;
    LODWORD(v114) = -1227133513 * ((v160 - (unsigned char *)v159) >> 4);
    if (v114)
    {
      uint64_t v115 = v172[3];
      v182[v153] = v115;
      p_superclass = &OBJC_METACLASS___MTLIOAccelResource.superclass;
      int v68 = +[MTLLoader serializeMachOContainerWithSlice:payload:count:writer:]((uint64_t)MTLLoader, v175[v153], (uint64_t)v113, v114, v170);
      v181[v153] = v172[3] - v115;
      uint64_t v114 = v114;
      do
      {
        uint64_t v116 = *v113;
        v113 += 14;
        dispatch_release(v116);
        --v114;
      }
      while (v114);
      unint64_t v76 = v153 + 1;
      if (v76 < v176 - v175) {
        +[MTLLoader serializePaddingForOffset:writer:]((uint64_t)MTLLoader, v172[3], (uint64_t)v170);
      }
      if (a5 && v68 != 1) {
        *a5 = newErrorWithMessage(&cfstr_SerializationO_1.isa, MTLBinaryArchiveErrorInvalidFile);
      }
    }
    else
    {
      int v68 = 1;
      p_superclass = &OBJC_METACLASS___MTLIOAccelResource.superclass;
      LODWORD(v76) = v153;
    }
    uint64_t v75 = v158;
    if (v159)
    {
      uint64_t v160 = (char *)v159;
      operator delete(v159);
    }
    std::__hash_table<std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,MTLStructTypeInternal *>>>::~__hash_table((uint64_t)&v163);
  }
  else
  {
    uint64_t v75 = v158;
    LODWORD(v76) = v153;
  }
  if ((v152 & v68) == 1)
  {
    long long v163 = 0u;
    long long v164 = 0u;
    LODWORD(v165) = 1065353216;
    [(_MTLBinaryArchive *)v75 getSpecializedFunctionArchivesToSerialize:&v163];
    BOOL v159 = 0;
    uint64_t v160 = 0;
    unint64_t v161 = 0;
    std::vector<MTLLoaderMachOPayload>::reserve(&v159, *((unint64_t *)&v164 + 1));
    for (unint64_t i = (uint64_t *)v164; i; unint64_t i = (uint64_t *)*i)
    {
      uint64_t v118 = i[6];
      if (v118)
      {
        long long v119 = *((_OWORD *)i + 2);
        long long v179 = *((_OWORD *)i + 1);
        long long v180 = v119;
        unint64_t v120 = v160;
        if (v160 >= v161)
        {
          uint64_t v123 = 0x6DB6DB6DB6DB6DB7 * ((v160 - (unsigned char *)v159) >> 4);
          unint64_t v124 = v123 + 1;
          if ((unint64_t)(v123 + 1) > 0x249249249249249) {
            std::vector<std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>>::__throw_length_error[abi:ne180100]();
          }
          if (0xDB6DB6DB6DB6DB6ELL * ((v161 - (unsigned char *)v159) >> 4) > v124) {
            unint64_t v124 = 0xDB6DB6DB6DB6DB6ELL * ((v161 - (unsigned char *)v159) >> 4);
          }
          if ((unint64_t)(0x6DB6DB6DB6DB6DB7 * ((v161 - (unsigned char *)v159) >> 4)) >= 0x124924924924924) {
            unint64_t v125 = 0x249249249249249;
          }
          else {
            unint64_t v125 = v124;
          }
          if (v125) {
            unint64_t v126 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<MTLLoaderMachOPayload>>((uint64_t)&v161, v125);
          }
          else {
            unint64_t v126 = 0;
          }
          long long v127 = v180;
          unint64_t v128 = &v126[112 * v123];
          *(_OWORD *)(v128 + 8) = v179;
          *(void *)unint64_t v128 = v118;
          *(_OWORD *)(v128 + 24) = v127;
          v128[40] = (v156 & 2) != 0;
          *((_DWORD *)v128 + 11) = 0;
          *(_DWORD *)(v128 + 41) = 0;
          *((void *)v128 + 6) = 1;
          *(_OWORD *)(v128 + 56) = 0u;
          *(_OWORD *)(v128 + 72) = 0u;
          *(_OWORD *)(v128 + 88) = 0u;
          *((void *)v128 + 13) = 0;
          v130 = (char *)v159;
          uint64_t v129 = v160;
          uint64_t v131 = v128;
          if (v160 != v159)
          {
            do
            {
              long long v132 = *((_OWORD *)v129 - 7);
              long long v133 = *((_OWORD *)v129 - 5);
              *((_OWORD *)v131 - 6) = *((_OWORD *)v129 - 6);
              *((_OWORD *)v131 - 5) = v133;
              *((_OWORD *)v131 - 7) = v132;
              long long v134 = *((_OWORD *)v129 - 4);
              long long v135 = *((_OWORD *)v129 - 3);
              long long v136 = *((_OWORD *)v129 - 1);
              *((_OWORD *)v131 - 2) = *((_OWORD *)v129 - 2);
              *((_OWORD *)v131 - 1) = v136;
              *((_OWORD *)v131 - 4) = v134;
              *((_OWORD *)v131 - 3) = v135;
              v131 -= 112;
              v129 -= 112;
            }
            while (v129 != v130);
            uint64_t v129 = v130;
          }
          unint64_t v122 = v128 + 112;
          BOOL v159 = v131;
          uint64_t v160 = v128 + 112;
          unint64_t v161 = &v126[112 * v125];
          if (v129) {
            operator delete(v129);
          }
        }
        else
        {
          *(void *)uint64_t v160 = v118;
          long long v121 = v180;
          *(_OWORD *)(v120 + 8) = v179;
          *(_OWORD *)(v120 + 24) = v121;
          v120[40] = (v156 & 2) != 0;
          *(_DWORD *)(v120 + 41) = 0;
          *((_DWORD *)v120 + 11) = 0;
          *((void *)v120 + 6) = 1;
          *(_OWORD *)(v120 + 56) = 0u;
          *(_OWORD *)(v120 + 72) = 0u;
          *(_OWORD *)(v120 + 88) = 0u;
          unint64_t v122 = v120 + 112;
          *((void *)v120 + 13) = 0;
        }
        uint64_t v160 = v122;
      }
    }
    std::__hash_table<std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,MTLStructTypeInternal *>>>::clear(&v163);
    unint64_t v137 = (NSObject **)v159;
    LODWORD(v138) = -1227133513 * ((v160 - (unsigned char *)v159) >> 4);
    if (v138)
    {
      uint64_t v139 = v172[3];
      v182[v76] = v139;
      p_superclass = &OBJC_METACLASS___MTLIOAccelResource.superclass;
      uint64_t v66 = (void *)v157;
      int v140 = +[MTLLoader serializeMachOContainerWithSlice:payload:count:writer:]((uint64_t)MTLLoader, v175[v76], (uint64_t)v137, v138, v170);
      v181[v76] = v172[3] - v139;
      uint64_t v138 = v138;
      do
      {
        uint64_t v141 = *v137;
        v137 += 14;
        dispatch_release(v141);
        --v138;
      }
      while (v138);
      if ((v76 + 1) < (unint64_t)(v176 - v175)) {
        +[MTLLoader serializePaddingForOffset:writer:]((uint64_t)MTLLoader, v172[3], (uint64_t)v170);
      }
      if (a5 && v140 != 1) {
        *a5 = newErrorWithMessage(&cfstr_SerializationO_1.isa, MTLBinaryArchiveErrorInvalidFile);
      }
    }
    else
    {
      LOBYTE(v140) = 1;
      uint64_t v66 = (void *)v157;
      p_superclass = (__objc2_class **)(&OBJC_METACLASS___MTLIOAccelResource + 8);
    }
    if (v159)
    {
      uint64_t v160 = (char *)v159;
      operator delete(v159);
    }
    std::__hash_table<std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,MTLStructTypeInternal *>>>::~__hash_table((uint64_t)&v163);
    if ((v140 & 1) == 0) {
      goto LABEL_212;
    }
    goto LABEL_204;
  }
  uint64_t v66 = (void *)v157;
  if (v68)
  {
LABEL_204:
    id v11 = v151;
    if ([v66 seekToOffset:0 error:a5]
      && +[MTLLoader serializeUniversalBinaryHeaderWithSlice:offset:length:count:writer:]((uint64_t)(p_superclass + 364), (uint64_t)v175, v182, v181, (unint64_t)((char *)v176 - (char *)v175) >> 3, (uint64_t)v170))
    {
      uint64_t v142 = v172[3];
      int v143 = 1;
      uint64_t v144 = a5;
      goto LABEL_213;
    }
    goto LABEL_207;
  }
LABEL_212:
  int v143 = 0;
  uint64_t v144 = 0;
  uint64_t v142 = 0;
  id v11 = v151;
LABEL_213:
  int v145 = v143 & [v66 truncateAtOffset:v142 error:v144];
  if (v145) {
    uint64_t v146 = a5;
  }
  else {
    uint64_t v146 = 0;
  }
  int v147 = [v66 closeAndReturnError:v146];
  _Block_object_dispose(&v171, 8);
  if (v175)
  {
    uint64_t v176 = v175;
    operator delete(v175);
  }
  int v28 = v145 & v147;
  id v12 = v154;
  if (v156)
  {
    if (v28) {
      int v28 = [v11 replaceItemAtURL:v155 withItemAtURL:v154 backupItemName:0 options:0 resultingItemURL:0 error:a5];
    }
LABEL_221:
    [v11 removeItemAtURL:v12 error:0];
  }
LABEL_222:
  BOOL v17 = v28 != 0;
  if (!a5 || v28)
  {
    if (!a5) {
      return v17;
    }
    goto LABEL_228;
  }
  id v16 = *a5;
  if (*a5) {
LABEL_225:
  }
    id v148 = v16;
LABEL_226:
LABEL_228:
  if (*a5) {
    id v149 = *a5;
  }
  return v17;
}

- (void)pipelineCollection
{
  return self->_pipelineCollection.__ptr_.__value_;
}

- (BOOL)getScriptsWithAIRNTObject:(void *)a3
{
  uint64_t v10 = 0;
  if (self->_reloadingAfterSerialization) {
    return 1;
  }
  id v5 = [(_MTLBinaryArchive *)self getLibraryInArchiveAtPos:a3 atIndex:0 error:&v10];
  char v6 = [v5 isStub];
  BOOL result = 0;
  if ((v6 & 1) == 0 && v5)
  {
    uint64_t v7 = [v5 newMetalScript];
    if (v7)
    {
      BOOL v8 = (OS_dispatch_data *)v7;
      metalScript = self->_metalScript;
      if (metalScript) {
        dispatch_release(metalScript);
      }
      self->_metalScript = v8;
      MTLMetalScriptBuilder::initFromScript((NSObject ***)self->_mtlScriptBuilder.__ptr_.__value_, v8);
    }
    return 1;
  }
  return result;
}

- (BOOL)loadFileIndex:(void *)a3 expectedSliceId:(const MTLLoaderSliceIdentifier *)a4 expectedVersion:(unint64_t)a5 sliceOffset:(unint64_t)a6
{
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __79___MTLBinaryArchive_loadFileIndex_expectedSliceId_expectedVersion_sliceOffset___block_invoke;
  v10[3] = &__block_descriptor_64_e61_B52__0_MTLLoaderSliceIdentifier_ii_8Q16r_____32C__24I32Q36Q44l;
  v10[4] = a4;
  void v10[5] = a5;
  v10[6] = a3;
  v10[7] = a6;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __79___MTLBinaryArchive_loadFileIndex_expectedSliceId_expectedVersion_sliceOffset___block_invoke_2;
  v9[3] = &unk_1E521FAC0;
  v9[4] = self;
  v9[5] = a6;
  char v7 = +[MTLLoader deserializeMachOContainerWithHandler:reader:]((uint64_t)MTLLoader, (uint64_t)v10, (uint64_t)v9);
  if ((v7 & 1) == 0)
  {
    std::__tree<unsigned long,flexbuffers::Builder::KeyOffsetCompare,std::allocator<unsigned long>>::destroy((uint64_t)a3, *((void **)a3 + 1));
    *(void *)a3 = (char *)a3 + 8;
    *((void *)a3 + 2) = 0;
    *((void *)a3 + 1) = 0;
  }
  return v7;
}

- (BOOL)enumerateArchivesFromBackingFileFromSlice:(const MTLLoaderSliceIdentifier *)a3 version:(unint64_t)a4 verifyKey:(id *)a5 offset:(unint64_t)a6 bytes:(unint64_t)a7 enumerator:(id)a8
{
  char v8 = 1;
  if (a7)
  {
    fileData = self->_fileData;
    if (fileData)
    {
      id v16 = [(MTLLoadedFileContentsWrapper *)self->_fileData bytes];
      v21[0] = 0;
      v21[1] = v21;
      v21[2] = 0x2020000000;
      v21[3] = 0;
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __105___MTLBinaryArchive_enumerateArchivesFromBackingFileFromSlice_version_verifyKey_offset_bytes_enumerator___block_invoke;
      v20[3] = &unk_1E521FD30;
      v20[4] = v21;
      v20[5] = a7;
      void v20[6] = &v16[a6];
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __105___MTLBinaryArchive_enumerateArchivesFromBackingFileFromSlice_version_verifyKey_offset_bytes_enumerator___block_invoke_2;
      v19[3] = &unk_1E521FD58;
      v19[8] = a4;
      v19[9] = a5;
      v19[10] = a6;
      v19[6] = v21;
      v19[7] = a3;
      v19[4] = fileData;
      v19[5] = a8;
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __105___MTLBinaryArchive_enumerateArchivesFromBackingFileFromSlice_version_verifyKey_offset_bytes_enumerator___block_invoke_3;
      v18[3] = &unk_1E521FD80;
      v18[7] = a3;
      v18[8] = a4;
      v18[5] = v20;
      v18[6] = v21;
      v18[4] = v19;
      char v8 = +[MTLLoader deserializeMachOContainerWithHandler:reader:]((uint64_t)MTLLoader, (uint64_t)v18, (uint64_t)v20);
      _Block_object_dispose(v21, 8);
    }
  }
  return v8;
}

- (BOOL)enumerateSpecializedFunctionArchivesFromBackingFile:(id)a3
{
  MTLLoaderSliceIdentifier v6 = +[_MTLBinaryArchive sliceIDForSpecializedFunctionsForLLVMVersion:_MTLGetMTLCompilerLLVMVersionForDevice(self->_device)];
  return [(_MTLBinaryArchive *)self enumerateArchivesFromBackingFileFromSlice:&v6 version:1 verifyKey:0 offset:self->_specializedFunctionArchiveOffset bytes:self->_specializedFunctionArchiveBytes enumerator:a3];
}

- (BOOL)enumerateArchivesFromBackingFile:(id)a3
{
  uint64_t v6 = +[MTLLoader sliceIDForDescriptors]();
  return [(_MTLBinaryArchive *)self enumerateArchivesFromBackingFileFromSlice:&v6 version:1 verifyKey:&_MTLBinaryArchiveDescriptorUUID offset:self->_recompilationArchiveOffset bytes:self->_recompilationArchiveBytes enumerator:a3];
}

- (BOOL)enumerateArchivesFromPipelineCollection:(id)a3
{
  BOOL result = 1;
  char v8 = 1;
  value = self->_pipelineCollection.__ptr_.__value_;
  if (value)
  {
    v7[0] = &v8;
    v7[1] = a3;
    uint64_t v6 = *((void *)value + 36);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = ___ZNK21MTLPipelineCollection14visitLibrariesIZ61___MTLBinaryArchive_enumerateArchivesFromPipelineCollection__E3__5EEvOT__block_invoke;
    block[3] = &__block_descriptor_48_e5_v8__0l;
    block[4] = value;
    block[5] = v7;
    dispatch_sync(v6, block);
    return v8 != 0;
  }
  return result;
}

- (id)materializeEntryForKey:(id *)a3 fileIndex:(void *)a4 containsEntry:(id)a5 addEntry:(id)a6
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  long long v9 = *(_OWORD *)&a3->var0[16];
  long long v22 = *(_OWORD *)a3->var0;
  long long v23 = v9;
  id v10 = [(_MTLBinaryArchive *)self materializeFromHash:&v22 fileIndex:a4];
  if (v10)
  {
    id v11 = v10;
    long long v12 = *(_OWORD *)&a3->var0[16];
    long long v20 = *(_OWORD *)a3->var0;
    long long v21 = v12;
    if ((void)v22 == *(void *)a3->var0
      && *((void *)&v22 + 1) == *(void *)&a3->var0[8]
      && (void)v23 == *(void *)&a3->var0[16]
      && *((void *)&v23 + 1) == *(void *)&a3->var0[24])
    {
      id v17 = v10;
    }
    else
    {
      long long v20 = v22;
      long long v21 = v23;
      char v16 = (*((uint64_t (**)(id, long long *))a5 + 2))(a5, &v20);
      id v17 = 0;
      int v18 = 0;
      if (v16) {
        goto LABEL_17;
      }
    }
    (*((void (**)(id, void *, long long *))a6 + 2))(a6, v11, &v20);

    int v18 = v17;
LABEL_17:

    return v18;
  }
  return 0;
}

- ($2772B1D07D29A72E8557B2574C0AE5C1)reflectionHashWithFunctionId:(SEL)a3 binaryPos:(const void *)a4
{
  unint64_t data = a5;
  MTLHashKey::getHash((uint64_t)a4, 0, 0);
  CC_SHA256_Init(&v9);
  Hash = (const void *)MTLHashKey::getHash((uint64_t)a4, 0, 0);
  CC_SHA256_Update(&v9, Hash, 0x20u);
  CC_SHA256_Update(&v9, &data, 8u);
  return ($2772B1D07D29A72E8557B2574C0AE5C1 *)CC_SHA256_Final(retstr->var0, &v9);
}

- (NSArray)keys
{
  if ((self->_options & 2) == 0) {
    return (NSArray *)MEMORY[0x1E4F1CBF0];
  }
  uint64_t v6 = 0;
  char v7 = &v6;
  uint64_t v8 = 0x3052000000;
  CC_SHA256_CTX v9 = __Block_byref_object_copy_;
  id v10 = __Block_byref_object_dispose_;
  uint64_t v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __25___MTLBinaryArchive_keys__block_invoke;
  v5[3] = &unk_1E521FDA8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  uint64_t v2 = (NSArray *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v2;
}

+ (id)descriptorDataForArchive:(id)a3
{
  long long v20 = 0;
  id v4 = objc_opt_new();
  id v5 = (MTLLoadedFile *)-[MTLLoader loadFileWithURL:error:errorDomain:invalidFileErrorCode:]((uint64_t)v4, (NSURL *)a3, &v20, &cfstr_Mtlbinaryarchi.isa, 1);
  if (v4) {
    BOOL v6 = v5 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  if (v6)
  {
  }
  else
  {
    char v7 = v5;
    uint64_t v8 = [[MTLLoadedFileContentsWrapper alloc] initWithData:[(MTLLoadedFile *)v5 contents]];
    uint64_t v19 = 0;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v16 = 0u;
    memset(v15, 0, sizeof(v15));
    CC_SHA256_CTX v9 = 0;
    if (+[_MTLBinaryArchive deserializeBinaryArchiveHeader:v15 fileData:v8 device:0])
    {
      if (+[_MTLBinaryArchive deserializeBinaryArchiveDescriptorMachO:v15 fileData:v8])
      {
        BOOL v10 = (void)v16 == 0;
      }
      else
      {
        BOOL v10 = 1;
      }
      if (v10 || *((void *)&v16 + 1) == 0)
      {
        CC_SHA256_CTX v9 = 0;
      }
      else
      {
        long long v12 = [(MTLLoadedFileContentsWrapper *)v8 sourceContents];
        CC_SHA256_CTX v9 = [(NSData *)v12 subdataWithRange:v16];
      }
    }

    -[MTLLoader releaseLoadedFile:]((uint64_t)v4, v7);
    if (v9)
    {
      uint64_t v13 = [(NSData *)v9 length];
      *(void *)&v15[0] = 0;
      *((void *)&v15[0] + 1) = v13;
      return _MTLNSDataToDispatchData(v9, v15);
    }
  }
  return 0;
}

- (MTLDevice)device
{
  return self->_device;
}

- (unint64_t)options
{
  return self->_options;
}

- (void)addBinaryEntryImpl:(id)a3 forKey:(id)a4
{
  ++self->_newBinary;
  if (![(_MTLBinaryArchive *)self recompilationTarget])
  {
    [a3 setIndex:-1];
    [(NSMutableDictionary *)self->_entries setObject:a3 forKey:a4];
    unsigned __int8 v7 = atomic_load((unsigned __int8 *)&self->_serializing);
    if ((v7 & 1) != 0 && !self->_isLegacy)
    {
      asynEntries = self->_asynEntries;
      [(NSMutableDictionary *)asynEntries setObject:a3 forKey:a4];
    }
  }
}

- (void)addArchiveEntryInternal:(id)a3 forKey:(id *)a4
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __78___MTLBinaryArchive_MTLBinaryArchiveInternal__addArchiveEntryInternal_forKey___block_invoke;
  block[3] = &unk_1E521FDD0;
  block[5] = a3;
  void block[6] = a4;
  block[4] = self;
  dispatch_sync(queue, block);
}

- (id)newArchiveDataForKeyInternal:(id *)a3
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3052000000;
  BOOL v10 = __Block_byref_object_copy_;
  uint64_t v11 = __Block_byref_object_dispose_;
  uint64_t v12 = 0;
  if (self->_isLegacy && (self->_options & 4) != 0)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __76___MTLBinaryArchive_MTLBinaryArchiveInternal__newArchiveDataForKeyInternal___block_invoke;
    block[3] = &unk_1E521FB10;
    block[4] = self;
    block[5] = &v7;
    void block[6] = a3;
    dispatch_sync(queue, block);
    uint64_t v3 = (void *)v8[5];
  }
  else
  {
    uint64_t v3 = 0;
  }
  _Block_object_dispose(&v7, 8);
  return v3;
}

- (void)addBinaryEntryInternal:(id)a3 forKey:(id)a4
{
  if (!self->_isLegacy || (self->_options & 2) != 0)
  {
    id v7 = a3;
    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __77___MTLBinaryArchive_MTLBinaryArchiveInternal__addBinaryEntryInternal_forKey___block_invoke;
    block[3] = &unk_1E521FE48;
    block[4] = self;
    block[5] = a3;
    void block[6] = a4;
    dispatch_async(queue, block);
  }
}

- (id)getArchiveIDWithErrorInternal:(id *)a3
{
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x3052000000;
  uint64_t v13 = __Block_byref_object_copy_;
  int v14 = __Block_byref_object_dispose_;
  uint64_t v15 = 0;
  queue = self->_queue;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __77___MTLBinaryArchive_MTLBinaryArchiveInternal__getArchiveIDWithErrorInternal___block_invoke;
  v9[3] = &unk_1E521FDA8;
  v9[4] = self;
  v9[5] = &v10;
  dispatch_sync(queue, v9);
  id v6 = (id)v11[5];
  if (a3) {
    *a3 = (id)v11[5];
  }
  if (self->_archiveIDInt) {
    id v7 = objc_msgSend(NSString, "stringWithUTF8String:");
  }
  else {
    id v7 = 0;
  }
  _Block_object_dispose(&v10, 8);
  return v7;
}

- (BOOL)recompilationTarget
{
  return (LOBYTE(self->_options) >> 6) & 1;
}

- (void)setRecompilationTarget:(BOOL)a3
{
  uint64_t v3 = 64;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_unint64_t options = self->_options & 0xFFFFFFFFFFFFFFBFLL | v3;
}

- (void)findProgramObjectForFunction:(id *)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v3 = *(_OWORD *)&a3->var0[16];
  long long v12 = *(_OWORD *)a3->var0;
  long long v13 = v3;
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  queue = self->_queue;
  uint64_t v10 = 0;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __76___MTLBinaryArchive_MTLBinaryArchiveInternal__findProgramObjectForFunction___block_invoke;
  block[3] = &unk_1E521FEC0;
  block[4] = self;
  block[5] = &v7;
  dispatch_sync(queue, block);
  id v5 = (void *)v8[3];
  _Block_object_dispose(&v7, 8);
  return v5;
}

- (void)programObjectForFunction:(id *)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v3 = *(_OWORD *)&a3->var0[16];
  long long v12 = *(_OWORD *)a3->var0;
  long long v13 = v3;
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  queue = self->_queue;
  uint64_t v10 = 0;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __72___MTLBinaryArchive_MTLBinaryArchiveInternal__programObjectForFunction___block_invoke;
  block[3] = &unk_1E521FEC0;
  block[4] = self;
  block[5] = &v7;
  dispatch_sync(queue, block);
  id v5 = (void *)v8[3];
  _Block_object_dispose(&v7, 8);
  return v5;
}

- (id)getFunctionNameFromAirDescriptor:(const stitchedAirDescriptor *)a3
{
  buffer_ptr = 0;
  size_t size_ptr = 0;
  long long v3 = dispatch_data_create_map((dispatch_data_t)a3->var0, (const void **)&buffer_ptr, &size_ptr);
  id v4 = 0;
  id v5 = (int *)((char *)buffer_ptr + *(unsigned int *)buffer_ptr);
  id v6 = (unsigned __int16 *)((char *)v5 - *v5);
  if (*v6 >= 9u)
  {
    id v4 = (int *)v6[4];
    if (v6[4]) {
      id v4 = (int *)((char *)v4 + (void)v5 + *(unsigned int *)((char *)v4 + (void)v5));
    }
  }
  uint64_t v7 = (unsigned __int16 *)((char *)v4 - *v4);
  if (*v7 >= 7u && (uint64_t v8 = v7[3]) != 0) {
    uint64_t v9 = (int *)((char *)v4 + v8 + *(unsigned int *)((char *)v4 + v8));
  }
  else {
    uint64_t v9 = 0;
  }
  uint64_t v10 = (unsigned int *)((char *)v9 + *(unsigned __int16 *)((char *)v9 - *v9 + 4));
  std::string::basic_string[abi:ne180100](__p, (char *)v10 + *v10 + 4, *(unsigned int *)((char *)v10 + *v10));
  id v11 = [NSString alloc];
  if (v16 >= 0) {
    long long v12 = __p;
  }
  else {
    long long v12 = (void **)__p[0];
  }
  long long v13 = (void *)[v11 initWithUTF8String:v12];
  dispatch_release(v3);
  if (v16 < 0) {
    operator delete(__p[0]);
  }
  return v13;
}

- (id)localStitchedFunctionLookupWithDescriptor:(const stitchedAirDescriptor *)a3
{
  id result = std::__hash_table<HashKey,KeyHashFunction,std::equal_to<HashKey>,std::allocator<HashKey>>::find<HashKey>(&self->_stitchedFunctionByHash.__table_.__bucket_list_.__ptr_.__value_, (unint64_t *)a3->var1.var0);
  if (result)
  {
    id v6 = (id *)result;
    id v7 = [(_MTLBinaryArchive *)self getFunctionNameFromAirDescriptor:a3];
    device = (_MTLDevice *)self->_device;
    uint64_t libraryBuilder = (uint64_t)device->_libraryBuilder;
    uint64_t v10 = [v6[6] data];
    uint64_t v15 = MTLLibraryBuilder::newLibraryWithData(libraryBuilder, device, v10, 0, v11, v12, v13, v14);
    id v16 = [(_MTLLibrary *)v15 newFunctionWithName:v7];

    return v16;
  }
  return result;
}

- (void)addStitchingInputsFunction:(id)a3 toEntry:(id)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    uint64_t v32 = 0;
    id v33 = 0;
    unint64_t v34 = 0;
    std::vector<MTLSerializer::ObjectRef>::reserve((void **)&v32, [a3 count]);
    id v27 = a4;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    uint64_t v7 = [a3 countByEnumeratingWithState:&v28 objects:v36 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v29 != v8) {
            objc_enumerationMutation(a3);
          }
          uint64_t v10 = *(void **)(*((void *)&v28 + 1) + 8 * i);
          if (!std::__hash_table<std::__hash_value_type<MTLUINT256_t,NSObject  {objcproto16OS_dispatch_data}*>,std::__unordered_map_hasher<MTLUINT256_t,std::__hash_value_type<MTLUINT256_t,NSObject  {objcproto16OS_dispatch_data}*>,UnorderedContainerHash,UnorderedContainerHash,true>,std::__unordered_map_equal<MTLUINT256_t,std::__hash_value_type<MTLUINT256_t,NSObject  {objcproto16OS_dispatch_data}*>,UnorderedContainerHash,UnorderedContainerHash,true>,std::allocator<std::__hash_value_type<MTLUINT256_t,NSObject  {objcproto16OS_dispatch_data}*>>>::find<MTLUINT256_t>((void *)self->_uniqueBitcodeList.__ptr_, (unint64_t *)[v10 bitCodeHash]))
          {
            uint64_t v11 = [v10 bitcodeDataInternal];
            ptr = self->_uniqueBitcodeList.__ptr_;
            uint64_t v35 = (unint64_t *)[v10 bitCodeHash];
            std::__hash_table<std::__hash_value_type<MTLUINT256_t,NSObject  {objcproto16OS_dispatch_data}*>,std::__unordered_map_hasher<MTLUINT256_t,std::__hash_value_type<MTLUINT256_t,NSObject  {objcproto16OS_dispatch_data}*>,UnorderedContainerHash,UnorderedContainerHash,true>,std::__unordered_map_equal<MTLUINT256_t,std::__hash_value_type<MTLUINT256_t,NSObject  {objcproto16OS_dispatch_data}*>,UnorderedContainerHash,UnorderedContainerHash,true>,std::allocator<std::__hash_value_type<MTLUINT256_t,NSObject  {objcproto16OS_dispatch_data}*>>>::__emplace_unique_key_args<MTLUINT256_t,std::piecewise_construct_t const&,std::tuple<MTLUINT256_t const&>,std::tuple<>>((uint64_t)ptr, v35, (uint64_t)&std::piecewise_construct, (_OWORD **)&v35)[6] = v11;
          }
          uint64_t v13 = objc_msgSend(objc_alloc(MEMORY[0x1E4F29238]), "initWithBytes:objCType:", objc_msgSend(v10, "bitCodeHash"), "{?=[32C]}");
          uint64_t v14 = v13;
          uint64_t v15 = v33;
          if (v33 >= v34)
          {
            uint64_t v17 = (v33 - v32) >> 3;
            if ((unint64_t)(v17 + 1) >> 61) {
              std::vector<std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>>::__throw_length_error[abi:ne180100]();
            }
            unint64_t v18 = (v34 - v32) >> 2;
            if (v18 <= v17 + 1) {
              unint64_t v18 = v17 + 1;
            }
            if ((unint64_t)(v34 - v32) >= 0x7FFFFFFFFFFFFFF8) {
              unint64_t v19 = 0x1FFFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v19 = v18;
            }
            if (v19) {
              long long v20 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<objc_object  {objcproto18MTLIOScratchBuffer}*>>((uint64_t)&v34, v19);
            }
            else {
              long long v20 = 0;
            }
            long long v21 = (uint64_t *)&v20[8 * v17];
            uint64_t *v21 = v14;
            id v16 = (char *)(v21 + 1);
            long long v23 = v32;
            long long v22 = v33;
            if (v33 != v32)
            {
              do
              {
                uint64_t v24 = *((void *)v22 - 1);
                v22 -= 8;
                *--long long v21 = v24;
              }
              while (v22 != v23);
              long long v22 = v32;
            }
            uint64_t v32 = (char *)v21;
            id v33 = v16;
            unint64_t v34 = &v20[8 * v19];
            if (v22) {
              operator delete(v22);
            }
          }
          else
          {
            *(void *)id v33 = v13;
            id v16 = v15 + 8;
          }
          id v33 = v16;
        }
        uint64_t v7 = [a3 countByEnumeratingWithState:&v28 objects:v36 count:16];
      }
      while (v7);
    }
    objc_msgSend(v27, "setLinkedBitcodes:", objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:count:"));

    unint64_t v25 = (id *)v32;
    uint64_t v26 = (id *)v33;
    if (v32 != v33)
    {
      do

      while (v25 != v26);
      unint64_t v25 = (id *)v32;
    }
    if (v25)
    {
      id v33 = (char *)v25;
      operator delete(v25);
    }
  }
}

- (void)addStitchedLibraryWithKey:(id *)a3 descriptors:(const void *)a4 inputFunctions:(id)a5 library:(id)a6
{
  uint64_t v10 = [a6 libraryData];
  if (self->_isLegacy && (self->_options & 4) != 0)
  {
    uint64_t v12 = [[MTLAirEntry alloc] initWithData:(*(uint64_t (**)(uint64_t))(*(void *)v10 + 128))(v10)];
    [(_MTLBinaryArchive *)self addArchiveEntryInternal:v12 forKey:a3];
  }
  else
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __108___MTLBinaryArchive_MTLBinaryArchiveInternal__addStitchedLibraryWithKey_descriptors_inputFunctions_library___block_invoke;
    block[3] = &unk_1E521FF10;
    void block[6] = a4;
    void block[7] = v10;
    block[4] = self;
    block[5] = a5;
    dispatch_sync(queue, block);
  }
}

- (id)newArchiverIdWithBinaryKey:(id)a3 entry:(id)a4 srcArchiverId:(id)a5 functionType:(unint64_t)a6
{
  uint64_t v25 = 0;
  uint64_t v26 = &v25;
  uint64_t v27 = 0x3052000000;
  long long v28 = __Block_byref_object_copy_;
  long long v29 = __Block_byref_object_dispose_;
  uint64_t v30 = 0;
  uint64_t v11 = [a3 getFunctionId];
  size_t size_ptr = 0;
  buffer_ptr = 0;
  dispatch_data_t v12 = dispatch_data_create_map((dispatch_data_t)[a4 airScript], (const void **)&buffer_ptr, &size_ptr);
  uint64_t v13 = (unsigned int *)buffer_ptr;
  int v14 = strncmp((const char *)buffer_ptr + 4, "AIRP", 4uLL);
  if (v14) {
    uint64_t v15 = 0;
  }
  else {
    uint64_t v15 = (char *)v13 + *v13;
  }
  BOOL v16 = v14 == 0;
  queue = self->_queue;
  v21[0] = MEMORY[0x1E4F143A8];
  char v18 = v16;
  v21[1] = 3221225472;
  v21[2] = __107___MTLBinaryArchive_MTLBinaryArchiveInternal__newArchiverIdWithBinaryKey_entry_srcArchiverId_functionType___block_invoke;
  v21[3] = &unk_1E521FF38;
  void v21[4] = a5;
  v21[5] = self;
  v21[6] = a4;
  v21[7] = a3;
  v21[10] = v15;
  v21[11] = v11;
  char v22 = v18;
  v21[8] = v12;
  v21[9] = &v25;
  v21[12] = a6;
  dispatch_sync(queue, v21);
  unint64_t v19 = (void *)v26[5];
  _Block_object_dispose(&v25, 8);
  return v19;
}

- (void)updatePipelineWithPipelineArchiverId:(id)a3 key:(id)a4 functionType:(unint64_t)a5
{
  queue = self->_queue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __101___MTLBinaryArchive_MTLBinaryArchiveInternal__updatePipelineWithPipelineArchiverId_key_functionType___block_invoke;
  v6[3] = &unk_1E521FF60;
  v6[4] = a3;
  v6[5] = a4;
  v6[6] = self;
  v6[7] = a5;
  dispatch_sync(queue, v6);
}

+ (BOOL)deserializeBinaryArchiveDescriptorMachO:(id *)a3 fileData:(id)a4
{
  a3->var7 = 0;
  a3->var8 = 0;
  if (!a3->var4) {
    return 0;
  }
  uint64_t v6 = +[MTLLoader sliceIDForDescriptors]();
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __96___MTLBinaryArchive_MTLBinaryArchiveInternal__deserializeBinaryArchiveDescriptorMachO_fileData___block_invoke;
  v9[3] = &unk_1E5220028;
  v9[5] = a3;
  void v9[6] = v6;
  v9[4] = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __96___MTLBinaryArchive_MTLBinaryArchiveInternal__deserializeBinaryArchiveDescriptorMachO_fileData___block_invoke_4;
  v8[3] = &unk_1E521FAC0;
  v8[4] = a4;
  void v8[5] = a3;
  return +[MTLLoader deserializeMachOContainerWithHandler:reader:]((uint64_t)MTLLoader, (uint64_t)v9, (uint64_t)v8);
}

- (BOOL)requiresLegacyReflection
{
  return self->_isLegacy;
}

- (BOOL)remoteInsertionBegin
{
  dispatch_suspend((dispatch_object_t)self->_serializeQueue);
  unsigned __int8 v3 = atomic_load((unsigned __int8 *)&self->_serializing);
  return (v3 & 1) == 0;
}

- (void)remoteInsertionEnd
{
}

- (void)initWithOptions:(void *)a1 device:url:error:.cold.1(void *a1)
{
  objc_msgSend((id)objc_msgSend(a1, "absoluteString"), "UTF8String");
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1(&dword_1826F6000, MEMORY[0x1E4F14500], v1, "MTLBinaryArchive - load from URL: '%s'", v2, v3, v4, v5, v6);
}

- (void)loadFromURL:(void *)a1 error:.cold.1(void *a1)
{
  objc_msgSend((id)objc_msgSend(a1, "absoluteString"), "UTF8String");
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1(&dword_1826F6000, MEMORY[0x1E4F14500], v1, "unable to find a compatible slice for binary archive '%s'", v2, v3, v4, v5, v6);
}

- (void)mapFileToMemoryWithPath:fileSize:.cold.2()
{
  __error();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_3_0(&dword_1826F6000, MEMORY[0x1E4F14500], v0, "Mapping of file %s failed with errno %d", v1, v2, v3, v4, v5);
}

- (void)mapFileToMemoryWithPath:fileSize:.cold.3()
{
  __error();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_3_0(&dword_1826F6000, MEMORY[0x1E4F14500], v0, "fstat failed for file %s with errno %d", v1, v2, v3, v4, v5);
}

- (void)flatBufferFromJSON:schema:schemaSize:.cold.1()
{
  *(_WORD *)uint64_t v0 = 0;
  _os_log_error_impl(&dword_1826F6000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "unable to map air script", v0, 2u);
}

- (void)flatBufferFromJSON:schema:schemaSize:.cold.2()
{
  OUTLINED_FUNCTION_2_0(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_1(&dword_1826F6000, MEMORY[0x1E4F14500], v0, "cannot decode flatbuffert with error %s", v1, v2, v3, v4, 2u);
}

- (void)flatBufferFromJSON:schema:schemaSize:.cold.3()
{
  OUTLINED_FUNCTION_2_0(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_1(&dword_1826F6000, MEMORY[0x1E4F14500], v0, "cannot load schema with error %s", v1, v2, v3, v4, 2u);
}

- (void)materializeBitCode:(void *)a1 atIndex:.cold.1(void *a1)
{
  objc_msgSend((id)objc_msgSend(a1, "localizedDescription"), "UTF8String");
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1(&dword_1826F6000, MEMORY[0x1E4F14500], v1, "Error loading machO library: %s", v2, v3, v4, v5, v6);
}

@end