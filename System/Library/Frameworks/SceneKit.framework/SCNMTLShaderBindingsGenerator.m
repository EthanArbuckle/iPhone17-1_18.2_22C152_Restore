@interface SCNMTLShaderBindingsGenerator
+ (void)allocateRegistry;
+ (void)deallocateRegistry;
+ (void)registerArgument:(id)a3 frequency:(int)a4 block:(id)a5;
+ (void)registerArgument:(id)a3 frequency:(int)a4 needsRenderResource:(BOOL)a5 block:(id)a6;
+ (void)registerSemantic:(id)a3 withBlock:(id)a4;
+ (void)registerShadableArgumentBindingBlockForBuffers:(id)a3 textures:(id)a4 samplers:(id)a5;
+ (void)registerUserBlockTrampoline:(id)a3;
- (BOOL)addPassResourceBindingsForArgument:(id)a3;
- (SCNMTLShaderBindingsGenerator)init;
- (id)_dictionaryForFrequency:(int)a3;
- (int64_t)_searchArguments:(id)a3 forArgumentNamed:(id)a4 type:(unint64_t)a5;
- (void)_checkForAssociatedSamplerOnBinding:(id)a3 argument:(id)a4;
- (void)_parseArguments:(id)a3 function:(id)a4 renderPipeline:(id)a5;
- (void)addResourceBindingsForArgument:(id)a3 frequency:(int)a4 needsRenderResource:(BOOL)a5 block:(id)a6;
- (void)dealloc;
- (void)generateBindingsForPipeline:(id)a3 withReflection:(id)a4 program:(__C3DFXMetalProgram *)a5 material:(__C3DMaterial *)a6 geometry:(__C3DGeometry *)a7 pass:(__C3DFXPass *)a8;
@end

@implementation SCNMTLShaderBindingsGenerator

