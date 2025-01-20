@interface SKShader
+ (BOOL)supportsSecureCoding;
+ (SKShader)shader;
+ (SKShader)shaderWithFileNamed:(NSString *)name;
+ (SKShader)shaderWithSource:(NSString *)source;
+ (SKShader)shaderWithSource:(NSString *)source uniforms:(NSArray *)uniforms;
+ (id)precompiledMetalShaderWithFile:(id)a3 uniforms:(id)a4;
- (BOOL)_backingProgramIsDirty;
- (BOOL)_usesPathLengthUniform;
- (BOOL)_usesTimeUniform;
- (BOOL)isEqualToShader:(id)a3;
- (BOOL)isValid;
- (BOOL)performFullCapture;
- (NSArray)_textureUniforms;
- (NSArray)attributes;
- (NSArray)uniforms;
- (NSString)source;
- (SKShader)init;
- (SKShader)initWithCoder:(id)a3;
- (SKShader)initWithSource:(NSString *)source;
- (SKShader)initWithSource:(NSString *)source uniforms:(NSArray *)uniforms;
- (SKUniform)uniformNamed:(NSString *)name;
- (id).cxx_construct;
- (id)_fullMetalVertexSourceWithImplementation:(BOOL)a3;
- (id)_fullVertexSourceWithImplementation:(int64_t)a3;
- (id)_generateMetalSource;
- (id)_getLegacyUniformData;
- (id)_getMetalFragmentFunctionName;
- (id)_getMetalFragmentShaderSource;
- (id)_getMetalVertexOutDefinition;
- (id)_getMetalVertexShaderSource:(BOOL)a3;
- (id)_getShaderCompilationLog;
- (id)copyWithZone:(_NSZone *)a3;
- (id)fragmentPrelude;
- (id)fragmentPreludeMetal;
- (id)fullFragmentSource;
- (id)fullMetalFragmentSource;
- (id)fullMetalVertexSource;
- (id)fullMetalVertexWithTransformSource;
- (id)fullVertexSource;
- (id)fullVertexWithTransformSource;
- (shared_ptr<jet_command_buffer>)_commands;
- (shared_ptr<jet_command_buffer>)_commandsForBatchOffset:(int)a3 count:(int)a4;
- (shared_ptr<jet_program>)_backingProgram;
- (shared_ptr<jet_program>)_backingProgramWithTransform;
- (shared_ptr<jet_program>)_makeBackingProgramWithImplementation:(int64_t)a3;
- (void)_addTargetNode:(id)a3;
- (void)_attributeBuffers;
- (void)_removeTargetNode:(id)a3;
- (void)_setUniformsDirty;
- (void)addUniform:(SKUniform *)uniform;
- (void)encodeWithCoder:(id)a3;
- (void)generateFragmentAttributeDeclares:(id *)a3;
- (void)generateVertexAttributeDeclares:(id *)a3 statements:(id *)a4;
- (void)removeUniformNamed:(NSString *)name;
- (void)setAttributes:(NSArray *)attributes;
- (void)setPerformFullCapture:(BOOL)a3;
- (void)setSource:(NSString *)source;
- (void)setUniforms:(NSArray *)uniforms;
@end

@implementation SKShader

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SKShader)init
{
  return [(SKShader *)self initWithSource:&stru_26BEEFD10 uniforms:MEMORY[0x263EFFA68]];
}

- (SKShader)initWithSource:(NSString *)source
{
  return [(SKShader *)self initWithSource:source uniforms:MEMORY[0x263EFFA68]];
}

- (SKShader)initWithSource:(NSString *)source uniforms:(NSArray *)uniforms
{
  v6 = source;
  v7 = uniforms;
  v14.receiver = self;
  v14.super_class = (Class)SKShader;
  v8 = [(SKShader *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [MEMORY[0x263F08A88] weakObjectsPointerArray];
    targetNodes = v8->_targetNodes;
    v8->_targetNodes = (NSPointerArray *)v9;

    uint64_t v11 = [MEMORY[0x263EFF9A0] dictionary];
    uniformData = v8->_uniformData;
    v8->_uniformData = (NSMutableDictionary *)v11;

    *(_WORD *)&v8->_usesTimeUniform = 0;
    v8->_isPrecompiledMetal = 0;
    [(SKShader *)v8 setUniforms:v7];
    [(SKShader *)v8 setSource:v6];
  }

  return v8;
}

+ (SKShader)shader
{
  id v2 = objc_alloc_init((Class)objc_opt_class());

  return (SKShader *)v2;
}

+ (SKShader)shaderWithSource:(NSString *)source
{
  v3 = source;
  v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithSource:v3];

  return (SKShader *)v4;
}

+ (SKShader)shaderWithSource:(NSString *)source uniforms:(NSArray *)uniforms
{
  v5 = source;
  v6 = uniforms;
  v7 = (void *)[objc_alloc((Class)objc_opt_class()) initWithSource:v5 uniforms:v6];

  return (SKShader *)v7;
}

+ (SKShader)shaderWithFileNamed:(NSString *)name
{
  v4 = name;
  if ([(NSString *)v4 hasSuffix:@".fsh"])
  {
    v5 = SKGetResourceBundle();
    [v5 pathForResource:v4 ofType:0];
  }
  else
  {
    v5 = SKGetResourceBundle();
    [v5 pathForResource:v4 ofType:@"fsh"];
  v6 = };

  if (v6)
  {
    v7 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithContentsOfFile:v6 options:1 error:0];
    id v8 = [NSString alloc];
    id v9 = v7;
    v10 = objc_msgSend(v8, "initWithBytesNoCopy:length:encoding:freeWhenDone:", objc_msgSend(v9, "bytes"), objc_msgSend(v9, "length"), 4, 0);
    uint64_t v11 = (id *)[objc_alloc((Class)objc_opt_class()) initWithSource:v10];
    objc_storeStrong(v11 + 5, name);
  }
  else
  {
    NSLog(&cfstr_SkshaderFailed.isa, v4);
    uint64_t v11 = 0;
  }

  return (SKShader *)v11;
}

+ (id)precompiledMetalShaderWithFile:(id)a3 uniforms:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = objc_alloc_init((Class)objc_opt_class());
  id v8 = (void *)v7[5];
  v7[5] = v5;
  id v9 = v5;

  *((unsigned char *)v7 + 48) = 1;
  v10 = (void *)v7[1];
  v7[1] = v6;

  return v7;
}

- (NSArray)attributes
{
  attributes = self->_attributes;
  if (!attributes)
  {
    self->_attributes = (NSArray *)MEMORY[0x263EFFA68];

    attributes = self->_attributes;
  }

  return attributes;
}

- (void)setAttributes:(NSArray *)attributes
{
  v4 = attributes;
  id v5 = v4;
  if (v4)
  {
    id v6 = (NSArray *)[(NSArray *)v4 copy];
    v7 = self->_attributes;
    self->_attributes = v6;
  }
  else
  {
    v7 = self->_attributes;
    self->_attributes = (NSArray *)MEMORY[0x263EFFA68];
  }

  *(_WORD *)&self->_programDirty = 257;
  cntrl = self->_backingProgram.__cntrl_;
  self->_backingProgram.__ptr_ = 0;
  self->_backingProgram.__cntrl_ = 0;
  if (cntrl) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)cntrl);
  }
  id v9 = self->_backingProgramWithTransform.__cntrl_;
  self->_backingProgramWithTransform.__ptr_ = 0;
  self->_backingProgramWithTransform.__cntrl_ = 0;
  if (v9) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v9);
  }
  std::__tree<std::__value_type<std::string,std::shared_ptr<jet_buffer_pool>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::shared_ptr<jet_buffer_pool>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::shared_ptr<jet_buffer_pool>>>>::destroy((uint64_t)&self->_attributeBuffers, (void *)self->_attributeBuffers.__tree_.__pair1_.__value_.__left_);
  self->_attributeBuffers.__tree_.__begin_node_ = &self->_attributeBuffers.__tree_.__pair1_;
  self->_attributeBuffers.__tree_.__pair3_.__value_ = 0;
  self->_attributeBuffers.__tree_.__pair1_.__value_.__left_ = 0;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __26__SKShader_setAttributes___block_invoke;
  v10[3] = &unk_263FEA678;
  v10[4] = self;
  SKCPerformResourceOperation(v10);
}

