@interface AGXG17FamilyBinaryArchive
- (BOOL)addComputePipelineFunctionsWithDescriptor:(id)a3 error:(id *)a4;
- (BOOL)addComputePipelineFunctionsWithDescriptor:(id)a3 options:(unint64_t)a4 error:(id *)a5;
- (BOOL)addMeshRenderPipelineFunctionsWithDescriptor:(id)a3 options:(unint64_t)a4 error:(id *)a5;
- (BOOL)addRenderPipelineFunctionsWithDescriptor:(id)a3 error:(id *)a4;
- (BOOL)addRenderPipelineFunctionsWithDescriptor:(id)a3 options:(unint64_t)a4 error:(id *)a5;
- (BOOL)addTileRenderPipelineFunctionsWithDescriptor:(id)a3 error:(id *)a4;
- (BOOL)addTileRenderPipelineFunctionsWithDescriptor:(id)a3 options:(unint64_t)a4 error:(id *)a5;
@end

@implementation AGXG17FamilyBinaryArchive

- (BOOL)addComputePipelineFunctionsWithDescriptor:(id)a3 error:(id *)a4
{
  return [(AGXG17FamilyBinaryArchive *)self addComputePipelineFunctionsWithDescriptor:a3 options:0 error:a4];
}

- (BOOL)addComputePipelineFunctionsWithDescriptor:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  v9 = [(_MTLBinaryArchive *)self device];
  [(_MTLBinaryArchive *)self storeComputePipelineDescriptor:a3];
  v10 = *(void **)(*((void *)v9 + 101) + 6016);
  if (!a5)
  {
    if (a3)
    {
      v28[0] = 0;
      if ([a3 validateWithDevice:v9 error:v28]) {
        goto LABEL_7;
      }
      v24 = (__CFString *)[v28[0] localizedDescription];
      v22 = NSDictionary;
      uint64_t v23 = *MEMORY[0x263F08320];
    }
    else
    {
      v22 = NSDictionary;
      uint64_t v23 = *MEMORY[0x263F08320];
      v24 = @"pipeline descriptor is nil";
    }
    uint64_t v25 = [v22 dictionaryWithObject:v24 forKey:v23];
    id v26 = (id)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"AGXMetalG17P" code:2 userInfo:v25];
    return 0;
  }
  *a5 = 0;
  if (!a3)
  {
    v12 = NSDictionary;
    uint64_t v13 = *MEMORY[0x263F08320];
    v11 = @"pipeline descriptor is nil";
    goto LABEL_12;
  }
  v28[0] = 0;
  if (![a3 validateWithDevice:v9 error:v28])
  {
    v11 = (__CFString *)[v28[0] localizedDescription];
    v12 = NSDictionary;
    uint64_t v13 = *MEMORY[0x263F08320];
LABEL_12:
    uint64_t v20 = [v12 dictionaryWithObject:v11 forKey:v13];
    id v21 = (id)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"AGXMetalG17P" code:2 userInfo:v20];
    BOOL v19 = 0;
    *a5 = v21;
    return v19;
  }
LABEL_7:
  AGX::UserShaderFactory<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::loadDynamicLibrariesForFunctions(&v38, v9, [a3 computeFunction], objc_msgSend(a3, "linkedFunctions"), objc_msgSend(a3, "preloadedLibraries"), (uint64_t)a5);
  v14 = v38;
  if (v38)
  {
    uint64_t v15 = [a3 computeFunction];
    uint64_t v34 = 0;
    v35 = &v34;
    uint64_t v36 = 0x2020000000;
    uint64_t v37 = 0;
    v16 = v10[2];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = ___ZN3AGX23UserCommonShaderFactoryINS_6HAL2008EncodersENS1_7ClassesENS1_10ObjClassesEE36addComputePipelineFunctionsToArchiveEP28MTLComputePipelineDescriptorP18AGXG17FamilyDevicemP25AGXG17FamilyBinaryArchivePP7NSError_block_invoke;
    block[3] = &unk_26516F130;
    block[4] = v15;
    block[5] = &v34;
    dispatch_sync(v16, block);
    uint64_t v29 = 0;
    v30 = &v29;
    uint64_t v31 = 0x2020000000;
    char v32 = 1;
    v17 = [a3 newSerializedComputeData];
    uint64_t v18 = v35[3];
    v28[0] = (id)MEMORY[0x263EF8330];
    v28[1] = (id)3221225472;
    v28[2] = ___ZN3AGX23UserCommonShaderFactoryINS_6HAL2008EncodersENS1_7ClassesENS1_10ObjClassesEE36addComputePipelineFunctionsToArchiveEP28MTLComputePipelineDescriptorP18AGXG17FamilyDevicemP25AGXG17FamilyBinaryArchivePP7NSError_block_invoke_2;
    v28[3] = &unk_26516F158;
    v28[5] = v10;
    v28[6] = a5;
    v28[4] = &v29;
    AGX::UserCommonShaderFactory<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::createComputeProgramVariant((void ***)v10, a3, v9, a4, (uint64_t)self, v14, v18, v17, 0, (uint64_t)v28);
    if (v17) {
      dispatch_release(v17);
    }
    BOOL v19 = *((unsigned char *)v30 + 24) != 0;
    _Block_object_dispose(&v29, 8);
    _Block_object_dispose(&v34, 8);
  }
  else
  {
    BOOL v19 = 0;
  }

  return v19;
}