- (void)_parseArguments:(id)a3 function:(id)a4 renderPipeline:(id)a5
{
  uint64_t v56 = *MEMORY[0x263EF8340];
  if (!a4)
  {
    v7 = scn_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      -[SCNMTLShaderBindingsGenerator _parseArguments:function:renderPipeline:](v7, v8, v9, v10, v11, v12, v13, v14);
    }
  }
  int v40 = SCNMTLFunctionTypeToProgramStage([a4 functionType]);
  self->_current.stage = v40;
  self->_current.arguments = (NSArray *)a3;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  uint64_t v15 = [a3 countByEnumeratingWithState:&v49 objects:v55 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v50;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v50 != v16) {
          objc_enumerationMutation(a3);
        }
        v18 = *(void **)(*((void *)&v49 + 1) + 8 * v17);
        if ([v18 isActive]
          && [v18 type] != 3
          && ([v18 type]
           || (objc_msgSend((id)objc_msgSend(v18, "name"), "hasPrefix:", @"vertexBuffer.") & 1) == 0)
          && (objc_msgSend((id)objc_msgSend(v18, "name"), "isEqualToString:", @"osdIndicesBuffer") & 1) == 0
          && (objc_msgSend((id)objc_msgSend(v18, "name"), "isEqualToString:", @"osdTessellationLevel") & 1) == 0
          && (objc_msgSend((id)objc_msgSend(v18, "name"), "isEqualToString:", @"osdVertexBuffer") & 1) == 0
          && (objc_msgSend((id)objc_msgSend(v18, "name"), "isEqualToString:", @"osdFaceVaryingData") & 1) == 0
          && (objc_msgSend((id)objc_msgSend(v18, "name"), "isEqualToString:", @"osdFaceVaryingIndices") & 1) == 0
          && (objc_msgSend((id)objc_msgSend(v18, "name"), "isEqualToString:", @"osdFaceVaryingPatchParams") & 1) == 0
          && (objc_msgSend((id)objc_msgSend(v18, "name"), "isEqualToString:", @"osdFaceVaryingPatchArray") & 1) == 0
          && (objc_msgSend((id)objc_msgSend(v18, "name"), "isEqualToString:", @"osdFaceVaryingChannelCount") & 1) == 0
          && (objc_msgSend((id)objc_msgSend(v18, "name"), "isEqualToString:", @"osdFaceVaryingChannelDescriptors") & 1) == 0
          && (objc_msgSend((id)objc_msgSend(v18, "name"), "isEqualToString:", @"osdFaceVaryingPatchArrayIndex") & 1) == 0
          && (objc_msgSend((id)objc_msgSend(v18, "name"), "isEqualToString:", @"osdFaceVaryingChannelsPackedData") & 1) == 0
          && (objc_msgSend((id)objc_msgSend(v18, "name"), "isEqualToString:", @"vertexBuffer") & 1) == 0
          && (objc_msgSend((id)objc_msgSend(v18, "name"), "isEqualToString:", @"indexBuffer") & 1) == 0
          && (objc_msgSend((id)objc_msgSend(v18, "name"), "isEqualToString:", @"patchParamBuffer") & 1) == 0
          && (objc_msgSend((id)objc_msgSend(v18, "name"), "isEqualToString:", @"perPatchVertexBuffer") & 1) == 0
          && (objc_msgSend((id)objc_msgSend(v18, "name"), "isEqualToString:", @"patchTessBuffer") & 1) == 0)
        {
          uint64_t v19 = objc_msgSend((id)__argumentRegistry, "objectForKeyedSubscript:", objc_msgSend(v18, "name"));
          if (v19)
          {
            [(SCNMTLShaderBindingsGenerator *)self addResourceBindingsForArgument:v18 frequency:*(unsigned int *)(v19 + 16) needsRenderResource:*(unsigned __int8 *)(v19 + 20) block:*(void *)(v19 + 8)];
            goto LABEL_62;
          }
          if ([v18 type])
          {
            if ([v18 type] == 2 && self->_current.pass)
            {
LABEL_34:
              if ([(SCNMTLShaderBindingsGenerator *)self addPassResourceBindingsForArgument:v18])
              {
                goto LABEL_62;
              }
            }
LABEL_35:
            -[SCNMTLShaderBindingsGenerator addResourceBindingsForArgument:frequency:needsRenderResource:block:](self, "addResourceBindingsForArgument:frequency:needsRenderResource:block:", v18, 2, 1, __shadableArgumentBindingBlocks[[v18 type]]);
            goto LABEL_62;
          }
          if ((objc_msgSend((id)objc_msgSend(v18, "name"), "isEqualToString:", @"scn_node") & 1) != 0
            || (objc_msgSend((id)objc_msgSend(v18, "name"), "isEqualToString:", @"scn_nodes") & 1) != 0
            || objc_msgSend((id)objc_msgSend(v18, "name"), "isEqualToString:", @"scn_lights"))
          {
            if (objc_msgSend((id)objc_msgSend(v18, "name", self->_nodeBindings), "isEqualToString:", @"scn_lights"))lightBindings = self->_lightBindings; {
            uint64_t v20 = objc_msgSend(v18, "name", lightBindings);
            }
            v21 = (SCNMTLSemanticResourceBinding *)[v31 objectForKeyedSubscript:v20];
            v32 = v21;
            if (v21)
            {
              v22 = v21;
            }
            else
            {
              v32 = objc_alloc_init(SCNMTLSemanticResourceBinding);
              [(SCNMTLResourceBinding *)v32 setArgument:v18];
              if ([v18 bufferDataType] == 1)
              {
                __src = 0;
                v47 = 0;
                uint64_t v48 = 0;
                long long v42 = 0u;
                long long v43 = 0u;
                long long v44 = 0u;
                long long v45 = 0u;
                id obj = (id)objc_msgSend((id)objc_msgSend(v18, "bufferStructType"), "members");
                uint64_t v35 = [obj countByEnumeratingWithState:&v42 objects:v54 count:16];
                if (v35)
                {
                  uint64_t v34 = *(void *)v43;
                  do
                  {
                    for (size_t __n = 0; __n != v35; ++__n)
                    {
                      if (*(void *)v43 != v34) {
                        objc_enumerationMutation(obj);
                      }
                      v37 = *(MTLStructMember **)(*((void *)&v42 + 1) + 8 * __n);
                      uint64_t v23 = objc_msgSend((id)__semanticRegistry, "objectForKeyedSubscript:", -[MTLStructMember name](v37, "name"));
                      if (v23)
                      {
                        long long buf = (unint64_t)v23;
                        DWORD2(buf) = [(MTLStructMember *)v37 offset];
                        HIDWORD(buf) = __structMemberSize(v37);
                        std::vector<SCNSemanticBinding>::push_back[abi:nn180100](&__src, &buf);
                      }
                      else
                      {
                        log = scn_default_log();
                        if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
                        {
                          uint64_t v24 = [(MTLStructMember *)v37 name];
                          LODWORD(buf) = 138412290;
                          *(void *)((char *)&buf + 4) = v24;
                          _os_log_impl(&dword_20B249000, log, OS_LOG_TYPE_DEFAULT, "Warning: unknown member in scn automated buffer : %@", (uint8_t *)&buf, 0xCu);
                        }
                      }
                    }
                    uint64_t v35 = [obj countByEnumeratingWithState:&v42 objects:v54 count:16];
                  }
                  while (v35);
                }
                [(SCNMTLSemanticResourceBinding *)v32 setSemanticsCount:(v47 - (unsigned char *)__src) >> 4];
                if ([(SCNMTLSemanticResourceBinding *)v32 semanticsCount])
                {
                  uint64_t __na = 16 * [(SCNMTLSemanticResourceBinding *)v32 semanticsCount];
                  v32->_semantics = ($CA5999E4A43FCC3CCFD73A03B2056697 *)malloc_type_malloc(__na, 0xFC168213uLL);
                  memcpy(v32->_semantics, __src, __na);
                  -[SCNMTLSemanticResourceBinding setBufferSize:](v32, "setBufferSize:", [v18 bufferDataSize]);
                }
                objc_msgSend(v31, "setObject:forKeyedSubscript:", v32, objc_msgSend(v18, "name"));
                if (__src)
                {
                  v47 = __src;
                  operator delete(__src);
                }
              }
            }
            char v25 = [v18 index];
            p_indices = &v32->super._indices;
            if (v40) {
              p_indices = ($E8FEF9D34A3DFDCB69CDC2374B44012F *)&v32->super._indices.fragmentIndex;
            }
            p_indices->vertexIndex = v25;
          }
          else if ([v18 bufferDataType] == 1 {
                 && ((objc_msgSend((id)objc_msgSend(v18, "name"), "isEqualToString:", @"scn_frame") & 1) != 0
          }
                  || objc_msgSend((id)objc_msgSend(v18, "name"), "isEqualToString:", @"scn_frame_multi")))
          {
            char v27 = [v18 index];
            if (v40) {
              self->_sceneBuffer.fragmentIndex = v27;
            }
            else {
              self->_sceneBuffer.vertexIndex = v27;
            }
          }
          else
          {
            id v28 = -[NSDictionary objectForKey:](self->_current.customBlocks, "objectForKey:", [v18 name]);
            if (!v28)
            {
              if (self->_current.pass && [v18 bufferDataType] == 1) {
                goto LABEL_34;
              }
              goto LABEL_35;
            }
            (*(void (**)(uint64_t, id, void *, SCNMTLShaderBindingsGenerator *))(__trampolineUserBufferBlock
                                                                                         + 16))(__trampolineUserBufferBlock, v28, v18, self);
          }
        }
