@interface DYMTLTextureRenderer
- (DYMTLTextureRenderer)initWithDevice:(id)a3;
- (id).cxx_construct;
- (unint64_t)_renderPassPixelFormatFromDescriptor:(id)a3;
- (void)renderTexture:(id)a3 withEncoder:(id)a4 enableBlending:(BOOL)a5 layerIndex:(unsigned int)a6;
- (void)setBlendColorRed:(float)a3 green:(float)a4 blue:(float)a5 alpha:(float)a6;
@end

@implementation DYMTLTextureRenderer

- (DYMTLTextureRenderer)initWithDevice:(id)a3
{
  id v5 = a3;
  v44.receiver = self;
  v44.super_class = (Class)DYMTLTextureRenderer;
  v6 = [(DYMTLTextureRenderer *)&v44 init];
  v7 = v6;
  if (!v6 || (p_device = (id *)&v6->_device, objc_storeStrong((id *)&v6->_device, a3), (device = v7->_device) == 0))
  {
    v40 = 0;
    goto LABEL_9;
  }
  id v43 = 0;
  uint64_t v10 = -[MTLDevice newLibraryWithSource:options:error:](device, "newLibraryWithSource:options:error:", @"#include <metal_graphics>\n#include <metal_texture>\nusing namespace metal;\nstruct VertexOutput\n{\n  vec<float, 4> pos [[position]];\n  vec<float, 2> uv;\n};\nstruct UniformData\n{\n  vec<float, 4> blendColor;\n  uint selectedLayer;\n};\n\nvertex VertexOutput vertexFunction(device const vec<float,4> *pos_data [[ buffer(0) ]],\n                                   device const vec<float,2> *uv_data [[ buffer(1) ]], \n                                   uint vid [[ vertex_id ]])\n{\n  VertexOutput out;\n  out.pos = pos_data[vid];\n  out.uv = uv_data[vid];\n  return out;\n}\nfragment vec<float, 4> opaqueFragmentFunction(VertexOutput in [[stage_in]],\n                                              texture2d<float> tex [[ texture(0) ]],\n                                              sampler sam [[ sampler(0) ]])\n{\n  vec<float, 4> tex_color = tex.sample(sam, in.uv);\n  return tex_color;\n}\nfragment vec<float, 4> blendingFragmentFunction(VertexOutput in [[stage_in]],\n                                                texture2d<float> tex [[ texture(0) ]],\n                                                sampler sam [[ sampler(0) ]],\n                                                constant UniformData &uniformData [[ buffer(0) ]]){\n  vec<float, 4> tex_color = tex.sample(sam, in.uv);\n  return tex_color.r * uniformData.blendColor;\n}\nfragment vec<float, 4> blendingFragmentFunction_2dArray(VertexOutput in [[stage_in]],\n                                                        texture2d_array<float> tex [[ texture(0) ]],\n                                                        sampler sam [[ sampler(0) ]],\n                                                        constant UniformData &uniformData [[ buffer(0) ]]){\n  vec<float, 4> tex_color = tex.sample(sam, in.uv, uniformData.selectedLayer);\n  return tex_color.r * uniformData.blendColor;\n}\n",
          0,
          &v43);
  id v11 = v43;
  library = v7->_library;
  v7->_library = (MTLLibrary *)v10;

  v13 = v7->_library;
  if (!v13) {
    __assert_rtn("-[DYMTLTextureRenderer initWithDevice:]", ", 0, "_library != nil"");
  }
  uint64_t v14 = [(MTLLibrary *)v13 newFunctionWithName:@"vertexFunction"];
  vertexFunction = v7->_vertexFunction;
  v7->_vertexFunction = (MTLFunction *)v14;

  uint64_t v16 = [(MTLLibrary *)v7->_library newFunctionWithName:@"opaqueFragmentFunction"];
  opaqueFragmentFunction = v7->_opaqueFragmentFunction;
  v7->_opaqueFragmentFunction = (MTLFunction *)v16;

  uint64_t v18 = [(MTLLibrary *)v7->_library newFunctionWithName:@"blendingFragmentFunction"];
  blendingFragmentFunction = v7->_blendingFragmentFunction;
  v7->_blendingFragmentFunction = (MTLFunction *)v18;

  uint64_t v20 = [(MTLLibrary *)v7->_library newFunctionWithName:@"blendingFragmentFunction_2dArray"];
  blendingFragmentFunction_2dArray = v7->_blendingFragmentFunction_2dArray;
  v7->_blendingFragmentFunction_2dArray = (MTLFunction *)v20;

  uint64_t v22 = objc_opt_new();
  renderPipelineDescriptor = v7->_renderPipelineDescriptor;
  v7->_renderPipelineDescriptor = (MTLRenderPipelineDescriptor *)v22;

  v24 = [(MTLRenderPipelineDescriptor *)v7->_renderPipelineDescriptor colorAttachments];
  v25 = [v24 objectAtIndexedSubscript:0];

  [v25 setBlendingEnabled:0];
  [v25 setSourceRGBBlendFactor:4];
  [v25 setDestinationRGBBlendFactor:5];
  [v25 setRgbBlendOperation:0];
  [v25 setSourceAlphaBlendFactor:0];
  [v25 setDestinationAlphaBlendFactor:1];
  [v25 setAlphaBlendOperation:0];
  [(MTLRenderPipelineDescriptor *)v7->_renderPipelineDescriptor setVertexFunction:v7->_vertexFunction];
  uint64_t v26 = objc_opt_new();
  depthStencilDescriptor = v7->_depthStencilDescriptor;
  v7->_depthStencilDescriptor = (MTLDepthStencilDescriptor *)v26;

  if (!v7->_depthStencilDescriptor)
  {
    v42 = "_depthStencilDescriptor != nil";
    goto LABEL_14;
  }
  uint64_t v28 = [*p_device newBufferWithLength:64 options:0];
  positionBuffer = v7->_positionBuffer;
  v7->_positionBuffer = (MTLBuffer *)v28;

  v30 = v7->_positionBuffer;
  if (!v30)
  {
    v42 = "_positionBuffer != nil";
    goto LABEL_14;
  }
  v31 = (_OWORD *)[(MTLBuffer *)v30 contents];
  _OWORD *v31 = -[DYMTLTextureRenderer initWithDevice:]::positionList;
  v31[1] = unk_24F732090;
  v31[2] = xmmword_24F7320A0;
  v31[3] = unk_24F7320B0;
  uint64_t v32 = [*p_device newBufferWithLength:32 options:0];
  texCoordBuffer = v7->_texCoordBuffer;
  v7->_texCoordBuffer = (MTLBuffer *)v32;

  v34 = v7->_texCoordBuffer;
  if (!v34)
  {
    v42 = "_texCoordBuffer != nil";
LABEL_14:
    __assert_rtn("-[DYMTLTextureRenderer initWithDevice:]", "", 0, v42);
  }
  v35 = (_OWORD *)[(MTLBuffer *)v34 contents];
  _OWORD *v35 = -[DYMTLTextureRenderer initWithDevice:]::texCoordList;
  v35[1] = unk_24F7320D0;
  v36 = objc_opt_new();
  [v36 setMinFilter:1];
  [v36 setMagFilter:1];
  [v36 setMipFilter:2];
  [v36 setMaxAnisotropy:1];
  [v36 setSAddressMode:0];
  [v36 setTAddressMode:0];
  [v36 setRAddressMode:0];
  [v36 setNormalizedCoordinates:1];
  [v36 setLodMinClamp:0.0];
  LODWORD(v37) = 2139095039;
  [v36 setLodMaxClamp:v37];
  uint64_t v38 = [*p_device newSamplerStateWithDescriptor:v36];
  samplerState = v7->_samplerState;
  v7->_samplerState = (MTLSamplerState *)v38;

  v40 = v7;
LABEL_9:

  return v40;
}