void __26__SKShader_setAttributes___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id obj = *(id *)(*(void *)(a1 + 32) + 16);
  uint64_t v3 = [obj countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v15 != v4) {
          objc_enumerationMutation(obj);
        }
        id v6 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        v7 = NSString;
        id v8 = [v6 name];
        id v9 = [v7 stringWithFormat:@"a_%@", v8];

        unint64_t v10 = [v6 type] - 1;
        if (v10 < 8)
        {
          uint64_t v11 = (*(uint64_t (**)(void, void, void, uint64_t))(*(void *)*a2 + 16))(*a2, dword_20AE9C320[v10], dword_20AE9C300[v10], 40);
          std::shared_ptr<jet_buffer_pool>::shared_ptr[abi:ne180100]<jet_buffer_pool,void>(&v13, v11);
        }
      }
      uint64_t v3 = [obj countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v3);
  }
}

- (void)_attributeBuffers
{
  return &self->_attributeBuffers;
}

- (void)setSource:(NSString *)source
{
  uint64_t v13 = source;
  uint64_t v4 = (NSString *)[(NSString *)v13 copy];
  id v5 = self->_source;
  self->_source = v4;

  fileName = self->_fileName;
  self->_fileName = 0;

  *(_WORD *)&self->_programDirty = 257;
  cntrl = self->_backingProgram.__cntrl_;
  self->_backingProgram.__ptr_ = 0;
  self->_backingProgram.__cntrl_ = 0;
  if (cntrl) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)cntrl);
  }
  id v8 = self->_backingProgramWithTransform.__cntrl_;
  self->_backingProgramWithTransform.__ptr_ = 0;
  self->_backingProgramWithTransform.__cntrl_ = 0;
  if (v8) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v8);
  }
  *(_WORD *)&self->_usesTimeUniform = 0;
  if (self->_source)
  {
    id v9 = [MEMORY[0x263F08AE8] regularExpressionWithPattern:@"[^a-zA-Z0-9_](u_time)[^a-zA-Z0-9_]" options:1024 error:0];
    unint64_t v10 = objc_msgSend(v9, "firstMatchInString:options:range:", self->_source, 0, 0, -[NSString length](self->_source, "length"));
    if (v10) {
      self->_usesTimeUniform = 1;
    }
    uint64_t v11 = [MEMORY[0x263F08AE8] regularExpressionWithPattern:@"[^a-zA-Z0-9_](u_path_length)[^a-zA-Z0-9_]" options:1024 error:0];

    v12 = objc_msgSend(v11, "firstMatchInString:options:range:", self->_source, 0, 0, -[NSString length](self->_source, "length"));

    if (v12) {
      self->_usesPathLengthUniform = 1;
    }
  }
}

- (NSString)source
{
  id v2 = (void *)[(NSString *)self->_source copy];

  return (NSString *)v2;
}

- (NSArray)uniforms
{
  uniforms = self->_uniforms;
  if (uniforms) {
    uint64_t v3 = (void *)[(NSMutableArray *)uniforms copy];
  }
  else {
    uint64_t v3 = (void *)MEMORY[0x263EFFA68];
  }

  return (NSArray *)v3;
}

- (id)fragmentPrelude
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  uint64_t v3 = (void *)[(id)SKShader_preamble_fsh copy];
  v27 = [MEMORY[0x263EFF9A0] dictionaryWithDictionary:self->_uniformData];
  uint64_t v4 = [(SKShader *)self _getLegacyUniformData];
  v26 = v4;
  if (v4)
  {
    id v5 = [v4 uniform];
    id v6 = [v5 name];
    [v27 setObject:v26 forKey:v6];

    BOOL v7 = 1;
  }
  else
  {
    BOOL v7 = 0;
  }
  self->_usesSpriteSizeUniform = v7;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id obj = [v27 allValues];
  uint64_t v8 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v30;
LABEL_6:
    uint64_t v10 = 0;
    while (2)
    {
      if (*(void *)v30 != v9) {
        objc_enumerationMutation(obj);
      }
      uint64_t v11 = *(void **)(*((void *)&v29 + 1) + 8 * v10);
      v12 = [v11 uniform];
      uint64_t v13 = [v12 name];
      switch([v12 uniformType])
      {
        case 1:
          long long v14 = [NSString stringWithFormat:@"uniform mediump float %@; ", v13];
          uint64_t v15 = [v3 stringByAppendingString:v14];
          goto LABEL_16;
        case 2:
          long long v14 = [NSString stringWithFormat:@"uniform mediump vec2 %@; ", v13];
          uint64_t v15 = [v3 stringByAppendingString:v14];
          goto LABEL_16;
        case 3:
        case 4:
          long long v14 = [NSString stringWithFormat:@"uniform mediump vec4 %@; ", v13];
          uint64_t v15 = [v3 stringByAppendingString:v14];
          goto LABEL_16;
        case 5:
          long long v14 = [NSString stringWithFormat:@"uniform mediump mat2 %@; ", v13];
          uint64_t v15 = [v3 stringByAppendingString:v14];
          goto LABEL_16;
        case 6:
          long long v14 = [NSString stringWithFormat:@"uniform mediump mat3 %@; ", v13];
          uint64_t v15 = [v3 stringByAppendingString:v14];
          goto LABEL_16;
        case 7:
          long long v14 = [NSString stringWithFormat:@"uniform mediump mat4 %@; ", v13];
          uint64_t v15 = [v3 stringByAppendingString:v14];
LABEL_16:
          long long v16 = (void *)v15;

          goto LABEL_17;
        case 8:
          long long v17 = [v12 textureValue];
          BOOL v18 = v17 == 0;

          if (v18) {
            goto LABEL_18;
          }
          uint64_t v19 = [v12 textureValue];
          int v20 = [v19 textureTarget];

          if (v20 == 3553)
          {
            v21 = [NSString stringWithFormat:@"uniform lowp sampler2D %@; ", v13];
            uint64_t v22 = [v3 stringByAppendingString:v21];

            uint64_t v3 = (void *)v22;
          }
          long long v14 = [v12 textureValue];
          objc_msgSend(v11, "setTextureTarget:", objc_msgSend(v14, "textureTarget"));
          long long v16 = v3;
LABEL_17:

          uint64_t v3 = v16;
LABEL_18:

          if (v8 != ++v10) {
            continue;
          }
          uint64_t v23 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
          uint64_t v8 = v23;
          if (!v23) {
            goto LABEL_25;
          }
          goto LABEL_6;
        default:
          goto LABEL_18;
      }
    }
  }
LABEL_25:

  id v24 = v3;
  return v24;
}