LABEL_62:
        ++v17;
      }
      while (v17 != v15);
      uint64_t v29 = [a3 countByEnumeratingWithState:&v49 objects:v55 count:16];
      uint64_t v15 = v29;
    }
    while (v29);
  }
}

- (void)addResourceBindingsForArgument:(id)a3 frequency:(int)a4 needsRenderResource:(BOOL)a5 block:(id)a6
{
  BOOL v7 = a5;
  id v10 = [(SCNMTLShaderBindingsGenerator *)self _dictionaryForFrequency:*(void *)&a4];
  uint64_t v11 = (SCNMTLResourceBinding *)objc_msgSend(v10, "objectForKeyedSubscript:", objc_msgSend(a3, "name"));
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = [(SCNMTLResourceBinding *)v11 type];
    if (v13 != [a3 type])
    {
      uint64_t v14 = scn_default_log();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
        -[SCNMTLShaderBindingsGenerator addResourceBindingsForArgument:frequency:needsRenderResource:block:](a3, v12);
      }
    }
    if ([(SCNMTLResourceBinding *)v12 bindBlock] != a6)
    {
      uint64_t v15 = scn_default_log();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT)) {
        -[SCNMTLShaderBindingsGenerator addResourceBindingsForArgument:frequency:needsRenderResource:block:](v15, v16, v17, v18, v19, v20, v21, v22);
      }
    }
  }
  else
  {
    uint64_t v12 = objc_alloc_init(SCNMTLResourceBinding);
    [(SCNMTLResourceBinding *)v12 setBindBlock:a6];
    [(SCNMTLResourceBinding *)v12 setNeedsRenderResource:v7];
    [(SCNMTLResourceBinding *)v12 setArgument:a3];
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v12, objc_msgSend(a3, "name"));
  }
  int stage = self->_current.stage;
  if (stage == 1)
  {
    v12->_indices.fragmentIndex = [a3 index];
  }
  else if (stage)
  {
    uint64_t v24 = scn_default_log();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      -[SCNMTLShaderBindingsGenerator _checkForAssociatedSamplerOnBinding:argument:]((uint64_t)&self->_current, v24, v25, v26, v27, v28, v29, v30);
    }
  }
  else
  {
    v12->_indices.vertexIndex = [a3 index];
  }
  if ([a3 type] == 2) {
    [(SCNMTLShaderBindingsGenerator *)self _checkForAssociatedSamplerOnBinding:v12 argument:a3];
  }
}