- (BOOL)addMeshRenderPipelineFunctionsWithDescriptor:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  v8 = [(_MTLBinaryArchive *)self device];
  [(_MTLBinaryArchive *)self storeMeshRenderPipelineDescriptor:a3];
  if (!a5)
  {
    if (a3)
    {
      id v19 = 0;
      if ([a3 validateWithDevice:v8 error:&v19]) {
        goto LABEL_7;
      }
      uint64_t v15 = (__CFString *)[v19 localizedDescription];
      uint64_t v13 = NSDictionary;
      uint64_t v14 = *MEMORY[0x263F08320];
    }
    else
    {
      uint64_t v13 = NSDictionary;
      uint64_t v14 = *MEMORY[0x263F08320];
      uint64_t v15 = @"pipeline descriptor is nil";
    }
    uint64_t v16 = [v13 dictionaryWithObject:v15 forKey:v14];
    id v17 = (id)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"AGXMetalG17P" code:2 userInfo:v16];
    return 0;
  }
  *a5 = 0;
  if (!a3)
  {
    v10 = NSDictionary;
    uint64_t v11 = *MEMORY[0x263F08320];
    v9 = @"pipeline descriptor is nil";
    goto LABEL_9;
  }
  id v19 = 0;
  if ([a3 validateWithDevice:v8 error:&v19]) {
LABEL_7:
  }
    operator new();
  v9 = (__CFString *)[v19 localizedDescription];
  v10 = NSDictionary;
  uint64_t v11 = *MEMORY[0x263F08320];
LABEL_9:
  uint64_t v12 = [v10 dictionaryWithObject:v9 forKey:v11];
  *a5 = (id)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"AGXMetalG17P" code:2 userInfo:v12];
  return 0;
}

- (BOOL)addTileRenderPipelineFunctionsWithDescriptor:(id)a3 error:(id *)a4
{
  return [(AGXG17FamilyBinaryArchive *)self addTileRenderPipelineFunctionsWithDescriptor:a3 options:0 error:a4];
}

- (BOOL)addTileRenderPipelineFunctionsWithDescriptor:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  v9 = [(_MTLBinaryArchive *)self device];
  [(_MTLBinaryArchive *)self storeTileRenderPipelineDescriptor:a3];
  v10 = *(void **)(*((void *)v9 + 101) + 6024);
  if (!a5)
  {
    if (a3)
    {
      v27[0] = 0;
      if ([a3 validateWithDevice:v9 error:v27]) {
        goto LABEL_7;
      }
      uint64_t v23 = (__CFString *)[v27[0] localizedDescription];
      id v21 = NSDictionary;
      uint64_t v22 = *MEMORY[0x263F08320];
    }
    else
    {
      id v21 = NSDictionary;
      uint64_t v22 = *MEMORY[0x263F08320];
      uint64_t v23 = @"pipeline descriptor is nil";
    }
    uint64_t v24 = [v21 dictionaryWithObject:v23 forKey:v22];
    id v25 = (id)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"AGXMetalG17P" code:2 userInfo:v24];
    return 0;
  }
  *a5 = 0;
  if (!a3)
  {
    uint64_t v12 = NSDictionary;
    uint64_t v13 = *MEMORY[0x263F08320];
    uint64_t v11 = @"pipeline descriptor is nil";
    goto LABEL_10;
  }
  v27[0] = 0;
  if (![a3 validateWithDevice:v9 error:v27])
  {
    uint64_t v11 = (__CFString *)[v27[0] localizedDescription];
    uint64_t v12 = NSDictionary;
    uint64_t v13 = *MEMORY[0x263F08320];
LABEL_10:
    uint64_t v19 = [v12 dictionaryWithObject:v11 forKey:v13];
    id v20 = (id)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"AGXMetalG17P" code:2 userInfo:v19];
    BOOL v18 = 0;
    *a5 = v20;
    return v18;
  }