- (id)fragmentPreludeMetal
{
  uint64_t v3 = (void *)[(id)SKShader_Metal_preamble_fsh copy];
  uint64_t v4 = [(SKShader *)self _getMetalVertexOutDefinition];
  id v5 = [v3 stringByAppendingString:v4];

  return v5;
}

- (void)generateVertexAttributeDeclares:(id *)a3 statements:(id *)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  *a3 = @"\n\n/* Vertex Attribute Declares */\n";
  *a4 = @"\n\n/* Vertex Attribute Statements */\n";
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = [(SKShader *)self attributes];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        unint64_t v11 = [v10 type] - 1;
        if (v11 < 8)
        {
          v12 = off_263FEA6C0[v11];
          uint64_t v13 = [v10 name];
          id v14 = [NSString stringWithFormat:@"%@attribute %@ a_%@;\n", *a3, v12, v13];
          *a3 = v14;
          *a3 = [NSString stringWithFormat:@"%@varying mediump %@ %@;\n", v14, v12, v13];
          [NSString stringWithFormat:@"%@%@ = a_%@;\n", *a4, v13, v13];
          *a4 = (id)objc_claimAutoreleasedReturnValue();
        }
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }

  *a3 = [*a3 stringByAppendingString:@"\n\n"];
  *a4 = [*a4 stringByAppendingString:@"\n\n"];
}

- (void)generateFragmentAttributeDeclares:(id *)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  *a3 = @"\n\n/* Fragment Attribute Declares */\n";
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v4 = [(SKShader *)self attributes];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v4);
        }
        uint64_t v8 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        unint64_t v9 = [v8 type] - 1;
        if (v9 < 8)
        {
          uint64_t v10 = off_263FEA6C0[v9];
          unint64_t v11 = [v8 name];
          *a3 = [NSString stringWithFormat:@"%@varying mediump %@ %@;\n", *a3, v10, v11];
        }
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }

  *a3 = [*a3 stringByAppendingString:@"\n\n"];
}

- (id)fullVertexSource
{
  return [(SKShader *)self _fullVertexSourceWithImplementation:0];
}

- (id)fullVertexWithTransformSource
{
  return [(SKShader *)self _fullVertexSourceWithImplementation:1];
}

- (id)_fullVertexSourceWithImplementation:(int64_t)a3
{
  id v18 = 0;
  id v19 = 0;
  [(SKShader *)self generateVertexAttributeDeclares:&v19 statements:&v18];
  id v4 = v19;
  id v5 = v18;
  if (a3)
  {
    uint64_t v6 = (void *)[(id)SKShader_declares_with_transform_vsh copy];
    uint64_t v7 = [v6 stringByAppendingString:v4];

    uint64_t v8 = (void *)[(id)SKShader_begin_main_with_transform_vsh copy];
    unint64_t v9 = [v7 stringByAppendingString:v8];

    uint64_t v10 = [v9 stringByAppendingString:v5];

    unint64_t v11 = (void *)[(id)SKShader_end_main_with_transform_vsh copy];
  }
  else
  {
    long long v12 = (void *)[(id)SKShader_declares_vsh copy];
    long long v13 = [v12 stringByAppendingString:v4];

    long long v14 = (void *)[(id)SKShader_begin_main_vsh copy];
    long long v15 = [v13 stringByAppendingString:v14];

    uint64_t v10 = [v15 stringByAppendingString:v5];

    unint64_t v11 = (void *)[(id)SKShader_end_main_vsh copy];
  }
  long long v16 = [v10 stringByAppendingString:v11];

  return v16;
}

- (id)fullFragmentSource
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v23 = 0;
  [(SKShader *)self generateFragmentAttributeDeclares:&v23];
  id v16 = v23;
  uint64_t v3 = [(SKShader *)self fragmentPrelude];
  id v18 = [v16 stringByAppendingString:v3];

  id v4 = [&stru_26BEEFD10 stringByAppendingString:v18];
  id v5 = [(SKShader *)self source];
  uint64_t v6 = [v4 stringByAppendingString:v5];

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id obj = self->_uniforms;
  uint64_t v7 = [(NSMutableArray *)obj countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        if ([v10 uniformType] == 3)
        {
          unint64_t v11 = [v10 name];
          long long v12 = [NSString stringWithFormat:@"\\b%@(?=\\b)", v11];
          long long v13 = [NSString stringWithFormat:@"(%@.xyz)", v11];
          uint64_t v14 = objc_msgSend(v6, "stringByReplacingOccurrencesOfString:withString:options:range:", v12, v13, 1024, objc_msgSend(v18, "length"), objc_msgSend(v6, "length") - objc_msgSend(v18, "length"));

          uint64_t v6 = (void *)v14;
        }
      }
      uint64_t v7 = [(NSMutableArray *)obj countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v7);
  }

  return v6;
}

- (id)fullMetalVertexSource
{
  return [(SKShader *)self _fullMetalVertexSourceWithImplementation:0];
}

- (id)fullMetalVertexWithTransformSource
{
  return [(SKShader *)self _fullMetalVertexSourceWithImplementation:1];
}

- (id)_fullMetalVertexSourceWithImplementation:(BOOL)a3
{
  BOOL v28 = a3;
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v4 = (void *)[(id)SKShader_Metal_declares_vsh copy];
  id v5 = [(SKShader *)self _getMetalVertexOutDefinition];
  uint64_t v6 = [v4 stringByAppendingString:v5];

  if (v28)
  {
    v27 = objc_msgSend(v6, "stringByAppendingString:", @"               vertex SKShader_VertexOut SKShader_VertexFunc (const device float4 *a_position  [[buffer(0)]],\n               const device float2 *a_tex_coord [[buffer(1)]],\n               constant float4 &u_color         [[buffer(2)]],\n               constant float4x4 &u_transform   [[buffer(3)]],\n               \n");
    uint64_t v7 = 4;
  }
  else
  {
    v27 = objc_msgSend(v6, "stringByAppendingString:", @"               vertex SKShader_VertexOut SKShader_VertexFunc (const device uchar4 *a_color      [[buffer(0)]],\n               const device float4 *a_position   [[buffer(1)]],\n               const device float2 *a_tex_coord  [[buffer(2)]],\n               \n");
    uint64_t v7 = 3;
  }

  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id obj = [(SKShader *)self attributes];
  uint64_t v8 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v8)
  {
    unint64_t v9 = &stru_26BEEFD10;
    uint64_t v10 = *(void *)v31;
    unint64_t v11 = &stru_26BEEFD10;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v31 != v10) {
          objc_enumerationMutation(obj);
        }
        long long v13 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        unint64_t v14 = [v13 type] - 1;
        if (v14 < 8)
        {
          long long v15 = off_263FEA700[v14];
          id v16 = [v13 name];
          uint64_t v17 = [NSString stringWithFormat:@"%@const device %@ *a_%@   [[buffer(%d)]], ", v9, v15, v16, v7];

          uint64_t v18 = [NSString stringWithFormat:@"%@vOut.%@ = a_%@[vid]\n", v11, v16, v16];;

          uint64_t v7 = (v7 + 1);
          unint64_t v9 = (__CFString *)v17;
          unint64_t v11 = (__CFString *)v18;
        }
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
    }
    while (v8);
  }
  else
  {
    unint64_t v9 = &stru_26BEEFD10;
    unint64_t v11 = &stru_26BEEFD10;
  }

  long long v19 = [v27 stringByAppendingString:v9];

  if (v28) {
    long long v20 = @"               unsigned int vid                  [[vertex_id]]\n               {\n               SKShader_VertexOut vOut;\n               vOut.position = a_position[vid] * u_transform;\n               vOut.v_tex_coord = a_tex_coord[vid];\n               vOut.v_color_mix = u_color;\n               return vOut;\n               \n");
  }
  else {
    long long v20 = @"               unsigned int vid                  [[vertex_id]]\n               {\n               SKShader_VertexOut vOut;\n               vOut.position = float4(a_position[vid].xyz, 1.0f);\n               vOut.v_path_distance = a_position[vid].w;\n               vOut.v_tex_coord = a_tex_coord[vid];\n               vOut.v_color_mix = float4(a_color[vid].r / 255.0f,\n               a_color[vid].g / 255.0f,\n               a_color[vid].b / 255.0f,\n               a_color[vid].a / 255.0f);\n               \n");
  }
  long long v21 = [v19 stringByAppendingString:v20];

  long long v22 = [v21 stringByAppendingString:v11];

  id v23 = (void *)[(id)SKShader_Metal_end_main_vsh copy];
  id v24 = [v22 stringByAppendingString:v23];

  id v25 = v24;
  return v25;
}