- (void)renderTexture:(id)a3 withEncoder:(id)a4 enableBlending:(BOOL)a5 layerIndex:(unsigned int)a6
{
  BOOL v7 = a5;
  id v37 = a3;
  id v10 = a4;
  if (!v37) {
    goto LABEL_21;
  }
  if (!v10) {
    goto LABEL_21;
  }
  id v11 = [v10 descriptor];
  unint64_t v12 = [(DYMTLTextureRenderer *)self _renderPassPixelFormatFromDescriptor:v11];

  if (!v12) {
    goto LABEL_21;
  }
  v13 = self->_renderPipelineDescriptor;
  uint64_t v14 = [(MTLRenderPipelineDescriptor *)v13 colorAttachments];
  v15 = [v14 objectAtIndexedSubscript:0];
  [v15 setBlendingEnabled:v7];

  uint64_t v16 = [(MTLRenderPipelineDescriptor *)v13 colorAttachments];
  v17 = [v16 objectAtIndexedSubscript:0];
  [v17 setRgbBlendOperation:0];

  uint64_t v18 = [(MTLRenderPipelineDescriptor *)v13 colorAttachments];
  v19 = [v18 objectAtIndexedSubscript:0];
  [v19 setSourceRGBBlendFactor:4];

  uint64_t v20 = [(MTLRenderPipelineDescriptor *)v13 colorAttachments];
  v21 = [v20 objectAtIndexedSubscript:0];
  [v21 setDestinationRGBBlendFactor:5];

  uint64_t v22 = [(MTLRenderPipelineDescriptor *)v13 colorAttachments];
  v23 = [v22 objectAtIndexedSubscript:0];
  [v23 setAlphaBlendOperation:0];

  v24 = [(MTLRenderPipelineDescriptor *)v13 colorAttachments];
  v25 = [v24 objectAtIndexedSubscript:0];
  [v25 setSourceAlphaBlendFactor:4];

  uint64_t v26 = [(MTLRenderPipelineDescriptor *)v13 colorAttachments];
  v27 = [v26 objectAtIndexedSubscript:0];
  [v27 setDestinationAlphaBlendFactor:5];

  uint64_t v28 = [v37 textureType];
  if (v28 == 2)
  {
    uint64_t v29 = 32;
    if (v7) {
      uint64_t v29 = 40;
    }
  }
  else
  {
    if (v28 != 3) {
      goto LABEL_13;
    }
    if (!v7)
    {
      uint64_t v30 = 0;
      goto LABEL_12;
    }
    uint64_t v29 = 48;
  }
  uint64_t v30 = *(uint64_t *)((char *)&self->super.isa + v29);
LABEL_12:
  [(MTLRenderPipelineDescriptor *)v13 setFragmentFunction:v30];
LABEL_13:
  v31 = [(MTLRenderPipelineDescriptor *)v13 fragmentFunction];
  if (v31)
  {
    uint64_t v32 = [(MTLRenderPipelineDescriptor *)v13 vertexFunction];

    if (v32)
    {
      v33 = [(MTLRenderPipelineDescriptor *)v13 colorAttachments];
      v34 = [v33 objectAtIndexedSubscript:0];
      [v34 setPixelFormat:v12];

      v35 = (void *)[(MTLDevice *)self->_device newRenderPipelineStateWithDescriptor:v13 error:0];
      if (v35)
      {
        v36 = (void *)[(MTLDevice *)self->_device newDepthStencilStateWithDescriptor:self->_depthStencilDescriptor];
        if (v36)
        {
          self->_uniformData.layerIndex = a6;
          [v10 setCullMode:0];
          [v10 setTriangleFillMode:0];
          [v10 setDepthStencilState:v36];
          [v10 setRenderPipelineState:v35];
          [v10 setVertexBuffer:self->_positionBuffer offset:0 atIndex:0];
          [v10 setVertexBuffer:self->_texCoordBuffer offset:0 atIndex:1];
          [v10 setFragmentTexture:v37 atIndex:0];
          [v10 setFragmentSamplerState:self->_samplerState atIndex:0];
          [v10 setFragmentBytes:&self->_uniformData length:32 atIndex:0];
          [v10 drawPrimitives:4 vertexStart:0 vertexCount:4 instanceCount:1];
        }
      }
    }
  }

LABEL_21:
}

