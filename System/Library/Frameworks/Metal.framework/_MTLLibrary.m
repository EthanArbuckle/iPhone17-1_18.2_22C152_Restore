@interface _MTLLibrary
- (BOOL)getFunctionAliasAndNameForHash:(id *)a3 functionName:(id *)a4 alias:(id *)a5;
- (BOOL)isStub;
- (BOOL)serializeToURL:(id)a3 error:(id *)a4;
- (BOOL)shaderValidationEnabled;
- (MTLDevice)device;
- (MTLLibraryContainer)cacheEntry;
- (NSArray)externFunctionNames;
- (NSArray)functionHashes;
- (NSArray)functionNames;
- (NSArray)specializedFunctionHashes;
- (NSArray)stitchingFunctionHashes;
- (NSArray)variableList;
- (NSData)bitcodeData;
- (NSMutableDictionary)functionDictionary;
- (NSString)description;
- (NSString)installName;
- (NSString)overrideTriple;
- (NSUUID)libraryIdentifier;
- (_MTLLibrary)initWithLibraryContainer:(MTLLibraryContainer *)a3 device:(id)a4;
- (id)bitCodeWithHash:(id *)a3;
- (id)formattedDescription:(unint64_t)a3;
- (id)libraryDataContents;
- (id)newExternFunctionWithName:(id)a3;
- (id)newFunctionWithDescriptor:(id)a3 destinationArchive:(id)a4 error:(id *)a5;
- (id)newFunctionWithDescriptor:(id)a3 error:(id *)a4;
- (id)newFunctionWithHash:(id *)a3;
- (id)newFunctionWithName:(id)a3;
- (id)newFunctionWithName:(id)a3 constantValues:(id)a4 error:(id *)a5;
- (id)newFunctionWithName:(id)a3 constantValues:(id)a4 functionCache:(id)a5 error:(id *)a6;
- (id)newFunctionWithName:(id)a3 constantValues:(id)a4 functionCache:(id)a5 specializedName:(id)a6 error:(id *)a7;
- (id)newFunctionWithName:(id)a3 constantValues:(id)a4 pipelineLibrary:(id)a5 error:(id *)a6;
- (id)newFunctionWithNameInternal:(id)a3;
- (id)newMetalScript;
- (id)newSpecializedFunctionWithDescriptorInternal:(id)a3 destinationArchive:(id)a4 functionCache:(id)a5 error:(id *)a6;
- (id)newSpecializedFunctionWithHash:(id *)a3;
- (id)newSpecializedFunctionWithHash:(id *)a3 libraryPath:(id)a4;
- (id)newStitchedFunctionWithHash:(id *)a3;
- (int64_t)type;
- (void)dealloc;
- (void)libraryData;
- (void)newFunctionWithDescriptor:(id)a3 completionHandler:(id)a4;
- (void)newFunctionWithDescriptor:(id)a3 destinationArchive:(id)a4 functionCache:(id)a5 completionHandler:(id)a6;
- (void)newFunctionWithName:(id)a3 constantValues:(id)a4 completionHandler:(id)a5;
- (void)newFunctionWithName:(id)a3 constantValues:(id)a4 functionCache:(id)a5 specializedName:(id)a6 completionHandler:(id)a7;
- (void)newFunctionWithName:(id)a3 constantValues:(id)a4 pipelineLibrary:(id)a5 completionHandler:(id)a6;
- (void)setOverrideTriple:(id)a3;
- (void)setShaderValidationEnabled:(BOOL)a3;
@end

@implementation _MTLLibrary