- (id)fullMetalFragmentSource
{
  uint64_t v3 = (void *)[(id)SKShader_Metal_declares_vsh copy];
  id v4 = [(SKShader *)self fragmentPreludeMetal];
  id v5 = [v3 stringByAppendingString:v4];

  uint64_t v6 = [(SKShader *)self _generateMetalSource];
  uint64_t v7 = [v5 stringByAppendingString:v6];

  return v7;
}

- (void)setUniforms:(NSArray *)uniforms
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v5 = uniforms;
  if (!v5)
  {
    id v5 = [MEMORY[0x263EFF8C0] array];
  }
  long long v21 = v5;
  uint64_t v6 = (NSMutableArray *)[(NSArray *)v5 mutableCopy];
  uint64_t v7 = self->_uniforms;
  self->_uniforms = v6;

  [(NSMutableDictionary *)self->_uniformData removeAllObjects];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id obj = self->_uniforms;
  uint64_t v8 = [(NSMutableArray *)obj countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v24 != v9) {
          objc_enumerationMutation(obj);
        }
        unint64_t v11 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        long long v12 = [v11 name];
        long long v13 = [(NSMutableDictionary *)self->_uniformData objectForKey:v12];
        if (v13)
        {
          NSLog(&cfstr_ErrorDuplicate.isa, v12);
          unint64_t v14 = self->_uniforms;
          long long v15 = [v13 uniform];
          [(NSMutableArray *)v14 removeExactObject:v15];
        }
        id v16 = objc_opt_new();
        [v16 setUniform:v11];
        uint64_t v17 = [v11 uniformType];
        if (v17 == 8)
        {
          uint64_t v3 = [v11 textureValue];
          unsigned int v18 = [v3 textureTarget];
        }
        else
        {
          unsigned int v18 = 0;
        }
        [v16 setTextureTarget:v18];
        if (v17 == 8) {

        }
        [(NSMutableDictionary *)self->_uniformData setObject:v16 forKey:v12];
        [v11 _addTargetShader:self];
      }
      uint64_t v8 = [(NSMutableArray *)obj countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v8);
  }

  *(_WORD *)&self->_programDirty = 257;
  cntrl = self->_backingProgram.__cntrl_;
  self->_backingProgram.__ptr_ = 0;
  self->_backingProgram.__cntrl_ = 0;
  if (cntrl) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)cntrl);
  }
  long long v20 = self->_backingProgramWithTransform.__cntrl_;
  self->_backingProgramWithTransform.__ptr_ = 0;
  self->_backingProgramWithTransform.__cntrl_ = 0;
  if (v20) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v20);
  }
}

- (void)addUniform:(SKUniform *)uniform
{
  id v5 = uniform;
  if (v5)
  {
    unint64_t v14 = v5;
    uint64_t v6 = [(SKUniform *)v5 name];
    uint64_t v7 = [(NSMutableDictionary *)self->_uniformData objectForKey:v6];
    if (v7)
    {
      NSLog(&cfstr_ErrorDuplicate.isa, v6);
      uniforms = self->_uniforms;
      uint64_t v8 = [v7 uniform];
      [uniforms removeObject:v8];
    }
    uint64_t v9 = objc_opt_new();
    [v9 setUniform:v14];
    uint64_t v10 = [(SKUniform *)v14 uniformType];
    if (v10 == 8)
    {
      uniforms = [(SKUniform *)v14 textureValue];
      unsigned int v11 = [uniforms textureTarget];
    }
    else
    {
      unsigned int v11 = 0;
    }
    [v9 setTextureTarget:v11];
    if (v10 == 8) {

    }
    [(NSMutableDictionary *)self->_uniformData setObject:v9 forKey:v6];
    [(NSMutableArray *)self->_uniforms addObject:v14];
    [(SKUniform *)v14 _addTargetShader:self];
    *(_WORD *)&self->_programDirty = 257;
    cntrl = self->_backingProgram.__cntrl_;
    self->_backingProgram.__ptr_ = 0;
    self->_backingProgram.__cntrl_ = 0;
    if (cntrl) {
      std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)cntrl);
    }
    long long v13 = self->_backingProgramWithTransform.__cntrl_;
    self->_backingProgramWithTransform.__ptr_ = 0;
    self->_backingProgramWithTransform.__cntrl_ = 0;
    if (v13) {
      std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v13);
    }

    id v5 = v14;
  }
}

- (SKUniform)uniformNamed:(NSString *)name
{
  uint64_t v3 = [(NSMutableDictionary *)self->_uniformData objectForKey:name];
  id v4 = [v3 uniform];

  return (SKUniform *)v4;
}

- (void)removeUniformNamed:(NSString *)name
{
  uint64_t v10 = name;
  id v4 = -[NSMutableDictionary objectForKey:](self->_uniformData, "objectForKey:");
  if (v4)
  {
    [(NSMutableDictionary *)self->_uniformData removeObjectForKey:v10];
    uniforms = self->_uniforms;
    uint64_t v6 = [v4 uniform];
    [(NSMutableArray *)uniforms removeExactObject:v6];

    uint64_t v7 = [v4 uniform];
    [v7 _removeTargetShader:self];

    *(_WORD *)&self->_programDirty = 257;
    cntrl = self->_backingProgram.__cntrl_;
    self->_backingProgram.__ptr_ = 0;
    self->_backingProgram.__cntrl_ = 0;
    if (cntrl) {
      std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)cntrl);
    }
    uint64_t v9 = self->_backingProgramWithTransform.__cntrl_;
    self->_backingProgramWithTransform.__ptr_ = 0;
    self->_backingProgramWithTransform.__cntrl_ = 0;
    if (v9) {
      std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v9);
    }
  }
}

- (NSArray)_textureUniforms
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v3 = [MEMORY[0x263EFF980] array];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v4 = self->_uniforms;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v4);
        }
        uint64_t v8 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        if (objc_msgSend(v8, "uniformType", (void)v10) == 8) {
          [v3 addObject:v8];
        }
      }
      uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }

  return (NSArray *)v3;
}

- (BOOL)isValid
{
  [(SKShader *)self _backingProgram];
  if (v4) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v4);
  }
  return v3 != 0;
}

- (BOOL)_backingProgramIsDirty
{
  return self->_programDirty;
}