- (id)_dictionaryForFrequency:(int)a3
{
  if (a3 <= 3) {
    return *(Class *)((char *)&self->super.isa + qword_20B5EE710[a3]);
  }
  return v3;
}

- (void)_checkForAssociatedSamplerOnBinding:(id)a3 argument:(id)a4
{
  int64_t v6 = -[SCNMTLShaderBindingsGenerator _searchArguments:forArgumentNamed:type:](self, "_searchArguments:forArgumentNamed:type:", self->_current.arguments, objc_msgSend((id)objc_msgSend(a4, "name"), "stringByAppendingString:", @"Sampler"), 3);
  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    int stage = self->_current.stage;
    p_current = &self->_current;
    int v7 = stage;
    if (stage == 1)
    {
      *((unsigned char *)a3 + 12) = v6;
    }
    else if (v7)
    {
      id v10 = scn_default_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[SCNMTLShaderBindingsGenerator _checkForAssociatedSamplerOnBinding:argument:]((uint64_t)p_current, v10, v11, v12, v13, v14, v15, v16);
      }
    }
    else
    {
      *((unsigned char *)a3 + 11) = v6;
    }
  }
}

- (int64_t)_searchArguments:(id)a3 forArgumentNamed:(id)a4 type:(unint64_t)a5
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v8 = [a3 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v16;
LABEL_3:
    uint64_t v11 = 0;
    while (1)
    {
      if (*(void *)v16 != v10) {
        objc_enumerationMutation(a3);
      }
      uint64_t v12 = *(void **)(*((void *)&v15 + 1) + 8 * v11);
      if (objc_msgSend((id)objc_msgSend(v12, "name"), "isEqualToString:", a4)) {
        break;
      }
      if (v9 == ++v11)
      {
        uint64_t v9 = [a3 countByEnumeratingWithState:&v15 objects:v23 count:16];
        if (v9) {
          goto LABEL_3;
        }
        return 0x7FFFFFFFFFFFFFFFLL;
      }
    }
    if ([v12 type] == a5) {
      return [v12 index];
    }
    uint64_t v14 = scn_default_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412546;
      id v20 = a4;
      __int16 v21 = 1024;
      int v22 = a5;
      _os_log_impl(&dword_20B249000, v14, OS_LOG_TYPE_DEFAULT, "Warning: arguments named %@ is reserved for type %d", buf, 0x12u);
    }
  }
  return 0x7FFFFFFFFFFFFFFFLL;
}

+ (void)registerArgument:(id)a3 frequency:(int)a4 block:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  if (objc_msgSend((id)__argumentRegistry, "objectForKey:"))
  {
    uint64_t v8 = scn_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      +[SCNMTLShaderBindingsGenerator registerArgument:frequency:block:](v8, v9, v10, v11, v12, v13, v14, v15);
    }
  }
  long long v16 = [[SCNMTLArgumentBinder alloc] initWithBlock:a5 frequency:v6 needsRenderResource:0];
  [(id)__argumentRegistry setObject:v16 forKey:a3];
}