- (id)newFunctionWithName:(id)a3 constantValues:(id)a4 functionCache:(id)a5 specializedName:(id)a6 error:(id *)a7
{
  id v13 = -[_MTLLibrary newFunctionWithName:](self, "newFunctionWithName:");
  if (v13)
  {
    v14 = v13;
    int v15 = [v13 needsFunctionConstantValues];
    if (a6 || v15)
    {
      v20 = objc_opt_new();
      [v20 setName:a3];
      if (a6) {
        [v20 setSpecializedName:a6];
      }
      if (a4) {
        [v20 setConstantValues:a4];
      }
      v17 = (void *)[v14 newSpecializedFunctionWithDescriptor:v20 destinationArchive:0 functionCache:a5 error:a7];
      var0 = self->_cacheEntry->var0;
      if (var0) {
        BOOL v22 = v17 == 0;
      }
      else {
        BOOL v22 = 1;
      }
      if (!v22) {
        MTLPipelineCollection::addSpecializedFunction((uint64_t)var0, (uint64_t)v14, (uint64_t)v17, (uint64_t)self, (uint64_t)v20);
      }
    }
    else
    {
      v16 = self->_cacheEntry->var0;
      if (v16) {
        MTLPipelineCollection::addFunction((uint64_t)v16, (uint64_t)v14, (uint64_t)self->_libraryData, 0);
      }
      return v14;
    }
  }
  else
  {
    uint64_t v18 = [NSString stringWithFormat:@"Function %@ was not found in the library", a3];
    if (a7)
    {
      uint64_t v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObject:v18 forKey:*MEMORY[0x1E4F28568]];
      v17 = 0;
      *a7 = (id)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"MTLLibraryErrorDomain" code:5 userInfo:v19];
    }
    else
    {
      return 0;
    }
  }
  return v17;
}

- (id)newFunctionWithName:(id)a3 constantValues:(id)a4 functionCache:(id)a5 error:(id *)a6
{
  return [(_MTLLibrary *)self newFunctionWithName:a3 constantValues:a4 functionCache:a5 specializedName:0 error:a6];
}

- (void)dealloc
{
  self->_functionDictionary = 0;
  libraryData = self->_libraryData;
  if (libraryData)
  {
    (*(void (**)(void *))(*(void *)libraryData + 24))(libraryData);
    self->_libraryData = 0;
  }
  if (self->_cacheEntry) {
    -[MTLDevice releaseCacheEntry:](self->_device, "releaseCacheEntry:");
  }

  self->_device = 0;
  v4.receiver = self;
  v4.super_class = (Class)_MTLLibrary;
  [(_MTLObjectWithLabel *)&v4 dealloc];
}

- (_MTLLibrary)initWithLibraryContainer:(MTLLibraryContainer *)a3 device:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)_MTLLibrary;
  v6 = [(_MTLObjectWithLabel *)&v9 init];
  var3 = a3->var3;
  (*(void (**)(MTLLibraryData *))(*(void *)var3 + 16))(var3);
  v6->_device = (MTLDevice *)a4;
  v6->_cacheEntry = a3;
  MTLAtomicIncrement(&a3->var1);
  v6->_libraryData = var3;
  v6->_functionDictionary = (NSMutableDictionary *)a3->var4;
  return v6;
}

- (NSArray)functionNames
{
  cacheEntry = self->_cacheEntry;
  result = (NSArray *)cacheEntry->var5;
  if (!result) {
    return (NSArray *)(*(uint64_t (**)(void))(*(void *)cacheEntry->var3 + 40))();
  }
  return result;
}

- (id)newFunctionWithDescriptor:(id)a3 destinationArchive:(id)a4 error:(id *)a5
{
  uint64_t v18 = 0;
  id v9 = [(_MTLLibrary *)self newSpecializedFunctionWithDescriptorInternal:a3 destinationArchive:a4 functionCache:0 error:&v18];
  if (v9)
  {
    v10 = v9;
    if (a4) {
      unint64_t v11 = ((unint64_t)[a4 options] >> 1) & 1;
    }
    else {
      LODWORD(v11) = 0;
    }
    if ((objc_msgSend(v10, "functionType", 0) == 5 || objc_msgSend(v10, "functionType") == 6)
      && -[MTLDevice supportsFunctionPointers](-[_MTLLibrary device](self, "device"), "supportsFunctionPointers")&& ([a3 options] & 1) != 0)
    {
      v12 = [(_MTLLibrary *)self device];
      if (v11) {
        [(MTLDevice *)v12 compileVisibleFunction:v10 withDescriptor:a3 destinationBinaryArchive:a4 error:&v17];
      }
      else {
        [(MTLDevice *)v12 compileVisibleFunction:v10 withDescriptor:a3 error:&v17];
      }
    }
    if (([a3 options] & 1) != 0 && v17)
    {
      if (a5) {
        *a5 = v17;
      }

      return 0;
    }
    else
    {
      uint64_t v13 = [v10 precompiledOutput];
      uint64_t v14 = [a3 options];
      uint64_t v15 = v14;
      if (v13) {
        uint64_t v15 = v14 | 1;
      }
      [v10 setOptions:v15];
    }
  }
  else
  {
    v10 = 0;
    if (a5) {
      *a5 = v18;
    }
  }
  return v10;
}

