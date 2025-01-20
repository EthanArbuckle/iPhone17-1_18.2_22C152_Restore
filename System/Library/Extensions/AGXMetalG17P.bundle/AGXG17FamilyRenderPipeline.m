@interface AGXG17FamilyRenderPipeline
- (AGXG17FamilyRenderPipeline)initWithDevice:(id)a3 meshRenderPipelineStateDescriptor:(id)a4 objectThreadExecutionWidth:(unint64_t)a5 meshThreadExecutionWidth:(unint64_t)a6;
- (AGXG17FamilyRenderPipeline)initWithDevice:(id)a3 meshRenderPipelineStateDescriptor:(id)a4 objectThreadExecutionWidth:(unint64_t)a5 meshThreadExecutionWidth:(unint64_t)a6 maxTotalThreadgroupsPerMeshGrid:(unint64_t)a7;
- (AGXG17FamilyRenderPipeline)initWithDevice:(id)a3 pipelineStateDescriptor:(id)a4;
- (AGXG17FamilyRenderPipeline)initWithParent:(id)a3;
- (id).cxx_construct;
- (id)fragmentFunctionHandleWithFunction:(id)a3;
- (id)meshFunctionHandleWithFunction:(id)a3;
- (id)newFragmentShaderDebugInfo;
- (id)newIntersectionFunctionTableWithDescriptor:(id)a3 stage:(unint64_t)a4;
- (id)newMeshShaderDebugInfo;
- (id)newObjectShaderDebugInfo;
- (id)newRenderPipelineStateWithAdditionalBinaryFunctions:(id)a3 error:(id *)a4;
- (id)newRenderPipelineStateWithAdditionalBinaryFunctions:(id)a3 fragmentAdditionalBinaryFunctions:(id)a4 error:(id *)a5;
- (id)newVertexShaderDebugInfo;
- (id)newVisibleFunctionTableFromFragmentStageWithDescriptor:(id)a3;
- (id)newVisibleFunctionTableFromTileStageWithDescriptor:(id)a3;
- (id)newVisibleFunctionTableFromVertexStageWithDescriptor:(id)a3;
- (id)newVisibleFunctionTableWithDescriptor:(id)a3 stage:(unint64_t)a4;
- (id)objectFunctionHandleWithFunction:(id)a3;
- (id)pipelineBinaries;
- (id)tileFunctionHandleWithFunction:(id)a3;
- (id)vertexFunctionHandleWithFunction:(id)a3;
- (unint64_t)allocatedSize;
- (unint64_t)imageBlockMemoryLengthForDimensions:(id *)a3;
- (unint64_t)imageBlockSampleLength;
- (unint64_t)imageblockMemoryLengthForDimensions:(id *)a3;
- (unint64_t)imageblockSampleLength;
- (unint64_t)maxTileStorageLength;
- (unint64_t)maxTotalThreadsPerMeshThreadgroup;
- (unint64_t)maxTotalThreadsPerObjectThreadgroup;
- (unint64_t)maxTotalThreadsPerThreadgroup;
- (unint64_t)meshThreadExecutionWidth;
- (unint64_t)objectThreadExecutionWidth;
- (unint64_t)resourceIndex;
- (unint64_t)staticThreadgroupMemoryLength;
- (unint64_t)uniqueIdentifier;
- (unsigned)getFragmentShaderTelemetryID;
- (unsigned)getVertexShaderTelemetryID;
- (void)dealloc;
@end

@implementation AGXG17FamilyRenderPipeline

- (id).cxx_construct
{
  AGX::RenderPipeline<AGX::HAL200::ObjClasses,AGX::HAL200::Classes,AGX::HAL200::Encoders>::RenderPipeline((uint64_t)&self->_impl);
  *(void *)(v3 + 3208) = 0;
  return self;
}

- (void).cxx_destruct
{
  p_impl = &self->_impl;
  uint64_t v3 = *(void *)&self->_anon_1a8[2928];
  if (v3)
  {
    uint64_t v4 = ProgramVaryingTable<AGX::HAL200::Encoders,AGX::HAL200::Classes>::~ProgramVaryingTable(v3);
    MEMORY[0x24566ED90](v4, 0x10F0C4099BF1763);
  }

  AGX::RenderPipeline<AGX::HAL200::ObjClasses,AGX::HAL200::Classes,AGX::HAL200::Encoders>::~RenderPipeline((uint64_t)p_impl);
}

- (unint64_t)maxTileStorageLength
{
  return self->_maxTileStorageLength;
}