+ (void)registerSemantic:(id)a3 withBlock:(id)a4
{
  if (objc_msgSend((id)__semanticRegistry, "objectForKey:"))
  {
    uint64_t v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      +[SCNMTLShaderBindingsGenerator registerSemantic:withBlock:](v6, v7, v8, v9, v10, v11, v12, v13);
    }
  }
  [(id)__semanticRegistry setObject:_Block_copy(a4) forKey:a3];
}

+ (void)registerArgument:(id)a3 frequency:(int)a4 needsRenderResource:(BOOL)a5 block:(id)a6
{
  BOOL v7 = a5;
  uint64_t v8 = *(void *)&a4;
  if (objc_msgSend((id)__argumentRegistry, "objectForKey:"))
  {
    uint64_t v10 = scn_default_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      +[SCNMTLShaderBindingsGenerator registerArgument:frequency:block:](v10, v11, v12, v13, v14, v15, v16, v17);
    }
  }
  long long v18 = [[SCNMTLArgumentBinder alloc] initWithBlock:a6 frequency:v8 needsRenderResource:v7];
  [(id)__argumentRegistry setObject:v18 forKey:a3];
}

+ (void)registerUserBlockTrampoline:(id)a3
{
  __trampolineUserBufferBlock = (uint64_t)_Block_copy(a3);
}

+ (void)registerShadableArgumentBindingBlockForBuffers:(id)a3 textures:(id)a4 samplers:(id)a5
{
  __shadableArgumentBindingBlocks[0] = (uint64_t)_Block_copy(a3);
  qword_2676970E0 = (uint64_t)_Block_copy(a4);
  qword_2676970E8 = (uint64_t)_Block_copy(a5);
}

- (void)generateBindingsForPipeline:(id)a3 withReflection:(id)a4 program:(__C3DFXMetalProgram *)a5 material:(__C3DMaterial *)a6 geometry:(__C3DGeometry *)a7 pass:(__C3DFXPass *)a8
{
  p_generateLock = &self->_generateLock;
  os_unfair_lock_lock(&self->_generateLock);
  self->_current.customBlocks = (NSDictionary *)C3DFXMetalProgramGetBufferBindings(a5);
  self->_current.pass = a8;
  if (a6) {
    C3DMaterialGetCommonProfileIfNoTechnique((uint64_t)a6);
  }
  self->_sceneBuffer = ($E8FEF9D34A3DFDCB69CDC2374B44012F)-1;
  if ([a3 vertexFunction]) {
    -[SCNMTLShaderBindingsGenerator _parseArguments:function:renderPipeline:](self, "_parseArguments:function:renderPipeline:", [a4 vertexArguments], objc_msgSend(a3, "vertexFunction"), a3);
  }
  if ([a3 fragmentFunction]) {
    -[SCNMTLShaderBindingsGenerator _parseArguments:function:renderPipeline:](self, "_parseArguments:function:renderPipeline:", [a4 fragmentArguments], objc_msgSend(a3, "fragmentFunction"), a3);
  }
  if (self->_sceneBuffer.vertexIndex != 255
    || self->_sceneBuffer.fragmentIndex != 255)
  {
    *((_WORD *)a3 + 4) = self->_sceneBuffer;
  }
  if ([(NSMutableDictionary *)self->_frameBindings count])
  {
    objc_msgSend(a3, "setFrameBufferBindings:", -[NSMutableDictionary allValues](self->_frameBindings, "allValues"));
    [(NSMutableDictionary *)self->_frameBindings removeAllObjects];
  }
  if ([(NSMutableDictionary *)self->_nodeBindings count])
  {
    objc_msgSend(a3, "setNodeBufferBindings:", -[NSMutableDictionary allValues](self->_nodeBindings, "allValues"));
    [(NSMutableDictionary *)self->_nodeBindings removeAllObjects];
  }
  if ([(NSMutableDictionary *)self->_passBindings count])
  {
    objc_msgSend(a3, "setPassBufferBindings:", -[NSMutableDictionary allValues](self->_passBindings, "allValues"));
    [(NSMutableDictionary *)self->_passBindings removeAllObjects];
  }
  if ([(NSMutableDictionary *)self->_shadableBindings count])
  {
    objc_msgSend(a3, "setShadableBufferBindings:", -[NSMutableDictionary allValues](self->_shadableBindings, "allValues"));
    [(NSMutableDictionary *)self->_shadableBindings removeAllObjects];
  }
  if ([(NSMutableDictionary *)self->_lightBindings count])
  {
    objc_msgSend(a3, "setLightBufferBindings:", -[NSMutableDictionary allValues](self->_lightBindings, "allValues"));
    [(NSMutableDictionary *)self->_lightBindings removeAllObjects];
  }
  objc_msgSend(a3, "_computeUsageForArguments:function:", objc_msgSend(a4, "vertexArguments"), objc_msgSend(a3, "vertexFunction"));
  objc_msgSend(a3, "_computeUsageForArguments:function:", objc_msgSend(a4, "fragmentArguments"), objc_msgSend(a3, "fragmentFunction"));

  os_unfair_lock_unlock(p_generateLock);
}