- (id)newSpecializedFunctionWithDescriptorInternal:(id)a3 destinationArchive:(id)a4 functionCache:(id)a5 error:(id *)a6
{
  id v11 = -[_MTLLibrary newFunctionWithName:](self, "newFunctionWithName:", [a3 name]);
  if (v11)
  {
    v12 = v11;
    uint64_t v13 = (void *)[v11 newSpecializedFunctionWithDescriptor:a3 destinationArchive:a4 functionCache:a5 error:a6];
    if (self->_cacheEntry->var0)
    {
      char v14 = [a3 options];
      if (v13 == v12)
      {
        if ((v14 & 0x10) == 0) {
          MTLPipelineCollection::addFunction((uint64_t)self->_cacheEntry->var0, (uint64_t)v12, (uint64_t)self->_libraryData, [a3 options]);
        }
      }
      else if (v13 && (v14 & 0x10) == 0)
      {
        MTLPipelineCollection::addSpecializedFunction((uint64_t)self->_cacheEntry->var0, (uint64_t)v12, (uint64_t)v13, (uint64_t)self, (uint64_t)a3);
      }
    }
  }
  else
  {
    uint64_t v15 = [NSString stringWithFormat:@"Function %@ was not found in the library", objc_msgSend(a3, "name")];
    if (a6)
    {
      uint64_t v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObject:v15 forKey:*MEMORY[0x1E4F28568]];
      id v17 = (id)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"MTLLibraryErrorDomain" code:5 userInfo:v16];
      uint64_t v13 = 0;
      *a6 = v17;
    }
    else
    {
      return 0;
    }
  }
  return v13;
}

- (void)newFunctionWithDescriptor:(id)a3 destinationArchive:(id)a4 functionCache:(id)a5 completionHandler:(id)a6
{
  id v10 = -[_MTLLibrary newFunctionWithName:](self, "newFunctionWithName:", [a3 name]);
  if (v10)
  {
    id v11 = v10;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __92___MTLLibrary_newFunctionWithDescriptor_destinationArchive_functionCache_completionHandler___block_invoke;
    v16[3] = &unk_1E5221100;
    v16[4] = self;
    v16[5] = a3;
    v16[6] = v10;
    v16[7] = a6;
    [v10 newSpecializedFunctionWithDescriptor:a3 destinationArchive:0 functionCache:a5 sync:0 completionHandler:v16];
  }
  else
  {
    uint64_t v12 = [NSString stringWithFormat:@"Function %@ was not found in the library", objc_msgSend(a3, "name")];
    uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObject:v12 forKey:*MEMORY[0x1E4F28568]];
    id v14 = (id)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"MTLLibraryErrorDomain" code:5 userInfo:v13];
    uint64_t v15 = (void (*)(id, void, id))*((void *)a6 + 2);
    v15(a6, 0, v14);
  }
}

- (id)newFunctionWithName:(id)a3 constantValues:(id)a4 pipelineLibrary:(id)a5 error:(id *)a6
{
  uint64_t v10 = [a5 functionCache];

  return [(_MTLLibrary *)self newFunctionWithName:a3 constantValues:a4 functionCache:v10 error:a6];
}

- (id)newFunctionWithName:(id)a3 constantValues:(id)a4 error:(id *)a5
{
  return [(_MTLLibrary *)self newFunctionWithName:a3 constantValues:a4 functionCache:0 specializedName:0 error:a5];
}