- (unint64_t)_renderPassPixelFormatFromDescriptor:(id)a3
{
  uint64_t v4 = 0;
  while (1)
  {
    id v5 = [a3 colorAttachments];
    v6 = [v5 objectAtIndexedSubscript:v4];

    BOOL v7 = [v6 texture];
    v8 = v7;
    if (v7)
    {
      if ([v7 width] && objc_msgSend(v8, "height")) {
        break;
      }
    }

    if (++v4 == 8) {
      return 0;
    }
  }
  unint64_t v9 = [v8 pixelFormat];

  return v9;
}

- (void)setBlendColorRed:(float)a3 green:(float)a4 blue:(float)a5 alpha:(float)a6
{
  self->_uniformData.blendColor[0] = a3;
  self->_uniformData.blendColor[1] = a4;
  self->_uniformData.blendColor[2] = a5;
  self->_uniformData.blendColor[3] = a6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_samplerState, 0);
  objc_storeStrong((id *)&self->_texCoordBuffer, 0);
  objc_storeStrong((id *)&self->_positionBuffer, 0);
  objc_storeStrong((id *)&self->_depthStencilDescriptor, 0);
  objc_storeStrong((id *)&self->_renderPipelineDescriptor, 0);
  objc_storeStrong((id *)&self->_blendingFragmentFunction_2dArray, 0);
  objc_storeStrong((id *)&self->_blendingFragmentFunction, 0);
  objc_storeStrong((id *)&self->_opaqueFragmentFunction, 0);
  objc_storeStrong((id *)&self->_vertexFunction, 0);
  objc_storeStrong((id *)&self->_library, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 88) = xmmword_24F732070;
  *((_DWORD *)self + 26) = 0;
  return self;
}

@end