- (SCNMTLShaderBindingsGenerator)init
{
  v5.receiver = self;
  v5.super_class = (Class)SCNMTLShaderBindingsGenerator;
  v2 = [(SCNMTLShaderBindingsGenerator *)&v5 init];
  v3 = v2;
  if (v2)
  {
    v2->_generateLock._os_unfair_lock_opaque = 0;
    v2->_passBindings = (NSMutableDictionary *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:16];
    v3->_nodeBindings = (NSMutableDictionary *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:16];
    v3->_frameBindings = (NSMutableDictionary *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:16];
    v3->_shadableBindings = (NSMutableDictionary *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:16];
    v3->_lightBindings = (NSMutableDictionary *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:16];
  }
  return v3;
}

+ (void)allocateRegistry
{
}

+ (void)deallocateRegistry
{
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SCNMTLShaderBindingsGenerator;
  [(SCNMTLShaderBindingsGenerator *)&v3 dealloc];
}

- (BOOL)addPassResourceBindingsForArgument:(id)a3
{
  uint64_t v94 = *MEMORY[0x263EF8340];
  id v5 = [(SCNMTLShaderBindingsGenerator *)self _dictionaryForFrequency:3];
  uint64_t v6 = (SCNMTLPassResourceBinding *)objc_msgSend(v5, "objectForKeyedSubscript:", objc_msgSend(a3, "name"));
  if (v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      BOOL v7 = scn_default_log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
        -[SCNMTLShaderBindingsGenerator addPassResourceBindingsForArgument:].cold.6(v7, v8, v9, v10, v11, v12, v13, v14);
      }
    }
    uint64_t v15 = [(SCNMTLResourceBinding *)v6 type];
    if (v15 != [a3 type])
    {
      uint64_t v16 = scn_default_log();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
        -[SCNMTLShaderBindingsGenerator addPassResourceBindingsForArgument:].cold.5(a3, v6);
      }
    }
    uint64_t v17 = v6;
    if ([(SCNMTLResourceBinding *)v6 bindBlock])
    {
      long long v18 = scn_default_log();
      uint64_t v17 = v6;
      if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
      {
        -[SCNMTLShaderBindingsGenerator addPassResourceBindingsForArgument:].cold.4(v18, v19, v20, v21, v22, v23, v24, v25);
        uint64_t v17 = v6;
      }
    }
  }
  else
  {
    uint64_t v17 = objc_alloc_init(SCNMTLPassResourceBinding);
    [(SCNMTLResourceBinding *)v17 setBindBlock:0];
    [(SCNMTLResourceBinding *)v17 setNeedsRenderResource:0];
    [(SCNMTLResourceBinding *)v17 setArgument:a3];
  }
  int stage = self->_current.stage;
  if (stage == 1)
  {
    v17->super._indices.fragmentIndex = [a3 index];
  }
  else if (stage)
  {
    uint64_t v27 = scn_default_log();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
      -[SCNMTLShaderBindingsGenerator _checkForAssociatedSamplerOnBinding:argument:]((uint64_t)&self->_current, v27, v28, v29, v30, v31, v32, v33);
    }
  }
  else
  {
    v17->super._indices.vertexIndex = [a3 index];
  }
  if ([a3 type] == 2)
  {
    if (v6)
    {
LABEL_22:
      [(SCNMTLShaderBindingsGenerator *)self _checkForAssociatedSamplerOnBinding:v17 argument:a3];
      goto LABEL_24;
    }
    InputWithName = (__C3DFXPassInput *)C3DFXPassGetInputWithName((uint64_t)self->_current.pass, (void *)[a3 name]);
    if (InputWithName)
    {
      v17->_samplerInput = InputWithName;
      goto LABEL_22;
    }
  }
  else
  {
    if ([a3 type])
    {
LABEL_24:
      if (v6)
      {
LABEL_26:
        LOBYTE(InputWithName) = 1;
        return (char)InputWithName;
      }
LABEL_25:
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v17, objc_msgSend(a3, "name"));
      goto LABEL_26;
    }
    if ([a3 bufferDataType] != 1)
    {
      uint64_t v35 = scn_default_log();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_FAULT)) {
        -[SCNMTLShaderBindingsGenerator addPassResourceBindingsForArgument:](v35, v36, v37, v38, v39, v40, v41, v42);
      }
    }
    if (v6)
    {
      uint64_t v43 = [(SCNMTLPassResourceBinding *)v17 bufferSize];
      if (v43 != [a3 bufferDataSize])
      {
        long long v44 = scn_default_log();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_FAULT)) {
          -[SCNMTLShaderBindingsGenerator addPassResourceBindingsForArgument:](v44, v45, v46, v47, v48, v49, v50, v51);
        }
      }
      goto LABEL_26;
    }
    id v82 = a3;
    p_isa = (void **)&v17->super.super.isa;
    id v81 = v5;
    __src = 0;
    v89 = 0;
    unint64_t v90 = 0;
    long long v84 = 0u;
    long long v85 = 0u;
    long long v86 = 0u;
    long long v87 = 0u;
    long long v52 = objc_msgSend((id)objc_msgSend(a3, "bufferStructType"), "members");
    uint64_t v53 = [v52 countByEnumeratingWithState:&v84 objects:v93 count:16];
    if (v53)
    {
      uint64_t v54 = *(void *)v85;
      do
      {
        for (uint64_t i = 0; i != v53; ++i)
        {
          if (*(void *)v85 != v54) {
            objc_enumerationMutation(v52);
          }
          uint64_t v56 = *(void **)(*((void *)&v84 + 1) + 8 * i);
          v57 = (__int16 *)C3DFXPassGetInputWithName((uint64_t)self->_current.pass, (void *)[v56 name]);
          if (v57)
          {
            v58 = (void *)[v56 arrayType];
            if ([v56 dataType] == 2
              && (uint64_t v59 = [v58 elementType], v59 == SCNMTLDataTypeFromC3DBaseType(v57[10]))
              || (uint64_t v60 = [v56 dataType], v60 == SCNMTLDataTypeFromC3DBaseType(v57[10]))
              && *((void *)v57 + 3) == 1)
            {
              int v61 = [v56 offset];
              if (v58)
              {
                [v58 arrayLength];
                int Size = SCNMTLDataTypeGetSize([v58 elementType]);
                uint64_t v63 = [v58 arrayLength];
                uint64_t v64 = *((void *)v57 + 3);
                if (v63 < v64) {
                  LODWORD(v64) = v63;
                }
              }
              else
              {
                int Size = SCNMTLDataTypeGetSize([v56 dataType]);
                uint64_t v64 = *((void *)v57 + 3);
              }
              int v67 = Size * v64;
              v68 = v89;
              if ((unint64_t)v89 >= v90)
              {
                int64_t v70 = (v89 - (unsigned char *)__src) >> 4;
                unint64_t v71 = v70 + 1;
                if ((unint64_t)(v70 + 1) >> 60) {
                  abort();
                }
                uint64_t v72 = v90 - (void)__src;
                if ((uint64_t)(v90 - (void)__src) >> 3 > v71) {
                  unint64_t v71 = v72 >> 3;
                }
                if ((unint64_t)v72 >= 0x7FFFFFFFFFFFFFF0) {
                  unint64_t v73 = 0xFFFFFFFFFFFFFFFLL;
                }
                else {
                  unint64_t v73 = v71;
                }
                if (v73) {
                  v74 = (char *)_ZNSt3__119__allocate_at_leastB8nn180100INS_9allocatorIDv3_fEEEENS_19__allocation_resultINS_16allocator_traitsIT_E7pointerEEERS6_m((uint64_t)&v90, v73);
                }
                else {
                  v74 = 0;
                }
                v75 = &v74[16 * v70];
                *(void *)v75 = v57;
                *((_DWORD *)v75 + 2) = v61;
                *((_DWORD *)v75 + 3) = v67;
                v77 = (char *)__src;
                v76 = v89;
                v78 = v75;
                if (v89 != __src)
                {
                  do
                  {
                    *((_OWORD *)v78 - 1) = *((_OWORD *)v76 - 1);
                    v78 -= 16;
                    v76 -= 16;
                  }
                  while (v76 != v77);
                  v76 = (char *)__src;
                }
                v69 = v75 + 16;
                __src = v78;
                v89 = v75 + 16;
                unint64_t v90 = (unint64_t)&v74[16 * v73];
                if (v76) {
                  operator delete(v76);
                }
              }
              else
              {
                *(void *)v89 = v57;
                v69 = v68 + 16;
                *((_DWORD *)v68 + 2) = v61;
                *((_DWORD *)v68 + 3) = v67;
              }
              v89 = v69;
            }
            else
            {
              v65 = scn_default_log();
              if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
              {
                uint64_t v66 = [v56 name];
                *(_DWORD *)long long buf = 138412290;
                uint64_t v92 = v66;
                _os_log_impl(&dword_20B249000, v65, OS_LOG_TYPE_DEFAULT, "Warning: struct member does not match pass description : %@", buf, 0xCu);
              }
            }
          }
        }
        uint64_t v53 = [v52 countByEnumeratingWithState:&v84 objects:v93 count:16];
      }
      while (v53);
    }
    if (v89 != __src)
    {
      uint64_t v17 = (SCNMTLPassResourceBinding *)p_isa;
      [p_isa setInputsCount:(v89 - (unsigned char *)__src) >> 4];
      id v5 = v81;
      a3 = v82;
      size_t v79 = 16 * [p_isa inputsCount];
      p_isa[6] = malloc_type_malloc(v79, 0x6773D8EAuLL);
      memcpy(p_isa[6], __src, v79);
      objc_msgSend(p_isa, "setBufferSize:", objc_msgSend(v82, "bufferDataSize"));
      if (__src)
      {
        v89 = __src;
        operator delete(__src);
      }
      goto LABEL_25;
    }
    if (v89) {
      operator delete(v89);
    }
    LOBYTE(InputWithName) = 0;
  }
  return (char)InputWithName;
}