- (void)newFunctionWithDescriptor:(id)a3 completionHandler:(id)a4
{
}

- (id)newFunctionWithDescriptor:(id)a3 error:(id *)a4
{
  return [(_MTLLibrary *)self newFunctionWithDescriptor:a3 destinationArchive:0 error:a4];
}

- (id)newFunctionWithName:(id)a3
{
  id v4 = -[_MTLLibrary newFunctionWithNameInternal:](self, "newFunctionWithNameInternal:");
  v5 = v4;
  if (v4 && [v4 functionType] == 4) {
    MTLReportFailure(1uLL, "-[_MTLLibrary newFunctionWithName:]", 6537, @"Function %@ was not found in the library", v6, v7, v8, v9, (uint64_t)a3);
  }
  return v5;
}

- (id)newFunctionWithNameInternal:(id)a3
{
  if (a3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_3;
    }
    uint64_t v15 = @"functionName is not a NSString.";
    unint64_t v16 = 1;
    uint64_t v17 = 6498;
  }
  else
  {
    uint64_t v15 = @"functionName must not be nil.";
    unint64_t v16 = 0;
    uint64_t v17 = 6495;
  }
  MTLReportFailure(v16, "-[_MTLLibrary newFunctionWithNameInternal:]", v17, (uint64_t)v15, v3, v4, v5, v6, v18);
LABEL_3:
  uint64_t v9 = (os_unfair_lock_s *)((char *)self->_libraryData + 84);
  os_unfair_lock_lock(v9);
  uint64_t v10 = (void *)[(NSMutableDictionary *)self->_functionDictionary objectForKey:a3];
  if (!v10) {
    uint64_t v10 = MTLLibraryContainer::functionWithName((uint64_t)self->_cacheEntry, (uint64_t)a3);
  }
  id v11 = v10;
  var0 = self->_cacheEntry->var0;
  if (var0) {
    BOOL v13 = v10 == 0;
  }
  else {
    BOOL v13 = 1;
  }
  if (!v13) {
    MTLPipelineCollection::addFunction((uint64_t)var0, (uint64_t)v10, (uint64_t)self->_libraryData, 0);
  }
  os_unfair_lock_unlock(v9);
  return v10;
}

- (id)newSpecializedFunctionWithHash:(id *)a3 libraryPath:(id)a4
{
  uint64_t v7 = (os_unfair_lock_s *)((char *)self->_libraryData + 84);
  os_unfair_lock_lock(v7);
  uint64_t v8 = (void *)(*(uint64_t (**)(void *, const $2772B1D07D29A72E8557B2574C0AE5C1 *, id, MTLDevice *))(*(void *)self->_libraryData + 176))(self->_libraryData, a3, a4, self->_device);
  os_unfair_lock_unlock(v7);
  return v8;
}

- (NSArray)stitchingFunctionHashes
{
  return (NSArray *)(*(uint64_t (**)(void))(*(void *)self->_libraryData + 96))();
}

- (NSArray)specializedFunctionHashes
{
  return (NSArray *)(*(uint64_t (**)(void))(*(void *)self->_libraryData + 80))();
}

- (MTLDevice)device
{
  return self->_device;
}

- (NSArray)externFunctionNames
{
  cacheEntry = self->_cacheEntry;
  result = (NSArray *)cacheEntry->var6;
  if (!result) {
    return (NSArray *)(*(uint64_t (**)(void))(*(void *)cacheEntry->var3 + 48))();
  }
  return result;
}

- (id)newStitchedFunctionWithHash:(id *)a3
{
  uint64_t v5 = (os_unfair_lock_s *)((char *)self->_libraryData + 84);
  os_unfair_lock_lock(v5);
  uint64_t v6 = (void *)(*(uint64_t (**)(void *, const $2772B1D07D29A72E8557B2574C0AE5C1 *, MTLDevice *))(*(void *)self->_libraryData + 184))(self->_libraryData, a3, self->_device);
  os_unfair_lock_unlock(v5);
  return v6;
}