- (shared_ptr<jet_program>)_backingProgram
{
  uint64_t v3 = self;
  id v4 = v2;
  ptr = self->_backingProgram.__ptr_;
  if (!ptr)
  {
    if (self->_programDirty)
    {
      [(SKShader *)self _makeBackingProgramWithImplementation:0];
      uint64_t v6 = v3->_backingProgram.__ptr_;
      self = (SKShader *)v3->_backingProgram.__cntrl_;
      v3->_backingProgram = v8;
      v8.__cntrl_ = (__shared_weak_count *)self;
      v3->_programDirty = 0;
      if (!v8.__ptr_)
      {
        if (v3->_fileName) {
          NSLog(&cfstr_SkshaderFailed_0.isa, v3->_fileName, v3->_compileLog, v6);
        }
        else {
          NSLog(&cfstr_SkshaderFailed_1.isa, v3->_compileLog);
        }
        kdebug_trace();
        self = (SKShader *)v8.__cntrl_;
      }
      if (self) {
        std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)self);
      }
      ptr = v3->_backingProgram.__ptr_;
    }
    else
    {
      ptr = 0;
    }
  }
  cntrl = v3->_backingProgram.__cntrl_;
  std::__shared_weak_count *v4 = ptr;
  v4[1] = (jet_program *)cntrl;
  if (cntrl) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = (jet_program *)self;
  return result;
}

- (shared_ptr<jet_program>)_backingProgramWithTransform
{
  uint64_t v3 = self;
  id v4 = v2;
  ptr = self->_backingProgramWithTransform.__ptr_;
  if (!ptr)
  {
    if (self->_programWithTransformDirty)
    {
      [(SKShader *)self _makeBackingProgramWithImplementation:1];
      uint64_t v6 = v3->_backingProgramWithTransform.__ptr_;
      self = (SKShader *)v3->_backingProgramWithTransform.__cntrl_;
      v3->_backingProgramWithTransform = v8;
      v8.__cntrl_ = (__shared_weak_count *)self;
      v3->_programWithTransformDirty = 0;
      if (!v8.__ptr_)
      {
        if (v3->_fileName) {
          NSLog(&cfstr_SkshaderFailed_0.isa, v3->_fileName, v3->_compileLog, v6);
        }
        else {
          NSLog(&cfstr_SkshaderFailed_1.isa, v3->_compileLog);
        }
        kdebug_trace();
        self = (SKShader *)v8.__cntrl_;
      }
      if (self) {
        std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)self);
      }
      ptr = v3->_backingProgramWithTransform.__ptr_;
    }
    else
    {
      ptr = 0;
    }
  }
  cntrl = v3->_backingProgramWithTransform.__cntrl_;
  std::__shared_weak_count *v4 = ptr;
  v4[1] = (jet_program *)cntrl;
  if (cntrl) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = (jet_program *)self;
  return result;
}

- (shared_ptr<jet_program>)_makeBackingProgramWithImplementation:(int64_t)a3
{
  id v4 = v3;
  uint64_t v9 = 0;
  long long v10 = &v9;
  uint64_t v11 = 0x4012000000;
  long long v12 = __Block_byref_object_copy__6;
  long long v13 = __Block_byref_object_dispose__6;
  unint64_t v14 = "";
  uint64_t v15 = 0;
  id v16 = 0;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __50__SKShader__makeBackingProgramWithImplementation___block_invoke;
  v8[3] = &unk_263FEA6A0;
  v8[5] = &v9;
  v8[6] = a3;
  v8[4] = self;
  SKCPerformResourceOperation(v8);
  uint64_t v5 = v10[7];
  void *v4 = v10[6];
  v4[1] = v5;
  if (v5) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v5 + 8), 1uLL, memory_order_relaxed);
  }
  _Block_object_dispose(&v9, 8);
  uint64_t v7 = v16;
  if (v16) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v16);
  }
  result.__cntrl_ = v6;
  result.__ptr_ = v7;
  return result;
}

void __50__SKShader__makeBackingProgramWithImplementation___block_invoke(uint64_t a1, void *a2)
{
  if (!*a2) {
    return;
  }
  kdebug_trace();
  uint64_t v36 = 0;
  uint64_t v37 = 0;
  if ((*(unsigned int (**)(void))(*(void *)*a2 + 136))() != 1)
  {
    uint64_t v17 = *(void **)(a1 + 32);
    if (*(void *)(a1 + 48)) {
      [v17 fullVertexWithTransformSource];
    }
    else {
    unsigned int v18 = [v17 fullVertexSource];
    }
    long long v19 = [*(id *)(a1 + 32) fullFragmentSource];
    uint64_t v20 = *a2;
    id v15 = v18;
    uint64_t v11 = (*(uint64_t (**)(uint64_t, uint64_t, const char *, uint64_t, uint64_t *))(*(void *)v20 + 72))(v20, [v15 UTF8String], "main", 1, &v37);
    uint64_t v21 = *a2;
    id v16 = v19;
    uint64_t v22 = (*(uint64_t (**)(uint64_t, uint64_t, const char *, uint64_t, uint64_t *))(*(void *)v21 + 72))(v21, [v16 UTF8String], "main", 2, &v36);
    goto LABEL_16;
  }
  id v4 = *(unsigned char **)(a1 + 32);
  if (!v4[48])
  {
    if (*(void *)(a1 + 48)) {
      [v4 fullMetalVertexWithTransformSource];
    }
    else {
    long long v23 = [v4 fullMetalVertexSource];
    }
    long long v24 = [*(id *)(a1 + 32) fullMetalFragmentSource];
    uint64_t v25 = *a2;
    id v15 = v23;
    uint64_t v11 = (*(uint64_t (**)(uint64_t, uint64_t, const char *, uint64_t, uint64_t *))(*(void *)v25 + 72))(v25, [v15 UTF8String], "SKShader_VertexFunc", 1, &v37);
    uint64_t v26 = *a2;
    id v16 = v24;
    uint64_t v22 = (*(uint64_t (**)(uint64_t, uint64_t, const char *, uint64_t, uint64_t *))(*(void *)v26 + 72))(v26, [v16 UTF8String], "SKShader_FragFunc", 2, &v36);
LABEL_16:
    uint64_t v14 = v22;
    goto LABEL_17;
  }
  uint64_t v5 = [MEMORY[0x263F086E0] mainBundle];
  uint64_t v6 = [v5 pathForResource:*(void *)(*(void *)(a1 + 32) + 40) ofType:@"metallib"];

  uint64_t v7 = *a2;
  id v8 = v6;
  uint64_t v9 = [v8 UTF8String];
  if (*(void *)(a1 + 48)) {
    long long v10 = "SKShader_VertexTransformFunc";
  }
  else {
    long long v10 = "SKShader_VertexFunc";
  }
  uint64_t v11 = (*(uint64_t (**)(uint64_t, uint64_t, const char *, uint64_t, uint64_t *))(*(void *)v7 + 64))(v7, v9, v10, 1, &v37);
  uint64_t v12 = *a2;
  id v13 = v8;
  uint64_t v14 = (*(uint64_t (**)(uint64_t, uint64_t, const char *, uint64_t, uint64_t *))(*(void *)v12 + 64))(v12, [v13 UTF8String], "SKShader_FragFunc", 2, &v36);

  id v15 = 0;
  id v16 = 0;
LABEL_17:
  uint64_t v27 = v37;
  if (v37)
  {
    if (*(char *)(v37 + 23) < 0) {
      operator delete(*(void **)v37);
    }
    MEMORY[0x21052EA30](v27, 0x1012C40EC159624);
  }
  if (v36)
  {
    uint64_t v28 = objc_msgSend(NSString, "stringWithUTF8String:");
    uint64_t v29 = *(void *)(a1 + 32);
    long long v30 = *(void **)(v29 + 56);
    *(void *)(v29 + 56) = v28;

    uint64_t v31 = v36;
    if (v36)
    {
      if (*(char *)(v36 + 23) < 0) {
        operator delete(*(void **)v36);
      }
      MEMORY[0x21052EA30](v31, 0x1012C40EC159624);
    }
    if (!v11) {
      goto LABEL_31;
    }
    goto LABEL_29;
  }
  uint64_t v32 = *(void *)(a1 + 32);
  long long v33 = *(void **)(v32 + 56);
  *(void *)(v32 + 56) = &stru_26BEEFD10;

  if (v11)
  {
LABEL_29:
    if (v14)
    {
      uint64_t v34 = (*(uint64_t (**)(void, uint64_t, uint64_t))(*(void *)*a2 + 80))(*a2, v11, v14);
      std::shared_ptr<jet_program>::shared_ptr[abi:ne180100]<jet_program,void>(&v35, v34);
    }
  }
LABEL_31:
  if (v11) {
    (*(void (**)(uint64_t))(*(void *)v11 + 8))(v11);
  }
  if (v14) {
    (*(void (**)(uint64_t))(*(void *)v14 + 8))(v14);
  }
}