+ (void)registerSemantic:(uint64_t)a3 withBlock:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)registerArgument:(uint64_t)a3 frequency:(uint64_t)a4 block:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_parseArguments:(uint64_t)a3 function:(uint64_t)a4 renderPipeline:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_checkForAssociatedSamplerOnBinding:(uint64_t)a3 argument:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)addResourceBindingsForArgument:(uint64_t)a3 frequency:(uint64_t)a4 needsRenderResource:(uint64_t)a5 block:(uint64_t)a6 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)addResourceBindingsForArgument:(void *)a1 frequency:(void *)a2 needsRenderResource:block:.cold.3(void *a1, void *a2)
{
  [a1 type];
  [a2 type];
  OUTLINED_FUNCTION_2_8(&dword_20B249000, v3, v4, "Assertion '%s' failed. Argument with the same name cannot have different types (%d != %d)", v5, v6, v7, v8, 2u);
}

- (void)addPassResourceBindingsForArgument:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)addPassResourceBindingsForArgument:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)addPassResourceBindingsForArgument:(uint64_t)a3 .cold.4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)addPassResourceBindingsForArgument:(void *)a1 .cold.5(void *a1, void *a2)
{
  [a1 type];
  [a2 type];
  OUTLINED_FUNCTION_2_8(&dword_20B249000, v3, v4, "Assertion '%s' failed. Argument with the same name cannot have different types (%d != %d)", v5, v6, v7, v8, 2u);
}

- (void)addPassResourceBindingsForArgument:(uint64_t)a3 .cold.6(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end