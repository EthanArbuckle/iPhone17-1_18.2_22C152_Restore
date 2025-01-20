@interface MPSGraphExecutableConstantDataRequest
+ (BOOL)supportsSecureCoding;
- (MPSGraphExecutableConstantDataRequest)initWithCoder:(id)a3;
- (NSDictionary)resourceOffsets;
- (NSURL)mpsgraphPackageURL;
- (id)initForMPSGraphPackageAtURL:(id)a3 device:(id)a4 multipleInputTypes:(id)a5 compilationDescriptor:(id)a6 includeConstantDataForNewSpecializations:(BOOL)a7;
- (void)encodeWithCoder:(id)a3;
- (void)setMpsgraphPackageURL:(id)a3;
- (void)setResourceOffsets:(id)a3;
@end

@implementation MPSGraphExecutableConstantDataRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MPSGraphExecutableConstantDataRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  if (([v4 allowsKeyedCoding] & 1) == 0) {
    __assert_rtn("-[MPSGraphExecutableConstantDataRequest initWithCoder:]", "MPSGraphExecutable.mm", 4111, "[coder allowsKeyedCoding]");
  }
  v13.receiver = self;
  v13.super_class = (Class)MPSGraphExecutableConstantDataRequest;
  v5 = [(MPSGraphExecutableConstantDataRequest *)&v13 init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"mpsgraphPackageURL"];
    [(MPSGraphExecutableConstantDataRequest *)v5 setMpsgraphPackageURL:v6];

    v7 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    v10 = objc_msgSend(v7, "setWithObjects:", v8, v9, objc_opt_class(), 0);
    v11 = [v4 decodeObjectOfClasses:v10 forKey:@"resourceOffsets"];
    [(MPSGraphExecutableConstantDataRequest *)v5 setResourceOffsets:v11];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  if (([v6 allowsKeyedCoding] & 1) == 0) {
    __assert_rtn("-[MPSGraphExecutableConstantDataRequest encodeWithCoder:]", "MPSGraphExecutable.mm", 4121, "[coder allowsKeyedCoding]");
  }
  id v4 = [(MPSGraphExecutableConstantDataRequest *)self mpsgraphPackageURL];
  [v6 encodeObject:v4 forKey:@"mpsgraphPackageURL"];

  v5 = [(MPSGraphExecutableConstantDataRequest *)self resourceOffsets];
  [v6 encodeObject:v5 forKey:@"resourceOffsets"];
}