- (shared_ptr<jet_command_buffer>)_commandsForBatchOffset:(int)a3 count:(int)a4
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  operator new();
}

- (shared_ptr<jet_command_buffer>)_commands
{
  id v2 = (jet_command_buffer *)[(SKShader *)self _commandsForBatchOffset:0 count:0];
  result.var1 = v3;
  result.var0 = v2;
  return result;
}

- (id)_generateMetalSource
{
  uint64_t v62 = *MEMORY[0x263EF8340];
  id v2 = [(SKShader *)self source];
  uint64_t v3 = [v2 copy];

  if (v3) {
    uint64_t v4 = (__CFString *)v3;
  }
  else {
    uint64_t v4 = &stru_26BEEFD10;
  }
  uint64_t v5 = [(__CFString *)v4 stringByReplacingOccurrencesOfString:@"gl_FragColor\\s*=\\s*", @"return ", 1024, 0, [(__CFString *)v4 length] withString options range];

  v41 = (void *)[&unk_26BF048A0 mutableCopy];
  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  uint64_t v6 = [(SKShader *)self attributes];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v54 objects:v61 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v55;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v55 != v8) {
          objc_enumerationMutation(v6);
        }
        long long v10 = [*(id *)(*((void *)&v54 + 1) + 8 * i) name];
        [v41 addObject:v10];
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v54 objects:v61 count:16];
    }
    while (v7);
  }

  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  id obj = v41;
  uint64_t v11 = [obj countByEnumeratingWithState:&v50 objects:v60 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v51;
    do
    {
      uint64_t v13 = 0;
      uint64_t v14 = v5;
      do
      {
        if (*(void *)v51 != v12) {
          objc_enumerationMutation(obj);
        }
        uint64_t v15 = *(void *)(*((void *)&v50 + 1) + 8 * v13);
        id v16 = [NSString stringWithFormat:@"\\b%@(?=\\b)", v15];
        uint64_t v17 = [NSString stringWithFormat:@"interpolated.%@", v15];
        uint64_t v5 = objc_msgSend(v14, "stringByReplacingOccurrencesOfString:withString:options:range:", v16, v17, 1024, 0, objc_msgSend(v14, "length"));

        ++v13;
        uint64_t v14 = v5;
      }
      while (v11 != v13);
      uint64_t v11 = [obj countByEnumeratingWithState:&v50 objects:v60 count:16];
    }
    while (v11);
  }

  v38 = (void *)[&unk_26BF048B8 mutableCopy];
  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  unsigned int v18 = self->_uniforms;
  uint64_t v19 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v46 objects:v59 count:16];
  if (v19)
  {
    uint64_t v20 = *(void *)v47;
    do
    {
      for (uint64_t j = 0; j != v19; ++j)
      {
        if (*(void *)v47 != v20) {
          objc_enumerationMutation(v18);
        }
        uint64_t v22 = *(void **)(*((void *)&v46 + 1) + 8 * j);
        if ([v22 uniformType] != 8)
        {
          long long v23 = [v22 name];
          [v38 addObject:v23];
        }
      }
      uint64_t v19 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v46 objects:v59 count:16];
    }
    while (v19);
  }

  if (([v38 containsObject:@"u_sprite_size"] & 1) == 0
    && ([obj containsObject:@"u_sprite_size"] & 1) == 0)
  {
    [v38 addObject:@"u_sprite_size"];
  }
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v39 = v38;
  uint64_t v24 = [v39 countByEnumeratingWithState:&v42 objects:v58 count:16];
  if (v24)
  {
    uint64_t v25 = *(void *)v43;
    do
    {
      uint64_t v26 = 0;
      uint64_t v27 = v5;
      do
      {
        if (*(void *)v43 != v25) {
          objc_enumerationMutation(v39);
        }
        uint64_t v28 = *(void *)(*((void *)&v42 + 1) + 8 * v26);
        uint64_t v29 = [NSString stringWithFormat:@"\\b%@(?=\\b)", v28];
        long long v30 = [NSString stringWithFormat:@"%@[0]", v28];
        uint64_t v5 = objc_msgSend(v27, "stringByReplacingOccurrencesOfString:withString:options:range:", v29, v30, 1024, 0, objc_msgSend(v27, "length"));

        ++v26;
        uint64_t v27 = v5;
      }
      while (v24 != v26);
      uint64_t v24 = [v39 countByEnumeratingWithState:&v42 objects:v58 count:16];
    }
    while (v24);
  }

  uint64_t v31 = objc_msgSend(v5, "stringByReplacingOccurrencesOfString:withString:options:range:", CFSTR("mat2\\s*\\("), CFSTR("_make_mat2("), 1024, 0, objc_msgSend(v5, "length"));

  uint64_t v32 = [(SKShader *)self _getMetalFragmentFunctionName];
  long long v33 = objc_msgSend(v31, "stringByReplacingOccurrencesOfString:withString:options:range:", @"void\\s+main\\s*\\(\\s*(void)?\\s*\\)", v32, 1024, 0, objc_msgSend(v31, "length"));

  uint64_t v34 = objc_msgSend(v33, "stringByReplacingOccurrencesOfString:withString:options:range:", @"\\bdiscard(?=\\b)", @" discard_fragment()", 1024, 0, objc_msgSend(v33, "length"));

  long long v35 = objc_msgSend(v34, "stringByReplacingOccurrencesOfString:withString:options:range:", @"\\bgl_FragCoord(?=\\b)", @" interpolated.position", 1024, 0, objc_msgSend(v34, "length"));

  return v35;
}

- (id)_getMetalVertexOutDefinition
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v2 = [(SKShader *)self attributes];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v3)
  {
    uint64_t v4 = @"    struct SKShader_VertexOut {\n    float4 position [[position]];\n    float2 v_tex_coord;\n    float4 v_color_mix;\n    float v_path_distance;\n    ";
    uint64_t v5 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v15 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        unint64_t v8 = [v7 type] - 1;
        if (v8 < 8)
        {
          uint64_t v9 = off_263FEA700[v8];
          long long v10 = [v7 name];
          uint64_t v11 = [NSString stringWithFormat:@"%@%@ %@;\n", v4, v9, v10];

          uint64_t v4 = (__CFString *)v11;
        }
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v3);
  }
  else
  {
    uint64_t v4 = @"    struct SKShader_VertexOut {\n    float4 position [[position]];\n    float2 v_tex_coord;\n    float4 v_color_mix;\n    float v_path_distance;\n    ";
  }

  uint64_t v12 = [(__CFString *)v4 stringByAppendingString:@"};\n"];

  return v12;
}