- (NSArray)variableList
{
  return (NSArray *)(*(uint64_t (**)(void))(*(void *)self->_libraryData + 56))();
}

- (id)bitCodeWithHash:(id *)a3
{
  return (id)(*(uint64_t (**)(void *, const $2772B1D07D29A72E8557B2574C0AE5C1 *))(*(void *)self->_libraryData
                                                                                          + 136))(self->_libraryData, a3);
}

- (id)newMetalScript
{
  return (id)(*(uint64_t (**)(void))(*(void *)self->_libraryData + 144))();
}

- (id)newFunctionWithHash:(id *)a3
{
  uint64_t v5 = (os_unfair_lock_s *)((char *)self->_libraryData + 84);
  os_unfair_lock_lock(v5);
  uint64_t v6 = (void *)(*(uint64_t (**)(void *, const $2772B1D07D29A72E8557B2574C0AE5C1 *, MTLDevice *))(*(void *)self->_libraryData + 168))(self->_libraryData, a3, self->_device);
  os_unfair_lock_unlock(v5);
  return v6;
}

- (id)newSpecializedFunctionWithHash:(id *)a3
{
  return [(_MTLLibrary *)self newSpecializedFunctionWithHash:a3 libraryPath:0];
}

- (BOOL)getFunctionAliasAndNameForHash:(id *)a3 functionName:(id *)a4 alias:(id *)a5
{
  uint64_t v9 = (os_unfair_lock_s *)((char *)self->_libraryData + 84);
  os_unfair_lock_lock(v9);
  LOBYTE(a5) = (*(uint64_t (**)(void *, const $2772B1D07D29A72E8557B2574C0AE5C1 *, id *, id *))(*(void *)self->_libraryData + 232))(self->_libraryData, a3, a4, a5);
  os_unfair_lock_unlock(v9);
  return (char)a5;
}

- (BOOL)isStub
{
  return (*(uint64_t (**)(void))(*(void *)self->_libraryData + 248))();
}

- (id)libraryDataContents
{
  return (id)(*(uint64_t (**)(void))(*(void *)self->_libraryData + 32))();
}

- (NSString)overrideTriple
{
  return (NSString *)*((void *)self->_libraryData + 11);
}

- (void)setOverrideTriple:(id)a3
{
  libraryData = self->_libraryData;
  if ((id)libraryData[11] != a3)
  {
    id v4 = (id)libraryData[11];
    libraryData[11] = [a3 copy];
  }
}

- (NSUUID)libraryIdentifier
{
  return (NSUUID *)(*(uint64_t (**)(void))(*(void *)self->_libraryData + 112))();
}

- (NSArray)functionHashes
{
  return (NSArray *)(*(uint64_t (**)(void))(*(void *)self->_libraryData + 88))();
}

- (NSData)bitcodeData
{
  uint64_t v7 = 0;
  uint64_t v8 = 0;
  (*(void (**)(void *, uint64_t *, uint64_t *))(*(void *)self->_libraryData + 216))(self->_libraryData, &v8, &v7);
  if (!v7) {
    return 0;
  }
  uint64_t v3 = (void *)(*(uint64_t (**)(void *))(*(void *)self->_libraryData + 32))(self->_libraryData);
  unint64_t v4 = v7 + v8;
  if (v4 <= [v3 length]) {
    uint64_t v5 = (NSData *)objc_msgSend(v3, "subdataWithRange:", v8, v7);
  }
  else {
    uint64_t v5 = 0;
  }

  return v5;
}

- (id)newExternFunctionWithName:(id)a3
{
  id v4 = -[_MTLLibrary newFunctionWithNameInternal:](self, "newFunctionWithNameInternal:");
  uint64_t v5 = v4;
  if (v4 && [v4 functionType] != 4)
  {
    [v5 functionType];
    MTLReportFailure(1uLL, "-[_MTLLibrary newExternFunctionWithName:]", 6527, @"Function %@ has type %@, expected MTLFunctionTypeExtern.", v7, v8, v9, v10, (uint64_t)a3);
  }
  return v5;
}