- (id)initForMPSGraphPackageAtURL:(id)a3 device:(id)a4 multipleInputTypes:(id)a5 compilationDescriptor:(id)a6 includeConstantDataForNewSpecializations:(BOOL)a7
{
  BOOL v7 = a7;
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  id v41 = a3;
  v42 = (MPSGraphDevice *)a4;
  id v43 = a5;
  id v13 = a6;
  v60.receiver = self;
  v60.super_class = (Class)MPSGraphExecutableConstantDataRequest;
  v14 = [(MPSGraphExecutableConstantDataRequest *)&v60 init];
  v45 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_mpsgraphPackageURL, a3);
    v40 = [[MPSGraphPackage alloc] initWithSourcePackageURL:v41];
    v44 = [(MPSGraphPackage *)v40 getMLIRLibrary];
    if ([v44 getResourceStorageMode] != 1 && MTLReportFailureTypeEnabled()) {
      MTLReportFailure();
    }
    v50 = [v44 getCallablesDescription];
    uint64_t DeviceKey = getDeviceKey(v42);
    id v51 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    if (v7)
    {
      v15 = [v44 getOriginalResourcesUsed];
      [v51 addObjectsFromArray:v15];
    }
    v49 = [v44 getOptimizedResourcesUsedLibrary];
    long long v58 = 0u;
    long long v59 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    obuint64_t j = v43;
    uint64_t v16 = [obj countByEnumeratingWithState:&v56 objects:v74 count:16];
    if (v16)
    {
      uint64_t v47 = *(void *)v57;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v57 != v47) {
            objc_enumerationMutation(obj);
          }
          id v18 = *(id *)(*((void *)&v56 + 1) + 8 * i);
          __dst = 0;
          uint64_t p_dst = (uint64_t)&__dst;
          v65[0] = 0x3032000000;
          v65[1] = __Block_byref_object_copy__415;
          v65[2] = __Block_byref_object_dispose__416;
          objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v18, "count"));
          id v66 = (id)objc_claimAutoreleasedReturnValue();
          v61[0] = MEMORY[0x1E4F143A8];
          v61[1] = 3221225472;
          v61[2] = ___Z18getShapesFromTypesP7NSArrayIP12MPSGraphTypeE_block_invoke;
          v61[3] = &unk_1E4FC1850;
          v61[4] = &__dst;
          [v18 enumerateObjectsUsingBlock:v61];
          id v19 = *(id *)(p_dst + 40);
          _Block_object_dispose(&__dst, 8);

          getFlatShapes(&__src, v19);
          v20 = [v13 entryFunctionName];
          id v21 = v13;
          id v22 = v13;
          id v23 = v50;
          id v24 = v20;
          __dst = v65;
          uint64_t p_dst = 0x600000000;
          unint64_t v25 = v72;
          if (v72)
          {
            uint64_t v26 = v72;
            if (v72 < 7uLL
              || (llvm::SmallVectorBase<unsigned int>::grow_pod((uint64_t)&__dst, v65, v72, 8), (uint64_t v26 = v72) != 0))
            {
              memcpy(__dst, __src, 8 * v26);
            }
            if (HIDWORD(p_dst) < v25) {
              __assert_rtn("set_size", "SmallVector.h", 102, "N <= capacity()");
            }
            LODWORD(p_dst) = v25;
          }
          id v67 = v22;
          id v68 = v23;
          id v69 = v24;
          uint64_t v70 = DeviceKey;

          id v13 = v21;
          v27 = MPSGraphModuleKeyToJSONString((const MPSGraphModuleKey *)&__dst);
          v28 = [v49 objectForKeyedSubscript:v27];
          [v51 addObjectsFromArray:v28];

          if (__dst != v65) {
            free(__dst);
          }
          if (__src != &v73) {
            free(__src);
          }
        }
        uint64_t v16 = [obj countByEnumeratingWithState:&v56 objects:v74 count:16];
      }
      while (v16);
    }

    v29 = [v44 getResourceOffsetsLibrary];
    objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v51, "count"));
    v30 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    long long v54 = 0u;
    long long v55 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    id v31 = v51;
    uint64_t v32 = [v31 countByEnumeratingWithState:&v52 objects:v62 count:16];
    if (v32)
    {
      uint64_t v33 = *(void *)v53;
      do
      {
        for (uint64_t j = 0; j != v32; ++j)
        {
          if (*(void *)v53 != v33) {
            objc_enumerationMutation(v31);
          }
          uint64_t v35 = *(void *)(*((void *)&v52 + 1) + 8 * j);
          v36 = [v29 objectForKeyedSubscript:v35];
          if (v36) {
            [(NSDictionary *)v30 setObject:v36 forKeyedSubscript:v35];
          }
        }
        uint64_t v32 = [v31 countByEnumeratingWithState:&v52 objects:v62 count:16];
      }
      while (v32);
    }

    resourceOffsets = v45->_resourceOffsets;
    v45->_resourceOffsets = v30;

    v38 = v45;
  }

  return v45;
}

- (NSURL)mpsgraphPackageURL
{
  return (NSURL *)objc_getProperty(self, a2, 8, 1);
}

- (void)setMpsgraphPackageURL:(id)a3
{
}

- (NSDictionary)resourceOffsets
{
  return (NSDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void)setResourceOffsets:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resourceOffsets, 0);

  objc_storeStrong((id *)&self->_mpsgraphPackageURL, 0);
}

@end