- (id)_getMetalFragmentFunctionName
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  uint64_t v28 = [MEMORY[0x263EFF9A0] dictionaryWithDictionary:self->_uniformData];
  uint64_t v3 = [(SKShader *)self _getLegacyUniformData];
  uint64_t v27 = v3;
  if (v3)
  {
    uint64_t v4 = [v3 uniform];
    uint64_t v5 = [v4 name];
    [v28 setObject:v27 forKey:v5];

    BOOL v6 = 1;
  }
  else
  {
    BOOL v6 = 0;
  }
  self->_usesSpriteSizeUniform = v6;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id obj = [v28 allValues];
  uint64_t v7 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v7)
  {
    uint64_t v8 = 2;
    uint64_t v9 = &stru_26BEEFD10;
    uint64_t v29 = 1;
    uint64_t v10 = *(void *)v32;
LABEL_6:
    uint64_t v11 = 0;
    while (2)
    {
      if (*(void *)v32 != v10) {
        objc_enumerationMutation(obj);
      }
      uint64_t v12 = *(void **)(*((void *)&v31 + 1) + 8 * v11);
      uint64_t v13 = [v12 uniform];
      long long v14 = [v13 name];
      switch([v13 uniformType])
      {
        case 1:
          long long v15 = [NSString stringWithFormat:@"const device float * %@ [[buffer(%d)]],", v14, v8];
          uint64_t v16 = [(__CFString *)v9 stringByAppendingString:v15];
          goto LABEL_17;
        case 2:
          long long v15 = [NSString stringWithFormat:@"const device float2 * %@ [[buffer(%d)]],", v14, v8];
          uint64_t v16 = [(__CFString *)v9 stringByAppendingString:v15];
          goto LABEL_17;
        case 3:
          long long v15 = [NSString stringWithFormat:@"const device float3 * %@ [[buffer(%d)]],", v14, v8];
          uint64_t v16 = [(__CFString *)v9 stringByAppendingString:v15];
          goto LABEL_17;
        case 4:
          long long v15 = [NSString stringWithFormat:@"const device float4 * %@ [[buffer(%d)]],", v14, v8];
          uint64_t v16 = [(__CFString *)v9 stringByAppendingString:v15];
          goto LABEL_17;
        case 5:
          long long v15 = [NSString stringWithFormat:@"const device float2x2 * %@ [[buffer(%d)]],", v14, v8];
          uint64_t v16 = [(__CFString *)v9 stringByAppendingString:v15];
          goto LABEL_17;
        case 6:
          long long v15 = [NSString stringWithFormat:@"const device float3x3 * %@ [[buffer(%d)]],", v14, v8];
          uint64_t v16 = [(__CFString *)v9 stringByAppendingString:v15];
          goto LABEL_17;
        case 7:
          long long v15 = [NSString stringWithFormat:@"const device float4x4 * %@ [[buffer(%d)]],", v14, v8];
          uint64_t v16 = [(__CFString *)v9 stringByAppendingString:v15];
LABEL_17:
          long long v17 = (__CFString *)v16;

          uint64_t v8 = (v8 + 1);
          goto LABEL_18;
        case 8:
          unsigned int v18 = [v13 textureValue];
          BOOL v19 = v18 == 0;

          if (v19) {
            goto LABEL_19;
          }
          uint64_t v20 = [v13 textureValue];
          int v21 = [v20 textureTarget];

          if (v21 == 3553)
          {
            uint64_t v22 = [NSString stringWithFormat:@"texture2d<float> %@ [[texture(%d)]],", v14, v29];
            uint64_t v23 = [(__CFString *)v9 stringByAppendingString:v22];

            uint64_t v29 = (v29 + 1);
            uint64_t v9 = (__CFString *)v23;
          }
          long long v15 = [v13 textureValue];
          objc_msgSend(v12, "setTextureTarget:", objc_msgSend(v15, "textureTarget"));
          long long v17 = v9;
LABEL_18:

          uint64_t v9 = v17;
LABEL_19:

          if (v7 != ++v11) {
            continue;
          }
          uint64_t v24 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
          uint64_t v7 = v24;
          if (!v24) {
            goto LABEL_28;
          }
          goto LABEL_6;
        default:
          goto LABEL_19;
      }
    }
  }
  uint64_t v9 = &stru_26BEEFD10;
LABEL_28:

  [NSString stringWithFormat:@"%@%@ SKShader_VertexOut interpolated     [[stage_in]]"], @"    fragment float4 SKShader_FragFunc(    texture2d<float>  u_texture         [[texture(0)]],     const device float *u_time           [[buffer(0)]],     const device float *u_path_length    [[buffer(1)]], "), v9;
  id v25 = (id)objc_claimAutoreleasedReturnValue();

  return v25;
}

- (id)_getShaderCompilationLog
{
  return self->_compileLog;
}

- (id)_getMetalVertexShaderSource:(BOOL)a3
{
  if (self->_isPrecompiledMetal)
  {
    uint64_t v3 = 0;
  }
  else
  {
    if (a3) {
      [(SKShader *)self fullMetalVertexWithTransformSource];
    }
    else {
    uint64_t v3 = [(SKShader *)self fullMetalVertexSource];
    }
  }

  return v3;
}

- (id)_getMetalFragmentShaderSource
{
  if (self->_isPrecompiledMetal)
  {
    id v2 = 0;
  }
  else
  {
    id v2 = [(SKShader *)self fullMetalFragmentSource];
  }

  return v2;
}

- (BOOL)_usesTimeUniform
{
  return self->_usesTimeUniform;
}

- (BOOL)_usesPathLengthUniform
{
  return self->_usesPathLengthUniform;
}

- (void)_setUniformsDirty
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v3 = self->_targetNodes;
  uint64_t v4 = [(NSPointerArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    char v5 = 0;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        if (v8) {
          SKCNode::setFlags((SKCNode *)objc_msgSend(v8, "_backingNode", (void)v9), 2, 1);
        }
        else {
          char v5 = 1;
        }
      }
      uint64_t v4 = [(NSPointerArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);

    if (v5) {
      [(NSPointerArray *)self->_targetNodes compact];
    }
  }
  else
  {
  }
}

- (void)_addTargetNode:(id)a3
{
}

- (void)_removeTargetNode:(id)a3
{
  id v5 = a3;
  for (unint64_t i = 0; [(NSPointerArray *)self->_targetNodes count] > i; ++i)
  {
    if ([(NSPointerArray *)self->_targetNodes pointerAtIndex:i] == v5) {
      [(NSPointerArray *)self->_targetNodes replacePointerAtIndex:i withPointer:0];
    }
  }
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  objc_msgSend(v6, "encodeBool:forKey:", -[SKShader performFullCapture](self, "performFullCapture"), @"_isCapture");
  uint64_t v4 = [(SKShader *)self uniforms];
  [v6 encodeObject:v4 forKey:@"_uniforms"];

  id v5 = [(SKShader *)self source];
  [v6 encodeObject:v5 forKey:@"_source"];

  [v6 encodeObject:self->_fileName forKey:@"_fileName"];
  [v6 encodeObject:self->_attributes forKey:@"_attributes"];
}