- (void)newFunctionWithName:(id)a3 constantValues:(id)a4 functionCache:(id)a5 specializedName:(id)a6 completionHandler:(id)a7
{
  id v13 = (id)objc_opt_new();
  [v13 setName:a3];
  if (a6) {
    [v13 setSpecializedName:a6];
  }
  if (a4) {
    [v13 setConstantValues:a4];
  }
  [(_MTLLibrary *)self newFunctionWithDescriptor:v13 destinationArchive:0 functionCache:a5 completionHandler:a7];
}

- (void)newFunctionWithName:(id)a3 constantValues:(id)a4 completionHandler:(id)a5
{
}

- (void)newFunctionWithName:(id)a3 constantValues:(id)a4 pipelineLibrary:(id)a5 completionHandler:(id)a6
{
  uint64_t v10 = [a5 functionCache];

  [(_MTLLibrary *)self newFunctionWithName:a3 constantValues:a4 functionCache:v10 specializedName:0 completionHandler:a6];
}

- (BOOL)serializeToURL:(id)a3 error:(id *)a4
{
  uint64_t v6 = (void *)(*(uint64_t (**)(void *, SEL))(*(void *)self->_libraryData + 128))(self->_libraryData, a2);
  if (v6)
  {
    return [v6 writeToURL:a3 options:1 error:a4];
  }
  else
  {
    if (a4)
    {
      uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObject:@"MTLLibrary is not formatted as a MetalLib file." forKey:*MEMORY[0x1E4F28568]];
      *a4 = (id)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"MTLLibraryErrorDomain" code:1 userInfo:v8];
    }
    return 0;
  }
}

- (int64_t)type
{
  return (*(uint64_t (**)(void))(*(void *)self->_libraryData + 288))();
}

- (NSString)installName
{
  return (NSString *)(*(uint64_t (**)(void))(*(void *)self->_libraryData + 104))();
}

- (id)formattedDescription:(unint64_t)a3
{
  v17[9] = *MEMORY[0x1E4F143B8];
  unint64_t v4 = a3 + 4;
  uint64_t v5 = [@"\n" stringByPaddingToLength:a3 + 4 withString:@" " startingAtIndex:0];
  uint64_t v6 = [(_MTLLibrary *)self functionNames];
  uint64_t v7 = [(_MTLObjectWithLabel *)self retainedLabel];
  uint64_t v8 = NSString;
  v16.receiver = self;
  v16.super_class = (Class)_MTLLibrary;
  uint64_t v9 = [(_MTLLibrary *)&v16 description];
  v17[0] = v5;
  v17[1] = @"label =";
  if (v7) {
    uint64_t v10 = v7;
  }
  else {
    uint64_t v10 = @"<none>";
  }
  v17[2] = v10;
  v17[3] = v5;
  v17[4] = @"device =";
  device = self->_device;
  if (device) {
    uint64_t v12 = (__CFString *)[(MTLDevice *)device formattedDescription:v4];
  }
  else {
    uint64_t v12 = @"<null>";
  }
  v17[5] = v12;
  v17[6] = v5;
  v17[7] = @"functionNames:";
  if (v6) {
    id v13 = [(NSArray *)v6 componentsJoinedByString:@" "];
  }
  else {
    id v13 = @"<null>";
  }
  v17[8] = v13;
  id v14 = (void *)[v8 stringWithFormat:@"%@%@", v9, objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v17, 9), "componentsJoinedByString:", @" "];

  return v14;
}

- (NSString)description
{
  return (NSString *)[(_MTLLibrary *)self formattedDescription:0];
}

- (void)libraryData
{
  return self->_libraryData;
}

- (NSMutableDictionary)functionDictionary
{
  return self->_functionDictionary;
}

- (MTLLibraryContainer)cacheEntry
{
  return self->_cacheEntry;
}

- (BOOL)shaderValidationEnabled
{
  return self->_shaderValidationEnabled;
}

- (void)setShaderValidationEnabled:(BOOL)a3
{
  self->_shaderValidationEnabled = a3;
}

@end