LABEL_7:
  uint64_t v14 = [a3 tileFunction];
  uint64_t v34 = 0;
  v35 = &v34;
  uint64_t v36 = 0x2020000000;
  uint64_t v37 = 0;
  uint64_t v15 = v10[2];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = ___ZN3AGX21UserTileShaderFactoryINS_6HAL2008EncodersENS1_7ClassesENS1_10ObjClassesEE39addTileRenderPipelineFunctionsToArchiveEP31MTLTileRenderPipelineDescriptorP18AGXG17FamilyDevicemP25AGXG17FamilyBinaryArchivePP7NSError_block_invoke;
  block[3] = &unk_26516F130;
  block[4] = v14;
  block[5] = &v34;
  dispatch_sync(v15, block);
  uint64_t v29 = 0;
  v30 = &v29;
  uint64_t v31 = 0x2020000000;
  char v32 = 1;
  AGX::UserShaderFactory<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::loadDynamicLibrariesForFunctions(&v28, v9, [a3 tileFunction], objc_msgSend(a3, "linkedFunctions"), objc_msgSend(a3, "preloadedLibraries"), (uint64_t)a5);
  uint64_t v16 = v28;
  if (v28)
  {
    uint64_t v17 = v35[3];
    v27[0] = (id)MEMORY[0x263EF8330];
    v27[1] = (id)3221225472;
    v27[2] = ___ZN3AGX21UserTileShaderFactoryINS_6HAL2008EncodersENS1_7ClassesENS1_10ObjClassesEE39addTileRenderPipelineFunctionsToArchiveEP31MTLTileRenderPipelineDescriptorP18AGXG17FamilyDevicemP25AGXG17FamilyBinaryArchivePP7NSError_block_invoke_2;
    v27[3] = &unk_26516F158;
    v27[5] = v10;
    v27[6] = a5;
    v27[4] = &v29;
    AGX::UserTileShaderFactory<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::createTileProgramVariant((void ***)v10, a3, v9, a4, (uint64_t)self, v28, v17, 0, (uint64_t)v27);
    BOOL v18 = *((unsigned char *)v30 + 24) != 0;
  }
  else
  {
    BOOL v18 = 0;
  }

  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(&v34, 8);
  return v18;
}

- (BOOL)addRenderPipelineFunctionsWithDescriptor:(id)a3 error:(id *)a4
{
  return [(AGXG17FamilyBinaryArchive *)self addRenderPipelineFunctionsWithDescriptor:a3 options:0 error:a4];
}

- (BOOL)addRenderPipelineFunctionsWithDescriptor:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  v8 = [(_MTLBinaryArchive *)self device];
  [(_MTLBinaryArchive *)self storeRenderPipelineDescriptor:a3];
  if (!a5)
  {
    if (a3)
    {
      id v19 = 0;
      if ([a3 validateWithDevice:v8 error:&v19]) {
        goto LABEL_7;
      }
      uint64_t v15 = (__CFString *)[v19 localizedDescription];
      uint64_t v13 = NSDictionary;
      uint64_t v14 = *MEMORY[0x263F08320];
    }
    else
    {
      uint64_t v13 = NSDictionary;
      uint64_t v14 = *MEMORY[0x263F08320];
      uint64_t v15 = @"pipeline descriptor is nil";
    }
    uint64_t v16 = [v13 dictionaryWithObject:v15 forKey:v14];
    id v17 = (id)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"AGXMetalG17P" code:2 userInfo:v16];
    return 0;
  }
  *a5 = 0;
  if (!a3)
  {
    v10 = NSDictionary;
    uint64_t v11 = *MEMORY[0x263F08320];
    v9 = @"pipeline descriptor is nil";
    goto LABEL_9;
  }
  id v19 = 0;
  if ([a3 validateWithDevice:v8 error:&v19]) {
LABEL_7:
  }
    operator new();
  v9 = (__CFString *)[v19 localizedDescription];
  v10 = NSDictionary;
  uint64_t v11 = *MEMORY[0x263F08320];
LABEL_9:
  uint64_t v12 = [v10 dictionaryWithObject:v9 forKey:v11];
  *a5 = (id)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"AGXMetalG17P" code:2 userInfo:v12];
  return 0;
}

@end