- (SKShader)initWithCoder:(id)a3
{
  v28[4] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [MEMORY[0x263F08A88] weakObjectsPointerArray];
  targetNodes = self->_targetNodes;
  self->_targetNodes = v5;

  uint64_t v7 = [MEMORY[0x263EFF9A0] dictionary];
  uniformData = self->_uniformData;
  self->_uniformData = v7;

  long long v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_fileName"];
  fileName = self->_fileName;
  self->_fileName = v9;

  long long v11 = self->_fileName;
  if (v11 && -[NSString length](v11, "length") && ([v4 decodeBoolForKey:@"_isCapture"] & 1) == 0)
  {
    uint64_t v22 = +[SKShader shaderWithFileNamed:self->_fileName];
    uint64_t v23 = [v22 source];
    source = self->_source;
    self->_source = v23;

    *(_WORD *)&self->_programDirty = 257;
    cntrl = self->_backingProgram.__cntrl_;
    self->_backingProgram.__ptr_ = 0;
    self->_backingProgram.__cntrl_ = 0;
    if (cntrl) {
      std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)cntrl);
    }
    uint64_t v26 = self->_backingProgramWithTransform.__cntrl_;
    self->_backingProgramWithTransform.__ptr_ = 0;
    self->_backingProgramWithTransform.__cntrl_ = 0;
    if (v26) {
      std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v26);
    }
  }
  else
  {
    long long v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_source"];
    [(SKShader *)self setSource:v12];
  }
  uint64_t v13 = (void *)MEMORY[0x263EFFA08];
  v28[0] = objc_opt_class();
  v28[1] = objc_opt_class();
  v28[2] = objc_opt_class();
  v28[3] = objc_opt_class();
  uint64_t v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v28 count:4];
  long long v15 = [v13 setWithArray:v14];
  uint64_t v16 = [v4 decodeObjectOfClasses:v15 forKey:@"_attributes"];
  [(SKShader *)self setAttributes:v16];

  long long v17 = (void *)MEMORY[0x263EFFA08];
  v27[0] = objc_opt_class();
  v27[1] = objc_opt_class();
  v27[2] = objc_opt_class();
  v27[3] = objc_opt_class();
  unsigned int v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:v27 count:4];
  BOOL v19 = [v17 setWithArray:v18];
  uint64_t v20 = [v4 decodeObjectOfClasses:v19 forKey:@"_uniforms"];
  [(SKShader *)self setUniforms:v20];

  return self;
}

- (BOOL)isEqualToShader:(id)a3
{
  id v4 = (SKShader *)a3;
  if (self == v4)
  {
    BOOL v9 = 1;
  }
  else
  {
    unint64_t v5 = 0;
    while ([(NSMutableArray *)self->_uniforms count] > v5)
    {
      id v6 = [(NSMutableArray *)self->_uniforms objectAtIndexedSubscript:v5];
      uint64_t v7 = [(NSMutableArray *)v4->_uniforms objectAtIndexedSubscript:v5];
      char v8 = [v6 isEqualToUniform:v7];

      ++v5;
      if ((v8 & 1) == 0) {
        goto LABEL_16;
      }
    }
    unint64_t v10 = 0;
    while ([(NSArray *)self->_attributes count] > v10)
    {
      long long v11 = [(NSArray *)self->_attributes objectAtIndexedSubscript:v10];
      long long v12 = [(NSArray *)v4->_attributes objectAtIndexedSubscript:v10];
      char v13 = [v11 isEqualToAttribute:v12];

      ++v10;
      if ((v13 & 1) == 0) {
        goto LABEL_16;
      }
    }
    fileName = self->_fileName;
    if (!fileName || !v4->_fileName || (-[NSString isEqual:](fileName, "isEqual:"))
      && [(NSString *)self->_source isEqual:v4->_source])
    {
      BOOL v9 = self->_performFullCapture == v4->_performFullCapture;
      goto LABEL_17;
    }
LABEL_16:
    BOOL v9 = 0;
  }
LABEL_17:

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [(SKShader *)self source];
  unint64_t v5 = (void *)[v4 copy];
  id v6 = [(SKShader *)self uniforms];
  uint64_t v7 = (void *)[v6 copy];
  char v8 = +[SKShader shaderWithSource:v5 uniforms:v7];

  BOOL v9 = [(SKShader *)self attributes];
  [v8 setAttributes:v9];

  return v8;
}

- (id)_getLegacyUniformData
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v3 = [(NSMutableDictionary *)self->_uniformData allValues];
  uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v22;
LABEL_3:
    uint64_t v6 = 0;
    while (1)
    {
      if (*(void *)v22 != v5) {
        objc_enumerationMutation(v3);
      }
      uint64_t v7 = [*(id *)(*((void *)&v21 + 1) + 8 * v6) uniform];
      char v8 = [v7 name];
      char v9 = [v8 isEqual:@"u_sprite_size"];

      if (v9) {
        break;
      }
      if (v4 == ++v6)
      {
        uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v21 objects:v26 count:16];
        if (v4) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:

    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    uint64_t v3 = self->_attributes;
    uint64_t v10 = [(NSArray *)v3 countByEnumeratingWithState:&v17 objects:v25 count:16];
    if (!v10)
    {
LABEL_17:

      uint64_t v3 = +[SKUniform uniformWithName:@"u_sprite_size" vectorFloat2:0.0];
      long long v15 = objc_opt_new();
      [v15 setUniform:v3];
      goto LABEL_19;
    }
    uint64_t v11 = *(void *)v18;
LABEL_11:
    uint64_t v12 = 0;
    while (1)
    {
      if (*(void *)v18 != v11) {
        objc_enumerationMutation(v3);
      }
      char v13 = objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * v12), "name", (void)v17);
      char v14 = [v13 isEqual:@"u_sprite_size"];

      if (v14) {
        break;
      }
      if (v10 == ++v12)
      {
        uint64_t v10 = [(NSArray *)v3 countByEnumeratingWithState:&v17 objects:v25 count:16];
        if (v10) {
          goto LABEL_11;
        }
        goto LABEL_17;
      }
    }
  }
  long long v15 = 0;
LABEL_19:

  return v15;
}

- (BOOL)performFullCapture
{
  return self->_performFullCapture;
}

- (void)setPerformFullCapture:(BOOL)a3
{
  self->_performFullCapture = a3;
}

- (void).cxx_destruct
{
  std::__tree<std::__value_type<std::string,std::shared_ptr<jet_buffer_pool>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::shared_ptr<jet_buffer_pool>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::shared_ptr<jet_buffer_pool>>>>::destroy((uint64_t)&self->_attributeBuffers, (void *)self->_attributeBuffers.__tree_.__pair1_.__value_.__left_);
  cntrl = self->_backingProgramWithTransform.__cntrl_;
  if (cntrl) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)cntrl);
  }
  uint64_t v4 = self->_backingProgram.__cntrl_;
  if (v4) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v4);
  }
  objc_storeStrong((id *)&self->_targetNodes, 0);
  objc_storeStrong((id *)&self->_compileLog, 0);
  objc_storeStrong((id *)&self->_fileName, 0);
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_uniformData, 0);
  objc_storeStrong((id *)&self->_attributes, 0);

  objc_storeStrong((id *)&self->_uniforms, 0);
}

- (id).cxx_construct
{
  *((void *)self + 16) = 0;
  *((void *)self + 17) = 0;
  *(_OWORD *)((char *)self + 88) = 0u;
  *(_OWORD *)((char *)self + 104) = 0u;
  *((void *)self + 15) = (char *)self + 128;
  return self;
}

@end