- (id)newIntersectionFunctionTableWithDescriptor:(id)a3 stage:(unint64_t)a4
{
  v7 = [(_MTLRenderPipelineState *)self device];
  if (![(MTLDevice *)v7 requiresRaytracingEmulation])
  {
    v12 = 0;
    if (a4 <= 0x10 && ((1 << a4) & 0x10116) != 0)
    {
      uint64_t v13 = 0;
      switch(a4)
      {
        case 1uLL:
          goto LABEL_13;
        case 2uLL:
          uint64_t v13 = 1;
          goto LABEL_13;
        case 4uLL:
          uint64_t v13 = 2;
          goto LABEL_13;
        case 8uLL:
          uint64_t v13 = 3;
          goto LABEL_13;
        case 0x10uLL:
          uint64_t v13 = 4;
LABEL_13:
          v14 = (char *)&self->_impl + 16 * v13;
          uint64_t v15 = *((void *)v14 + 364);
          v16 = (std::__shared_weak_count *)*((void *)v14 + 365);
          if (v16) {
            atomic_fetch_add_explicit(&v16->__shared_owners_, 1uLL, memory_order_relaxed);
          }
          if (v15)
          {
            if ([a3 forceResourceIndex]) {
              uint64_t v17 = [a3 resourceIndex];
            }
            else {
              uint64_t v17 = 0;
            }
            v18 = [AGXG17FamilyUserIntersectionFunctionTable alloc];
            uint64_t v19 = [a3 functionCount];
            uint64_t v20 = __clz(__rbit32(a4)) + 1;
            uint64_t v22 = v15;
            v23 = v16;
            if (v16) {
              atomic_fetch_add_explicit(&v16->__shared_owners_, 1uLL, memory_order_relaxed);
            }
            v12 = [(AGXG17FamilyUserIntersectionFunctionTable *)v18 initWithDevice:v7 numTableFnSlots:v19 pipelineSets:&v22 pipeline:self stage:v20 resourceIndex:v17];
            v21 = v23;
            if (v23 && !atomic_fetch_add(&v23->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
            {
              ((void (*)(std::__shared_weak_count *))v21->__on_zero_shared)(v21);
              std::__shared_weak_count::__release_weak(v21);
            }
          }
          if (!v16 || atomic_fetch_add(&v16->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
          {
            if (v15) {
              return v12;
            }
            return 0;
          }
          ((void (*)(std::__shared_weak_count *))v16->__on_zero_shared)(v16);
          std::__shared_weak_count::__release_weak(v16);
          if (!v15) {
            return 0;
          }
          break;
        default:
          return 0;
      }
    }
    return v12;
  }
  id v8 = objc_alloc_init(MEMORY[0x263F12A88]);
  objc_msgSend(v8, "setFunctionCount:", objc_msgSend(a3, "functionCount"));
  objc_msgSend(v8, "setResourceIndex:", objc_msgSend(a3, "resourceIndex"));
  objc_msgSend(v8, "setForceResourceIndex:", objc_msgSend(a3, "forceResourceIndex"));
  id v9 = 0;
  if (a4 <= 0x10 && ((1 << a4) & 0x10116) != 0) {
    id v9 = [(AGXG17FamilyRenderPipeline *)self newVisibleFunctionTableWithDescriptor:v8 stage:a4];
  }

  v10 = (void *)[objc_alloc(MEMORY[0x263F4B120]) initWithVisibleFunctionTable:v9];
  return v10;
}

- (id)newVisibleFunctionTableWithDescriptor:(id)a3 stage:(unint64_t)a4
{
  v7 = [(_MTLRenderPipelineState *)self device];
  return -[AGXG17FamilyVisibleFunctionTable initWithDevice:functionCount:options:isSuballocDisabled:resourceIndex:pipelineState:stage:]([AGXG17FamilyVisibleFunctionTable alloc], "initWithDevice:functionCount:options:isSuballocDisabled:resourceIndex:pipelineState:stage:", v7, [a3 functionCount], 0, *(unsigned __int8 *)(*((void *)v7 + 101) + 7805), objc_msgSend(a3, "resourceIndex"), self, a4);
}

- (id)newVisibleFunctionTableFromTileStageWithDescriptor:(id)a3
{
  v5 = [(_MTLRenderPipelineState *)self device];
  LODWORD(v7) = 3;
  return -[AGXG17FamilyVisibleFunctionTable initWithDevice:functionCount:options:isSuballocDisabled:resourceIndex:pipelineState:type:]([AGXG17FamilyVisibleFunctionTable alloc], "initWithDevice:functionCount:options:isSuballocDisabled:resourceIndex:pipelineState:type:", v5, [a3 functionCount], 0, *(unsigned __int8 *)(*((void *)v5 + 101) + 7805), objc_msgSend(a3, "resourceIndex"), self, v7);
}

- (id)newVisibleFunctionTableFromFragmentStageWithDescriptor:(id)a3
{
  v5 = [(_MTLRenderPipelineState *)self device];
  LODWORD(v7) = 2;
  return -[AGXG17FamilyVisibleFunctionTable initWithDevice:functionCount:options:isSuballocDisabled:resourceIndex:pipelineState:type:]([AGXG17FamilyVisibleFunctionTable alloc], "initWithDevice:functionCount:options:isSuballocDisabled:resourceIndex:pipelineState:type:", v5, [a3 functionCount], 0, *(unsigned __int8 *)(*((void *)v5 + 101) + 7805), objc_msgSend(a3, "resourceIndex"), self, v7);
}

- (id)newVisibleFunctionTableFromVertexStageWithDescriptor:(id)a3
{
  v5 = [(_MTLRenderPipelineState *)self device];
  LODWORD(v7) = 1;
  return -[AGXG17FamilyVisibleFunctionTable initWithDevice:functionCount:options:isSuballocDisabled:resourceIndex:pipelineState:type:]([AGXG17FamilyVisibleFunctionTable alloc], "initWithDevice:functionCount:options:isSuballocDisabled:resourceIndex:pipelineState:type:", v5, [a3 functionCount], 0, *(unsigned __int8 *)(*((void *)v5 + 101) + 7805), objc_msgSend(a3, "resourceIndex"), self, v7);
}

- (id)pipelineBinaries
{
  v44[1] = *MEMORY[0x263EF8340];
  p_impl = &self->_impl;
  if (!self->_impl.fragment_variant
    && !self->_impl.vertex_variant
    && !self->_impl.tile_variant
    && !self->_impl.object_variant
    && !self->_impl.mesh_variant)
  {
    return 0;
  }
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  if (p_impl->fragment_variant)
  {
    id v4 = objc_alloc(MEMORY[0x263F12AF0]);
    fragment_variant = p_impl->fragment_variant;
    if (*((char *)p_impl->fragment_variant + 1583) < 0)
    {
      if (*((void *)fragment_variant + 196)) {
        goto LABEL_9;
      }
    }
    else if (*((unsigned char *)p_impl->fragment_variant + 1583))
    {
LABEL_9:
      id v6 = objc_alloc(MEMORY[0x263EFF8F8]);
      if (*((char *)fragment_variant + 1583) < 0)
      {
        uint64_t v7 = (char *)*((void *)fragment_variant + 195);
        uint64_t v8 = *((void *)fragment_variant + 196);
      }
      else
      {
        uint64_t v7 = (char *)fragment_variant + 1560;
        uint64_t v8 = *((unsigned __int8 *)fragment_variant + 1583);
      }
      uint64_t v9 = [v6 initWithBytes:v7 length:v8];
      fragment_variant = p_impl->fragment_variant;
LABEL_15:
      v44[0] = [v4 initWithBinary:v9 uniqueIdentifier:*((void *)fragment_variant + 139) debugIdentifier:*((unsigned int *)fragment_variant + 276)];
      objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", v44, 1), @"fragment");
      [v3 setObject:AGX::PipelineDylibResources<AGX::HAL200::ObjClasses,AGX::HAL200::Classes,(AGX::ICBType)0>::getPipelineBinaries((uint64_t **)&p_impl[8].resource_info[12]) forKeyedSubscript:@"fragment-dynamic-libraries"];
      uint64_t v10 = AGX::getIntersectionFunctionPipelineBinaries<AGX::HAL200::Classes>((uint64_t)p_impl[10].resource_info[5].iosurface);
      if (v10) {
        [v3 setObject:v10 forKeyedSubscript:@"fragment-intersection-functions"];
      }
      goto LABEL_17;
    }
    uint64_t v9 = 0;
    goto LABEL_15;
  }
LABEL_17:
  if (!p_impl->vertex_variant) {
    goto LABEL_28;
  }
  id v11 = objc_alloc(MEMORY[0x263F12AF0]);
  vertex_variant = p_impl->vertex_variant;
  if (*((char *)vertex_variant + 1583) < 0)
  {
    if (*((void *)vertex_variant + 196)) {
      goto LABEL_20;
    }
LABEL_23:
    uint64_t v16 = 0;
    goto LABEL_26;
  }
  if (!*((unsigned char *)vertex_variant + 1583)) {
    goto LABEL_23;
  }
LABEL_20:
  id v13 = objc_alloc(MEMORY[0x263EFF8F8]);
  if (*((char *)vertex_variant + 1583) < 0)
  {
    v14 = (char *)*((void *)vertex_variant + 195);
    uint64_t v15 = *((void *)vertex_variant + 196);
  }
  else
  {
    v14 = (char *)vertex_variant + 1560;
    uint64_t v15 = *((unsigned __int8 *)vertex_variant + 1583);
  }
  uint64_t v16 = [v13 initWithBytes:v14 length:v15];
  vertex_variant = p_impl->vertex_variant;
LABEL_26:
  uint64_t v43 = [v11 initWithBinary:v16 uniqueIdentifier:*((void *)vertex_variant + 139) debugIdentifier:*((unsigned int *)vertex_variant + 276)];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", &v43, 1), @"vertex");
  [v3 setObject:AGX::PipelineDylibResources<AGX::HAL200::ObjClasses,AGX::HAL200::Classes,(AGX::ICBType)0>::getPipelineBinaries((uint64_t **)&p_impl[8].resource_info[9]) forKeyedSubscript:@"vertex-dynamic-libraries"];
  uint64_t v17 = AGX::getIntersectionFunctionPipelineBinaries<AGX::HAL200::Classes>((uint64_t)p_impl[10].resource_info[3].iosurface);
  if (v17) {
    [v3 setObject:v17 forKeyedSubscript:@"vertex-intersection-functions"];
  }
LABEL_28:
  if (!p_impl->tile_variant) {
    goto LABEL_39;
  }
  id v18 = objc_alloc(MEMORY[0x263F12AF0]);
  tile_variant = p_impl->tile_variant;
  if (*((char *)tile_variant + 1583) < 0)
  {
    if (*((void *)tile_variant + 196)) {
      goto LABEL_31;
    }
LABEL_34:
    uint64_t v23 = 0;
    goto LABEL_37;
  }
  if (!*((unsigned char *)tile_variant + 1583)) {
    goto LABEL_34;
  }
LABEL_31:
  id v20 = objc_alloc(MEMORY[0x263EFF8F8]);
  if (*((char *)tile_variant + 1583) < 0)
  {
    v21 = (char *)*((void *)tile_variant + 195);
    uint64_t v22 = *((void *)tile_variant + 196);
  }
  else
  {
    v21 = (char *)tile_variant + 1560;
    uint64_t v22 = *((unsigned __int8 *)tile_variant + 1583);
  }
  uint64_t v23 = [v20 initWithBytes:v21 length:v22];
  tile_variant = p_impl->tile_variant;
LABEL_37:
  uint64_t v42 = [v18 initWithBinary:v23 uniqueIdentifier:*((void *)tile_variant + 139) debugIdentifier:*((unsigned int *)tile_variant + 276)];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", &v42, 1), @"tile");
  [v3 setObject:AGX::PipelineDylibResources<AGX::HAL200::ObjClasses,AGX::HAL200::Classes,(AGX::ICBType)0>::getPipelineBinaries((uint64_t **)&p_impl[8].resource_info[15]) forKeyedSubscript:@"tile-dynamic-libraries"];
  uint64_t v24 = AGX::getIntersectionFunctionPipelineBinaries<AGX::HAL200::Classes>((uint64_t)p_impl[10].resource_info[7].iosurface);
  if (v24) {
    [v3 setObject:v24 forKeyedSubscript:@"tile-intersection-functions"];
  }
LABEL_39:
  if (!p_impl->object_variant) {
    goto LABEL_50;
  }
  id v25 = objc_alloc(MEMORY[0x263F12AF0]);
  object_variant = p_impl->object_variant;
  if (*((char *)object_variant + 1583) < 0)
  {
    if (*((void *)object_variant + 196)) {
      goto LABEL_42;
    }
LABEL_45:
    uint64_t v30 = 0;
    goto LABEL_48;
  }
  if (!*((unsigned char *)object_variant + 1583)) {
    goto LABEL_45;
  }
LABEL_42:
  id v27 = objc_alloc(MEMORY[0x263EFF8F8]);
  if (*((char *)object_variant + 1583) < 0)
  {
    v28 = (char *)*((void *)object_variant + 195);
    uint64_t v29 = *((void *)object_variant + 196);
  }
  else
  {
    v28 = (char *)object_variant + 1560;
    uint64_t v29 = *((unsigned __int8 *)object_variant + 1583);
  }
  uint64_t v30 = [v27 initWithBytes:v28 length:v29];
  object_variant = p_impl->object_variant;
LABEL_48:
  uint64_t v41 = [v25 initWithBinary:v30 uniqueIdentifier:*((void *)object_variant + 139) debugIdentifier:*((unsigned int *)object_variant + 276)];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", &v41, 1), @"object");
  [v3 setObject:AGX::PipelineDylibResources<AGX::HAL200::ObjClasses,AGX::HAL200::Classes,(AGX::ICBType)0>::getPipelineBinaries((uint64_t **)&p_impl[8].resource_info[18]) forKeyedSubscript:@"object-dynamic-libraries"];
  uint64_t v31 = AGX::getIntersectionFunctionPipelineBinaries<AGX::HAL200::Classes>((uint64_t)p_impl[10].resource_info[9].iosurface);
  if (v31) {
    [v3 setObject:v31 forKeyedSubscript:@"object-intersection-functions"];
  }
LABEL_50:
  if (p_impl->mesh_variant)
  {
    id v32 = objc_alloc(MEMORY[0x263F12AF0]);
    mesh_variant = p_impl->mesh_variant;
    if (*((char *)mesh_variant + 1583) < 0)
    {
      if (*((void *)mesh_variant + 196)) {
        goto LABEL_53;
      }
    }
    else if (*((unsigned char *)mesh_variant + 1583))
    {
LABEL_53:
      id v34 = objc_alloc(MEMORY[0x263EFF8F8]);
      if (*((char *)mesh_variant + 1583) < 0)
      {
        v35 = (char *)*((void *)mesh_variant + 195);
        uint64_t v36 = *((void *)mesh_variant + 196);
      }
      else
      {
        v35 = (char *)mesh_variant + 1560;
        uint64_t v36 = *((unsigned __int8 *)mesh_variant + 1583);
      }
      uint64_t v37 = [v34 initWithBytes:v35 length:v36];
      mesh_variant = p_impl->mesh_variant;
      goto LABEL_59;
    }
    uint64_t v37 = 0;
LABEL_59:
    uint64_t v40 = [v32 initWithBinary:v37 uniqueIdentifier:*((void *)mesh_variant + 139) debugIdentifier:*((unsigned int *)mesh_variant + 276)];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", &v40, 1), @"mesh");
    [v3 setObject:AGX::PipelineDylibResources<AGX::HAL200::ObjClasses,AGX::HAL200::Classes,(AGX::ICBType)0>::getPipelineBinaries((uint64_t **)&p_impl[8].resource_info[21]) forKeyedSubscript:@"mesh-dynamic-libraries"];
    uint64_t v38 = AGX::getIntersectionFunctionPipelineBinaries<AGX::HAL200::Classes>((uint64_t)p_impl[10].resource_info[11].iosurface);
    if (v38) {
      [v3 setObject:v38 forKeyedSubscript:@"mesh-intersection-functions"];
    }
  }
  return (id)[v3 copy];
}

- (id)newRenderPipelineStateWithAdditionalBinaryFunctions:(id)a3 fragmentAdditionalBinaryFunctions:(id)a4 error:(id *)a5
{
  uint64_t v304 = *MEMORY[0x263EF8340];
  if (self->_basePipeline) {
    basePipeline = self->_basePipeline;
  }
  else {
    basePipeline = self;
  }
  uint64_t v9 = [[AGXG17FamilyRenderPipeline alloc] initWithParent:basePipeline];
  uint64_t v10 = [(_MTLRenderPipelineState *)self device];
  id v11 = @"Failed to allocate a new pipeline";
  v283 = @"Failed to allocate a new pipeline";
  if (!v9) {
    goto LABEL_322;
  }
  v12 = (uint64_t **)v10;
  v256 = v9;
  p_impl = &v9->_impl;
  v260 = &self->_impl;
  AGX::RenderPipeline<AGX::HAL200::ObjClasses,AGX::HAL200::Classes,AGX::HAL200::Encoders>::copyStateAndFunctionsFromOriginal((uint64_t)&v9->_impl, (uint64_t)v10, (uint64_t)&self->_impl, [a4 count] + objc_msgSend(a3, "count"));
  uint64_t v14 = (uint64_t)&v9->_anon_1a8[2240];
  id obj = a3;
  unint64_t prime = vcvtps_u32_f32((float)((unint64_t)p_impl[9].object_variant + [a3 count])/ *(float *)&p_impl[9].mesh_variant);
  if (prime == 1)
  {
    unint64_t prime = 2;
  }
  else if ((prime & (prime - 1)) != 0)
  {
    unint64_t prime = std::__next_prime(prime);
  }
  int8x8_t vertex_variant = (int8x8_t)p_impl[9].vertex_variant;
  id v257 = a4;
  if (prime > *(void *)&vertex_variant) {
    goto LABEL_10;
  }
  if (prime < *(void *)&vertex_variant)
  {
    uint8x8_t v17 = (uint8x8_t)vcnt_s8(vertex_variant);
    v17.i16[0] = vaddlv_u8(v17);
    unint64_t v18 = vcvtps_u32_f32((float)(unint64_t)p_impl[9].object_variant / *(float *)&p_impl[9].mesh_variant);
    if (*(void *)&vertex_variant < 3uLL || v17.u32[0] > 1uLL)
    {
      unint64_t v18 = std::__next_prime(v18);
    }
    else
    {
      uint64_t v20 = 1 << -(char)__clz(v18 - 1);
      if (v18 >= 2) {
        unint64_t v18 = v20;
      }
    }
    if (prime <= v18) {
      unint64_t prime = v18;
    }
    if (prime < *(void *)&vertex_variant) {
LABEL_10:
    }
      std::__hash_table<std::__hash_value_type<std::string,unsigned int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,unsigned int>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,unsigned int>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,unsigned int>>>::__do_rehash<true>((uint64_t)&p_impl[9], prime);
  }
  v263 = v12;
  uint64_t p_vertex_spill_params = (uint64_t)&p_impl[9].vertex_spill_params;
  uint64_t v270 = (uint64_t)p_impl;
  unint64_t v22 = vcvtps_u32_f32((float)(unint64_t)([v257 count]+ *((void *)&p_impl[9].vertex_spill_params.config.minPoolInfo.overrides + 2))/ *(float *)&p_impl[9].fragment_tile_spill_params.clique_plus_coeff_pages_typical);
  if (v22 == 1)
  {
    unint64_t v22 = 2;
    uint64_t v23 = obj;
  }
  else
  {
    uint64_t v23 = obj;
    if ((v22 & (v22 - 1)) != 0) {
      unint64_t v22 = std::__next_prime(v22);
    }
  }
  int8x8_t v24 = *(int8x8_t *)(v270 + 2568);
  if (v22 > *(void *)&v24) {
    goto LABEL_28;
  }
  if (v22 < *(void *)&v24)
  {
    unint64_t v25 = vcvtps_u32_f32((float)*(unint64_t *)(v270 + 2584) / *(float *)(v270 + 2592));
    if (*(void *)&v24 < 3uLL || (uint8x8_t v26 = (uint8x8_t)vcnt_s8(v24), v26.i16[0] = vaddlv_u8(v26), v26.u32[0] > 1uLL))
    {
      unint64_t v25 = std::__next_prime(v25);
    }
    else
    {
      uint64_t v27 = 1 << -(char)__clz(v25 - 1);
      if (v25 >= 2) {
        unint64_t v25 = v27;
      }
    }
    if (v22 <= v25) {
      unint64_t v22 = v25;
    }
    if (v22 < *(void *)&v24) {
LABEL_28:
    }
      std::__hash_table<std::__hash_value_type<std::string,unsigned int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,unsigned int>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,unsigned int>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,unsigned int>>>::__do_rehash<true>(p_vertex_spill_params, v22);
  }
  v268 = (uint64_t *)(v270 + 2912);
  iosurface = (std::__shared_weak_count *)v260[10].resource_info[4].iosurface;
  v286[0] = (uint64_t)v260[10].resource_info[3].iosurface;
  v286[1] = (uint64_t)iosurface;
  if (iosurface) {
    atomic_fetch_add_explicit(&iosurface->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  int v29 = AGX::mergeAndInsertAdditionalBinaryLinkedFunctions<AGX::HAL200::ObjClasses,AGX::HAL200::Classes>(v12, v23, v14, v268, v286, (int)v260[3].resource_info[13].iosurface, (uint64_t *)&v283);
  if (iosurface && !atomic_fetch_add(&iosurface->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))iosurface->__on_zero_shared)(iosurface);
    std::__shared_weak_count::__release_weak(iosurface);
  }
  if (*(void *)v270)
  {
    if (!v29)
    {
      int v43 = 0;
      uint64_t v33 = v270;
      goto LABEL_294;
    }
    uint64_t v30 = (std::__shared_weak_count *)v260[10].resource_info[6].iosurface;
    v285[0] = (uint64_t)v260[10].resource_info[5].iosurface;
    v285[1] = (uint64_t)v30;
    if (v30) {
      atomic_fetch_add_explicit(&v30->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    int v31 = AGX::mergeAndInsertAdditionalBinaryLinkedFunctions<AGX::HAL200::ObjClasses,AGX::HAL200::Classes>(v12, v257, p_vertex_spill_params, (uint64_t *)(v270 + 2928), v285, (int)v260[4].resource_info[14].iosurface, (uint64_t *)&v283);
    char v32 = v31;
    uint64_t v33 = v270;
    if (v30 && !atomic_fetch_add(&v30->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v30->__on_zero_shared)(v30);
      std::__shared_weak_count::__release_weak(v30);
      if (v32) {
        goto LABEL_51;
      }
    }
    else if (v31)
    {
LABEL_51:
      uint64_t v34 = *(void *)(v33 + 8);
      v262 = v260[10].resource_info[3].iosurface;
      v35 = (std::__shared_weak_count *)v260[10].resource_info[4].iosurface;
      if (v35) {
        atomic_fetch_add_explicit(&v35->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      v255 = v35;
      int v36 = *(unsigned __int8 *)(v33 + 709);
      uint64_t v38 = *((void *)v262 + 4);
      uint64_t v37 = *((void *)v262 + 5);
      uint64_t v39 = [v23 count];
      uint64_t v40 = (v37 - v38) / 1304 + 4 * v39;
      unint64_t v41 = v40 + 1;
      if (v40 == -1)
      {
        uint64_t v42 = 0;
        __p = 0;
      }
      else
      {
        if (v41 > 0x2AAAAAAAAAAAAAALL) {
          abort();
        }
        __p = (char *)operator new(96 * v41);
        uint64_t v42 = &__p[96 * v41];
      }
      uint64_t v253 = v39;
      unint64_t v254 = 4 * v39;
      v299 = 0;
      v300 = 0;
      v301 = 0;
      unint64_t v44 = v41 + ((uint64_t)(*(void *)(v33 + 2408) - *(void *)(v33 + 2400)) >> 4);
      uint64_t v264 = (v37 - v38) / 1304;
      int v252 = v36;
      uint64_t v274 = v38;
      uint64_t v278 = v37;
      if (v44)
      {
        if (v44 > 0x333333333333333) {
          abort();
        }
        v45 = v42;
        v46 = (char *)operator new(80 * v44);
        v47 = &v46[80 * v44];
        v299 = v46;
        v300 = v46;
        v301 = v47;
        uint64_t v42 = v45;
      }
      else
      {
        v47 = 0;
        v46 = 0;
      }
      uint64_t v48 = v34 + 1208;
      long long v49 = *(_OWORD *)(v34 + 1208);
      uint64_t v50 = v34;
      uint64_t v51 = v33 + 960;
      v52 = &v260[3].resource_info[4];
      uint64_t v53 = v50 + 8;
      long long v302 = v49;
      uint64_t v303 = *(void *)(v50 + 1224);
      uint64_t v54 = *(void *)(v50 + 1464);
      uint64_t v55 = *(void *)(v50 + 1456);
      uint64_t v56 = *(void *)(v50 + 1472);
      uint64_t v57 = v50 + 2544;
      long long v289 = *(_OWORD *)(v50 + 2544);
      uint64_t v251 = v50;
      *(void *)&long long v290 = *(void *)(v50 + 2560);
      if (__p >= v42)
      {
        uint64_t v266 = v54;
        uint64_t v271 = v56;
        unint64_t v62 = 0x5555555555555556 * ((v42 - __p) >> 5);
        if (v62 <= 1) {
          unint64_t v62 = 1;
        }
        if (0xAAAAAAAAAAAAAAABLL * ((v42 - __p) >> 5) >= 0x155555555555555) {
          unint64_t v63 = 0x2AAAAAAAAAAAAAALL;
        }
        else {
          unint64_t v63 = v62;
        }
        if (v63 > 0x2AAAAAAAAAAAAAALL) {
          std::__throw_bad_array_new_length[abi:nn180100]();
        }
        v64 = (char *)operator new(96 * v63);
        v65 = &v64[96 * v63];
        *(void *)v64 = v53;
        uint64_t v66 = *(void *)(v48 + 16);
        *(_OWORD *)(v64 + 8) = *(_OWORD *)v48;
        *((void *)v64 + 3) = v66;
        *((void *)v64 + 4) = v55;
        uint64_t v61 = v266;
        *((void *)v64 + 5) = v266;
        *((void *)v64 + 6) = v271;
        uint64_t v67 = *(void *)(v57 + 16);
        *(_OWORD *)(v64 + 56) = *(_OWORD *)v57;
        *((void *)v64 + 9) = v67;
        *((void *)v64 + 10) = v51;
        *((void *)v64 + 11) = v52;
        v60 = v64 + 96;
        if (__p) {
          operator delete(__p);
        }
        __p = v64;
        uint64_t v42 = v65;
        uint64_t v56 = v271;
      }
      else
      {
        *(void *)__p = v53;
        uint64_t v58 = *(void *)(v48 + 16);
        *(_OWORD *)(__p + 8) = *(_OWORD *)v48;
        *((void *)__p + 3) = v58;
        *((void *)__p + 4) = v55;
        *((void *)__p + 5) = v54;
        *((void *)__p + 6) = v56;
        uint64_t v59 = *(void *)(v50 + 2560);
        *(_OWORD *)(__p + 56) = *(_OWORD *)v57;
        *((void *)__p + 9) = v59;
        *((void *)__p + 10) = v51;
        *((void *)__p + 11) = v52;
        v60 = __p + 96;
        uint64_t v61 = v54;
      }
      if (v46 >= v47)
      {
        unint64_t v70 = 0x999999999999999ALL * ((v47 - v46) >> 4);
        if (v70 <= 1) {
          unint64_t v70 = 1;
        }
        if (0xCCCCCCCCCCCCCCCDLL * ((v47 - v46) >> 4) >= 0x199999999999999) {
          unint64_t v71 = 0x333333333333333;
        }
        else {
          unint64_t v71 = v70;
        }
        if (v71 > 0x333333333333333) {
          std::__throw_bad_array_new_length[abi:nn180100]();
        }
        v72 = v42;
        v73 = (char *)operator new(80 * v71);
        *(void *)v73 = v53;
        *(_OWORD *)(v73 + 8) = v302;
        *((void *)v73 + 3) = v303;
        *((void *)v73 + 4) = v55;
        *((void *)v73 + 5) = v61;
        *((void *)v73 + 6) = v56;
        *(_OWORD *)(v73 + 56) = v289;
        *((void *)v73 + 9) = v290;
        v68 = v73 + 80;
        v299 = v73;
        v301 = &v73[80 * v71];
        if (v46) {
          operator delete(v46);
        }
        unint64_t v69 = v264;
        uint64_t v42 = v72;
      }
      else
      {
        *(void *)v46 = v53;
        *(_OWORD *)(v46 + 8) = v302;
        *((void *)v46 + 3) = v303;
        *((void *)v46 + 4) = v55;
        *((void *)v46 + 5) = v61;
        *((void *)v46 + 6) = v56;
        *(_OWORD *)(v46 + 56) = v289;
        v68 = v46 + 80;
        *((void *)v46 + 9) = v290;
        unint64_t v69 = v264;
      }
      v300 = v68;
      if (v278 != v274)
      {
        uint64_t v74 = 0;
        if (v69 <= 1) {
          unint64_t v69 = 1;
        }
        unint64_t v261 = v69;
        do
        {
          uint64_t v75 = 0;
          uint64_t v267 = v74;
          uint64_t v76 = 1304 * v74;
          uint64_t v272 = *((void *)v262 + 4) + v76 + 112;
          uint64_t v275 = *(void *)(*v268 + 32) + v76 + 112;
          do
          {
            v79 = (uint64_t *)(v275 + 296 * v75);
            uint64_t v80 = *v79;
            if (*v79)
            {
              uint64_t v81 = v80 + 8;
              long long v302 = *(_OWORD *)(v80 + 1160);
              uint64_t v303 = *(void *)(v80 + 1176);
              uint64_t v82 = *(void *)(v80 + 1416);
              uint64_t v83 = *(void *)(v80 + 1408);
              uint64_t v84 = *(void *)(v80 + 1424);
              long long v289 = *(_OWORD *)(v80 + 2496);
              *(void *)&long long v290 = *(void *)(v80 + 2512);
              long long v297 = *(_OWORD *)(v80 + 1160);
              v298 = *(char **)(v80 + 1176);
              v85 = v79 + 1;
              long long v295 = *(_OWORD *)(v80 + 2496);
              uint64_t v86 = v272 + 296 * v75 + 8;
              v296 = *(char **)(v80 + 2512);
              if (v60 >= v42)
              {
                unint64_t v88 = 0xAAAAAAAAAAAAAAABLL * ((v60 - __p) >> 5) + 1;
                if (v88 > 0x2AAAAAAAAAAAAAALL) {
                  abort();
                }
                if (0x5555555555555556 * ((v42 - __p) >> 5) > v88) {
                  unint64_t v88 = 0x5555555555555556 * ((v42 - __p) >> 5);
                }
                if (0xAAAAAAAAAAAAAAABLL * ((v42 - __p) >> 5) >= 0x155555555555555) {
                  unint64_t v89 = 0x2AAAAAAAAAAAAAALL;
                }
                else {
                  unint64_t v89 = v88;
                }
                if (v89)
                {
                  if (v89 > 0x2AAAAAAAAAAAAAALL) {
                    std::__throw_bad_array_new_length[abi:nn180100]();
                  }
                  uint64_t v90 = v80 + 8;
                  uint64_t v91 = v83;
                  uint64_t v92 = v84;
                  uint64_t v93 = v82;
                  unint64_t v94 = v89;
                  v95 = (char *)operator new(96 * v89);
                  uint64_t v82 = v93;
                  uint64_t v84 = v92;
                  uint64_t v83 = v91;
                  uint64_t v81 = v90;
                  uint64_t v86 = v272 + 296 * v75 + 8;
                  unint64_t v89 = v94;
                }
                else
                {
                  v95 = 0;
                }
                v96 = &v95[32 * ((v60 - __p) >> 5)];
                *(void *)v96 = v81;
                *(_OWORD *)(v96 + 8) = v297;
                *((void *)v96 + 3) = v298;
                *((void *)v96 + 4) = v83;
                *((void *)v96 + 5) = v82;
                *((void *)v96 + 6) = v84;
                *(_OWORD *)(v96 + 56) = v295;
                *((void *)v96 + 9) = v296;
                *((void *)v96 + 10) = v85;
                *((void *)v96 + 11) = v86;
                if (v60 == __p)
                {
                  v99 = &v95[32 * ((v60 - __p) >> 5)];
                  v98 = __p;
                }
                else
                {
                  v97 = &v95[32 * ((v60 - __p) >> 5)];
                  v98 = __p;
                  do
                  {
                    v99 = v97 - 96;
                    long long v100 = *((_OWORD *)v60 - 5);
                    *((_OWORD *)v97 - 6) = *((_OWORD *)v60 - 6);
                    *((_OWORD *)v97 - 5) = v100;
                    long long v101 = *((_OWORD *)v60 - 4);
                    long long v102 = *((_OWORD *)v60 - 3);
                    long long v103 = *((_OWORD *)v60 - 1);
                    *((_OWORD *)v97 - 2) = *((_OWORD *)v60 - 2);
                    *((_OWORD *)v97 - 1) = v103;
                    *((_OWORD *)v97 - 4) = v101;
                    *((_OWORD *)v97 - 3) = v102;
                    v60 -= 96;
                    v97 -= 96;
                  }
                  while (v60 != __p);
                }
                uint64_t v42 = &v95[96 * v89];
                v60 = v96 + 96;
                if (v98)
                {
                  v104 = &v95[96 * v89];
                  uint64_t v105 = v82;
                  uint64_t v106 = v81;
                  operator delete(v98);
                  uint64_t v81 = v106;
                  uint64_t v82 = v105;
                  uint64_t v42 = v104;
                }
                __p = v99;
              }
              else
              {
                *(void *)v60 = v81;
                v87 = v298;
                *(_OWORD *)(v60 + 8) = v297;
                *((void *)v60 + 3) = v87;
                *((void *)v60 + 4) = v83;
                *((void *)v60 + 5) = v82;
                *((void *)v60 + 6) = v84;
                *(_OWORD *)(v60 + 56) = v295;
                *((void *)v60 + 9) = v296;
                *((void *)v60 + 10) = v85;
                *((void *)v60 + 11) = v86;
                v60 += 96;
                v68 = v300;
              }
              if (v68 < v301)
              {
                *(void *)v68 = v81;
                uint64_t v77 = v303;
                *(_OWORD *)(v68 + 8) = v302;
                *((void *)v68 + 3) = v77;
                *((void *)v68 + 4) = v83;
                *((void *)v68 + 5) = v82;
                *((void *)v68 + 6) = v84;
                *(_OWORD *)(v68 + 56) = v289;
                *((void *)v68 + 9) = v290;
                v78 = v68 + 80;
              }
              else
              {
                v107 = (char *)v299;
                unint64_t v108 = 0xCCCCCCCCCCCCCCCDLL * ((v68 - (unsigned char *)v299) >> 4);
                unint64_t v109 = v108 + 1;
                if (v108 + 1 > 0x333333333333333) {
                  abort();
                }
                if (0x999999999999999ALL * ((v301 - (unsigned char *)v299) >> 4) > v109) {
                  unint64_t v109 = 0x999999999999999ALL * ((v301 - (unsigned char *)v299) >> 4);
                }
                if (0xCCCCCCCCCCCCCCCDLL * ((v301 - (unsigned char *)v299) >> 4) >= 0x199999999999999) {
                  unint64_t v110 = 0x333333333333333;
                }
                else {
                  unint64_t v110 = v109;
                }
                v279 = v42;
                if (v110)
                {
                  if (v110 > 0x333333333333333) {
                    std::__throw_bad_array_new_length[abi:nn180100]();
                  }
                  uint64_t v111 = v81;
                  uint64_t v112 = v82;
                  v113 = (char *)operator new(80 * v110);
                  uint64_t v82 = v112;
                  uint64_t v81 = v111;
                }
                else
                {
                  v113 = 0;
                }
                v114 = &v113[80 * v108];
                *(void *)v114 = v81;
                *(_OWORD *)(v114 + 8) = v302;
                *((void *)v114 + 3) = v303;
                *((void *)v114 + 4) = v83;
                *((void *)v114 + 5) = v82;
                *((void *)v114 + 6) = v84;
                *(_OWORD *)(v114 + 56) = v289;
                *((void *)v114 + 9) = v290;
                v115 = v114;
                if (v68 != v107)
                {
                  do
                  {
                    *((_OWORD *)v115 - 5) = *((_OWORD *)v68 - 5);
                    long long v116 = *((_OWORD *)v68 - 4);
                    long long v117 = *((_OWORD *)v68 - 3);
                    long long v118 = *((_OWORD *)v68 - 1);
                    *((_OWORD *)v115 - 2) = *((_OWORD *)v68 - 2);
                    *((_OWORD *)v115 - 1) = v118;
                    *((_OWORD *)v115 - 4) = v116;
                    *((_OWORD *)v115 - 3) = v117;
                    v115 -= 80;
                    v68 -= 80;
                  }
                  while (v68 != v107);
                  v68 = v107;
                }
                v78 = v114 + 80;
                v299 = v115;
                v301 = &v113[80 * v110];
                if (v68) {
                  operator delete(v68);
                }
                uint64_t v42 = v279;
              }
              v300 = v78;
              v68 = v78;
            }
            ++v75;
          }
          while (v75 != 4);
          uint64_t v74 = v267 + 1;
        }
        while (v267 + 1 != v261);
      }
      v119 = *(uint64_t **)(v270 + 2400);
      v120 = *(uint64_t **)(v270 + 2408);
      v121 = v42;
      if (v119 != v120)
      {
        while (1)
        {
          uint64_t v122 = *v119;
          v123 = (std::__shared_weak_count *)v119[1];
          if (v123) {
            atomic_fetch_add_explicit(&v123->__shared_owners_, 1uLL, memory_order_relaxed);
          }
          uint64_t v124 = v122 + 96;
          long long v302 = *(_OWORD *)(v122 + 680);
          uint64_t v303 = *(void *)(v122 + 696);
          long long v289 = *(_OWORD *)(v122 + 768);
          *(void *)&long long v290 = *(void *)(v122 + 784);
          long long v297 = *(_OWORD *)(v122 + 944);
          v298 = *(char **)(v122 + 960);
          v125 = v300;
          if (v300 >= v301) {
            break;
          }
          *(void *)v300 = v124;
          *(_OWORD *)(v125 + 8) = v302;
          *((void *)v125 + 3) = v303;
          *((_OWORD *)v125 + 2) = v289;
          *((void *)v125 + 6) = v290;
          *(_OWORD *)(v125 + 56) = v297;
          *((void *)v125 + 9) = v298;
          v300 = v125 + 80;
          if (v123) {
            goto LABEL_157;
          }
LABEL_135:
          v119 += 2;
          if (v119 == v120) {
            goto LABEL_159;
          }
        }
        v126 = (char *)v299;
        unint64_t v127 = 0xCCCCCCCCCCCCCCCDLL * ((v300 - (unsigned char *)v299) >> 4);
        unint64_t v128 = v127 + 1;
        if (v127 + 1 > 0x333333333333333) {
          abort();
        }
        if (0x999999999999999ALL * ((v301 - (unsigned char *)v299) >> 4) > v128) {
          unint64_t v128 = 0x999999999999999ALL * ((v301 - (unsigned char *)v299) >> 4);
        }
        if (0xCCCCCCCCCCCCCCCDLL * ((v301 - (unsigned char *)v299) >> 4) >= 0x199999999999999) {
          unint64_t v129 = 0x333333333333333;
        }
        else {
          unint64_t v129 = v128;
        }
        if (v129)
        {
          if (v129 > 0x333333333333333) {
            std::__throw_bad_array_new_length[abi:nn180100]();
          }
          v130 = (char *)operator new(80 * v129);
        }
        else
        {
          v130 = 0;
        }
        v131 = &v130[80 * v127];
        *(void *)v131 = v124;
        *(_OWORD *)(v131 + 8) = v302;
        *((void *)v131 + 3) = v303;
        *((_OWORD *)v131 + 2) = v289;
        *((void *)v131 + 6) = v290;
        *(_OWORD *)(v131 + 56) = v297;
        *((void *)v131 + 9) = v298;
        v132 = v131;
        if (v125 != v126)
        {
          do
          {
            *((_OWORD *)v132 - 5) = *((_OWORD *)v125 - 5);
            long long v133 = *((_OWORD *)v125 - 4);
            long long v134 = *((_OWORD *)v125 - 3);
            long long v135 = *((_OWORD *)v125 - 1);
            *((_OWORD *)v132 - 2) = *((_OWORD *)v125 - 2);
            *((_OWORD *)v132 - 1) = v135;
            *((_OWORD *)v132 - 4) = v133;
            *((_OWORD *)v132 - 3) = v134;
            v132 -= 80;
            v125 -= 80;
          }
          while (v125 != v126);
          v125 = v126;
        }
        v136 = &v130[80 * v129];
        v137 = v131 + 80;
        v299 = v132;
        v301 = v136;
        if (v125) {
          operator delete(v125);
        }
        uint64_t v42 = v121;
        v300 = v137;
        if (!v123) {
          goto LABEL_135;
        }
LABEL_157:
        if (!atomic_fetch_add(&v123->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
        {
          ((void (*)(std::__shared_weak_count *))v123->__on_zero_shared)(v123);
          std::__shared_weak_count::__release_weak(v123);
          uint64_t v42 = v121;
        }
        goto LABEL_135;
      }
LABEL_159:
      long long v297 = 0uLL;
      v298 = 0;
      if (v254)
      {
        if (v254 > 0x333333333333333) {
          abort();
        }
        v138 = (char *)operator new(320 * v253);
        uint64_t v33 = v270;
        unint64_t v139 = v264;
        v140 = v138;
        *(void *)&long long v297 = v138;
        *((void *)&v297 + 1) = v138;
        v298 = &v138[80 * v254];
        uint64_t v42 = v121;
      }
      else
      {
        v140 = 0;
        uint64_t v33 = v270;
        unint64_t v139 = v264;
      }
      uint64_t v141 = *(void *)(*v268 + 32);
      if (v139 < 0x1F693A1C451AB30BLL * ((*(void *)(*v268 + 40) - v141) >> 3))
      {
        do
        {
          uint64_t v142 = 0;
          unint64_t v265 = v139;
          uint64_t v276 = v141 + 1304 * v139 + 112;
          do
          {
            v145 = (uint64_t *)(v276 + 296 * v142);
            uint64_t v146 = *v145;
            if (*v145)
            {
              uint64_t v147 = v146 + 8;
              long long v302 = *(_OWORD *)(v146 + 1160);
              uint64_t v303 = *(void *)(v146 + 1176);
              uint64_t v148 = *(void *)(v146 + 1416);
              uint64_t v149 = *(void *)(v146 + 1408);
              uint64_t v150 = *(void *)(v146 + 1424);
              long long v289 = *(_OWORD *)(v146 + 2496);
              *(void *)&long long v290 = *(void *)(v146 + 2512);
              long long v295 = *(_OWORD *)(v146 + 1160);
              v296 = *(char **)(v146 + 1176);
              long long v293 = *(_OWORD *)(v146 + 2496);
              v151 = v145 + 1;
              uint64_t v294 = *(void *)(v146 + 2512);
              if (v60 >= v42)
              {
                unint64_t v153 = 0xAAAAAAAAAAAAAAABLL * ((v60 - __p) >> 5) + 1;
                if (v153 > 0x2AAAAAAAAAAAAAALL) {
                  abort();
                }
                if (0x5555555555555556 * ((v42 - __p) >> 5) > v153) {
                  unint64_t v153 = 0x5555555555555556 * ((v42 - __p) >> 5);
                }
                if (0xAAAAAAAAAAAAAAABLL * ((v42 - __p) >> 5) >= 0x155555555555555) {
                  unint64_t v154 = 0x2AAAAAAAAAAAAAALL;
                }
                else {
                  unint64_t v154 = v153;
                }
                if (v154)
                {
                  if (v154 > 0x2AAAAAAAAAAAAAALL) {
                    std::__throw_bad_array_new_length[abi:nn180100]();
                  }
                  uint64_t v155 = v148;
                  v156 = (char *)operator new(96 * v154);
                  uint64_t v148 = v155;
                }
                else
                {
                  v156 = 0;
                }
                v157 = &v156[32 * ((v60 - __p) >> 5)];
                *(void *)v157 = v147;
                *(_OWORD *)(v157 + 8) = v295;
                *((void *)v157 + 3) = v296;
                *((void *)v157 + 4) = v149;
                *((void *)v157 + 5) = v148;
                *((void *)v157 + 6) = v150;
                *(_OWORD *)(v157 + 56) = v293;
                *((void *)v157 + 9) = v294;
                *((void *)v157 + 10) = v151;
                *((void *)v157 + 11) = v151;
                if (v60 == __p)
                {
                  v160 = &v156[32 * ((v60 - __p) >> 5)];
                  v159 = __p;
                }
                else
                {
                  v158 = &v156[32 * ((v60 - __p) >> 5)];
                  v159 = __p;
                  do
                  {
                    v160 = v158 - 96;
                    long long v161 = *((_OWORD *)v60 - 5);
                    *((_OWORD *)v158 - 6) = *((_OWORD *)v60 - 6);
                    *((_OWORD *)v158 - 5) = v161;
                    long long v162 = *((_OWORD *)v60 - 4);
                    long long v163 = *((_OWORD *)v60 - 3);
                    long long v164 = *((_OWORD *)v60 - 1);
                    *((_OWORD *)v158 - 2) = *((_OWORD *)v60 - 2);
                    *((_OWORD *)v158 - 1) = v164;
                    *((_OWORD *)v158 - 4) = v162;
                    *((_OWORD *)v158 - 3) = v163;
                    v60 -= 96;
                    v158 -= 96;
                  }
                  while (v60 != __p);
                }
                uint64_t v42 = &v156[96 * v154];
                v60 = v157 + 96;
                if (v159)
                {
                  v165 = &v156[96 * v154];
                  uint64_t v166 = v149;
                  uint64_t v167 = v150;
                  uint64_t v168 = v148;
                  operator delete(v159);
                  uint64_t v148 = v168;
                  uint64_t v150 = v167;
                  uint64_t v149 = v166;
                  uint64_t v42 = v165;
                }
                __p = v160;
              }
              else
              {
                *(void *)v60 = v147;
                v152 = v296;
                *(_OWORD *)(v60 + 8) = v295;
                *((void *)v60 + 3) = v152;
                *((void *)v60 + 4) = v149;
                *((void *)v60 + 5) = v148;
                *((void *)v60 + 6) = v150;
                *(_OWORD *)(v60 + 56) = v293;
                *((void *)v60 + 9) = v294;
                *((void *)v60 + 10) = v151;
                *((void *)v60 + 11) = v151;
                v60 += 96;
                v140 = (char *)*((void *)&v297 + 1);
              }
              if (v140 < v298)
              {
                *(void *)v140 = v147;
                uint64_t v143 = v303;
                *(_OWORD *)(v140 + 8) = v302;
                *((void *)v140 + 3) = v143;
                *((void *)v140 + 4) = v149;
                *((void *)v140 + 5) = v148;
                *((void *)v140 + 6) = v150;
                *(_OWORD *)(v140 + 56) = v289;
                *((void *)v140 + 9) = v290;
                v144 = v140 + 80;
                uint64_t v33 = v270;
              }
              else
              {
                v169 = (char *)v297;
                unint64_t v170 = 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)&v140[-v297] >> 4);
                unint64_t v171 = v170 + 1;
                if (v170 + 1 > 0x333333333333333) {
                  abort();
                }
                if (0x999999999999999ALL * ((uint64_t)&v298[-v297] >> 4) > v171) {
                  unint64_t v171 = 0x999999999999999ALL * ((uint64_t)&v298[-v297] >> 4);
                }
                if (0xCCCCCCCCCCCCCCCDLL * ((uint64_t)&v298[-v297] >> 4) >= 0x199999999999999) {
                  unint64_t v172 = 0x333333333333333;
                }
                else {
                  unint64_t v172 = v171;
                }
                v280 = v42;
                if (v172)
                {
                  if (v172 > 0x333333333333333) {
                    std::__throw_bad_array_new_length[abi:nn180100]();
                  }
                  uint64_t v173 = v147;
                  uint64_t v174 = v149;
                  uint64_t v175 = v150;
                  uint64_t v176 = v148;
                  v177 = (char *)operator new(80 * v172);
                  uint64_t v148 = v176;
                  uint64_t v150 = v175;
                  uint64_t v149 = v174;
                  uint64_t v147 = v173;
                }
                else
                {
                  v177 = 0;
                }
                v178 = &v177[80 * v170];
                *(void *)v178 = v147;
                *(_OWORD *)(v178 + 8) = v302;
                *((void *)v178 + 3) = v303;
                *((void *)v178 + 4) = v149;
                *((void *)v178 + 5) = v148;
                *((void *)v178 + 6) = v150;
                *(_OWORD *)(v178 + 56) = v289;
                *((void *)v178 + 9) = v290;
                v179 = v178;
                if (v140 == v169)
                {
                  uint64_t v33 = v270;
                }
                else
                {
                  uint64_t v33 = v270;
                  do
                  {
                    *((_OWORD *)v179 - 5) = *((_OWORD *)v140 - 5);
                    long long v180 = *((_OWORD *)v140 - 4);
                    long long v181 = *((_OWORD *)v140 - 3);
                    long long v182 = *((_OWORD *)v140 - 1);
                    *((_OWORD *)v179 - 2) = *((_OWORD *)v140 - 2);
                    *((_OWORD *)v179 - 1) = v182;
                    *((_OWORD *)v179 - 4) = v180;
                    *((_OWORD *)v179 - 3) = v181;
                    v179 -= 80;
                    v140 -= 80;
                  }
                  while (v140 != v169);
                  v140 = v169;
                }
                v144 = v178 + 80;
                *(void *)&long long v297 = v179;
                v298 = &v177[80 * v172];
                if (v140) {
                  operator delete(v140);
                }
                uint64_t v42 = v280;
              }
              *((void *)&v297 + 1) = v144;
              v140 = v144;
            }
            ++v142;
          }
          while (v142 != 4);
          unint64_t v139 = v265 + 1;
          uint64_t v141 = *(void *)(*v268 + 32);
        }
        while (v265 + 1 < 0x1F693A1C451AB30BLL * ((*(void *)(*v268 + 40) - v141) >> 3));
      }
      long long v292 = 0u;
      long long v290 = 0u;
      long long v291 = 0u;
      long long v289 = 0u;
      uint64_t v183 = [obj countByEnumeratingWithState:&v289 objects:&v302 count:16];
      if (v183)
      {
        uint64_t v269 = v33 + 2400;
        p_vtable = (void **)(&OBJC_METACLASS___AGXG17FamilyComputeProgram + 24);
        uint64_t v281 = *(void *)v290;
        unint64_t v185 = 0x268D57000;
        while (2)
        {
          uint64_t v186 = 0;
          uint64_t v277 = v183;
          do
          {
            if (*(void *)v290 != v281) {
              objc_enumerationMutation(obj);
            }
            v187 = *(void **)(*((void *)&v289 + 1) + 8 * v186);
            if (([v263 requiresRaytracingEmulation] & 1) != 0 || objc_msgSend(v187, "functionType") != 6)
            {
              if (![v187 vendorPrivate]
                || ([v187 vendorPrivate], objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
                || (uint64_t v188 = [v187 vendorPrivate], (v189 = (char *)v188) == 0))
              {
                int v233 = 0;
                goto LABEL_275;
              }
              uint64_t v190 = *(int *)(v185 + 1956);
              v191 = (__n128 *)(v188 + v190);
              unint64_t v192 = *(void *)(v188 + v190);
              v193 = *(__n128 **)(v33 + 2408);
              if ((unint64_t)v193 >= *(void *)(v33 + 2416))
              {
                v195 = std::vector<std::shared_ptr<AGX::HAL200::DynamicLibrary>>::__emplace_back_slow_path<std::shared_ptr<AGX::HAL200::DynamicLibrary>&>(v269, *v191);
                uint64_t v190 = *(int *)(v185 + 1956);
              }
              else
              {
                v193->n128_u64[0] = v192;
                unint64_t v194 = v191->n128_u64[1];
                v193->n128_u64[1] = v194;
                if (v194) {
                  atomic_fetch_add_explicit((atomic_ullong *volatile)(v194 + 8), 1uLL, memory_order_relaxed);
                }
                v195 = v193 + 1;
              }
              unint64_t v196 = v192 + 96;
              *(void *)(v33 + 2408) = v195;
              uint64_t v197 = *(void *)&v189[v190];
              v296 = *(char **)(v197 + 696);
              long long v295 = *(_OWORD *)(v197 + 680);
              long long v293 = *(_OWORD *)(v197 + 768);
              uint64_t v294 = *(void *)(v197 + 784);
              long long v287 = *(_OWORD *)(v197 + 944);
              uint64_t v288 = *(void *)(v197 + 960);
              if (v140 >= v298)
              {
                v199 = (char *)v297;
                unint64_t v200 = 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)&v140[-v297] >> 4);
                unint64_t v201 = v200 + 1;
                if (v200 + 1 > 0x333333333333333) {
                  abort();
                }
                if (0x999999999999999ALL * ((uint64_t)&v298[-v297] >> 4) > v201) {
                  unint64_t v201 = 0x999999999999999ALL * ((uint64_t)&v298[-v297] >> 4);
                }
                if (0xCCCCCCCCCCCCCCCDLL * ((uint64_t)&v298[-v297] >> 4) >= 0x199999999999999) {
                  unint64_t v202 = 0x333333333333333;
                }
                else {
                  unint64_t v202 = v201;
                }
                if (v202)
                {
                  v273 = v189;
                  if (v202 > 0x333333333333333) {
                    std::__throw_bad_array_new_length[abi:nn180100]();
                  }
                  uint64_t v203 = v186;
                  uint64_t v204 = v190;
                  uint64_t v205 = v183;
                  v206 = p_vtable;
                  unint64_t v207 = v196;
                  unint64_t v208 = v202;
                  v209 = (char *)operator new(80 * v202);
                  unint64_t v196 = v207;
                  p_vtable = v206;
                  uint64_t v183 = v205;
                  uint64_t v190 = v204;
                  unint64_t v202 = v208;
                  uint64_t v186 = v203;
                  v189 = v273;
                }
                else
                {
                  v209 = 0;
                }
                v210 = &v209[80 * v200];
                *(void *)v210 = v196;
                *(_OWORD *)(v210 + 8) = v295;
                *((void *)v210 + 3) = v296;
                *((_OWORD *)v210 + 2) = v293;
                *((void *)v210 + 6) = v294;
                *(_OWORD *)(v210 + 56) = v287;
                *((void *)v210 + 9) = v288;
                if (v140 == v199)
                {
                  v199 = v140;
                  v211 = &v209[80 * v200];
                  uint64_t v33 = v270;
                }
                else
                {
                  v211 = &v209[80 * v200];
                  uint64_t v33 = v270;
                  do
                  {
                    *((_OWORD *)v211 - 5) = *((_OWORD *)v140 - 5);
                    long long v212 = *((_OWORD *)v140 - 4);
                    long long v213 = *((_OWORD *)v140 - 3);
                    long long v214 = *((_OWORD *)v140 - 1);
                    *((_OWORD *)v211 - 2) = *((_OWORD *)v140 - 2);
                    *((_OWORD *)v211 - 1) = v214;
                    *((_OWORD *)v211 - 4) = v212;
                    *((_OWORD *)v211 - 3) = v213;
                    v211 -= 80;
                    v140 -= 80;
                  }
                  while (v140 != v199);
                }
                v140 = v210 + 80;
                *(void *)&long long v297 = v211;
                *((void *)&v297 + 1) = v210 + 80;
                v298 = &v209[80 * v202];
                if (v199)
                {
                  v215 = v199;
                  unint64_t v216 = v196;
                  operator delete(v215);
                  unint64_t v196 = v216;
                  unint64_t v185 = 0x268D57000uLL;
                  uint64_t v190 = 56;
                }
                else
                {
                  unint64_t v185 = 0x268D57000;
                }
              }
              else
              {
                *(void *)v140 = v196;
                long long v198 = v295;
                *((void *)v140 + 3) = v296;
                *(_OWORD *)(v140 + 8) = v198;
                *((_OWORD *)v140 + 2) = v293;
                *((void *)v140 + 6) = v294;
                *(_OWORD *)(v140 + 56) = v287;
                *((void *)v140 + 9) = v288;
                v140 += 80;
              }
              *((void *)&v297 + 1) = v140;
              uint64_t v217 = *(void *)&v189[v190];
              v296 = *(char **)(v217 + 696);
              long long v295 = *(_OWORD *)(v217 + 680);
              long long v293 = *(_OWORD *)(v217 + 768);
              uint64_t v294 = *(void *)(v217 + 784);
              long long v287 = *(_OWORD *)(v217 + 944);
              uint64_t v288 = *(void *)(v217 + 960);
              v218 = v300;
              if (v300 >= v301)
              {
                v219 = (char *)v299;
                unint64_t v220 = 0xCCCCCCCCCCCCCCCDLL * ((v300 - (unsigned char *)v299) >> 4);
                unint64_t v221 = v220 + 1;
                if (v220 + 1 > 0x333333333333333) {
                  abort();
                }
                if (0x999999999999999ALL * ((v301 - (unsigned char *)v299) >> 4) > v221) {
                  unint64_t v221 = 0x999999999999999ALL * ((v301 - (unsigned char *)v299) >> 4);
                }
                if (0xCCCCCCCCCCCCCCCDLL * ((v301 - (unsigned char *)v299) >> 4) >= 0x199999999999999) {
                  unint64_t v222 = 0x333333333333333;
                }
                else {
                  unint64_t v222 = v221;
                }
                if (v222)
                {
                  if (v222 > 0x333333333333333) {
                    std::__throw_bad_array_new_length[abi:nn180100]();
                  }
                  unint64_t v223 = v196;
                  v224 = (char *)operator new(80 * v222);
                  unint64_t v196 = v223;
                }
                else
                {
                  v224 = 0;
                }
                v225 = &v224[80 * v220];
                *(void *)v225 = v196;
                *(_OWORD *)(v225 + 8) = v295;
                *((void *)v225 + 3) = v296;
                *((_OWORD *)v225 + 2) = v293;
                *((void *)v225 + 6) = v294;
                *(_OWORD *)(v225 + 56) = v287;
                *((void *)v225 + 9) = v288;
                v226 = v225;
                if (v218 != v219)
                {
                  do
                  {
                    *((_OWORD *)v226 - 5) = *((_OWORD *)v218 - 5);
                    long long v227 = *((_OWORD *)v218 - 4);
                    long long v228 = *((_OWORD *)v218 - 3);
                    long long v229 = *((_OWORD *)v218 - 1);
                    *((_OWORD *)v226 - 2) = *((_OWORD *)v218 - 2);
                    *((_OWORD *)v226 - 1) = v229;
                    *((_OWORD *)v226 - 4) = v227;
                    *((_OWORD *)v226 - 3) = v228;
                    v226 -= 80;
                    v218 -= 80;
                  }
                  while (v218 != v219);
                  v218 = v219;
                }
                v299 = v226;
                v301 = &v224[80 * v222];
                unint64_t v185 = 0x268D57000uLL;
                if (v218)
                {
                  operator delete(v218);
                  uint64_t v190 = 56;
                }
                v218 = v225;
                uint64_t v33 = v270;
                uint64_t v183 = v277;
                p_vtable = &OBJC_METACLASS___AGXG17FamilyComputeProgram.vtable;
              }
              else
              {
                *(void *)v300 = v196;
                *(_OWORD *)(v218 + 8) = v295;
                *((void *)v218 + 3) = v296;
                *((_OWORD *)v218 + 2) = v293;
                *((void *)v218 + 6) = v294;
                *(_OWORD *)(v218 + 56) = v287;
                *((void *)v218 + 9) = v288;
              }
              v300 = v218 + 80;
              AGX::applySPIRelocations<AGX::HAL200::ObjClasses,AGX::HAL200::DynamicLibrary>(*(void *)&v189[v190], (void *)[v189 relocations]);
            }
            ++v186;
          }
          while (v186 != v183);
          uint64_t v183 = [obj countByEnumeratingWithState:&v289 objects:&v302 count:16];
          if (v183) {
            continue;
          }
          break;
        }
      }
      long long v295 = 0uLL;
      v296 = 0;
      uint64_t v230 = v60 - __p;
      if (v60 == __p)
      {
        v231 = 0;
      }
      else
      {
        if (0xAAAAAAAAAAAAAAABLL * (v230 >> 5) > 0x2AAAAAAAAAAAAAALL) {
          abort();
        }
        v231 = (char *)operator new(v60 - __p);
        *(void *)&long long v295 = v231;
        *((void *)&v295 + 1) = v231;
        v296 = &v231[32 * (v230 >> 5)];
        size_t v232 = 96 * ((v230 - 96) / 0x60uLL) + 96;
        memcpy(v231, __p, v232);
        *((void *)&v295 + 1) = &v231[v232];
      }
      int v233 = AGX::DynamicLoader<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses,void>::load((uint64_t)v263, (uint64_t **)&v299, (uint64_t **)&v297, (size_t *)&v295, *(_DWORD *)(v251 + 1036), 0, &v283, v252 != 0);
      if (v231)
      {
        *((void *)&v295 + 1) = v231;
        operator delete(v231);
      }
LABEL_275:
      if ((void)v297) {
        operator delete((void *)v297);
      }
      if (v299) {
        operator delete(v299);
      }
      if (__p) {
        operator delete(__p);
      }
      if (v255 && !atomic_fetch_add(&v255->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v255->__on_zero_shared)(v255);
        std::__shared_weak_count::__release_weak(v255);
      }
      uint64_t v234 = *(void *)v33;
      if (*(void *)v33) {
        int v43 = 0;
      }
      else {
        int v43 = v233;
      }
      if (v234 && ((v233 ^ 1) & 1) == 0)
      {
        v235 = (std::__shared_weak_count *)v260[10].resource_info[6].iosurface;
        v284[0] = v260[10].resource_info[5].iosurface;
        v284[1] = v235;
        if (v235) {
          atomic_fetch_add_explicit(&v235->__shared_owners_, 1uLL, memory_order_relaxed);
        }
        int v43 = AGX::PipelineDylibResources<AGX::HAL200::ObjClasses,AGX::HAL200::Classes,(AGX::ICBType)1>::incrementalLoad<AGX::HAL200::FragmentProgramVariant>((uint64_t **)(v33 + 2424), v263, v234, v257, v33 + 2928, (uint64_t)v284, v33 + 1248, (uint64_t)&v260[4].resource_info[5], *(unsigned char *)(v33 + 709), &v283);
        if (v235 && !atomic_fetch_add(&v235->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
        {
          ((void (*)(std::__shared_weak_count *))v235->__on_zero_shared)(v235);
          std::__shared_weak_count::__release_weak(v235);
        }
      }
      goto LABEL_294;
    }
  }
  else
  {
    uint64_t v33 = v270;
    if (v29) {
      goto LABEL_51;
    }
  }
  int v43 = 0;
LABEL_294:
  if (([v263 requiresRaytracingEmulation] & 1) == 0)
  {
    AGX::RenderPipeline<AGX::HAL200::ObjClasses,AGX::HAL200::Classes,AGX::HAL200::Encoders>::computeMaximumRayPayloadSizes((unsigned int *)v33);
    AGX::RenderPipeline<AGX::HAL200::ObjClasses,AGX::HAL200::Classes,AGX::HAL200::Encoders>::createScsPerShaderConfigTables((uint64_t *)v33);
    AGX::RenderPipeline<AGX::HAL200::ObjClasses,AGX::HAL200::Classes,AGX::HAL200::Encoders>::constructSpillParamsForIntersection(v33, v263[101]);
  }
  if (*(void *)v33 && (*(unsigned char *)(*(void *)v33 + 1951) & 0x18) != 0) {
    *(unsigned char *)(v33 + 710) = 1;
  }
  uint64_t v236 = *(void *)(v33 + 8);
  if (v236 && (*(unsigned char *)(v236 + 1951) & 0x18) != 0) {
    *(unsigned char *)(v33 + 710) = 1;
  }
  uint64_t v237 = *(void *)(v33 + 16);
  if (v237 && (*(unsigned char *)(v237 + 1951) & 0x18) != 0) {
    *(unsigned char *)(v33 + 710) = 1;
  }
  uint64_t v238 = *(void *)(v33 + 24);
  if (v238 && (*(unsigned char *)(v238 + 1951) & 0x18) != 0) {
    *(unsigned char *)(v33 + 710) = 1;
  }
  uint64_t v239 = *(void *)(v33 + 32);
  if (v239 && (*(unsigned char *)(v239 + 1951) & 0x18) != 0) {
    *(unsigned char *)(v33 + 710) = 1;
  }
  AGX::RenderPipeline<AGX::HAL200::ObjClasses,AGX::HAL200::Classes,AGX::HAL200::Encoders>::constructSpillParams((int8x8_t **)v33, v263[101]);
  if (v43)
  {
    uint64_t v240 = *(void *)(v33 + 8);
    if (v240) {
      AGX::VertexProgramVariant<AGX::HAL200::Encoders,AGX::HAL200::Classes>::patchPipelineRequirements(v240);
    }
    uint64_t v241 = *(void *)v33;
    if (*(void *)v33)
    {
      int v242 = *(unsigned __int8 *)(v33 + 1448);
      AGX::FragmentProgramVariantESLState<AGX::HAL200::Encoders,AGX::HAL200::Classes>::patchPipelineRequirements(v241 + 1936);
      if (v242) {
        *(_DWORD *)(v241 + 3304) &= ~0x200000u;
      }
      uint64_t v243 = *(void *)v33;
      unsigned int v244 = *(_DWORD *)(v33 + 732) & 0xFFDFFFFF | (((*(_DWORD *)(*(void *)v33 + 3304) >> 21) & 1) << 21);
      *(_DWORD *)(v33 + 732) = v244;
      unsigned int v245 = v244 & 0xFFBFFFFF | (((*(_DWORD *)(v243 + 3304) >> 22) & 1) << 22);
      *(_DWORD *)(v33 + 732) = v245;
      unsigned int v246 = v245 & 0xFDFFFFFF | (((*(_DWORD *)(v243 + 3304) >> 25) & 1) << 25);
      *(_DWORD *)(v33 + 732) = v246;
      unsigned int v247 = v246 & 0xFBFFFFFF | (((*(_DWORD *)(v243 + 3304) >> 26) & 1) << 26);
      *(_DWORD *)(v33 + 732) = v247;
      *(_DWORD *)(v33 + 732) = *(_DWORD *)(v243 + 3304) & 0xE0000000 | v247 & 0x1FFFFFFF;
      *(_DWORD *)(v33 + 744) = *(_DWORD *)(v33 + 744) & 0xFFFE0000 | *(_DWORD *)(v243 + 3308) & 0x1FFFF;
      LODWORD(v243) = *(unsigned __int8 *)(v243 + 3390);
      LOBYTE(v247) = (v243 - 1) < 2;
      unsigned int v248 = (v243 & 3) << 22;
      if ((v247 & ((v263[101][911] & 0x8000) != 0)) != 0) {
        unsigned int v248 = 0;
      }
      *(int8x8_t *)(v33 + 736) = vorr_s8((int8x8_t)(*(void *)(v33 + 736) & 0xFF3FFFFFFF3FFFFFLL), (int8x8_t)vdup_n_s32(v248));
    }
    return v256;
  }
  id v11 = v283;
  uint64_t v9 = v256;
LABEL_322:
  if (a5 && v11)
  {
    uint64_t v250 = [NSDictionary dictionaryWithObject:v11 forKey:*MEMORY[0x263F08320]];
    *a5 = (id)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"AGXMetalG17P" code:1 userInfo:v250];
  }

  return 0;
}

- (id)newRenderPipelineStateWithAdditionalBinaryFunctions:(id)a3 error:(id *)a4
{
  uint64_t v530 = *MEMORY[0x263EF8340];
  if (objc_msgSend((id)objc_msgSend(a3, "objectAdditionalBinaryFunctions"), "count")
    || objc_msgSend((id)objc_msgSend(a3, "meshAdditionalBinaryFunctions"), "count"))
  {
    if (self->_basePipeline) {
      basePipeline = self->_basePipeline;
    }
    else {
      basePipeline = self;
    }
    uint64_t v7 = [[AGXG17FamilyRenderPipeline alloc] initWithParent:basePipeline];
    uint64_t v8 = [(_MTLRenderPipelineState *)self device];
    uint64_t v9 = v7;
    uint64_t v10 = @"Failed to allocate a new mesh pipeline";
    v504 = @"Failed to allocate a new mesh pipeline";
    if (!v7)
    {
LABEL_331:
      if (a4 && v10)
      {
        unsigned int v245 = v9;
        uint64_t v246 = [NSDictionary dictionaryWithObject:v10 forKey:*MEMORY[0x263F08320]];
        *a4 = (id)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"AGXMetalG17P" code:1 userInfo:v246];
        uint64_t v9 = v245;
      }

      return 0;
    }
    v449 = v7;
    id v11 = (uint64_t **)v8;
    uint64_t p_impl = (uint64_t)&v7->_impl;
    id v13 = (void *)[a3 meshAdditionalBinaryFunctions];
    id v451 = (id)[a3 objectAdditionalBinaryFunctions];
    v450 = (void *)[a3 fragmentAdditionalBinaryFunctions];
    v459 = v11;
    v455 = &self->_impl;
    AGX::RenderPipeline<AGX::HAL200::ObjClasses,AGX::HAL200::Classes,AGX::HAL200::Encoders>::copyStateAndFunctionsFromOriginal((uint64_t)&v7->_impl, (uint64_t)v11, (uint64_t)&self->_impl, [v13 count] + objc_msgSend(v451, "count") + objc_msgSend(v450, "count"));
    unint64_t prime = vcvtps_u32_f32((float)(unint64_t)([v13 count] + *(void *)&v7->_anon_1a8[2424])/ *(float *)&v7->_anon_1a8[2432]);
    if (prime == 1)
    {
      unint64_t prime = 2;
    }
    else if ((prime & (prime - 1)) != 0)
    {
      unint64_t prime = std::__next_prime(prime);
    }
    int8x8_t v15 = *(int8x8_t *)&v7->_anon_1a8[2408];
    if (prime > *(void *)&v15) {
      goto LABEL_12;
    }
    if (prime < *(void *)&v15)
    {
      uint8x8_t v16 = (uint8x8_t)vcnt_s8(v15);
      v16.i16[0] = vaddlv_u8(v16);
      unint64_t v17 = vcvtps_u32_f32((float)*(unint64_t *)(p_impl + 2704) / *(float *)(p_impl + 2712));
      if (*(void *)&v15 < 3uLL || v16.u32[0] > 1uLL)
      {
        unint64_t v17 = std::__next_prime(v17);
      }
      else
      {
        uint64_t v21 = 1 << -(char)__clz(v17 - 1);
        if (v17 >= 2) {
          unint64_t v17 = v21;
        }
      }
      if (prime <= v17) {
        unint64_t prime = v17;
      }
      if (prime < *(void *)&v15) {
LABEL_12:
      }
        std::__hash_table<std::__hash_value_type<std::string,unsigned int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,unsigned int>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,unsigned int>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,unsigned int>>>::__do_rehash<true>(p_impl + 2680, prime);
    }
    unint64_t v22 = vcvtps_u32_f32((float)(unint64_t)([v451 count] + *(void *)(p_impl + 2664))/ *(float *)(p_impl + 2672));
    if (v22 == 1)
    {
      unint64_t v22 = 2;
    }
    else if ((v22 & (v22 - 1)) != 0)
    {
      unint64_t v22 = std::__next_prime(v22);
    }
    int8x8_t v23 = *(int8x8_t *)(p_impl + 2648);
    if (v22 > *(void *)&v23) {
      goto LABEL_34;
    }
    if (v22 < *(void *)&v23)
    {
      unint64_t v24 = vcvtps_u32_f32((float)*(unint64_t *)(p_impl + 2664) / *(float *)(p_impl + 2672));
      if (*(void *)&v23 < 3uLL || (uint8x8_t v25 = (uint8x8_t)vcnt_s8(v23), v25.i16[0] = vaddlv_u8(v25), v25.u32[0] > 1uLL))
      {
        unint64_t v24 = std::__next_prime(v24);
      }
      else
      {
        uint64_t v26 = 1 << -(char)__clz(v24 - 1);
        if (v24 >= 2) {
          unint64_t v24 = v26;
        }
      }
      if (v22 <= v24) {
        unint64_t v22 = v24;
      }
      if (v22 < *(void *)&v23) {
LABEL_34:
      }
        std::__hash_table<std::__hash_value_type<std::string,unsigned int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,unsigned int>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,unsigned int>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,unsigned int>>>::__do_rehash<true>(p_impl + 2640, v22);
    }
    unint64_t v27 = vcvtps_u32_f32((float)(unint64_t)([v450 count] + *(void *)(p_impl + 2584))/ *(float *)(p_impl + 2592));
    if (v27 == 1)
    {
      unint64_t v27 = 2;
    }
    else if ((v27 & (v27 - 1)) != 0)
    {
      unint64_t v27 = std::__next_prime(v27);
    }
    int8x8_t v28 = *(int8x8_t *)(p_impl + 2568);
    if (v27 > *(void *)&v28) {
      goto LABEL_50;
    }
    if (v27 < *(void *)&v28)
    {
      unint64_t v29 = vcvtps_u32_f32((float)*(unint64_t *)(p_impl + 2584) / *(float *)(p_impl + 2592));
      if (*(void *)&v28 < 3uLL || (uint8x8_t v30 = (uint8x8_t)vcnt_s8(v28), v30.i16[0] = vaddlv_u8(v30), v30.u32[0] > 1uLL))
      {
        unint64_t v29 = std::__next_prime(v29);
      }
      else
      {
        uint64_t v31 = 1 << -(char)__clz(v29 - 1);
        if (v29 >= 2) {
          unint64_t v29 = v31;
        }
      }
      if (v27 <= v29) {
        unint64_t v27 = v29;
      }
      if (v27 < *(void *)&v28) {
LABEL_50:
      }
        std::__hash_table<std::__hash_value_type<std::string,unsigned int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,unsigned int>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,unsigned int>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,unsigned int>>>::__do_rehash<true>(p_impl + 2560, v27);
    }
    v464 = (uint64_t *)(p_impl + 2976);
    iosurface = (std::__shared_weak_count *)v455[10].resource_info[12].iosurface;
    v512[0] = (uint64_t)v455[10].resource_info[11].iosurface;
    v512[1] = (uint64_t)iosurface;
    if (iosurface) {
      atomic_fetch_add_explicit(&iosurface->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    int v33 = AGX::mergeAndInsertAdditionalBinaryLinkedFunctions<AGX::HAL200::ObjClasses,AGX::HAL200::Classes>(v11, v13, p_impl + 2680, v464, v512, (int)v455[7].resource_info[17].iosurface, (uint64_t *)&v504);
    if (iosurface && !atomic_fetch_add(&iosurface->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))iosurface->__on_zero_shared)(iosurface);
      std::__shared_weak_count::__release_weak(iosurface);
      if (!*(void *)(p_impl + 24)) {
        goto LABEL_73;
      }
    }
    else if (!*(void *)(p_impl + 24))
    {
      goto LABEL_73;
    }
    if (!v33) {
      goto LABEL_302;
    }
    uint64_t v34 = (std::__shared_weak_count *)v455[10].resource_info[10].iosurface;
    v511[0] = (uint64_t)v455[10].resource_info[9].iosurface;
    v511[1] = (uint64_t)v34;
    if (v34) {
      atomic_fetch_add_explicit(&v34->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    int v33 = AGX::mergeAndInsertAdditionalBinaryLinkedFunctions<AGX::HAL200::ObjClasses,AGX::HAL200::Classes>(v11, v451, p_impl + 2640, (uint64_t *)(p_impl + 2960), v511, (int)v455[6].resource_info[16].iosurface, (uint64_t *)&v504);
    if (v34 && !atomic_fetch_add(&v34->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v34->__on_zero_shared)(v34);
      std::__shared_weak_count::__release_weak(v34);
    }
    if (!*(void *)p_impl) {
      goto LABEL_79;
    }
LABEL_73:
    if (!v33) {
      goto LABEL_302;
    }
    v35 = (std::__shared_weak_count *)v455[10].resource_info[6].iosurface;
    v510[0] = (uint64_t)v455[10].resource_info[5].iosurface;
    v510[1] = (uint64_t)v35;
    if (v35) {
      atomic_fetch_add_explicit(&v35->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    int v33 = AGX::mergeAndInsertAdditionalBinaryLinkedFunctions<AGX::HAL200::ObjClasses,AGX::HAL200::Classes>(v11, v450, p_impl + 2560, (uint64_t *)(p_impl + 2928), v510, (int)v455[4].resource_info[14].iosurface, (uint64_t *)&v504);
    if (v35 && !atomic_fetch_add(&v35->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v35->__on_zero_shared)(v35);
      std::__shared_weak_count::__release_weak(v35);
      if (v33)
      {
LABEL_80:
        uint64_t v445 = *(void *)(p_impl + 32);
        int v36 = v455[10].resource_info[11].iosurface;
        uint64_t v37 = v455[10].resource_info[12].iosurface;
        v508 = v36;
        v509 = (std::__shared_weak_count *)v37;
        if (v37) {
          atomic_fetch_add_explicit((atomic_ullong *volatile)v37 + 1, 1uLL, memory_order_relaxed);
        }
        int v38 = *(unsigned __int8 *)(p_impl + 709);
        uint64_t v40 = *((void *)v36 + 4);
        uint64_t v39 = *((void *)v36 + 5);
        uint64_t v41 = [v13 count];
        unint64_t v456 = (v39 - v40) / 1304;
        unint64_t v42 = v456 + 4 * v41;
        unint64_t v43 = v42 + 1;
        if (v42 == -1)
        {
          v45 = 0;
          unint64_t v44 = 0;
        }
        else
        {
          if (v43 > 0x2AAAAAAAAAAAAAALL) {
            abort();
          }
          unint64_t v44 = (char *)operator new(96 * v43);
          v45 = &v44[96 * v43];
        }
        v525 = 0;
        v526 = 0;
        v527 = 0;
        unint64_t v48 = v43 + ((uint64_t)(*(void *)(p_impl + 2504) - *(void *)(p_impl + 2496)) >> 4);
        id obj = v13;
        int v441 = v38;
        uint64_t v442 = v41;
        unint64_t v443 = 4 * v41;
        uint64_t v473 = v40;
        if (v48)
        {
          if (v48 > 0x333333333333333) {
            abort();
          }
          long long v49 = v45;
          uint64_t v50 = (char *)operator new(80 * v48);
          uint64_t v51 = v44;
          v52 = &v50[80 * v48];
          v525 = v50;
          v526 = v50;
          v527 = v52;
          v45 = v49;
        }
        else
        {
          uint64_t v51 = v44;
          v52 = 0;
          uint64_t v50 = 0;
        }
        uint64_t v53 = (_OWORD *)(v445 + 1208);
        v472 = (void *)p_impl;
        uint64_t v54 = p_impl + 2112;
        uint64_t v55 = &v455[7].resource_info[8];
        uint64_t v56 = v445 + 8;
        long long v528 = *(_OWORD *)(v445 + 1208);
        uint64_t v529 = *(void *)(v445 + 1224);
        uint64_t v57 = *(void *)(v445 + 1464);
        uint64_t v58 = *(void *)(v445 + 1456);
        uint64_t v59 = *(void *)(v445 + 1472);
        v60 = (_OWORD *)(v445 + 2544);
        long long v515 = *(_OWORD *)(v445 + 2544);
        *(void *)&long long v516 = *(void *)(v445 + 2560);
        if (v51 >= v45)
        {
          uint64_t v481 = v57;
          __p = v51;
          uint64_t v460 = v59;
          uint64_t v467 = v39;
          unint64_t v66 = 0x5555555555555556 * ((v45 - v51) >> 5);
          if (v66 <= 1) {
            unint64_t v66 = 1;
          }
          if (0xAAAAAAAAAAAAAAABLL * ((v45 - v51) >> 5) >= 0x155555555555555) {
            unint64_t v67 = 0x2AAAAAAAAAAAAAALL;
          }
          else {
            unint64_t v67 = v66;
          }
          if (v67 > 0x2AAAAAAAAAAAAAALL) {
            std::__throw_bad_array_new_length[abi:nn180100]();
          }
          v68 = (char *)operator new(96 * v67);
          unint64_t v69 = &v68[96 * v67];
          *(void *)v68 = v56;
          uint64_t v70 = *(void *)(v445 + 1224);
          *(_OWORD *)(v68 + 8) = *v53;
          *((void *)v68 + 3) = v70;
          *((void *)v68 + 4) = v58;
          uint64_t v57 = v481;
          uint64_t v65 = v460;
          *((void *)v68 + 5) = v481;
          *((void *)v68 + 6) = v460;
          uint64_t v71 = *(void *)(v445 + 2560);
          *(_OWORD *)(v68 + 56) = *v60;
          *((void *)v68 + 9) = v71;
          *((void *)v68 + 10) = v54;
          *((void *)v68 + 11) = v55;
          unint64_t v63 = v68 + 96;
          if (__p)
          {
            operator delete(__p);
            uint64_t v57 = v481;
          }
          v64 = v68;
          v45 = v69;
          uint64_t v39 = v467;
        }
        else
        {
          *(void *)uint64_t v51 = v56;
          uint64_t v61 = *(void *)(v445 + 1224);
          *(_OWORD *)(v51 + 8) = *v53;
          *((void *)v51 + 3) = v61;
          *((void *)v51 + 4) = v58;
          *((void *)v51 + 5) = v57;
          *((void *)v51 + 6) = v59;
          uint64_t v62 = *(void *)(v445 + 2560);
          *(_OWORD *)(v51 + 56) = *v60;
          *((void *)v51 + 9) = v62;
          *((void *)v51 + 10) = v54;
          *((void *)v51 + 11) = v55;
          unint64_t v63 = v51 + 96;
          v64 = v51;
          uint64_t v65 = v59;
        }
        if (v50 >= v52)
        {
          v482 = v45;
          unint64_t v74 = 0x999999999999999ALL * ((v52 - v50) >> 4);
          if (v74 <= 1) {
            unint64_t v74 = 1;
          }
          if (0xCCCCCCCCCCCCCCCDLL * ((v52 - v50) >> 4) >= 0x199999999999999) {
            unint64_t v75 = 0x333333333333333;
          }
          else {
            unint64_t v75 = v74;
          }
          if (v75 > 0x333333333333333) {
            std::__throw_bad_array_new_length[abi:nn180100]();
          }
          uint64_t v76 = v57;
          uint64_t v77 = (char *)operator new(80 * v75);
          *(void *)uint64_t v77 = v56;
          *(_OWORD *)(v77 + 8) = v528;
          *((void *)v77 + 3) = v529;
          *((void *)v77 + 4) = v58;
          *((void *)v77 + 5) = v76;
          *((void *)v77 + 6) = v65;
          *(_OWORD *)(v77 + 56) = v515;
          *((void *)v77 + 9) = v516;
          v72 = v77 + 80;
          v525 = v77;
          v527 = &v77[80 * v75];
          if (v50) {
            operator delete(v50);
          }
          v73 = v472;
          v45 = v482;
        }
        else
        {
          *(void *)uint64_t v50 = v56;
          *(_OWORD *)(v50 + 8) = v528;
          *((void *)v50 + 3) = v529;
          *((void *)v50 + 4) = v58;
          *((void *)v50 + 5) = v57;
          *((void *)v50 + 6) = v65;
          *(_OWORD *)(v50 + 56) = v515;
          v72 = v50 + 80;
          *((void *)v50 + 9) = v516;
          v73 = v472;
        }
        v526 = v72;
        if (v39 != v473)
        {
          uint64_t v78 = 0;
          uint64_t v79 = v456;
          if (v456 <= 1) {
            uint64_t v79 = 1;
          }
          uint64_t v453 = v79;
          do
          {
            uint64_t v80 = 0;
            uint64_t v461 = v78;
            uint64_t v81 = 1304 * v78;
            uint64_t v474 = *(void *)(*v464 + 32) + v81 + 112;
            uint64_t v468 = *((void *)v508 + 4) + v81 + 112;
            do
            {
              uint64_t v84 = (uint64_t *)(v474 + 296 * v80);
              uint64_t v85 = *v84;
              if (*v84)
              {
                __pa = v64;
                uint64_t v86 = v85 + 8;
                long long v528 = *(_OWORD *)(v85 + 1160);
                uint64_t v529 = *(void *)(v85 + 1176);
                uint64_t v87 = *(void *)(v85 + 1416);
                uint64_t v88 = *(void *)(v85 + 1408);
                uint64_t v89 = *(void *)(v85 + 1424);
                long long v515 = *(_OWORD *)(v85 + 2496);
                *(void *)&long long v516 = *(void *)(v85 + 2512);
                long long v523 = *(_OWORD *)(v85 + 1160);
                v524 = *(char **)(v85 + 1176);
                uint64_t v90 = v84 + 1;
                long long v521 = *(_OWORD *)(v85 + 2496);
                uint64_t v91 = v468 + 296 * v80 + 8;
                v522 = *(char **)(v85 + 2512);
                if (v63 >= v45)
                {
                  unint64_t v93 = 0xAAAAAAAAAAAAAAABLL * ((v63 - __pa) >> 5) + 1;
                  if (v93 > 0x2AAAAAAAAAAAAAALL) {
                    abort();
                  }
                  if (0x5555555555555556 * ((v45 - __pa) >> 5) > v93) {
                    unint64_t v93 = 0x5555555555555556 * ((v45 - __pa) >> 5);
                  }
                  if (0xAAAAAAAAAAAAAAABLL * ((v45 - __pa) >> 5) >= 0x155555555555555) {
                    unint64_t v94 = 0x2AAAAAAAAAAAAAALL;
                  }
                  else {
                    unint64_t v94 = v93;
                  }
                  if (v94)
                  {
                    if (v94 > 0x2AAAAAAAAAAAAAALL) {
                      std::__throw_bad_array_new_length[abi:nn180100]();
                    }
                    uint64_t v95 = v85 + 8;
                    uint64_t v96 = v88;
                    uint64_t v97 = v89;
                    uint64_t v98 = v87;
                    unint64_t v99 = v94;
                    long long v100 = (char *)operator new(96 * v94);
                    uint64_t v87 = v98;
                    uint64_t v89 = v97;
                    uint64_t v88 = v96;
                    uint64_t v86 = v95;
                    uint64_t v91 = v468 + 296 * v80 + 8;
                    unint64_t v94 = v99;
                  }
                  else
                  {
                    long long v100 = 0;
                  }
                  long long v101 = &v100[32 * ((v63 - __pa) >> 5)];
                  *(void *)long long v101 = v86;
                  *(_OWORD *)(v101 + 8) = v523;
                  *((void *)v101 + 3) = v524;
                  *((void *)v101 + 4) = v88;
                  *((void *)v101 + 5) = v87;
                  *((void *)v101 + 6) = v89;
                  *(_OWORD *)(v101 + 56) = v521;
                  *((void *)v101 + 9) = v522;
                  *((void *)v101 + 10) = v90;
                  *((void *)v101 + 11) = v91;
                  if (v63 == __pa)
                  {
                    long long v103 = &v100[32 * ((v63 - __pa) >> 5)];
                  }
                  else
                  {
                    long long v102 = &v100[32 * ((v63 - __pa) >> 5)];
                    do
                    {
                      long long v103 = v102 - 96;
                      long long v104 = *((_OWORD *)v63 - 5);
                      *((_OWORD *)v102 - 6) = *((_OWORD *)v63 - 6);
                      *((_OWORD *)v102 - 5) = v104;
                      long long v105 = *((_OWORD *)v63 - 4);
                      long long v106 = *((_OWORD *)v63 - 3);
                      long long v107 = *((_OWORD *)v63 - 1);
                      *((_OWORD *)v102 - 2) = *((_OWORD *)v63 - 2);
                      *((_OWORD *)v102 - 1) = v107;
                      *((_OWORD *)v102 - 4) = v105;
                      *((_OWORD *)v102 - 3) = v106;
                      v63 -= 96;
                      v102 -= 96;
                    }
                    while (v63 != __pa);
                  }
                  v45 = &v100[96 * v94];
                  unint64_t v63 = v101 + 96;
                  if (__pa)
                  {
                    unint64_t v108 = &v100[96 * v94];
                    uint64_t v109 = v87;
                    uint64_t v110 = v86;
                    operator delete(__pa);
                    uint64_t v86 = v110;
                    uint64_t v87 = v109;
                    v45 = v108;
                  }
                  v64 = v103;
                  v73 = v472;
                }
                else
                {
                  *(void *)unint64_t v63 = v86;
                  uint64_t v92 = v524;
                  *(_OWORD *)(v63 + 8) = v523;
                  *((void *)v63 + 3) = v92;
                  *((void *)v63 + 4) = v88;
                  *((void *)v63 + 5) = v87;
                  *((void *)v63 + 6) = v89;
                  *(_OWORD *)(v63 + 56) = v521;
                  *((void *)v63 + 9) = v522;
                  *((void *)v63 + 10) = v90;
                  *((void *)v63 + 11) = v91;
                  v63 += 96;
                  v72 = v526;
                  v64 = __pa;
                }
                if (v72 < v527)
                {
                  *(void *)v72 = v86;
                  uint64_t v82 = v529;
                  *(_OWORD *)(v72 + 8) = v528;
                  *((void *)v72 + 3) = v82;
                  *((void *)v72 + 4) = v88;
                  *((void *)v72 + 5) = v87;
                  *((void *)v72 + 6) = v89;
                  *(_OWORD *)(v72 + 56) = v515;
                  *((void *)v72 + 9) = v516;
                  uint64_t v83 = v72 + 80;
                }
                else
                {
                  uint64_t v111 = (char *)v525;
                  unint64_t v112 = 0xCCCCCCCCCCCCCCCDLL * ((v72 - (unsigned char *)v525) >> 4);
                  unint64_t v113 = v112 + 1;
                  if (v112 + 1 > 0x333333333333333) {
                    abort();
                  }
                  if (0x999999999999999ALL * ((v527 - (unsigned char *)v525) >> 4) > v113) {
                    unint64_t v113 = 0x999999999999999ALL * ((v527 - (unsigned char *)v525) >> 4);
                  }
                  if (0xCCCCCCCCCCCCCCCDLL * ((v527 - (unsigned char *)v525) >> 4) >= 0x199999999999999) {
                    unint64_t v114 = 0x333333333333333;
                  }
                  else {
                    unint64_t v114 = v113;
                  }
                  v483 = v45;
                  if (v114)
                  {
                    __pb = v64;
                    if (v114 > 0x333333333333333) {
                      std::__throw_bad_array_new_length[abi:nn180100]();
                    }
                    uint64_t v115 = v86;
                    uint64_t v116 = v87;
                    unint64_t v117 = v114;
                    long long v118 = (char *)operator new(80 * v114);
                    uint64_t v87 = v116;
                    v64 = __pb;
                    uint64_t v86 = v115;
                    unint64_t v114 = v117;
                  }
                  else
                  {
                    long long v118 = 0;
                  }
                  v119 = &v118[80 * v112];
                  *(void *)v119 = v86;
                  *(_OWORD *)(v119 + 8) = v528;
                  *((void *)v119 + 3) = v529;
                  *((void *)v119 + 4) = v88;
                  *((void *)v119 + 5) = v87;
                  *((void *)v119 + 6) = v89;
                  *(_OWORD *)(v119 + 56) = v515;
                  *((void *)v119 + 9) = v516;
                  v120 = v119;
                  if (v72 != v111)
                  {
                    do
                    {
                      *((_OWORD *)v120 - 5) = *((_OWORD *)v72 - 5);
                      long long v121 = *((_OWORD *)v72 - 4);
                      long long v122 = *((_OWORD *)v72 - 3);
                      long long v123 = *((_OWORD *)v72 - 1);
                      *((_OWORD *)v120 - 2) = *((_OWORD *)v72 - 2);
                      *((_OWORD *)v120 - 1) = v123;
                      *((_OWORD *)v120 - 4) = v121;
                      *((_OWORD *)v120 - 3) = v122;
                      v120 -= 80;
                      v72 -= 80;
                    }
                    while (v72 != v111);
                    v72 = v111;
                  }
                  uint64_t v83 = v119 + 80;
                  v525 = v120;
                  v527 = &v118[80 * v114];
                  if (v72) {
                    operator delete(v72);
                  }
                  v73 = v472;
                  v45 = v483;
                }
                v526 = v83;
                v72 = v83;
              }
              ++v80;
            }
            while (v80 != 4);
            uint64_t v78 = v461 + 1;
          }
          while (v461 + 1 != v453);
        }
        uint64_t v124 = (uint64_t *)v73[312];
        v125 = (uint64_t *)v73[313];
        v484 = v45;
        if (v124 != v125)
        {
          while (1)
          {
            v126 = v64;
            uint64_t v127 = *v124;
            unint64_t v128 = (std::__shared_weak_count *)v124[1];
            *(void *)&long long v521 = *v124;
            *((void *)&v521 + 1) = v128;
            if (v128) {
              atomic_fetch_add_explicit(&v128->__shared_owners_, 1uLL, memory_order_relaxed);
            }
            uint64_t v129 = v127 + 96;
            long long v528 = *(_OWORD *)(v127 + 680);
            uint64_t v529 = *(void *)(v127 + 696);
            long long v515 = *(_OWORD *)(v127 + 768);
            *(void *)&long long v516 = *(void *)(v127 + 784);
            long long v523 = *(_OWORD *)(v127 + 944);
            v524 = *(char **)(v127 + 960);
            v130 = v526;
            if (v526 >= v527) {
              break;
            }
            *(void *)v526 = v129;
            *(_OWORD *)(v130 + 8) = v528;
            *((void *)v130 + 3) = v529;
            *((_OWORD *)v130 + 2) = v515;
            *((void *)v130 + 6) = v516;
            *(_OWORD *)(v130 + 56) = v523;
            *((void *)v130 + 9) = v524;
            v64 = v126;
            v526 = v130 + 80;
            if (v128) {
              goto LABEL_186;
            }
LABEL_164:
            v124 += 2;
            if (v124 == v125) {
              goto LABEL_188;
            }
          }
          v131 = (char *)v525;
          unint64_t v132 = 0xCCCCCCCCCCCCCCCDLL * ((v526 - (unsigned char *)v525) >> 4);
          unint64_t v133 = v132 + 1;
          if (v132 + 1 > 0x333333333333333) {
            abort();
          }
          if (0x999999999999999ALL * ((v527 - (unsigned char *)v525) >> 4) > v133) {
            unint64_t v133 = 0x999999999999999ALL * ((v527 - (unsigned char *)v525) >> 4);
          }
          if (0xCCCCCCCCCCCCCCCDLL * ((v527 - (unsigned char *)v525) >> 4) >= 0x199999999999999) {
            unint64_t v134 = 0x333333333333333;
          }
          else {
            unint64_t v134 = v133;
          }
          if (v134)
          {
            if (v134 > 0x333333333333333) {
              std::__throw_bad_array_new_length[abi:nn180100]();
            }
            long long v135 = (char *)operator new(80 * v134);
          }
          else
          {
            long long v135 = 0;
          }
          v136 = &v135[80 * v132];
          *(void *)v136 = v129;
          *(_OWORD *)(v136 + 8) = v528;
          *((void *)v136 + 3) = v529;
          *((_OWORD *)v136 + 2) = v515;
          *((void *)v136 + 6) = v516;
          *(_OWORD *)(v136 + 56) = v523;
          *((void *)v136 + 9) = v524;
          v137 = v136;
          v64 = v126;
          if (v130 != v131)
          {
            do
            {
              *((_OWORD *)v137 - 5) = *((_OWORD *)v130 - 5);
              long long v138 = *((_OWORD *)v130 - 4);
              long long v139 = *((_OWORD *)v130 - 3);
              long long v140 = *((_OWORD *)v130 - 1);
              *((_OWORD *)v137 - 2) = *((_OWORD *)v130 - 2);
              *((_OWORD *)v137 - 1) = v140;
              *((_OWORD *)v137 - 4) = v138;
              *((_OWORD *)v137 - 3) = v139;
              v137 -= 80;
              v130 -= 80;
            }
            while (v130 != v131);
            v130 = v131;
          }
          uint64_t v141 = &v135[80 * v134];
          uint64_t v142 = v136 + 80;
          v525 = v137;
          v527 = v141;
          if (v130) {
            operator delete(v130);
          }
          v45 = v484;
          v526 = v142;
          if (!v128) {
            goto LABEL_164;
          }
LABEL_186:
          if (!atomic_fetch_add(&v128->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
          {
            ((void (*)(std::__shared_weak_count *))v128->__on_zero_shared)(v128);
            std::__shared_weak_count::__release_weak(v128);
            v45 = v484;
          }
          goto LABEL_164;
        }
LABEL_188:
        long long v523 = 0uLL;
        v524 = 0;
        if (v443)
        {
          if (v443 > 0x333333333333333) {
            abort();
          }
          uint64_t v143 = (char *)operator new(320 * v442);
          *(void *)&long long v523 = v143;
          *((void *)&v523 + 1) = v143;
          v524 = &v143[80 * v443];
          v45 = v484;
        }
        else
        {
          uint64_t v143 = 0;
        }
        uint64_t v144 = *(void *)(*v464 + 32);
        if (v456 < 0x1F693A1C451AB30BLL * ((*(void *)(*v464 + 40) - v144) >> 3))
        {
          unint64_t v145 = v456;
          do
          {
            uint64_t v146 = 0;
            unint64_t v457 = v145;
            uint64_t v475 = v144 + 1304 * v145 + 112;
            do
            {
              uint64_t v149 = (uint64_t *)(v475 + 296 * v146);
              uint64_t v150 = *v149;
              if (*v149)
              {
                uint64_t v151 = v150 + 8;
                long long v528 = *(_OWORD *)(v150 + 1160);
                uint64_t v529 = *(void *)(v150 + 1176);
                uint64_t v152 = *(void *)(v150 + 1416);
                uint64_t v153 = *(void *)(v150 + 1408);
                uint64_t v154 = *(void *)(v150 + 1424);
                long long v515 = *(_OWORD *)(v150 + 2496);
                *(void *)&long long v516 = *(void *)(v150 + 2512);
                long long v521 = *(_OWORD *)(v150 + 1160);
                v522 = *(char **)(v150 + 1176);
                long long v519 = *(_OWORD *)(v150 + 2496);
                uint64_t v155 = v149 + 1;
                uint64_t v520 = *(void *)(v150 + 2512);
                if (v63 >= v45)
                {
                  v157 = v64;
                  unint64_t v158 = 0xAAAAAAAAAAAAAAABLL * ((v63 - v64) >> 5);
                  unint64_t v159 = v158 + 1;
                  __pc = v157;
                  if (v158 + 1 > 0x2AAAAAAAAAAAAAALL) {
                    abort();
                  }
                  unint64_t v160 = 0xAAAAAAAAAAAAAAABLL * ((v45 - v157) >> 5);
                  if (2 * v160 > v159) {
                    unint64_t v159 = 2 * v160;
                  }
                  if (v160 >= 0x155555555555555) {
                    unint64_t v161 = 0x2AAAAAAAAAAAAAALL;
                  }
                  else {
                    unint64_t v161 = v159;
                  }
                  if (v161)
                  {
                    if (v161 > 0x2AAAAAAAAAAAAAALL) {
                      std::__throw_bad_array_new_length[abi:nn180100]();
                    }
                    uint64_t v162 = v151;
                    uint64_t v163 = v153;
                    uint64_t v164 = v152;
                    uint64_t v165 = v154;
                    uint64_t v166 = (char *)operator new(96 * v161);
                    uint64_t v154 = v165;
                    uint64_t v152 = v164;
                    uint64_t v153 = v163;
                    uint64_t v151 = v162;
                  }
                  else
                  {
                    uint64_t v166 = 0;
                  }
                  uint64_t v167 = &v166[96 * v158];
                  *(void *)uint64_t v167 = v151;
                  *(_OWORD *)(v167 + 8) = v521;
                  *((void *)v167 + 3) = v522;
                  *((void *)v167 + 4) = v153;
                  *((void *)v167 + 5) = v152;
                  *((void *)v167 + 6) = v154;
                  *(_OWORD *)(v167 + 56) = v519;
                  *((void *)v167 + 9) = v520;
                  *((void *)v167 + 10) = v155;
                  *((void *)v167 + 11) = v155;
                  if (v63 == __pc)
                  {
                    v169 = &v166[96 * v158];
                  }
                  else
                  {
                    uint64_t v168 = &v166[96 * v158];
                    do
                    {
                      v169 = v168 - 96;
                      long long v170 = *((_OWORD *)v63 - 5);
                      *((_OWORD *)v168 - 6) = *((_OWORD *)v63 - 6);
                      *((_OWORD *)v168 - 5) = v170;
                      long long v171 = *((_OWORD *)v63 - 4);
                      long long v172 = *((_OWORD *)v63 - 3);
                      long long v173 = *((_OWORD *)v63 - 1);
                      *((_OWORD *)v168 - 2) = *((_OWORD *)v63 - 2);
                      *((_OWORD *)v168 - 1) = v173;
                      *((_OWORD *)v168 - 4) = v171;
                      *((_OWORD *)v168 - 3) = v172;
                      v63 -= 96;
                      v168 -= 96;
                    }
                    while (v63 != __pc);
                  }
                  v45 = &v166[96 * v161];
                  unint64_t v63 = v167 + 96;
                  if (__pc)
                  {
                    uint64_t v174 = &v166[96 * v161];
                    uint64_t v175 = v154;
                    operator delete(__pc);
                    uint64_t v154 = v175;
                    v45 = v174;
                  }
                  v64 = v169;
                }
                else
                {
                  *(void *)unint64_t v63 = v151;
                  v156 = v522;
                  *(_OWORD *)(v63 + 8) = v521;
                  *((void *)v63 + 3) = v156;
                  *((void *)v63 + 4) = v153;
                  *((void *)v63 + 5) = v152;
                  *((void *)v63 + 6) = v154;
                  *(_OWORD *)(v63 + 56) = v519;
                  *((void *)v63 + 9) = v520;
                  *((void *)v63 + 10) = v155;
                  *((void *)v63 + 11) = v155;
                  v63 += 96;
                  uint64_t v143 = (char *)*((void *)&v523 + 1);
                }
                if (v143 < v524)
                {
                  *(void *)uint64_t v143 = v151;
                  uint64_t v147 = v529;
                  *(_OWORD *)(v143 + 8) = v528;
                  *((void *)v143 + 3) = v147;
                  *((void *)v143 + 4) = v153;
                  *((void *)v143 + 5) = v152;
                  *((void *)v143 + 6) = v154;
                  *(_OWORD *)(v143 + 56) = v515;
                  *((void *)v143 + 9) = v516;
                  uint64_t v148 = v143 + 80;
                }
                else
                {
                  __pd = v64;
                  uint64_t v176 = (char *)v523;
                  unint64_t v177 = 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)&v143[-v523] >> 4);
                  unint64_t v178 = v177 + 1;
                  if (v177 + 1 > 0x333333333333333) {
                    abort();
                  }
                  if (0x999999999999999ALL * ((uint64_t)&v524[-v523] >> 4) > v178) {
                    unint64_t v178 = 0x999999999999999ALL * ((uint64_t)&v524[-v523] >> 4);
                  }
                  if (0xCCCCCCCCCCCCCCCDLL * ((uint64_t)&v524[-v523] >> 4) >= 0x199999999999999) {
                    unint64_t v179 = 0x333333333333333;
                  }
                  else {
                    unint64_t v179 = v178;
                  }
                  v485 = v45;
                  if (v179)
                  {
                    if (v179 > 0x333333333333333) {
                      std::__throw_bad_array_new_length[abi:nn180100]();
                    }
                    uint64_t v180 = v151;
                    uint64_t v181 = v153;
                    uint64_t v182 = v152;
                    uint64_t v183 = v154;
                    v184 = (char *)operator new(80 * v179);
                    uint64_t v154 = v183;
                    uint64_t v152 = v182;
                    uint64_t v153 = v181;
                    uint64_t v151 = v180;
                  }
                  else
                  {
                    v184 = 0;
                  }
                  unint64_t v185 = &v184[80 * v177];
                  *(void *)unint64_t v185 = v151;
                  *(_OWORD *)(v185 + 8) = v528;
                  *((void *)v185 + 3) = v529;
                  *((void *)v185 + 4) = v153;
                  *((void *)v185 + 5) = v152;
                  *((void *)v185 + 6) = v154;
                  *(_OWORD *)(v185 + 56) = v515;
                  *((void *)v185 + 9) = v516;
                  uint64_t v186 = v185;
                  if (v143 == v176)
                  {
                    v64 = __pd;
                  }
                  else
                  {
                    v64 = __pd;
                    do
                    {
                      *((_OWORD *)v186 - 5) = *((_OWORD *)v143 - 5);
                      long long v187 = *((_OWORD *)v143 - 4);
                      long long v188 = *((_OWORD *)v143 - 3);
                      long long v189 = *((_OWORD *)v143 - 1);
                      *((_OWORD *)v186 - 2) = *((_OWORD *)v143 - 2);
                      *((_OWORD *)v186 - 1) = v189;
                      *((_OWORD *)v186 - 4) = v187;
                      *((_OWORD *)v186 - 3) = v188;
                      v186 -= 80;
                      v143 -= 80;
                    }
                    while (v143 != v176);
                    uint64_t v143 = v176;
                  }
                  uint64_t v148 = v185 + 80;
                  *(void *)&long long v523 = v186;
                  v524 = &v184[80 * v179];
                  if (v143) {
                    operator delete(v143);
                  }
                  v45 = v485;
                }
                *((void *)&v523 + 1) = v148;
                uint64_t v143 = v148;
              }
              ++v146;
            }
            while (v146 != 4);
            unint64_t v145 = v457 + 1;
            uint64_t v144 = *(void *)(*v464 + 32);
          }
          while (v457 + 1 < 0x1F693A1C451AB30BLL * ((*(void *)(*v464 + 40) - v144) >> 3));
        }
        long long v517 = 0u;
        long long v518 = 0u;
        long long v515 = 0u;
        long long v516 = 0u;
        __pe = v64;
        uint64_t v190 = [obj countByEnumeratingWithState:&v515 objects:&v528 count:16];
        uint64_t p_impl = (uint64_t)v472;
        if (v190)
        {
          uint64_t v486 = *(void *)v516;
          unint64_t v191 = 0x268D57000;
          while (2)
          {
            uint64_t v192 = 0;
            uint64_t v476 = v190;
            do
            {
              if (*(void *)v516 != v486) {
                objc_enumerationMutation(obj);
              }
              v193 = *(void **)(*((void *)&v515 + 1) + 8 * v192);
              if (([v459 requiresRaytracingEmulation] & 1) != 0
                || [v193 functionType] != 6)
              {
                if (![v193 vendorPrivate]
                  || ([v193 vendorPrivate], objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
                  || (uint64_t v194 = [v193 vendorPrivate], (v195 = (char *)v194) == 0))
                {
                  int v230 = 0;
                  goto LABEL_338;
                }
                uint64_t v196 = *(int *)(v191 + 1956);
                uint64_t v197 = (__n128 *)(v194 + v196);
                unint64_t v198 = *(void *)(v194 + v196);
                v199 = *(__n128 **)(p_impl + 2504);
                if ((unint64_t)v199 >= *(void *)(p_impl + 2512))
                {
                  unint64_t v201 = std::vector<std::shared_ptr<AGX::HAL200::DynamicLibrary>>::__emplace_back_slow_path<std::shared_ptr<AGX::HAL200::DynamicLibrary>&>((uint64_t)(v472 + 312), *v197);
                  uint64_t v196 = *(int *)(v191 + 1956);
                }
                else
                {
                  v199->n128_u64[0] = v198;
                  unint64_t v200 = v197->n128_u64[1];
                  v199->n128_u64[1] = v200;
                  if (v200) {
                    atomic_fetch_add_explicit((atomic_ullong *volatile)(v200 + 8), 1uLL, memory_order_relaxed);
                  }
                  unint64_t v201 = v199 + 1;
                }
                unint64_t v202 = v198 + 96;
                v472[313] = v201;
                uint64_t v203 = *(void *)&v195[v196];
                v522 = *(char **)(v203 + 696);
                long long v521 = *(_OWORD *)(v203 + 680);
                long long v519 = *(_OWORD *)(v203 + 768);
                uint64_t v520 = *(void *)(v203 + 784);
                long long v513 = *(_OWORD *)(v203 + 944);
                uint64_t v514 = *(void *)(v203 + 960);
                if (v143 >= v524)
                {
                  uint64_t v205 = (char *)v523;
                  unint64_t v206 = 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)&v143[-v523] >> 4);
                  unint64_t v207 = v206 + 1;
                  if (v206 + 1 > 0x333333333333333) {
                    abort();
                  }
                  if (0x999999999999999ALL * ((uint64_t)&v524[-v523] >> 4) > v207) {
                    unint64_t v207 = 0x999999999999999ALL * ((uint64_t)&v524[-v523] >> 4);
                  }
                  if (0xCCCCCCCCCCCCCCCDLL * ((uint64_t)&v524[-v523] >> 4) >= 0x199999999999999) {
                    unint64_t v208 = 0x333333333333333;
                  }
                  else {
                    unint64_t v208 = v207;
                  }
                  if (v208)
                  {
                    if (v208 > 0x333333333333333) {
                      std::__throw_bad_array_new_length[abi:nn180100]();
                    }
                    v209 = (char *)operator new(80 * v208);
                  }
                  else
                  {
                    v209 = 0;
                  }
                  v210 = &v209[80 * v206];
                  *(void *)v210 = v202;
                  *(_OWORD *)(v210 + 8) = v521;
                  *((void *)v210 + 3) = v522;
                  *((_OWORD *)v210 + 2) = v519;
                  *((void *)v210 + 6) = v520;
                  *(_OWORD *)(v210 + 56) = v513;
                  *((void *)v210 + 9) = v514;
                  if (v143 == v205)
                  {
                    uint64_t v205 = v143;
                    v211 = &v209[80 * v206];
                    uint64_t v190 = v476;
                  }
                  else
                  {
                    v211 = &v209[80 * v206];
                    uint64_t v190 = v476;
                    do
                    {
                      *((_OWORD *)v211 - 5) = *((_OWORD *)v143 - 5);
                      long long v212 = *((_OWORD *)v143 - 4);
                      long long v213 = *((_OWORD *)v143 - 3);
                      long long v214 = *((_OWORD *)v143 - 1);
                      *((_OWORD *)v211 - 2) = *((_OWORD *)v143 - 2);
                      *((_OWORD *)v211 - 1) = v214;
                      *((_OWORD *)v211 - 4) = v212;
                      *((_OWORD *)v211 - 3) = v213;
                      v211 -= 80;
                      v143 -= 80;
                    }
                    while (v143 != v205);
                  }
                  uint64_t v143 = v210 + 80;
                  *(void *)&long long v523 = v211;
                  *((void *)&v523 + 1) = v210 + 80;
                  v524 = &v209[80 * v208];
                  if (v205)
                  {
                    operator delete(v205);
                    unint64_t v191 = 0x268D57000uLL;
                    uint64_t v196 = 56;
                  }
                  else
                  {
                    unint64_t v191 = 0x268D57000;
                  }
                }
                else
                {
                  *(void *)uint64_t v143 = v202;
                  long long v204 = v521;
                  *((void *)v143 + 3) = v522;
                  *(_OWORD *)(v143 + 8) = v204;
                  *((_OWORD *)v143 + 2) = v519;
                  *((void *)v143 + 6) = v520;
                  *(_OWORD *)(v143 + 56) = v513;
                  *((void *)v143 + 9) = v514;
                  v143 += 80;
                }
                *((void *)&v523 + 1) = v143;
                uint64_t v215 = *(void *)&v195[v196];
                v522 = *(char **)(v215 + 696);
                long long v521 = *(_OWORD *)(v215 + 680);
                long long v519 = *(_OWORD *)(v215 + 768);
                uint64_t v520 = *(void *)(v215 + 784);
                long long v513 = *(_OWORD *)(v215 + 944);
                uint64_t v514 = *(void *)(v215 + 960);
                unint64_t v216 = v526;
                if (v526 >= v527)
                {
                  uint64_t v217 = (char *)v525;
                  unint64_t v218 = 0xCCCCCCCCCCCCCCCDLL * ((v526 - (unsigned char *)v525) >> 4);
                  unint64_t v219 = v218 + 1;
                  if (v218 + 1 > 0x333333333333333) {
                    abort();
                  }
                  if (0x999999999999999ALL * ((v527 - (unsigned char *)v525) >> 4) > v219) {
                    unint64_t v219 = 0x999999999999999ALL * ((v527 - (unsigned char *)v525) >> 4);
                  }
                  if (0xCCCCCCCCCCCCCCCDLL * ((v527 - (unsigned char *)v525) >> 4) >= 0x199999999999999) {
                    unint64_t v220 = 0x333333333333333;
                  }
                  else {
                    unint64_t v220 = v219;
                  }
                  if (v220)
                  {
                    if (v220 > 0x333333333333333) {
                      std::__throw_bad_array_new_length[abi:nn180100]();
                    }
                    unint64_t v221 = (char *)operator new(80 * v220);
                  }
                  else
                  {
                    unint64_t v221 = 0;
                  }
                  unint64_t v222 = &v221[80 * v218];
                  *(void *)unint64_t v222 = v202;
                  *(_OWORD *)(v222 + 8) = v521;
                  *((void *)v222 + 3) = v522;
                  *((_OWORD *)v222 + 2) = v519;
                  *((void *)v222 + 6) = v520;
                  *(_OWORD *)(v222 + 56) = v513;
                  *((void *)v222 + 9) = v514;
                  unint64_t v223 = v222;
                  if (v216 == v217)
                  {
                    uint64_t p_impl = (uint64_t)v472;
                  }
                  else
                  {
                    uint64_t p_impl = (uint64_t)v472;
                    do
                    {
                      *((_OWORD *)v223 - 5) = *((_OWORD *)v216 - 5);
                      long long v224 = *((_OWORD *)v216 - 4);
                      long long v225 = *((_OWORD *)v216 - 3);
                      long long v226 = *((_OWORD *)v216 - 1);
                      *((_OWORD *)v223 - 2) = *((_OWORD *)v216 - 2);
                      *((_OWORD *)v223 - 1) = v226;
                      *((_OWORD *)v223 - 4) = v224;
                      *((_OWORD *)v223 - 3) = v225;
                      v223 -= 80;
                      v216 -= 80;
                    }
                    while (v216 != v217);
                    unint64_t v216 = v217;
                  }
                  v525 = v223;
                  v527 = &v221[80 * v220];
                  unint64_t v191 = 0x268D57000uLL;
                  if (v216)
                  {
                    operator delete(v216);
                    uint64_t v196 = 56;
                  }
                  unint64_t v216 = v222;
                  v64 = __pe;
                  uint64_t v190 = v476;
                }
                else
                {
                  *(void *)v526 = v202;
                  *(_OWORD *)(v216 + 8) = v521;
                  *((void *)v216 + 3) = v522;
                  *((_OWORD *)v216 + 2) = v519;
                  *((void *)v216 + 6) = v520;
                  *(_OWORD *)(v216 + 56) = v513;
                  *((void *)v216 + 9) = v514;
                  uint64_t p_impl = (uint64_t)v472;
                }
                v526 = v216 + 80;
                AGX::applySPIRelocations<AGX::HAL200::ObjClasses,AGX::HAL200::DynamicLibrary>(*(void *)&v195[v196], (void *)[v195 relocations]);
              }
              ++v192;
            }
            while (v192 != v190);
            uint64_t v190 = [obj countByEnumeratingWithState:&v515 objects:&v528 count:16];
            if (v190) {
              continue;
            }
            break;
          }
        }
        long long v521 = 0uLL;
        v522 = 0;
        uint64_t v227 = v63 - v64;
        if (v63 == v64)
        {
          long long v228 = 0;
        }
        else
        {
          if (0xAAAAAAAAAAAAAAABLL * (v227 >> 5) > 0x2AAAAAAAAAAAAAALL) {
            abort();
          }
          long long v228 = (char *)operator new(v63 - v64);
          *(void *)&long long v521 = v228;
          *((void *)&v521 + 1) = v228;
          v522 = &v228[32 * (v227 >> 5)];
          size_t v229 = 96 * ((v227 - 96) / 0x60uLL) + 96;
          memcpy(v228, v64, v229);
          *((void *)&v521 + 1) = &v228[v229];
        }
        int v230 = AGX::DynamicLoader<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses,void>::load((uint64_t)v459, (uint64_t **)&v525, (uint64_t **)&v523, (size_t *)&v521, *(_DWORD *)(v445 + 1036), 0, &v504, v441 != 0);
        if (v228)
        {
          *((void *)&v521 + 1) = v228;
          operator delete(v228);
        }
LABEL_338:
        if ((void)v523) {
          operator delete((void *)v523);
        }
        if (v525) {
          operator delete(v525);
        }
        if (v64) {
          operator delete(v64);
        }
        unsigned int v247 = v509;
        if (v509 && !atomic_fetch_add(&v509->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
        {
          ((void (*)(std::__shared_weak_count *))v247->__on_zero_shared)(v247);
          std::__shared_weak_count::__release_weak(v247);
        }
        uint64_t v248 = *(void *)(p_impl + 24);
        if (v248) {
          int v249 = 0;
        }
        else {
          int v249 = v230;
        }
        if (!v248 || ((v230 ^ 1) & 1) != 0)
        {
LABEL_583:
          uint64_t v439 = *(void *)p_impl;
          if (*(void *)p_impl) {
            int v231 = 0;
          }
          else {
            int v231 = v249;
          }
          if (v439 && v249)
          {
            v440 = (std::__shared_weak_count *)v455[10].resource_info[6].iosurface;
            v505[0] = v455[10].resource_info[5].iosurface;
            v505[1] = v440;
            if (v440) {
              atomic_fetch_add_explicit(&v440->__shared_owners_, 1uLL, memory_order_relaxed);
            }
            int v231 = AGX::PipelineDylibResources<AGX::HAL200::ObjClasses,AGX::HAL200::Classes,(AGX::ICBType)1>::incrementalLoad<AGX::HAL200::FragmentProgramVariant>((uint64_t **)(p_impl + 2424), v459, v439, v450, p_impl + 2928, (uint64_t)v505, p_impl + 1248, (uint64_t)&v455[4].resource_info[5], *(unsigned char *)(p_impl + 709), &v504);
            if (v440 && !atomic_fetch_add(&v440->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
            {
              ((void (*)(std::__shared_weak_count *))v440->__on_zero_shared)(v440);
              std::__shared_weak_count::__release_weak(v440);
            }
          }
          goto LABEL_303;
        }
        uint64_t v250 = v455[10].resource_info[9].iosurface;
        uint64_t v251 = v455[10].resource_info[10].iosurface;
        v506 = v250;
        v507 = (std::__shared_weak_count *)v251;
        if (v251) {
          atomic_fetch_add_explicit((atomic_ullong *volatile)v251 + 1, 1uLL, memory_order_relaxed);
        }
        int v252 = *(unsigned __int8 *)(p_impl + 709);
        uint64_t v253 = *((void *)v250 + 4);
        uint64_t v254 = *((void *)v250 + 5);
        uint64_t v255 = [v451 count];
        unint64_t v454 = 4 * v255;
        uint64_t v256 = (v254 - v253) / 1304 + 4 * v255;
        unint64_t v257 = v256 + 1;
        if (v256 == -1)
        {
          v259 = 0;
          v258 = 0;
        }
        else
        {
          if (v257 > 0x2AAAAAAAAAAAAAALL) {
            abort();
          }
          v258 = (char *)operator new(96 * v257);
          v259 = &v258[96 * v257];
        }
        v525 = 0;
        v526 = 0;
        v527 = 0;
        unint64_t v260 = v257 + ((uint64_t)(*(void *)(p_impl + 2480) - *(void *)(p_impl + 2472)) >> 4);
        int v446 = v252;
        unint64_t v462 = (v254 - v253) / 1304;
        uint64_t obja = v255;
        uint64_t v477 = v253;
        uint64_t v487 = v254;
        if (v260)
        {
          if (v260 > 0x333333333333333) {
            abort();
          }
          unint64_t v261 = v259;
          v262 = (char *)operator new(80 * v260);
          v263 = v258;
          uint64_t v264 = &v262[80 * v260];
          v525 = v262;
          v526 = v262;
          v527 = v264;
          v259 = v261;
        }
        else
        {
          v263 = v258;
          uint64_t v264 = 0;
          v262 = 0;
        }
        uint64_t v265 = v248 + 1208;
        long long v266 = *(_OWORD *)(v248 + 1208);
        uint64_t v267 = v248;
        v268 = v472 + 228;
        uint64_t v269 = &v455[6].resource_info[7];
        uint64_t v270 = v267 + 8;
        long long v528 = v266;
        uint64_t v529 = *(void *)(v267 + 1224);
        uint64_t v271 = *(void *)(v267 + 1464);
        uint64_t v272 = *(void *)(v267 + 1456);
        uint64_t v273 = *(void *)(v267 + 1472);
        uint64_t v274 = v267 + 2544;
        long long v515 = *(_OWORD *)(v267 + 2544);
        uint64_t v444 = v267;
        *(void *)&long long v516 = *(void *)(v267 + 2560);
        if (v263 >= v259)
        {
          uint64_t v465 = v273;
          uint64_t v469 = v271;
          __pf = v263;
          unint64_t v281 = 0x5555555555555556 * ((v259 - v263) >> 5);
          if (v281 <= 1) {
            unint64_t v281 = 1;
          }
          if (0xAAAAAAAAAAAAAAABLL * ((v259 - v263) >> 5) >= 0x155555555555555) {
            unint64_t v282 = 0x2AAAAAAAAAAAAAALL;
          }
          else {
            unint64_t v282 = v281;
          }
          if (v282 > 0x2AAAAAAAAAAAAAALL) {
            std::__throw_bad_array_new_length[abi:nn180100]();
          }
          v283 = (char *)operator new(96 * v282);
          v284 = &v283[96 * v282];
          *(void *)v283 = v270;
          uint64_t v285 = *(void *)(v265 + 16);
          *(_OWORD *)(v283 + 8) = *(_OWORD *)v265;
          *((void *)v283 + 3) = v285;
          *((void *)v283 + 4) = v272;
          uint64_t v279 = v465;
          *((void *)v283 + 5) = v469;
          *((void *)v283 + 6) = v465;
          uint64_t v286 = *(void *)(v274 + 16);
          *(_OWORD *)(v283 + 56) = *(_OWORD *)v274;
          *((void *)v283 + 9) = v286;
          *((void *)v283 + 10) = v268;
          *((void *)v283 + 11) = v269;
          uint64_t v277 = v283 + 96;
          if (__pf) {
            operator delete(__pf);
          }
          uint64_t v278 = v283;
          v259 = v284;
          uint64_t v271 = v469;
          if (v262 < v264) {
            goto LABEL_364;
          }
        }
        else
        {
          *(void *)v263 = v270;
          uint64_t v275 = *(void *)(v265 + 16);
          *(_OWORD *)(v263 + 8) = *(_OWORD *)v265;
          *((void *)v263 + 3) = v275;
          *((void *)v263 + 4) = v272;
          *((void *)v263 + 5) = v271;
          *((void *)v263 + 6) = v273;
          uint64_t v276 = *(void *)(v267 + 2560);
          *(_OWORD *)(v263 + 56) = *(_OWORD *)v274;
          *((void *)v263 + 9) = v276;
          *((void *)v263 + 10) = v268;
          *((void *)v263 + 11) = v269;
          uint64_t v277 = v263 + 96;
          uint64_t v278 = v263;
          uint64_t v279 = v273;
          if (v262 < v264)
          {
LABEL_364:
            *(void *)v262 = v270;
            *(_OWORD *)(v262 + 8) = v528;
            *((void *)v262 + 3) = v529;
            *((void *)v262 + 4) = v272;
            *((void *)v262 + 5) = v271;
            *((void *)v262 + 6) = v279;
            *(_OWORD *)(v262 + 56) = v515;
            v280 = v262 + 80;
            *((void *)v262 + 9) = v516;
            uint64_t p_impl = (uint64_t)v472;
LABEL_383:
            v526 = v280;
            if (v487 != v477)
            {
              uint64_t v291 = 0;
              uint64_t v292 = v462;
              if (v462 <= 1) {
                uint64_t v292 = 1;
              }
              uint64_t v458 = v292;
              do
              {
                uint64_t v293 = 0;
                uint64_t v466 = v291;
                uint64_t v294 = 1304 * v291;
                uint64_t v478 = *(void *)(*(void *)(p_impl + 2960) + 32) + v294 + 112;
                uint64_t v470 = *((void *)v506 + 4) + v294 + 112;
                do
                {
                  long long v297 = (uint64_t *)(v478 + 296 * v293);
                  uint64_t v298 = *v297;
                  if (*v297)
                  {
                    __pg = v278;
                    uint64_t v299 = v298 + 8;
                    long long v528 = *(_OWORD *)(v298 + 1160);
                    uint64_t v529 = *(void *)(v298 + 1176);
                    uint64_t v300 = *(void *)(v298 + 1416);
                    uint64_t v301 = *(void *)(v298 + 1408);
                    uint64_t v302 = *(void *)(v298 + 1424);
                    long long v515 = *(_OWORD *)(v298 + 2496);
                    *(void *)&long long v516 = *(void *)(v298 + 2512);
                    long long v523 = *(_OWORD *)(v298 + 1160);
                    v524 = *(char **)(v298 + 1176);
                    uint64_t v303 = v297 + 1;
                    long long v521 = *(_OWORD *)(v298 + 2496);
                    uint64_t v304 = v470 + 296 * v293 + 8;
                    v522 = *(char **)(v298 + 2512);
                    if (v277 >= v259)
                    {
                      unint64_t v306 = 0xAAAAAAAAAAAAAAABLL * ((v277 - __pg) >> 5) + 1;
                      if (v306 > 0x2AAAAAAAAAAAAAALL) {
                        abort();
                      }
                      if (0x5555555555555556 * ((v259 - __pg) >> 5) > v306) {
                        unint64_t v306 = 0x5555555555555556 * ((v259 - __pg) >> 5);
                      }
                      if (0xAAAAAAAAAAAAAAABLL * ((v259 - __pg) >> 5) >= 0x155555555555555) {
                        unint64_t v307 = 0x2AAAAAAAAAAAAAALL;
                      }
                      else {
                        unint64_t v307 = v306;
                      }
                      if (v307)
                      {
                        if (v307 > 0x2AAAAAAAAAAAAAALL) {
                          std::__throw_bad_array_new_length[abi:nn180100]();
                        }
                        uint64_t v308 = v298 + 8;
                        uint64_t v309 = v301;
                        uint64_t v310 = v302;
                        unint64_t v311 = v307;
                        v312 = (char *)operator new(96 * v307);
                        uint64_t v302 = v310;
                        uint64_t v301 = v309;
                        uint64_t v299 = v308;
                        uint64_t v304 = v470 + 296 * v293 + 8;
                        unint64_t v307 = v311;
                      }
                      else
                      {
                        v312 = 0;
                      }
                      v313 = &v312[32 * ((v277 - __pg) >> 5)];
                      *(void *)v313 = v299;
                      *(_OWORD *)(v313 + 8) = v523;
                      *((void *)v313 + 3) = v524;
                      *((void *)v313 + 4) = v301;
                      *((void *)v313 + 5) = v300;
                      *((void *)v313 + 6) = v302;
                      *(_OWORD *)(v313 + 56) = v521;
                      *((void *)v313 + 9) = v522;
                      *((void *)v313 + 10) = v303;
                      *((void *)v313 + 11) = v304;
                      if (v277 == __pg)
                      {
                        uint64_t v278 = &v312[32 * ((v277 - __pg) >> 5)];
                      }
                      else
                      {
                        v314 = &v312[32 * ((v277 - __pg) >> 5)];
                        do
                        {
                          uint64_t v278 = v314 - 96;
                          long long v315 = *((_OWORD *)v277 - 5);
                          *((_OWORD *)v314 - 6) = *((_OWORD *)v277 - 6);
                          *((_OWORD *)v314 - 5) = v315;
                          long long v316 = *((_OWORD *)v277 - 4);
                          long long v317 = *((_OWORD *)v277 - 3);
                          long long v318 = *((_OWORD *)v277 - 1);
                          *((_OWORD *)v314 - 2) = *((_OWORD *)v277 - 2);
                          *((_OWORD *)v314 - 1) = v318;
                          *((_OWORD *)v314 - 4) = v316;
                          *((_OWORD *)v314 - 3) = v317;
                          v277 -= 96;
                          v314 -= 96;
                        }
                        while (v277 != __pg);
                      }
                      v259 = &v312[96 * v307];
                      uint64_t v277 = v313 + 96;
                      if (__pg)
                      {
                        v319 = &v312[96 * v307];
                        uint64_t v320 = v302;
                        operator delete(__pg);
                        uint64_t v302 = v320;
                        v259 = v319;
                      }
                      uint64_t p_impl = (uint64_t)v472;
                    }
                    else
                    {
                      *(void *)uint64_t v277 = v299;
                      v305 = v524;
                      *(_OWORD *)(v277 + 8) = v523;
                      *((void *)v277 + 3) = v305;
                      *((void *)v277 + 4) = v301;
                      *((void *)v277 + 5) = v300;
                      *((void *)v277 + 6) = v302;
                      *(_OWORD *)(v277 + 56) = v521;
                      *((void *)v277 + 9) = v522;
                      *((void *)v277 + 10) = v303;
                      *((void *)v277 + 11) = v304;
                      v277 += 96;
                      v280 = v526;
                      uint64_t v278 = __pg;
                    }
                    if (v280 < v527)
                    {
                      *(void *)v280 = v299;
                      uint64_t v295 = v529;
                      *(_OWORD *)(v280 + 8) = v528;
                      *((void *)v280 + 3) = v295;
                      *((void *)v280 + 4) = v301;
                      *((void *)v280 + 5) = v300;
                      *((void *)v280 + 6) = v302;
                      *(_OWORD *)(v280 + 56) = v515;
                      *((void *)v280 + 9) = v516;
                      v296 = v280 + 80;
                    }
                    else
                    {
                      v321 = (char *)v525;
                      unint64_t v322 = 0xCCCCCCCCCCCCCCCDLL * ((v280 - (unsigned char *)v525) >> 4);
                      unint64_t v323 = v322 + 1;
                      __ph = v278;
                      if (v322 + 1 > 0x333333333333333) {
                        abort();
                      }
                      if (0x999999999999999ALL * ((v527 - (unsigned char *)v525) >> 4) > v323) {
                        unint64_t v323 = 0x999999999999999ALL * ((v527 - (unsigned char *)v525) >> 4);
                      }
                      if (0xCCCCCCCCCCCCCCCDLL * ((v527 - (unsigned char *)v525) >> 4) >= 0x199999999999999) {
                        unint64_t v324 = 0x333333333333333;
                      }
                      else {
                        unint64_t v324 = v323;
                      }
                      v488 = v259;
                      if (v324)
                      {
                        if (v324 > 0x333333333333333) {
                          std::__throw_bad_array_new_length[abi:nn180100]();
                        }
                        uint64_t v325 = v299;
                        uint64_t v326 = v301;
                        uint64_t v327 = v302;
                        v328 = (char *)operator new(80 * v324);
                        uint64_t v302 = v327;
                        uint64_t v301 = v326;
                        uint64_t v299 = v325;
                      }
                      else
                      {
                        v328 = 0;
                      }
                      v329 = &v328[80 * v322];
                      *(void *)v329 = v299;
                      *(_OWORD *)(v329 + 8) = v528;
                      *((void *)v329 + 3) = v529;
                      *((void *)v329 + 4) = v301;
                      *((void *)v329 + 5) = v300;
                      *((void *)v329 + 6) = v302;
                      *(_OWORD *)(v329 + 56) = v515;
                      *((void *)v329 + 9) = v516;
                      v330 = v329;
                      if (v280 != v321)
                      {
                        do
                        {
                          *((_OWORD *)v330 - 5) = *((_OWORD *)v280 - 5);
                          long long v331 = *((_OWORD *)v280 - 4);
                          long long v332 = *((_OWORD *)v280 - 3);
                          long long v333 = *((_OWORD *)v280 - 1);
                          *((_OWORD *)v330 - 2) = *((_OWORD *)v280 - 2);
                          *((_OWORD *)v330 - 1) = v333;
                          *((_OWORD *)v330 - 4) = v331;
                          *((_OWORD *)v330 - 3) = v332;
                          v330 -= 80;
                          v280 -= 80;
                        }
                        while (v280 != v321);
                        v280 = v321;
                      }
                      v296 = v329 + 80;
                      v525 = v330;
                      v527 = &v328[80 * v324];
                      if (v280) {
                        operator delete(v280);
                      }
                      uint64_t p_impl = (uint64_t)v472;
                      v259 = v488;
                      uint64_t v278 = __ph;
                    }
                    v526 = v296;
                    v280 = v296;
                  }
                  ++v293;
                }
                while (v293 != 4);
                uint64_t v291 = v466 + 1;
              }
              while (v466 + 1 != v458);
            }
            v334 = *(uint64_t **)(p_impl + 2472);
            v335 = *(uint64_t **)(p_impl + 2480);
            v336 = v259;
            if (v334 != v335)
            {
              __pi = v278;
              while (1)
              {
                uint64_t v337 = *v334;
                v338 = (std::__shared_weak_count *)v334[1];
                *(void *)&long long v521 = *v334;
                *((void *)&v521 + 1) = v338;
                if (v338) {
                  atomic_fetch_add_explicit(&v338->__shared_owners_, 1uLL, memory_order_relaxed);
                }
                uint64_t v339 = v337 + 96;
                long long v528 = *(_OWORD *)(v337 + 680);
                uint64_t v529 = *(void *)(v337 + 696);
                long long v515 = *(_OWORD *)(v337 + 768);
                *(void *)&long long v516 = *(void *)(v337 + 784);
                long long v523 = *(_OWORD *)(v337 + 944);
                v524 = *(char **)(v337 + 960);
                v340 = v526;
                if (v526 >= v527) {
                  break;
                }
                *(void *)v526 = v339;
                *(_OWORD *)(v340 + 8) = v528;
                *((void *)v340 + 3) = v529;
                *((_OWORD *)v340 + 2) = v515;
                *((void *)v340 + 6) = v516;
                *(_OWORD *)(v340 + 56) = v523;
                *((void *)v340 + 9) = v524;
                uint64_t v278 = __pi;
                v526 = v340 + 80;
                if (v338) {
                  goto LABEL_456;
                }
LABEL_432:
                v334 += 2;
                if (v334 == v335) {
                  goto LABEL_458;
                }
              }
              v341 = (char *)v525;
              unint64_t v342 = 0xCCCCCCCCCCCCCCCDLL * ((v526 - (unsigned char *)v525) >> 4);
              unint64_t v343 = v342 + 1;
              if (v342 + 1 > 0x333333333333333) {
                abort();
              }
              if (0x999999999999999ALL * ((v527 - (unsigned char *)v525) >> 4) > v343) {
                unint64_t v343 = 0x999999999999999ALL * ((v527 - (unsigned char *)v525) >> 4);
              }
              if (0xCCCCCCCCCCCCCCCDLL * ((v527 - (unsigned char *)v525) >> 4) >= 0x199999999999999) {
                unint64_t v344 = 0x333333333333333;
              }
              else {
                unint64_t v344 = v343;
              }
              if (v344)
              {
                if (v344 > 0x333333333333333) {
                  std::__throw_bad_array_new_length[abi:nn180100]();
                }
                v345 = (char *)operator new(80 * v344);
              }
              else
              {
                v345 = 0;
              }
              v346 = &v345[80 * v342];
              *(void *)v346 = v339;
              *(_OWORD *)(v346 + 8) = v528;
              *((void *)v346 + 3) = v529;
              *((_OWORD *)v346 + 2) = v515;
              *((void *)v346 + 6) = v516;
              *(_OWORD *)(v346 + 56) = v523;
              *((void *)v346 + 9) = v524;
              v347 = v346;
              if (v340 == v341)
              {
                uint64_t v278 = __pi;
              }
              else
              {
                uint64_t v278 = __pi;
                do
                {
                  *((_OWORD *)v347 - 5) = *((_OWORD *)v340 - 5);
                  long long v348 = *((_OWORD *)v340 - 4);
                  long long v349 = *((_OWORD *)v340 - 3);
                  long long v350 = *((_OWORD *)v340 - 1);
                  *((_OWORD *)v347 - 2) = *((_OWORD *)v340 - 2);
                  *((_OWORD *)v347 - 1) = v350;
                  *((_OWORD *)v347 - 4) = v348;
                  *((_OWORD *)v347 - 3) = v349;
                  v347 -= 80;
                  v340 -= 80;
                }
                while (v340 != v341);
                v340 = v341;
              }
              v351 = &v345[80 * v344];
              v352 = v346 + 80;
              v525 = v347;
              v527 = v351;
              uint64_t p_impl = (uint64_t)v472;
              if (v340) {
                operator delete(v340);
              }
              v259 = v336;
              v526 = v352;
              if (!v338) {
                goto LABEL_432;
              }
LABEL_456:
              if (!atomic_fetch_add(&v338->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
              {
                ((void (*)(std::__shared_weak_count *))v338->__on_zero_shared)(v338);
                std::__shared_weak_count::__release_weak(v338);
                v259 = v336;
              }
              goto LABEL_432;
            }
LABEL_458:
            long long v523 = 0uLL;
            v524 = 0;
            if (v454)
            {
              if (v454 > 0x333333333333333) {
                abort();
              }
              v353 = (char *)operator new(320 * obja);
              *(void *)&long long v523 = v353;
              *((void *)&v523 + 1) = v353;
              v524 = &v353[80 * v454];
              v259 = v336;
            }
            else
            {
              v353 = 0;
            }
            uint64_t v354 = *(void *)(*(void *)(p_impl + 2960) + 32);
            if (v462 < 0x1F693A1C451AB30BLL * ((*(void *)(*(void *)(p_impl + 2960) + 40) - v354) >> 3))
            {
              unint64_t v355 = v462;
              do
              {
                uint64_t v356 = 0;
                unint64_t v463 = v355;
                uint64_t v479 = v354 + 1304 * v355 + 112;
                do
                {
                  v359 = (uint64_t *)(v479 + 296 * v356);
                  uint64_t v360 = *v359;
                  if (*v359)
                  {
                    uint64_t v361 = v360 + 8;
                    long long v528 = *(_OWORD *)(v360 + 1160);
                    uint64_t v529 = *(void *)(v360 + 1176);
                    uint64_t v362 = *(void *)(v360 + 1416);
                    uint64_t v363 = *(void *)(v360 + 1408);
                    uint64_t v364 = *(void *)(v360 + 1424);
                    long long v515 = *(_OWORD *)(v360 + 2496);
                    *(void *)&long long v516 = *(void *)(v360 + 2512);
                    long long v521 = *(_OWORD *)(v360 + 1160);
                    v522 = *(char **)(v360 + 1176);
                    long long v519 = *(_OWORD *)(v360 + 2496);
                    v365 = v359 + 1;
                    uint64_t v520 = *(void *)(v360 + 2512);
                    if (v277 >= v259)
                    {
                      v367 = v278;
                      unint64_t v368 = 0xAAAAAAAAAAAAAAABLL * ((v277 - v278) >> 5);
                      unint64_t v369 = v368 + 1;
                      __pj = v367;
                      if (v368 + 1 > 0x2AAAAAAAAAAAAAALL) {
                        abort();
                      }
                      unint64_t v370 = 0xAAAAAAAAAAAAAAABLL * ((v259 - v367) >> 5);
                      if (2 * v370 > v369) {
                        unint64_t v369 = 2 * v370;
                      }
                      if (v370 >= 0x155555555555555) {
                        unint64_t v371 = 0x2AAAAAAAAAAAAAALL;
                      }
                      else {
                        unint64_t v371 = v369;
                      }
                      if (v371)
                      {
                        if (v371 > 0x2AAAAAAAAAAAAAALL) {
                          std::__throw_bad_array_new_length[abi:nn180100]();
                        }
                        uint64_t v372 = v362;
                        uint64_t v373 = v364;
                        v374 = (char *)operator new(96 * v371);
                        uint64_t v364 = v373;
                        uint64_t v362 = v372;
                      }
                      else
                      {
                        v374 = 0;
                      }
                      v375 = &v374[96 * v368];
                      *(void *)v375 = v361;
                      *(_OWORD *)(v375 + 8) = v521;
                      *((void *)v375 + 3) = v522;
                      *((void *)v375 + 4) = v363;
                      *((void *)v375 + 5) = v362;
                      *((void *)v375 + 6) = v364;
                      *(_OWORD *)(v375 + 56) = v519;
                      *((void *)v375 + 9) = v520;
                      *((void *)v375 + 10) = v365;
                      *((void *)v375 + 11) = v365;
                      if (v277 == __pj)
                      {
                        v377 = &v374[96 * v368];
                      }
                      else
                      {
                        v376 = &v374[96 * v368];
                        do
                        {
                          v377 = v376 - 96;
                          long long v378 = *((_OWORD *)v277 - 5);
                          *((_OWORD *)v376 - 6) = *((_OWORD *)v277 - 6);
                          *((_OWORD *)v376 - 5) = v378;
                          long long v379 = *((_OWORD *)v277 - 4);
                          long long v380 = *((_OWORD *)v277 - 3);
                          long long v381 = *((_OWORD *)v277 - 1);
                          *((_OWORD *)v376 - 2) = *((_OWORD *)v277 - 2);
                          *((_OWORD *)v376 - 1) = v381;
                          *((_OWORD *)v376 - 4) = v379;
                          *((_OWORD *)v376 - 3) = v380;
                          v277 -= 96;
                          v376 -= 96;
                        }
                        while (v277 != __pj);
                      }
                      v259 = &v374[96 * v371];
                      uint64_t v277 = v375 + 96;
                      if (__pj)
                      {
                        v382 = &v374[96 * v371];
                        uint64_t v383 = v364;
                        uint64_t v384 = v361;
                        uint64_t v385 = v363;
                        uint64_t v386 = v362;
                        operator delete(__pj);
                        uint64_t v362 = v386;
                        uint64_t v363 = v385;
                        uint64_t v361 = v384;
                        uint64_t v364 = v383;
                        v259 = v382;
                      }
                      uint64_t v278 = v377;
                    }
                    else
                    {
                      *(void *)uint64_t v277 = v361;
                      v366 = v522;
                      *(_OWORD *)(v277 + 8) = v521;
                      *((void *)v277 + 3) = v366;
                      *((void *)v277 + 4) = v363;
                      *((void *)v277 + 5) = v362;
                      *((void *)v277 + 6) = v364;
                      *(_OWORD *)(v277 + 56) = v519;
                      *((void *)v277 + 9) = v520;
                      *((void *)v277 + 10) = v365;
                      *((void *)v277 + 11) = v365;
                      v277 += 96;
                      v353 = (char *)*((void *)&v523 + 1);
                    }
                    if (v353 < v524)
                    {
                      *(void *)v353 = v361;
                      uint64_t v357 = v529;
                      *(_OWORD *)(v353 + 8) = v528;
                      *((void *)v353 + 3) = v357;
                      *((void *)v353 + 4) = v363;
                      *((void *)v353 + 5) = v362;
                      *((void *)v353 + 6) = v364;
                      *(_OWORD *)(v353 + 56) = v515;
                      *((void *)v353 + 9) = v516;
                      v358 = v353 + 80;
                    }
                    else
                    {
                      __pk = v278;
                      v387 = (char *)v523;
                      unint64_t v388 = 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)&v353[-v523] >> 4);
                      unint64_t v389 = v388 + 1;
                      if (v388 + 1 > 0x333333333333333) {
                        abort();
                      }
                      if (0x999999999999999ALL * ((uint64_t)&v524[-v523] >> 4) > v389) {
                        unint64_t v389 = 0x999999999999999ALL * ((uint64_t)&v524[-v523] >> 4);
                      }
                      if (0xCCCCCCCCCCCCCCCDLL * ((uint64_t)&v524[-v523] >> 4) >= 0x199999999999999) {
                        unint64_t v390 = 0x333333333333333;
                      }
                      else {
                        unint64_t v390 = v389;
                      }
                      v489 = v259;
                      if (v390)
                      {
                        if (v390 > 0x333333333333333) {
                          std::__throw_bad_array_new_length[abi:nn180100]();
                        }
                        uint64_t v391 = v361;
                        uint64_t v392 = v363;
                        uint64_t v393 = v362;
                        uint64_t v394 = v364;
                        v395 = (char *)operator new(80 * v390);
                        uint64_t v364 = v394;
                        uint64_t v362 = v393;
                        uint64_t v363 = v392;
                        uint64_t v361 = v391;
                      }
                      else
                      {
                        v395 = 0;
                      }
                      v396 = &v395[80 * v388];
                      *(void *)v396 = v361;
                      *(_OWORD *)(v396 + 8) = v528;
                      *((void *)v396 + 3) = v529;
                      *((void *)v396 + 4) = v363;
                      *((void *)v396 + 5) = v362;
                      *((void *)v396 + 6) = v364;
                      *(_OWORD *)(v396 + 56) = v515;
                      *((void *)v396 + 9) = v516;
                      v397 = v396;
                      if (v353 == v387)
                      {
                        uint64_t v278 = __pk;
                      }
                      else
                      {
                        uint64_t v278 = __pk;
                        do
                        {
                          *((_OWORD *)v397 - 5) = *((_OWORD *)v353 - 5);
                          long long v398 = *((_OWORD *)v353 - 4);
                          long long v399 = *((_OWORD *)v353 - 3);
                          long long v400 = *((_OWORD *)v353 - 1);
                          *((_OWORD *)v397 - 2) = *((_OWORD *)v353 - 2);
                          *((_OWORD *)v397 - 1) = v400;
                          *((_OWORD *)v397 - 4) = v398;
                          *((_OWORD *)v397 - 3) = v399;
                          v397 -= 80;
                          v353 -= 80;
                        }
                        while (v353 != v387);
                        v353 = v387;
                      }
                      v358 = v396 + 80;
                      *(void *)&long long v523 = v397;
                      v524 = &v395[80 * v390];
                      if (v353) {
                        operator delete(v353);
                      }
                      v259 = v489;
                    }
                    *((void *)&v523 + 1) = v358;
                    v353 = v358;
                  }
                  ++v356;
                }
                while (v356 != 4);
                unint64_t v355 = v463 + 1;
                uint64_t p_impl = (uint64_t)v472;
                uint64_t v354 = *(void *)(v472[370] + 32);
              }
              while (v463 + 1 < 0x1F693A1C451AB30BLL * ((*(void *)(v472[370] + 40) - v354) >> 3));
            }
            long long v517 = 0u;
            long long v518 = 0u;
            long long v515 = 0u;
            long long v516 = 0u;
            __pl = v278;
            uint64_t v401 = [v451 countByEnumeratingWithState:&v515 objects:&v528 count:16];
            if (v401)
            {
              uint64_t v471 = p_impl + 2472;
              uint64_t v490 = *(void *)v516;
              while (2)
              {
                uint64_t v402 = 0;
                uint64_t v480 = v401;
                do
                {
                  if (*(void *)v516 != v490) {
                    objc_enumerationMutation(v451);
                  }
                  v403 = *(void **)(*((void *)&v515 + 1) + 8 * v402);
                  if (([v459 requiresRaytracingEmulation] & 1) != 0
                    || [v403 functionType] != 6)
                  {
                    if (![v403 vendorPrivate]
                      || ([v403 vendorPrivate], objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
                      || (uint64_t v404 = [v403 vendorPrivate], (v405 = (uint64_t *)v404) == 0))
                    {
                      int v249 = 0;
                      goto LABEL_574;
                    }
                    unint64_t v406 = *(void *)(v404 + 56);
                    v407 = *(__n128 **)(p_impl + 2480);
                    if ((unint64_t)v407 >= *(void *)(p_impl + 2488))
                    {
                      v409 = std::vector<std::shared_ptr<AGX::HAL200::DynamicLibrary>>::__emplace_back_slow_path<std::shared_ptr<AGX::HAL200::DynamicLibrary>&>(v471, *(__n128 *)(v404 + 56));
                    }
                    else
                    {
                      v407->n128_u64[0] = v406;
                      unint64_t v408 = *(void *)(v404 + 64);
                      v407->n128_u64[1] = v408;
                      if (v408) {
                        atomic_fetch_add_explicit((atomic_ullong *volatile)(v408 + 8), 1uLL, memory_order_relaxed);
                      }
                      v409 = v407 + 1;
                    }
                    unint64_t v410 = v406 + 96;
                    v472[310] = v409;
                    uint64_t v411 = v405[7];
                    v522 = *(char **)(v411 + 696);
                    long long v521 = *(_OWORD *)(v411 + 680);
                    long long v519 = *(_OWORD *)(v411 + 768);
                    uint64_t v520 = *(void *)(v411 + 784);
                    long long v513 = *(_OWORD *)(v411 + 944);
                    uint64_t v514 = *(void *)(v411 + 960);
                    if (v353 >= v524)
                    {
                      v413 = (char *)v523;
                      unint64_t v414 = 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)&v353[-v523] >> 4);
                      unint64_t v415 = v414 + 1;
                      if (v414 + 1 > 0x333333333333333) {
                        abort();
                      }
                      if (0x999999999999999ALL * ((uint64_t)&v524[-v523] >> 4) > v415) {
                        unint64_t v415 = 0x999999999999999ALL * ((uint64_t)&v524[-v523] >> 4);
                      }
                      if (0xCCCCCCCCCCCCCCCDLL * ((uint64_t)&v524[-v523] >> 4) >= 0x199999999999999) {
                        unint64_t v416 = 0x333333333333333;
                      }
                      else {
                        unint64_t v416 = v415;
                      }
                      if (v416)
                      {
                        if (v416 > 0x333333333333333) {
                          std::__throw_bad_array_new_length[abi:nn180100]();
                        }
                        v417 = (char *)operator new(80 * v416);
                      }
                      else
                      {
                        v417 = 0;
                      }
                      v418 = &v417[80 * v414];
                      *(void *)v418 = v410;
                      *(_OWORD *)(v418 + 8) = v521;
                      *((void *)v418 + 3) = v522;
                      *((_OWORD *)v418 + 2) = v519;
                      *((void *)v418 + 6) = v520;
                      *(_OWORD *)(v418 + 56) = v513;
                      *((void *)v418 + 9) = v514;
                      if (v353 == v413)
                      {
                        v413 = v353;
                        v419 = &v417[80 * v414];
                      }
                      else
                      {
                        v419 = &v417[80 * v414];
                        do
                        {
                          *((_OWORD *)v419 - 5) = *((_OWORD *)v353 - 5);
                          long long v420 = *((_OWORD *)v353 - 4);
                          long long v421 = *((_OWORD *)v353 - 3);
                          long long v422 = *((_OWORD *)v353 - 1);
                          *((_OWORD *)v419 - 2) = *((_OWORD *)v353 - 2);
                          *((_OWORD *)v419 - 1) = v422;
                          *((_OWORD *)v419 - 4) = v420;
                          *((_OWORD *)v419 - 3) = v421;
                          v419 -= 80;
                          v353 -= 80;
                        }
                        while (v353 != v413);
                      }
                      v353 = v418 + 80;
                      *(void *)&long long v523 = v419;
                      *((void *)&v523 + 1) = v418 + 80;
                      v524 = &v417[80 * v416];
                      if (v413) {
                        operator delete(v413);
                      }
                      uint64_t v401 = v480;
                    }
                    else
                    {
                      *(void *)v353 = v410;
                      long long v412 = v521;
                      *((void *)v353 + 3) = v522;
                      *(_OWORD *)(v353 + 8) = v412;
                      *((_OWORD *)v353 + 2) = v519;
                      *((void *)v353 + 6) = v520;
                      *(_OWORD *)(v353 + 56) = v513;
                      *((void *)v353 + 9) = v514;
                      v353 += 80;
                    }
                    *((void *)&v523 + 1) = v353;
                    uint64_t v423 = v405[7];
                    v522 = *(char **)(v423 + 696);
                    long long v521 = *(_OWORD *)(v423 + 680);
                    long long v519 = *(_OWORD *)(v423 + 768);
                    uint64_t v520 = *(void *)(v423 + 784);
                    long long v513 = *(_OWORD *)(v423 + 944);
                    uint64_t v514 = *(void *)(v423 + 960);
                    v424 = v526;
                    if (v526 >= v527)
                    {
                      v425 = (char *)v525;
                      unint64_t v426 = 0xCCCCCCCCCCCCCCCDLL * ((v526 - (unsigned char *)v525) >> 4);
                      unint64_t v427 = v426 + 1;
                      if (v426 + 1 > 0x333333333333333) {
                        abort();
                      }
                      if (0x999999999999999ALL * ((v527 - (unsigned char *)v525) >> 4) > v427) {
                        unint64_t v427 = 0x999999999999999ALL * ((v527 - (unsigned char *)v525) >> 4);
                      }
                      if (0xCCCCCCCCCCCCCCCDLL * ((v527 - (unsigned char *)v525) >> 4) >= 0x199999999999999) {
                        unint64_t v428 = 0x333333333333333;
                      }
                      else {
                        unint64_t v428 = v427;
                      }
                      if (v428)
                      {
                        if (v428 > 0x333333333333333) {
                          std::__throw_bad_array_new_length[abi:nn180100]();
                        }
                        v429 = (char *)operator new(80 * v428);
                      }
                      else
                      {
                        v429 = 0;
                      }
                      v430 = &v429[80 * v426];
                      *(void *)v430 = v410;
                      *(_OWORD *)(v430 + 8) = v521;
                      *((void *)v430 + 3) = v522;
                      *((_OWORD *)v430 + 2) = v519;
                      *((void *)v430 + 6) = v520;
                      *(_OWORD *)(v430 + 56) = v513;
                      *((void *)v430 + 9) = v514;
                      v431 = v430;
                      if (v424 == v425)
                      {
                        uint64_t p_impl = (uint64_t)v472;
                      }
                      else
                      {
                        uint64_t p_impl = (uint64_t)v472;
                        do
                        {
                          *((_OWORD *)v431 - 5) = *((_OWORD *)v424 - 5);
                          long long v432 = *((_OWORD *)v424 - 4);
                          long long v433 = *((_OWORD *)v424 - 3);
                          long long v434 = *((_OWORD *)v424 - 1);
                          *((_OWORD *)v431 - 2) = *((_OWORD *)v424 - 2);
                          *((_OWORD *)v431 - 1) = v434;
                          *((_OWORD *)v431 - 4) = v432;
                          *((_OWORD *)v431 - 3) = v433;
                          v431 -= 80;
                          v424 -= 80;
                        }
                        while (v424 != v425);
                        v424 = v425;
                      }
                      v525 = v431;
                      v527 = &v429[80 * v428];
                      uint64_t v401 = v480;
                      if (v424) {
                        operator delete(v424);
                      }
                      v424 = v430;
                      uint64_t v278 = __pl;
                    }
                    else
                    {
                      *(void *)v526 = v410;
                      *(_OWORD *)(v424 + 8) = v521;
                      *((void *)v424 + 3) = v522;
                      *((_OWORD *)v424 + 2) = v519;
                      *((void *)v424 + 6) = v520;
                      *(_OWORD *)(v424 + 56) = v513;
                      *((void *)v424 + 9) = v514;
                      uint64_t p_impl = (uint64_t)v472;
                    }
                    v526 = v424 + 80;
                    AGX::applySPIRelocations<AGX::HAL200::ObjClasses,AGX::HAL200::DynamicLibrary>(v405[7], (void *)[v405 relocations]);
                  }
                  ++v402;
                }
                while (v402 != v401);
                uint64_t v401 = [v451 countByEnumeratingWithState:&v515 objects:&v528 count:16];
                if (v401) {
                  continue;
                }
                break;
              }
            }
            long long v521 = 0uLL;
            v522 = 0;
            uint64_t v435 = v277 - v278;
            if (v277 == v278)
            {
              v436 = 0;
            }
            else
            {
              if (0xAAAAAAAAAAAAAAABLL * (v435 >> 5) > 0x2AAAAAAAAAAAAAALL) {
                abort();
              }
              v436 = (char *)operator new(v277 - v278);
              *(void *)&long long v521 = v436;
              *((void *)&v521 + 1) = v436;
              v522 = &v436[32 * (v435 >> 5)];
              size_t v437 = 96 * ((v435 - 96) / 0x60uLL) + 96;
              memcpy(v436, v278, v437);
              *((void *)&v521 + 1) = &v436[v437];
            }
            int v249 = AGX::DynamicLoader<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses,void>::load((uint64_t)v459, (uint64_t **)&v525, (uint64_t **)&v523, (size_t *)&v521, *(_DWORD *)(v444 + 1036), 0, &v504, v446 != 0);
            if (v436)
            {
              *((void *)&v521 + 1) = v436;
              operator delete(v436);
            }
LABEL_574:
            if ((void)v523) {
              operator delete((void *)v523);
            }
            if (v525) {
              operator delete(v525);
            }
            if (v278) {
              operator delete(v278);
            }
            v438 = v507;
            if (v507 && !atomic_fetch_add(&v507->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
            {
              ((void (*)(std::__shared_weak_count *))v438->__on_zero_shared)(v438);
              std::__shared_weak_count::__release_weak(v438);
            }
            goto LABEL_583;
          }
        }
        unint64_t v287 = 0x999999999999999ALL * ((v264 - v262) >> 4);
        if (v287 <= 1) {
          unint64_t v287 = 1;
        }
        if (0xCCCCCCCCCCCCCCCDLL * ((v264 - v262) >> 4) >= 0x199999999999999) {
          unint64_t v288 = 0x333333333333333;
        }
        else {
          unint64_t v288 = v287;
        }
        if (v288 > 0x333333333333333) {
          std::__throw_bad_array_new_length[abi:nn180100]();
        }
        long long v289 = v259;
        long long v290 = (char *)operator new(80 * v288);
        *(void *)long long v290 = v270;
        *(_OWORD *)(v290 + 8) = v528;
        *((void *)v290 + 3) = v529;
        *((void *)v290 + 4) = v272;
        *((void *)v290 + 5) = v271;
        *((void *)v290 + 6) = v279;
        *(_OWORD *)(v290 + 56) = v515;
        *((void *)v290 + 9) = v516;
        v280 = v290 + 80;
        v525 = v290;
        v527 = &v290[80 * v288];
        uint64_t p_impl = (uint64_t)v472;
        if (v262) {
          operator delete(v262);
        }
        v259 = v289;
        goto LABEL_383;
      }
    }
    else
    {
LABEL_79:
      if (v33) {
        goto LABEL_80;
      }
    }
LABEL_302:
    int v231 = 0;
LABEL_303:
    if (([v459 requiresRaytracingEmulation] & 1) == 0)
    {
      AGX::RenderPipeline<AGX::HAL200::ObjClasses,AGX::HAL200::Classes,AGX::HAL200::Encoders>::computeMaximumRayPayloadSizes((unsigned int *)p_impl);
      AGX::RenderPipeline<AGX::HAL200::ObjClasses,AGX::HAL200::Classes,AGX::HAL200::Encoders>::createScsPerShaderConfigTables((uint64_t *)p_impl);
      AGX::RenderPipeline<AGX::HAL200::ObjClasses,AGX::HAL200::Classes,AGX::HAL200::Encoders>::constructSpillParamsForIntersection(p_impl, v459[101]);
    }
    if (*(void *)p_impl && (*(unsigned char *)(*(void *)p_impl + 1951) & 0x18) != 0) {
      *(unsigned char *)(p_impl + 710) = 1;
    }
    uint64_t v232 = *(void *)(p_impl + 8);
    if (v232 && (*(unsigned char *)(v232 + 1951) & 0x18) != 0) {
      *(unsigned char *)(p_impl + 710) = 1;
    }
    uint64_t v233 = *(void *)(p_impl + 16);
    if (v233 && (*(unsigned char *)(v233 + 1951) & 0x18) != 0) {
      *(unsigned char *)(p_impl + 710) = 1;
    }
    uint64_t v234 = *(void *)(p_impl + 24);
    if (v234 && (*(unsigned char *)(v234 + 1951) & 0x18) != 0) {
      *(unsigned char *)(p_impl + 710) = 1;
    }
    uint64_t v235 = *(void *)(p_impl + 32);
    if (v235 && (*(unsigned char *)(v235 + 1951) & 0x18) != 0) {
      *(unsigned char *)(p_impl + 710) = 1;
    }
    AGX::RenderPipeline<AGX::HAL200::ObjClasses,AGX::HAL200::Classes,AGX::HAL200::Encoders>::constructSpillParams((int8x8_t **)p_impl, v459[101]);
    if (v231)
    {
      uint64_t v236 = *(void *)(p_impl + 32);
      if (v236) {
        AGX::VertexProgramVariant<AGX::HAL200::Encoders,AGX::HAL200::Classes>::patchPipelineRequirements(v236);
      }
      uint64_t v237 = *(void *)(p_impl + 24);
      if (v237) {
        AGX::VertexProgramVariant<AGX::HAL200::Encoders,AGX::HAL200::Classes>::patchPipelineRequirements(v237);
      }
      uint64_t v238 = *(void *)p_impl;
      if (*(void *)p_impl)
      {
        int v239 = *(unsigned __int8 *)(p_impl + 1448);
        AGX::FragmentProgramVariantESLState<AGX::HAL200::Encoders,AGX::HAL200::Classes>::patchPipelineRequirements(v238 + 1936);
        if (v239) {
          *(_DWORD *)(v238 + 3304) &= ~0x200000u;
        }
        uint64_t v240 = *(void *)p_impl;
        unsigned int v241 = *(_DWORD *)(p_impl + 732) & 0xFFDFFFFF | (((*(_DWORD *)(*(void *)p_impl + 3304) >> 21) & 1) << 21);
        *(_DWORD *)(p_impl + 732) = v241;
        unsigned int v242 = v241 & 0xFFBFFFFF | (((*(_DWORD *)(v240 + 3304) >> 22) & 1) << 22);
        *(_DWORD *)(p_impl + 732) = v242;
        unsigned int v243 = v242 & 0xFDFFFFFF | (((*(_DWORD *)(v240 + 3304) >> 25) & 1) << 25);
        *(_DWORD *)(p_impl + 732) = v243;
        unsigned int v244 = v243 & 0xFBFFFFFF | (((*(_DWORD *)(v240 + 3304) >> 26) & 1) << 26);
        *(_DWORD *)(p_impl + 732) = v244;
        *(_DWORD *)(p_impl + 732) = *(_DWORD *)(v240 + 3304) & 0xE0000000 | v244 & 0x1FFFFFFF;
        *(_DWORD *)(p_impl + 744) = *(_DWORD *)(p_impl + 744) & 0xFFFE0000 | *(_DWORD *)(v240 + 3308) & 0x1FFFF;
      }
      return v449;
    }
    uint64_t v10 = v504;
    uint64_t v9 = v449;
    goto LABEL_331;
  }
  if (objc_msgSend((id)objc_msgSend(a3, "tileAdditionalBinaryFunctions"), "count"))
  {
    uint64_t v19 = [a3 tileAdditionalBinaryFunctions];
    return [(_MTLRenderPipelineState *)self newTileRenderPipelineStateWithAdditionalBinaryFunctions:v19 error:a4];
  }
  else
  {
    uint64_t v46 = [a3 vertexAdditionalBinaryFunctions];
    uint64_t v47 = [a3 fragmentAdditionalBinaryFunctions];
    return [(AGXG17FamilyRenderPipeline *)self newRenderPipelineStateWithAdditionalBinaryFunctions:v46 fragmentAdditionalBinaryFunctions:v47 error:a4];
  }
}

- (unint64_t)meshThreadExecutionWidth
{
  return 32;
}

- (unint64_t)objectThreadExecutionWidth
{
  return 32;
}

- (id)meshFunctionHandleWithFunction:(id)a3
{
  id result = std::__hash_table<std::__hash_value_type<objc_object  {objcproto11MTLFunction}*,RetainedObjCPointer<AGXG17FamilyFunctionHandle *>>,std::__unordered_map_hasher<objc_object  {objcproto11MTLFunction},RetainedObjCPointer<AGXG17FamilyFunctionHandle *>,std::hash<objc_object  {objcproto11MTLFunction}>,std::equal_to<objc_object  {objcproto11MTLFunction}>,true>,std::__unordered_map_equal<objc_object  {objcproto11MTLFunction},RetainedObjCPointer<AGXG17FamilyFunctionHandle *>,std::equal_to,std::hash,true>,std::allocator<RetainedObjCPointer<AGXG17FamilyFunctionHandle *>>>::find<objc_object  {objcproto11MTLFunction}>(&self->_anon_1a8[2400], (unint64_t)a3);
  if (result) {
    return (id)*((void *)result + 3);
  }
  return result;
}

- (id)objectFunctionHandleWithFunction:(id)a3
{
  id result = std::__hash_table<std::__hash_value_type<objc_object  {objcproto11MTLFunction}*,RetainedObjCPointer<AGXG17FamilyFunctionHandle *>>,std::__unordered_map_hasher<objc_object  {objcproto11MTLFunction},RetainedObjCPointer<AGXG17FamilyFunctionHandle *>,std::hash<objc_object  {objcproto11MTLFunction}>,std::equal_to<objc_object  {objcproto11MTLFunction}>,true>,std::__unordered_map_equal<objc_object  {objcproto11MTLFunction},RetainedObjCPointer<AGXG17FamilyFunctionHandle *>,std::equal_to,std::hash,true>,std::allocator<RetainedObjCPointer<AGXG17FamilyFunctionHandle *>>>::find<objc_object  {objcproto11MTLFunction}>(&self->_anon_1a8[2360], (unint64_t)a3);
  if (result) {
    return (id)*((void *)result + 3);
  }
  return result;
}

- (id)tileFunctionHandleWithFunction:(id)a3
{
  id result = std::__hash_table<std::__hash_value_type<objc_object  {objcproto11MTLFunction}*,RetainedObjCPointer<AGXG17FamilyFunctionHandle *>>,std::__unordered_map_hasher<objc_object  {objcproto11MTLFunction},RetainedObjCPointer<AGXG17FamilyFunctionHandle *>,std::hash<objc_object  {objcproto11MTLFunction}>,std::equal_to<objc_object  {objcproto11MTLFunction}>,true>,std::__unordered_map_equal<objc_object  {objcproto11MTLFunction},RetainedObjCPointer<AGXG17FamilyFunctionHandle *>,std::equal_to,std::hash,true>,std::allocator<RetainedObjCPointer<AGXG17FamilyFunctionHandle *>>>::find<objc_object  {objcproto11MTLFunction}>(&self->_anon_1a8[2320], (unint64_t)a3);
  if (result) {
    return (id)*((void *)result + 3);
  }
  return result;
}

- (id)fragmentFunctionHandleWithFunction:(id)a3
{
  id result = std::__hash_table<std::__hash_value_type<objc_object  {objcproto11MTLFunction}*,RetainedObjCPointer<AGXG17FamilyFunctionHandle *>>,std::__unordered_map_hasher<objc_object  {objcproto11MTLFunction},RetainedObjCPointer<AGXG17FamilyFunctionHandle *>,std::hash<objc_object  {objcproto11MTLFunction}>,std::equal_to<objc_object  {objcproto11MTLFunction}>,true>,std::__unordered_map_equal<objc_object  {objcproto11MTLFunction},RetainedObjCPointer<AGXG17FamilyFunctionHandle *>,std::equal_to,std::hash,true>,std::allocator<RetainedObjCPointer<AGXG17FamilyFunctionHandle *>>>::find<objc_object  {objcproto11MTLFunction}>(&self->_anon_1a8[2280], (unint64_t)a3);
  if (result) {
    return (id)*((void *)result + 3);
  }
  return result;
}

- (id)vertexFunctionHandleWithFunction:(id)a3
{
  id result = std::__hash_table<std::__hash_value_type<objc_object  {objcproto11MTLFunction}*,RetainedObjCPointer<AGXG17FamilyFunctionHandle *>>,std::__unordered_map_hasher<objc_object  {objcproto11MTLFunction},RetainedObjCPointer<AGXG17FamilyFunctionHandle *>,std::hash<objc_object  {objcproto11MTLFunction}>,std::equal_to<objc_object  {objcproto11MTLFunction}>,true>,std::__unordered_map_equal<objc_object  {objcproto11MTLFunction},RetainedObjCPointer<AGXG17FamilyFunctionHandle *>,std::equal_to,std::hash,true>,std::allocator<RetainedObjCPointer<AGXG17FamilyFunctionHandle *>>>::find<objc_object  {objcproto11MTLFunction}>(&self->_anon_1a8[2240], (unint64_t)a3);
  if (result) {
    return (id)*((void *)result + 3);
  }
  return result;
}

- (unint64_t)allocatedSize
{
  uint64_t p_impl = &self->_impl;
  int8x8_t vertex_variant = self->_impl.vertex_variant;
  if (vertex_variant) {
    LODWORD(vertex_variant) = *((_DWORD *)vertex_variant + 950) + *((_DWORD *)vertex_variant + 790);
  }
  tile_variant = self->_impl.tile_variant;
  if (tile_variant) {
    LODWORD(tile_variant) = *((_DWORD *)tile_variant + 792);
  }
  fragment_variant = p_impl->fragment_variant;
  if (p_impl->fragment_variant) {
    LODWORD(fragment_variant) = *((_DWORD *)fragment_variant + 792);
  }
  int v6 = tile_variant + vertex_variant + fragment_variant;
  if (self->_anon_1a8[429]) {
    int v7 = 392;
  }
  else {
    int v7 = 0;
  }
  return (v6 + v7);
}

- (unint64_t)resourceIndex
{
  return *(unsigned int *)&self->_anon_1a8[648];
}

- (unint64_t)uniqueIdentifier
{
  unint64_t result = (unint64_t)&self->_impl;
  if (*(unsigned char *)(result + 709)) {
    return *(void *)(result + 872);
  }
  return result;
}

- (unint64_t)imageblockSampleLength
{
  fragment_variant = self->_impl.fragment_variant;
  if (fragment_variant) {
    return *((unsigned int *)fragment_variant + 814);
  }
  tile_variant = self->_impl.tile_variant;
  if (tile_variant) {
    return *((unsigned int *)tile_variant + 814);
  }
  else {
    return 0;
  }
}

- (unint64_t)imageblockMemoryLengthForDimensions:(id *)a3
{
  fragment_variant = self->_impl.fragment_variant;
  if (fragment_variant) {
    return fragment_variant[814] * a3->var1 * a3->var0 * *(_DWORD *)&self->_anon_1a8[396];
  }
  fragment_variant = self->_impl.tile_variant;
  if (fragment_variant) {
    return fragment_variant[814] * a3->var1 * a3->var0 * *(_DWORD *)&self->_anon_1a8[396];
  }
  else {
    return 0;
  }
}

- (unint64_t)imageBlockMemoryLengthForDimensions:(id *)a3
{
  fragment_variant = self->_impl.fragment_variant;
  if (fragment_variant) {
    return fragment_variant[814] * a3->var1 * a3->var0 * *(_DWORD *)&self->_anon_1a8[396];
  }
  fragment_variant = self->_impl.tile_variant;
  if (fragment_variant) {
    return fragment_variant[814] * a3->var1 * a3->var0 * *(_DWORD *)&self->_anon_1a8[396];
  }
  else {
    return 0;
  }
}

- (unint64_t)imageBlockSampleLength
{
  fragment_variant = self->_impl.fragment_variant;
  if (fragment_variant) {
    return *((unsigned int *)fragment_variant + 814);
  }
  tile_variant = self->_impl.tile_variant;
  if (tile_variant) {
    return *((unsigned int *)tile_variant + 814);
  }
  else {
    return 0;
  }
}

- (unint64_t)staticThreadgroupMemoryLength
{
  return 0;
}

- (unint64_t)maxTotalThreadsPerMeshThreadgroup
{
  mesh_variant = self->_impl.mesh_variant;
  if (mesh_variant) {
    return *((unsigned int *)mesh_variant + 879);
  }
  else {
    return 0;
  }
}

- (unint64_t)maxTotalThreadsPerObjectThreadgroup
{
  object_variant = self->_impl.object_variant;
  if (object_variant) {
    return *((unsigned int *)object_variant + 853);
  }
  else {
    return 0;
  }
}

- (unint64_t)maxTotalThreadsPerThreadgroup
{
  tile_variant = self->_impl.tile_variant;
  if (tile_variant) {
    return *((unsigned int *)tile_variant + 824);
  }
  else {
    return 0;
  }
}

- (unsigned)getFragmentShaderTelemetryID
{
  fragment_variant = self->_impl.fragment_variant;
  if (fragment_variant) {
    return *((_DWORD *)fragment_variant + 278);
  }
  else {
    return 0;
  }
}

- (unsigned)getVertexShaderTelemetryID
{
  int8x8_t vertex_variant = self->_impl.vertex_variant;
  if (vertex_variant) {
    return *((_DWORD *)vertex_variant + 278);
  }
  else {
    return 0;
  }
}

- (id)newObjectShaderDebugInfo
{
  object_variant = self->_impl.object_variant;
  if (!object_variant) {
    return 0;
  }
  if (*((char *)object_variant + 1583) < 0)
  {
    if (*((void *)object_variant + 196)) {
      goto LABEL_4;
    }
    return 0;
  }
  if (!*((unsigned char *)object_variant + 1583)) {
    return 0;
  }
LABEL_4:
  id v3 = objc_alloc(MEMORY[0x263EFF8F8]);
  if (*((char *)object_variant + 1583) < 0)
  {
    id v4 = (char *)*((void *)object_variant + 195);
    uint64_t v5 = *((void *)object_variant + 196);
  }
  else
  {
    id v4 = (char *)object_variant + 1560;
    uint64_t v5 = *((unsigned __int8 *)object_variant + 1583);
  }

  return (id)[v3 initWithBytes:v4 length:v5];
}

- (id)newMeshShaderDebugInfo
{
  mesh_variant = self->_impl.mesh_variant;
  if (!mesh_variant) {
    return 0;
  }
  if (*((char *)mesh_variant + 1583) < 0)
  {
    if (*((void *)mesh_variant + 196)) {
      goto LABEL_4;
    }
    return 0;
  }
  if (!*((unsigned char *)mesh_variant + 1583)) {
    return 0;
  }
LABEL_4:
  id v3 = objc_alloc(MEMORY[0x263EFF8F8]);
  if (*((char *)mesh_variant + 1583) < 0)
  {
    id v4 = (char *)*((void *)mesh_variant + 195);
    uint64_t v5 = *((void *)mesh_variant + 196);
  }
  else
  {
    id v4 = (char *)mesh_variant + 1560;
    uint64_t v5 = *((unsigned __int8 *)mesh_variant + 1583);
  }

  return (id)[v3 initWithBytes:v4 length:v5];
}

- (id)newFragmentShaderDebugInfo
{
  fragment_variant = self->_impl.fragment_variant;
  if (!fragment_variant) {
    return 0;
  }
  if (*((char *)fragment_variant + 1583) < 0)
  {
    if (*((void *)fragment_variant + 196)) {
      goto LABEL_4;
    }
    return 0;
  }
  if (!*((unsigned char *)fragment_variant + 1583)) {
    return 0;
  }
LABEL_4:
  id v3 = objc_alloc(MEMORY[0x263EFF8F8]);
  if (*((char *)fragment_variant + 1583) < 0)
  {
    id v4 = (char *)*((void *)fragment_variant + 195);
    uint64_t v5 = *((void *)fragment_variant + 196);
  }
  else
  {
    id v4 = (char *)fragment_variant + 1560;
    uint64_t v5 = *((unsigned __int8 *)fragment_variant + 1583);
  }

  return (id)[v3 initWithBytes:v4 length:v5];
}

- (id)newVertexShaderDebugInfo
{
  int8x8_t vertex_variant = self->_impl.vertex_variant;
  if (!vertex_variant) {
    return 0;
  }
  if (*((char *)vertex_variant + 1583) < 0)
  {
    if (*((void *)vertex_variant + 196)) {
      goto LABEL_4;
    }
    return 0;
  }
  if (!*((unsigned char *)vertex_variant + 1583)) {
    return 0;
  }
LABEL_4:
  id v3 = objc_alloc(MEMORY[0x263EFF8F8]);
  if (*((char *)vertex_variant + 1583) < 0)
  {
    id v4 = (char *)*((void *)vertex_variant + 195);
    uint64_t v5 = *((void *)vertex_variant + 196);
  }
  else
  {
    id v4 = (char *)vertex_variant + 1560;
    uint64_t v5 = *((unsigned __int8 *)vertex_variant + 1583);
  }

  return (id)[v3 initWithBytes:v4 length:v5];
}

- (void)dealloc
{
  self->_vp = 0;
  self->_fp = 0;

  self->_basePipeline = 0;
  self->_op = 0;

  self->_mp = 0;
  v3.receiver = self;
  v3.super_class = (Class)AGXG17FamilyRenderPipeline;
  [(_MTLRenderPipelineState *)&v3 dealloc];
}

- (AGXG17FamilyRenderPipeline)initWithParent:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)AGXG17FamilyRenderPipeline;
  id v4 = -[_MTLRenderPipelineState initWithParent:](&v6, sel_initWithParent_);
  if (v4) {
    v4->_basePipeline = (AGXG17FamilyRenderPipeline *)a3;
  }
  return v4;
}

- (AGXG17FamilyRenderPipeline)initWithDevice:(id)a3 meshRenderPipelineStateDescriptor:(id)a4 objectThreadExecutionWidth:(unint64_t)a5 meshThreadExecutionWidth:(unint64_t)a6 maxTotalThreadgroupsPerMeshGrid:(unint64_t)a7
{
  v16.receiver = self;
  v16.super_class = (Class)AGXG17FamilyRenderPipeline;
  uint64_t v8 = [(_MTLRenderPipelineState *)&v16 initWithDevice:a3 meshRenderPipelineStateDescriptor:a4 objectThreadExecutionWidth:a5 meshThreadExecutionWidth:a6 maxTotalThreadgroupsPerMeshGrid:a7];
  if (v8)
  {
    uint64_t v9 = (AGXG17FamilyFragmentProgram *)objc_msgSend((id)objc_msgSend(a4, "fragmentFunction"), "vendorPrivate");
    v8->_fp = v9;
    uint64_t v10 = v9;
    id v11 = (AGXG17FamilyObjectProgram *)objc_msgSend((id)objc_msgSend(a4, "objectFunction"), "vendorPrivate");
    v8->_op = v11;
    v12 = v11;
    id v13 = (AGXG17FamilyMeshProgram *)objc_msgSend((id)objc_msgSend(a4, "meshFunction"), "vendorPrivate");
    v8->_mp = v13;
    uint64_t v14 = v13;
  }
  return v8;
}

- (AGXG17FamilyRenderPipeline)initWithDevice:(id)a3 meshRenderPipelineStateDescriptor:(id)a4 objectThreadExecutionWidth:(unint64_t)a5 meshThreadExecutionWidth:(unint64_t)a6
{
  v15.receiver = self;
  v15.super_class = (Class)AGXG17FamilyRenderPipeline;
  int v7 = [(_MTLRenderPipelineState *)&v15 initWithDevice:a3 meshRenderPipelineStateDescriptor:a4 objectThreadExecutionWidth:a5 meshThreadExecutionWidth:a6];
  if (v7)
  {
    uint64_t v8 = (AGXG17FamilyFragmentProgram *)objc_msgSend((id)objc_msgSend(a4, "fragmentFunction"), "vendorPrivate");
    v7->_fp = v8;
    uint64_t v9 = v8;
    uint64_t v10 = (AGXG17FamilyObjectProgram *)objc_msgSend((id)objc_msgSend(a4, "objectFunction"), "vendorPrivate");
    v7->_op = v10;
    id v11 = v10;
    v12 = (AGXG17FamilyMeshProgram *)objc_msgSend((id)objc_msgSend(a4, "meshFunction"), "vendorPrivate");
    v7->_mp = v12;
    id v13 = v12;
  }
  return v7;
}

- (AGXG17FamilyRenderPipeline)initWithDevice:(id)a3 pipelineStateDescriptor:(id)a4
{
  v15.receiver = self;
  v15.super_class = (Class)AGXG17FamilyRenderPipeline;
  uint64_t v5 = -[_MTLRenderPipelineState initWithDevice:pipelineStateDescriptor:](&v15, sel_initWithDevice_pipelineStateDescriptor_, a3);
  if (v5)
  {
    objc_super v6 = (AGXG17FamilyFragmentProgram *)objc_msgSend((id)objc_msgSend(a4, "fragmentFunction"), "vendorPrivate");
    v5->_fp = v6;
    int v7 = v6;
    uint64_t v8 = (AGXG17FamilyVertexProgram *)objc_msgSend((id)objc_msgSend(a4, "vertexFunction"), "vendorPrivate");
    v5->_vp = v8;
    uint64_t v9 = v8;
    uint64_t v10 = (AGXG17FamilyObjectProgram *)objc_msgSend((id)objc_msgSend(a4, "objectFunction"), "vendorPrivate");
    v5->_op = v10;
    id v11 = v10;
    v12 = (AGXG17FamilyMeshProgram *)objc_msgSend((id)objc_msgSend(a4, "meshFunction"), "vendorPrivate");
    v5->_mp = v12;
    id v13 = v12;
  }
  return v5;
}

@end