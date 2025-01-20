@interface DYMTLTextureResize
+ (id)forDevice:(id)a3;
- (DYMTLTextureResize)initWithDevice:(id)a3;
- (MTLDevice)device;
- (id)_texture2DFromTexture:(id)a3 level:(unint64_t)a4 slice:(unint64_t)a5 depthPlane:(unint64_t)a6 commandBuffer:(id)a7;
- (id)dataTypeForReturnType:(id)a3;
- (id)generateFragmentFunctionForPixelFormat:(unint64_t)a3 texture:(id)a4;
- (id)generateThumbnailFromTexture:(id)a3 commandBuffer:(id)a4 resolution:(id *)a5 withFence:(id)a6;
- (id)resolveMultisampleTexture:(id)a3 slice:(unint64_t)a4 level:(unint64_t)a5 depthPlane:(unint64_t)a6 commandBuffer:(id)a7;
- (id)returnTypeForPixelFormat:(unint64_t)a3;
- (id)stencilTextureFromTexture:(id)a3 commandBuffer:(id)a4;
- (id)textureFromTexture:(id)a3 slice:(unint64_t)a4 level:(unint64_t)a5 depthPlane:(unint64_t)a6 commandBuffer:(id)a7;
- (id)textureTypeForPixelFormat:(unint64_t)a3;
- (void)resizeTexture:(id)a3 resolution:(id *)a4 level:(unint64_t)a5 slice:(unint64_t)a6 depthPlane:(unint64_t)a7 inBuffer:(id)a8 withType:(unsigned int)a9 completion:(id)a10;
@end

@implementation DYMTLTextureResize

- (DYMTLTextureResize)initWithDevice:(id)a3
{
  id v5 = a3;
  v43.receiver = self;
  v43.super_class = (Class)DYMTLTextureResize;
  v6 = [(DYMTLTextureResize *)&v43 init];
  v7 = v6;
  if (v6)
  {
    p_device = (id *)&v6->_device;
    objc_storeStrong((id *)&v6->_device, a3);
    device = v7->_device;
    id v42 = 0;
    v10 = (void *)-[MTLDevice newLibraryWithSource:options:error:](device, "newLibraryWithSource:options:error:", @"#include <metal_stdlib>\nusing namespace metal;\nstruct VertexOutput\n{\n    vec<float, 4> pos [[position]];\n    vec<float, 2> uv;\n};\nvertex VertexOutput passthroughVertex(uint vid [[ vertex_id ]],\n                                      constant vec<float,4> *pos_data [[ buffer(0) ]],\n                                      constant vec<float,2> *uv_data [[ buffer(1) ]])\n{\n    VertexOutput out;\n    out.pos = pos_data[vid];\n    out.uv = uv_data[vid];\n    return out;\n}\nfragment float4 texturedQuadFragmentDepth(VertexOutput in [[ stage_in ]],\n                                     depth2d<float> tex [[ texture(0) ]],\n                                     sampler samp [[ sampler(0) ]])\n{\nfloat sample = tex.sample(samp, in.uv);\nreturn float4(sample, sample, sample, 1.0);\n}\nfragment float4 texturedQuadFragmentStencil(VertexOutput in [[ stage_in ]],\n                                     depth2d<float> tex [[ texture(0) ]],\n                                     sampler samp [[ sampler(0) ]])\n{\nfloat sample = tex.sample(samp, in.uv);\nreturn float4(sample, sample, sample, 1.0);\n}\nfragment float4 texturedQuadFragment(VertexOutput in [[ stage_in ]],\n                                     texture2d<float> tex [[ texture(0) ]],\n                                     sampler samp [[ sampler(0) ]])\n{\nreturn tex.sample(samp, in.uv);\n}",
                    0,
                    &v42);
    id v11 = v42;
    if (!v10) {
      __assert_rtn("-[DYMTLTextureResize initWithDevice:]", ", 0, "_quadLibrary != nil"");
    }
    v12 = (void *)[v10 newFunctionWithName:@"passthroughVertex"];
    uint64_t v13 = [v10 newFunctionWithName:@"texturedQuadFragment"];
    thumbnailColorFragment = v7->_thumbnailColorFragment;
    v7->_thumbnailColorFragment = (MTLFunction *)v13;

    uint64_t v15 = [v10 newFunctionWithName:@"texturedQuadFragmentDepth"];
    thumbnailDepthFragment = v7->_thumbnailDepthFragment;
    v7->_thumbnailDepthFragment = (MTLFunction *)v15;

    uint64_t v17 = [v10 newFunctionWithName:@"texturedQuadFragmentStencil"];
    thumbnailStencilFragment = v7->_thumbnailStencilFragment;
    v7->_thumbnailStencilFragment = (MTLFunction *)v17;

    uint64_t v19 = -[MTLDevice newBufferWithBytes:length:options:](v7->_device, "newBufferWithBytes:length:options:", &-[DYMTLTextureResize initWithDevice:]::posData, 96, 0);
    quadPositions = v7->_quadPositions;
    v7->_quadPositions = (MTLBuffer *)v19;

    uint64_t v21 = -[MTLDevice newBufferWithBytes:length:options:](v7->_device, "newBufferWithBytes:length:options:", &-[DYMTLTextureResize initWithDevice:]::texCoords, 48, 0);
    quadTexCoords = v7->_quadTexCoords;
    v7->_quadTexCoords = (MTLBuffer *)v21;

    uint64_t v23 = -[MTLDevice newBufferWithBytes:length:options:](v7->_device, "newBufferWithBytes:length:options:", &-[DYMTLTextureResize initWithDevice:]::indexData, 24, 0);
    quadIndicies = v7->_quadIndicies;
    v7->_quadIndicies = (MTLBuffer *)v23;

    uint64_t v25 = objc_opt_new();
    thumbnailRenderPass = v7->_thumbnailRenderPass;
    v7->_thumbnailRenderPass = (MTLRenderPassDescriptor *)v25;

    v27 = objc_opt_new();
    [v27 setStencilCompareFunction:7];
    [v27 setReadMask:0];
    [v27 setWriteMask:0];
    id v28 = objc_alloc_init(MEMORY[0x263F128A0]);
    [v28 setDepthCompareFunction:7];
    [v28 setFrontFaceStencil:v27];
    [v28 setBackFaceStencil:v27];
    [v28 setDepthWriteEnabled:0];
    uint64_t v29 = [*p_device newDepthStencilStateWithDescriptor:v28];
    thumbnailDepthStencilState = v7->_thumbnailDepthStencilState;
    v7->_thumbnailDepthStencilState = (MTLDepthStencilState *)v29;

    uint64_t v31 = objc_opt_new();
    thumbnailPipelineDescriptor = v7->_thumbnailPipelineDescriptor;
    v7->_thumbnailPipelineDescriptor = (MTLRenderPipelineDescriptor *)v31;

    [(MTLRenderPipelineDescriptor *)v7->_thumbnailPipelineDescriptor setLabel:@"Thumbnail Render"];
    [(MTLRenderPipelineDescriptor *)v7->_thumbnailPipelineDescriptor setVertexFunction:v12];
    v33 = objc_opt_new();
    [v33 setMinFilter:1];
    [v33 setMagFilter:1];
    [v33 setMipFilter:2];
    [v33 setMaxAnisotropy:1];
    [v33 setSAddressMode:0];
    [v33 setTAddressMode:0];
    [v33 setRAddressMode:0];
    [v33 setNormalizedCoordinates:1];
    [v33 setLodMinClamp:0.0];
    LODWORD(v34) = 2139095039;
    [v33 setLodMaxClamp:v34];
    uint64_t v35 = [*p_device newSamplerStateWithDescriptor:v33];
    downscaleSampler = v7->_downscaleSampler;
    v7->_downscaleSampler = (MTLSamplerState *)v35;

    [v33 setMinFilter:0];
    [v33 setMagFilter:0];
    [v33 setMipFilter:0];
    uint64_t v37 = [*p_device newSamplerStateWithDescriptor:v33];
    upscaleSampler = v7->_upscaleSampler;
    v7->_upscaleSampler = (MTLSamplerState *)v37;

    uint64_t v39 = objc_opt_new();
    fragmentFunctionForPixelFormatCache = v7->_fragmentFunctionForPixelFormatCache;
    v7->_fragmentFunctionForPixelFormatCache = (NSMutableDictionary *)v39;
  }
  return v7;
}

- (id)stencilTextureFromTexture:(id)a3 commandBuffer:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 pixelFormat] == 260)
  {
    if (([v6 usage] & 0x10) == 0)
    {
      v8 = MakeMTLTextureDescriptorFromTexture(v6);
      [v8 setUsage:17];
      v9 = [(DYMTLTextureResize *)self device];
      uint64_t v10 = [v9 newTextureWithDescriptor:v8];

      id v11 = [v7 blitCommandEncoder];
      memset(v18, 0, sizeof(v18));
      v17[0] = [v6 width];
      v17[1] = [v6 height];
      v17[2] = 1;
      memset(v16, 0, sizeof(v16));
      [v11 copyFromTexture:v6 sourceSlice:0 sourceLevel:0 sourceOrigin:v18 sourceSize:v17 toTexture:v10 destinationSlice:0 destinationLevel:0 destinationOrigin:v16];
      [v11 endEncoding];

      id v6 = (id)v10;
    }
    uint64_t v12 = [v6 pixelFormat];
    if (v12 == 260) {
      uint64_t v13 = 261;
    }
    else {
      uint64_t v13 = v12;
    }
    v14 = (void *)[v6 newTextureViewWithPixelFormat:v13];
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)resolveMultisampleTexture:(id)a3 slice:(unint64_t)a4 level:(unint64_t)a5 depthPlane:(unint64_t)a6 commandBuffer:(id)a7
{
  id v12 = a3;
  id v13 = a7;
  if ([v12 textureType] == 4 || objc_msgSend(v12, "textureType") == 8)
  {
    v14 = MakeMTLTextureDescriptorFromTexture(v12);
    [v14 setUsage:1];
    uint64_t v15 = [(DYMTLTextureResize *)self device];
    v16 = (void *)[v15 newTextureWithDescriptor:v14];

    uint64_t v17 = [MEMORY[0x263F129A0] renderPassDescriptor];
    switch([v12 pixelFormat])
    {
      case 250:
      case 252:
        v18 = [v17 depthAttachment];
        [v18 setTexture:v12];
        [v18 setLevel:a5];
        [v18 setSlice:a4];
        [v18 setDepthPlane:a6];
        [v18 setResolveTexture:v16];
        [v18 setLoadAction:1];
        [v18 setStoreAction:2];
        break;
      case 253:
      case 261:
        v18 = [v17 stencilAttachment];
        [v18 setTexture:v12];
        [v18 setLevel:a5];
        [v18 setSlice:a4];
        [v18 setDepthPlane:a6];
        [v18 setResolveTexture:v16];
        [v18 setLoadAction:1];
        [v18 setStoreAction:2];
        break;
      case 260:
        v18 = [v17 depthAttachment];
        [v18 setTexture:v12];
        [v18 setLevel:a5];
        [v18 setSlice:a4];
        [v18 setDepthPlane:a6];
        [v18 setResolveTexture:v16];
        [v18 setLoadAction:1];
        [v18 setStoreAction:2];
        uint64_t v19 = [v17 stencilAttachment];
        [v19 setTexture:v12];
        [v19 setLevel:a5];
        [v19 setSlice:a4];
        [v19 setDepthPlane:a6];
        [v19 setResolveTexture:v16];
        [v19 setLoadAction:1];
        [v19 setStoreAction:2];

        break;
      default:
        v20 = [v17 colorAttachments];
        v18 = [v20 objectAtIndexedSubscript:0];

        [v18 setTexture:v12];
        [v18 setLevel:a5];
        [v18 setSlice:a4];
        [v18 setDepthPlane:a6];
        [v18 setResolveTexture:v16];
        [v18 setLoadAction:1];
        [v18 setStoreAction:2];
        break;
    }

    uint64_t v21 = [v13 renderCommandEncoderWithDescriptor:v17];
    [v21 endEncoding];
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (id)returnTypeForPixelFormat:(unint64_t)a3
{
  id result = 0;
  switch(a3)
  {
    case 1uLL:
    case 0xAuLL:
    case 0xBuLL:
    case 0xCuLL:
    case 0x14uLL:
    case 0x16uLL:
    case 0x19uLL:
    case 0x37uLL:
      id result = @"float";
      break;
    case 2uLL:
    case 3uLL:
    case 4uLL:
    case 5uLL:
    case 6uLL:
    case 7uLL:
    case 8uLL:
    case 9uLL:
    case 0xFuLL:
    case 0x10uLL:
    case 0x11uLL:
    case 0x12uLL:
    case 0x13uLL:
    case 0x15uLL:
    case 0x1AuLL:
    case 0x1BuLL:
    case 0x1CuLL:
    case 0x1DuLL:
    case 0x23uLL:
    case 0x24uLL:
    case 0x25uLL:
    case 0x26uLL:
    case 0x27uLL:
    case 0x2CuLL:
    case 0x2DuLL:
    case 0x2EuLL:
    case 0x2FuLL:
    case 0x30uLL:
    case 0x31uLL:
    case 0x32uLL:
    case 0x33uLL:
    case 0x34uLL:
    case 0x38uLL:
    case 0x39uLL:
    case 0x3AuLL:
    case 0x3BuLL:
    case 0x3DuLL:
    case 0x42uLL:
    case 0x43uLL:
    case 0x44uLL:
    case 0x45uLL:
    case 0x4BuLL:
    case 0x4CuLL:
    case 0x4DuLL:
    case 0x4EuLL:
    case 0x4FuLL:
    case 0x52uLL:
    case 0x53uLL:
    case 0x54uLL:
    case 0x55uLL:
    case 0x56uLL:
    case 0x57uLL:
    case 0x58uLL:
    case 0x59uLL:
    case 0x5FuLL:
    case 0x60uLL:
    case 0x61uLL:
    case 0x62uLL:
    case 0x63uLL:
    case 0x64uLL:
    case 0x65uLL:
    case 0x66uLL:
    case 0x6AuLL:
    case 0x6BuLL:
    case 0x6CuLL:
    case 0x6DuLL:
    case 0x6FuLL:
    case 0x74uLL:
    case 0x75uLL:
    case 0x76uLL:
    case 0x77uLL:
    case 0x78uLL:
    case 0x79uLL:
    case 0x7AuLL:
      return result;
    case 0xDuLL:
    case 0x17uLL:
    case 0x35uLL:
      id result = @"uint";
      break;
    case 0xEuLL:
    case 0x18uLL:
    case 0x36uLL:
      id result = @"int";
      break;
    case 0x1EuLL:
    case 0x1FuLL:
    case 0x20uLL:
    case 0x3CuLL:
    case 0x3EuLL:
    case 0x41uLL:
    case 0x69uLL:
      id result = @"float2";
      break;
    case 0x21uLL:
    case 0x3FuLL:
    case 0x67uLL:
      id result = @"uint2";
      break;
    case 0x22uLL:
    case 0x40uLL:
    case 0x68uLL:
      id result = @"int2";
      break;
    case 0x28uLL:
    case 0x29uLL:
    case 0x2AuLL:
    case 0x2BuLL:
    case 0x46uLL:
    case 0x47uLL:
    case 0x48uLL:
    case 0x50uLL:
    case 0x51uLL:
    case 0x5AuLL:
    case 0x5CuLL:
    case 0x5DuLL:
    case 0x5EuLL:
    case 0x6EuLL:
    case 0x70uLL:
    case 0x73uLL:
    case 0x7DuLL:
      goto LABEL_2;
    case 0x49uLL:
    case 0x5BuLL:
    case 0x71uLL:
    case 0x7BuLL:
      id result = @"uint4";
      break;
    case 0x4AuLL:
    case 0x72uLL:
    case 0x7CuLL:
      id result = @"int4";
      break;
    default:
      if (a3 - 554 < 2) {
LABEL_2:
      }
        id result = @"float4";
      break;
  }
  return result;
}

- (id)textureTypeForPixelFormat:(unint64_t)a3
{
  id result = 0;
  switch(a3)
  {
    case 1uLL:
    case 0xAuLL:
    case 0xBuLL:
    case 0xCuLL:
    case 0x14uLL:
    case 0x16uLL:
    case 0x19uLL:
    case 0x1EuLL:
    case 0x1FuLL:
    case 0x20uLL:
    case 0x28uLL:
    case 0x29uLL:
    case 0x2AuLL:
    case 0x2BuLL:
    case 0x37uLL:
    case 0x3CuLL:
    case 0x3EuLL:
    case 0x41uLL:
    case 0x46uLL:
    case 0x47uLL:
    case 0x48uLL:
    case 0x50uLL:
    case 0x51uLL:
    case 0x5AuLL:
    case 0x5CuLL:
    case 0x5DuLL:
    case 0x5EuLL:
    case 0x69uLL:
    case 0x6EuLL:
    case 0x70uLL:
    case 0x73uLL:
    case 0x7DuLL:
      goto LABEL_2;
    case 2uLL:
    case 3uLL:
    case 4uLL:
    case 5uLL:
    case 6uLL:
    case 7uLL:
    case 8uLL:
    case 9uLL:
    case 0xFuLL:
    case 0x10uLL:
    case 0x11uLL:
    case 0x12uLL:
    case 0x13uLL:
    case 0x15uLL:
    case 0x1AuLL:
    case 0x1BuLL:
    case 0x1CuLL:
    case 0x1DuLL:
    case 0x23uLL:
    case 0x24uLL:
    case 0x25uLL:
    case 0x26uLL:
    case 0x27uLL:
    case 0x2CuLL:
    case 0x2DuLL:
    case 0x2EuLL:
    case 0x2FuLL:
    case 0x30uLL:
    case 0x31uLL:
    case 0x32uLL:
    case 0x33uLL:
    case 0x34uLL:
    case 0x38uLL:
    case 0x39uLL:
    case 0x3AuLL:
    case 0x3BuLL:
    case 0x3DuLL:
    case 0x42uLL:
    case 0x43uLL:
    case 0x44uLL:
    case 0x45uLL:
    case 0x4BuLL:
    case 0x4CuLL:
    case 0x4DuLL:
    case 0x4EuLL:
    case 0x4FuLL:
    case 0x52uLL:
    case 0x53uLL:
    case 0x54uLL:
    case 0x55uLL:
    case 0x56uLL:
    case 0x57uLL:
    case 0x58uLL:
    case 0x59uLL:
    case 0x5FuLL:
    case 0x60uLL:
    case 0x61uLL:
    case 0x62uLL:
    case 0x63uLL:
    case 0x64uLL:
    case 0x65uLL:
    case 0x66uLL:
    case 0x6AuLL:
    case 0x6BuLL:
    case 0x6CuLL:
    case 0x6DuLL:
    case 0x6FuLL:
    case 0x74uLL:
    case 0x75uLL:
    case 0x76uLL:
    case 0x77uLL:
    case 0x78uLL:
    case 0x79uLL:
    case 0x7AuLL:
      return result;
    case 0xDuLL:
    case 0x17uLL:
    case 0x21uLL:
    case 0x35uLL:
    case 0x3FuLL:
    case 0x49uLL:
    case 0x5BuLL:
    case 0x67uLL:
    case 0x71uLL:
    case 0x7BuLL:
      id result = @"uint";
      break;
    case 0xEuLL:
    case 0x18uLL:
    case 0x22uLL:
    case 0x36uLL:
    case 0x40uLL:
    case 0x4AuLL:
    case 0x68uLL:
    case 0x72uLL:
    case 0x7CuLL:
      id result = @"int";
      break;
    default:
      if (a3 - 554 < 2) {
LABEL_2:
      }
        id result = @"float";
      break;
  }
  return result;
}

- (id)dataTypeForReturnType:(id)a3
{
  id v3 = a3;
  if (([v3 isEqualToString:@"int"] & 1) != 0
    || ([v3 isEqualToString:@"uint"] & 1) != 0
    || ([v3 isEqualToString:@"float"] & 1) != 0)
  {
    v4 = @".x";
  }
  else if (([v3 isEqualToString:@"int2"] & 1) != 0 {
         || ([v3 isEqualToString:@"uint2"] & 1) != 0
  }
         || ([v3 isEqualToString:@"float2"] & 1) != 0)
  {
    v4 = @".xy";
  }
  else if (([v3 isEqualToString:@"int4"] & 1) != 0 {
         || ([v3 isEqualToString:@"uint4"] & 1) != 0
  }
         || [v3 isEqualToString:@"float4"])
  {
    v4 = @".xyzw";
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)generateFragmentFunctionForPixelFormat:(unint64_t)a3 texture:(id)a4
{
  id v6 = a4;
  fragmentFunctionForPixelFormatCache = self->_fragmentFunctionForPixelFormatCache;
  v8 = [NSNumber numberWithUnsignedInteger:a3];
  id v9 = [(NSMutableDictionary *)fragmentFunctionForPixelFormatCache objectForKeyedSubscript:v8];

  if (v9) {
    goto LABEL_20;
  }
  uint64_t v10 = [(DYMTLTextureResize *)self returnTypeForPixelFormat:a3];
  id v11 = [(DYMTLTextureResize *)self textureTypeForPixelFormat:a3];
  id v12 = [(DYMTLTextureResize *)self dataTypeForReturnType:v10];
  if ((objc_opt_respondsToSelector() & 1) != 0 && ([v6 isSparse] & 1) == 0) {
    id v13 = @"tex.sparse_sample(samp, in.uv).value()";
  }
  else {
    id v13 = @"tex.sample(samp, in.uv)";
  }
  BOOL v14 = !v10 || v11 == 0;
  BOOL v15 = v14 || v12 == 0;
  BOOL v16 = v15;
  if (v15)
  {
    id v9 = 0;
  }
  else
  {
    BOOL v24 = v16;
    objc_msgSend(NSString, "stringWithFormat:", @"#include <metal_stdlib>\nusing namespace metal;\n\nstruct VertexOutput\n{\n    vec<float, 4> pos [[position]];\n    vec<float, 2> uv;\n};\n\n\nfragment %@ texturedQuadFragment(VertexOutput in [[ stage_in ]],\n                                     texture2d<%@> tex [[ texture(0) ]],\n                                     sampler samp [[ sampler(0) ]])\n{\n   return %@%@;\n}\n",
      v10,
      v11,
      v13,
    uint64_t v17 = v12);
    device = self->_device;
    id v27 = 0;
    v26 = (void *)v17;
    uint64_t v19 = (void *)[(MTLDevice *)device newLibraryWithSource:v17 options:0 error:&v27];
    id v25 = v27;
    id v9 = (id)[v19 newFunctionWithName:@"texturedQuadFragment"];
    v20 = self->_fragmentFunctionForPixelFormatCache;
    uint64_t v21 = [NSNumber numberWithUnsignedInteger:a3];
    [(NSMutableDictionary *)v20 setObject:v9 forKey:v21];

    BOOL v16 = v24;
  }

  if (!v16)
  {
LABEL_20:
    id v9 = v9;
    v22 = v9;
  }
  else
  {
    v22 = 0;
  }

  return v22;
}

- (id)generateThumbnailFromTexture:(id)a3 commandBuffer:(id)a4 resolution:(id *)a5 withFence:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = 0;
  if (!v10 || !v11) {
    goto LABEL_33;
  }
  unint64_t v14 = [v10 width];
  unint64_t v15 = [v10 height];
  unint64_t v16 = v15;
  unint64_t var0 = a5->var0;
  if (v14 < a5->var0 && v15 < a5->var1 && a5->var2)
  {
    float v18 = (float)var0 / (float)v14;
    unint64_t v14 = (unint64_t)(float)(v18 * (float)v14);
    unint64_t v16 = (unint64_t)(float)(v18 * (float)v15);
    uint64_t v19 = 24;
  }
  else
  {
    uint64_t v19 = 16;
  }
  uint64_t v53 = v19;
  if ((v14 > var0 || v16 > a5->var1) && a5->var2)
  {
    unint64_t var1 = a5->var1;
    if (v16 <= var1)
    {
      if (v14 <= var0)
      {
LABEL_17:
        if (v14 <= 8) {
          unint64_t v14 = 8;
        }
        if (v16 <= 0x10) {
          unint64_t v16 = 16;
        }
        goto LABEL_21;
      }
      float v24 = (float)var0;
      float v26 = (float)v14;
    }
    else
    {
      unint64_t v21 = [v10 height];
      unint64_t v22 = [v10 width];
      unint64_t v23 = [v10 height];
      float v24 = (float)var0;
      float v25 = (float)var1 / (float)v21;
      unint64_t v14 = (unint64_t)(float)(v25 * (float)v22);
      unint64_t v16 = (unint64_t)(float)(v25 * (float)v23);
      float v26 = (float)v14;
      if ((float)v14 <= (float)var0) {
        goto LABEL_17;
      }
    }
    float v27 = v24 / v26;
    unint64_t v14 = (unint64_t)(float)(v27 * v26);
    unint64_t v16 = (unint64_t)(float)(v27 * (float)v16);
    goto LABEL_17;
  }
LABEL_21:
  uint64_t v28 = objc_msgSend(v10, "pixelFormat", v53);
  uint64_t v29 = v28;
  if (v28 == 1)
  {
    uint64_t v29 = 10;
  }
  else if ((unint64_t)(v28 - 1) >= 0x7D)
  {
    if ((unint64_t)(v28 - 250) > 0xB) {
      uint64_t v29 = 90;
    }
    else {
      uint64_t v29 = qword_2557EF970[v28 - 250];
    }
  }
  v30 = MakeMTLTextureDescriptorFromTexture(v10);
  [v30 setPixelFormat:v29];
  [v30 setWidth:v14];
  [v30 setHeight:v16];
  [v30 setUsage:4];
  [v30 setStorageMode:0];
  uint64_t v31 = [(DYMTLTextureResize *)self device];
  v32 = (void *)[v31 newTextureWithDescriptor:v30];

  v33 = objc_opt_new();
  double v34 = [v33 colorAttachments];
  uint64_t v35 = [v34 objectAtIndexedSubscript:0];
  [v35 setTexture:v32];

  v36 = [v33 colorAttachments];
  uint64_t v37 = [v36 objectAtIndexedSubscript:0];
  [v37 setLoadAction:2];

  v38 = [v33 colorAttachments];
  uint64_t v39 = [v38 objectAtIndexedSubscript:0];
  [v39 setStoreAction:1];

  v40 = [(MTLRenderPipelineDescriptor *)self->_thumbnailPipelineDescriptor colorAttachments];
  v41 = [v40 objectAtIndexedSubscript:0];
  [v41 setPixelFormat:v29];

  id v42 = [(MTLRenderPipelineDescriptor *)self->_thumbnailPipelineDescriptor colorAttachments];
  objc_super v43 = [v42 objectAtIndexedSubscript:0];
  [v43 setBlendingEnabled:0];

  v44 = [(DYMTLTextureResize *)self generateFragmentFunctionForPixelFormat:v29 texture:v10];
  [(MTLRenderPipelineDescriptor *)self->_thumbnailPipelineDescriptor setFragmentFunction:v44];

  v45 = [(DYMTLTextureResize *)self device];
  thumbnailPipelineDescriptor = self->_thumbnailPipelineDescriptor;
  id v57 = 0;
  v47 = (MTLRenderPipelineState *)[v45 newRenderPipelineStateWithDescriptor:thumbnailPipelineDescriptor error:&v57];
  id v48 = v57;
  thumbnailPipeline = self->_thumbnailPipeline;
  self->_thumbnailPipeline = v47;

  if (self->_thumbnailPipeline)
  {
    v50 = [v11 renderCommandEncoderWithDescriptor:v33];
    v51 = v50;
    if (v12) {
      [v50 waitForFence:v12 beforeStages:2];
    }
    [v51 setRenderPipelineState:self->_thumbnailPipeline];
    [v51 setDepthStencilState:self->_thumbnailDepthStencilState];
    [v51 setFragmentSamplerState:*(Class *)((char *)&self->super.isa + v54) atIndex:0];
    [v51 setVertexBuffer:self->_quadPositions offset:0 atIndex:0];
    [v51 setVertexBuffer:self->_quadTexCoords offset:0 atIndex:1];
    v55[0] = 0;
    v55[1] = 0;
    *(double *)&v55[2] = (double)(unint64_t)[v32 width];
    *(double *)&v55[3] = (double)(unint64_t)[v32 height];
    long long v56 = xmmword_2557EF8B0;
    [v51 setViewport:v55];
    [v51 setFragmentTexture:v10 atIndex:0];
    [v51 drawIndexedPrimitives:3 indexCount:6 indexType:1 indexBuffer:self->_quadIndicies indexBufferOffset:0];
    [v51 endEncoding];
    id v13 = v32;
  }
  else
  {
    id v13 = 0;
  }

LABEL_33:
  return v13;
}

- (id)textureFromTexture:(id)a3 slice:(unint64_t)a4 level:(unint64_t)a5 depthPlane:(unint64_t)a6 commandBuffer:(id)a7
{
  id v11 = a3;
  id v12 = a7;
  if (![v11 width] || !objc_msgSend(v11, "height"))
  {
    v20 = 0;
    goto LABEL_27;
  }
  if ([v11 textureType] == 2
    && [v11 mipmapLevelCount] == 1
    && ([v11 usage] & 1) != 0
    && (objc_opt_respondsToSelector() & 1) != 0
    && ([v11 isSparse] & 1) == 0)
  {
    id v23 = v11;
    goto LABEL_34;
  }
  if (([v11 usage] & 1) != 0
    && [v11 textureType]
    && [v11 textureType] != 1
    && [v11 textureType] != 7
    && [v11 textureType] != 9
    && ((objc_opt_respondsToSelector() & 1) == 0 || ([v11 isSparse] & 1) != 0))
  {
    id v23 = (id)objc_msgSend(v11, "newTextureViewWithPixelFormat:textureType:levels:slices:", objc_msgSend(v11, "pixelFormat"), 2, a5, 1, a4, 1);
LABEL_34:
    v20 = v23;
    goto LABEL_27;
  }
  unint64_t v13 = [v11 width];
  unint64_t v14 = [v11 height];
  if (a5)
  {
    unint64_t v15 = a5;
    do
    {
      if (v13 <= 1) {
        unint64_t v13 = 1;
      }
      else {
        v13 >>= 1;
      }
      if (v14 <= 1) {
        unint64_t v14 = 1;
      }
      else {
        v14 >>= 1;
      }
      --v15;
    }
    while (v15);
  }
  unint64_t v16 = MakeMTLTextureDescriptorFromTexture(v11);
  [v16 setWidth:v13];
  [v16 setHeight:v14];
  [v16 setUsage:17];
  if ([v11 textureType] == 9)
  {
    uint64_t v17 = [(DYMTLTextureResize *)self device];
    unint64_t v18 = [v17 maxTextureWidth2D];

    if (v13 > v18)
    {
      [v16 setWidth:v18];
      unint64_t v13 = v18;
    }
  }
  uint64_t v19 = [(DYMTLTextureResize *)self device];
  v20 = (void *)[v19 newTextureWithDescriptor:v16];

  unint64_t v21 = [v12 blitCommandEncoder];
  v27[0] = 0;
  v27[1] = 0;
  v27[2] = a6;
  v26[0] = v13;
  v26[1] = v14;
  v26[2] = 1;
  memset(v25, 0, sizeof(v25));
  [v21 copyFromTexture:v11 sourceSlice:a4 sourceLevel:a5 sourceOrigin:v27 sourceSize:v26 toTexture:v20 destinationSlice:0 destinationLevel:0 destinationOrigin:v25];
  [v21 endEncoding];

LABEL_27:
  return v20;
}

- (id)_texture2DFromTexture:(id)a3 level:(unint64_t)a4 slice:(unint64_t)a5 depthPlane:(unint64_t)a6 commandBuffer:(id)a7
{
  id v12 = a3;
  id v13 = a7;
  unint64_t v14 = objc_opt_new();
  [v14 setTextureType:2];
  objc_msgSend(v14, "setPixelFormat:", objc_msgSend(v12, "pixelFormat"));
  unint64_t v15 = [v12 width];
  if (v15 >> a4 <= 1) {
    uint64_t v16 = 1;
  }
  else {
    uint64_t v16 = v15 >> a4;
  }
  [v14 setWidth:v16];
  unint64_t v17 = [v12 height];
  if (v17 >> a4 <= 1) {
    uint64_t v18 = 1;
  }
  else {
    uint64_t v18 = v17 >> a4;
  }
  [v14 setHeight:v18];
  objc_msgSend(v14, "setUsage:", objc_msgSend(v14, "usage") | 1);
  uint64_t v19 = [(DYMTLTextureResize *)self device];
  v20 = (void *)[v19 newTextureWithDescriptor:v14];

  if ([v12 textureType] == 4)
  {
    unint64_t v21 = [MEMORY[0x263F129A0] renderPassDescriptor];
    switch([v20 pixelFormat])
    {
      case 250:
      case 252:
        unint64_t v22 = [v21 depthAttachment];
        [v22 setTexture:v12];
        [v22 setLevel:a4];
        [v22 setSlice:a5];
        [v22 setDepthPlane:a6];
        [v22 setResolveTexture:v20];
        [v22 setLoadAction:1];
        [v22 setStoreAction:2];
        break;
      case 253:
        unint64_t v22 = [v21 stencilAttachment];
        [v22 setTexture:v12];
        [v22 setLevel:a4];
        [v22 setSlice:a5];
        [v22 setDepthPlane:a6];
        [v22 setResolveTexture:v20];
        [v22 setLoadAction:1];
        [v22 setStoreAction:2];
        break;
      case 260:
      case 261:
        unint64_t v22 = [v21 depthAttachment];
        [v22 setTexture:v12];
        [v22 setLevel:a4];
        [v22 setSlice:a5];
        [v22 setDepthPlane:a6];
        [v22 setResolveTexture:v20];
        [v22 setLoadAction:1];
        [v22 setStoreAction:2];
        id v23 = [v21 stencilAttachment];
        [v23 setTexture:v12];
        [v23 setLevel:a4];
        [v23 setSlice:a5];
        [v23 setDepthPlane:a6];
        [v23 setResolveTexture:v20];
        [v23 setLoadAction:1];
        [v23 setStoreAction:2];

        break;
      default:
        float v24 = [v21 colorAttachments];
        unint64_t v22 = [v24 objectAtIndexedSubscript:0];

        [v22 setTexture:v12];
        [v22 setLevel:a4];
        [v22 setSlice:a5];
        [v22 setDepthPlane:a6];
        [v22 setResolveTexture:v20];
        [v22 setLoadAction:1];
        [v22 setStoreAction:2];
        break;
    }

    float v25 = [v13 renderCommandEncoderWithDescriptor:v21];
    [v25 endEncoding];
  }
  else
  {
    unint64_t v21 = [v13 blitCommandEncoder];
    v29[0] = 0;
    v29[1] = 0;
    v29[2] = a6;
    v28[0] = [v20 width];
    v28[1] = [v20 height];
    v28[2] = 1;
    memset(v27, 0, sizeof(v27));
    [v21 copyFromTexture:v12 sourceSlice:a5 sourceLevel:a4 sourceOrigin:v29 sourceSize:v28 toTexture:v20 destinationSlice:0 destinationLevel:0 destinationOrigin:v27];
    [v21 endEncoding];
  }

  return v20;
}

- (void)resizeTexture:(id)a3 resolution:(id *)a4 level:(unint64_t)a5 slice:(unint64_t)a6 depthPlane:(unint64_t)a7 inBuffer:(id)a8 withType:(unsigned int)a9 completion:(id)a10
{
  id v16 = a3;
  id v17 = a8;
  id v53 = a10;
  if (v17)
  {
    [v16 width];
    [v16 height];
    if (!a4->var2) {
      goto LABEL_11;
    }
    v20 = a4;
    unint64_t var0 = a4->var0;
    unint64_t var1 = v20->var1;
    unint64_t v21 = [v16 height];
    unint64_t v22 = [v16 width];
    unint64_t v23 = [v16 height];
    float v24 = (float)var1 / (float)v21;
    unint64_t v25 = (unint64_t)(float)(v24 * (float)v22);
    if ((float)v25 > (float)var0)
    {
      unint64_t v26 = [v16 width];
      unint64_t v27 = [v16 width];
      unint64_t v23 = [v16 height];
      float v24 = (float)var0 / (float)v26;
      unint64_t v25 = (unint64_t)(float)(v24 * (float)v27);
    }
    if (v25 && (unint64_t)(float)(v24 * (float)v23) != 0)
    {
LABEL_11:
      uint64_t v29 = [v16 pixelFormat];
      uint64_t v30 = 55;
      uint64_t v31 = 90;
      if ((v29 & 0xFFFFFFFFFFFFFFFELL) == 0x104) {
        uint64_t v31 = 55;
      }
      if (v29 == 253) {
        uint64_t v31 = 10;
      }
      if (v29 == 252) {
        uint64_t v31 = 55;
      }
      if (v29 != 250) {
        uint64_t v30 = v31;
      }
      if ((unint64_t)(v29 - 1) >= 0x7D) {
        uint64_t v32 = v30;
      }
      else {
        uint64_t v32 = v29;
      }
      objc_msgSend(MEMORY[0x263F12A50], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", v32);
      v33 = (MTLTextureDescriptor *)objc_claimAutoreleasedReturnValue();
      thumbnailTextureDescriptor = self->_thumbnailTextureDescriptor;
      self->_thumbnailTextureDescriptor = v33;

      [(MTLTextureDescriptor *)self->_thumbnailTextureDescriptor setUsage:[(MTLTextureDescriptor *)self->_thumbnailTextureDescriptor usage] | 4];
      [(MTLTextureDescriptor *)self->_thumbnailTextureDescriptor setResourceOptions:32];
      [(MTLTextureDescriptor *)self->_thumbnailTextureDescriptor setStorageMode:0];
      uint64_t v35 = [(DYMTLTextureResize *)self device];
      v36 = (void *)[v35 newTextureWithDescriptor:self->_thumbnailTextureDescriptor];

      uint64_t v37 = [(MTLRenderPassDescriptor *)self->_thumbnailRenderPass colorAttachments];
      v38 = [v37 objectAtIndexedSubscript:0];
      [v38 setTexture:v36];

      id v39 = v16;
      if ([v39 textureType] != 2 || (objc_msgSend(v39, "usage") & 1) == 0)
      {
        uint64_t v40 = [(DYMTLTextureResize *)self _texture2DFromTexture:v39 level:a5 slice:a6 depthPlane:a7 commandBuffer:v17];

        id v39 = (id)v40;
      }
      v41 = [(MTLRenderPipelineDescriptor *)self->_thumbnailPipelineDescriptor colorAttachments];
      id v42 = [v41 objectAtIndexedSubscript:0];
      [v42 setPixelFormat:v52];

      objc_super v43 = [(MTLRenderPipelineDescriptor *)self->_thumbnailPipelineDescriptor colorAttachments];
      v44 = [v43 objectAtIndexedSubscript:0];
      [v44 setBlendingEnabled:0];

      switch(a9)
      {
        case 1u:
          uint64_t v45 = 56;
          break;
        case 2u:
          uint64_t v45 = 64;
          break;
        case 4u:
          uint64_t v45 = 72;
          break;
        default:
LABEL_32:
          v46 = [(DYMTLTextureResize *)self device];
          thumbnailPipelineDescriptor = self->_thumbnailPipelineDescriptor;
          id v60 = 0;
          id v48 = (MTLRenderPipelineState *)[v46 newRenderPipelineStateWithDescriptor:thumbnailPipelineDescriptor error:&v60];
          id v49 = v60;
          thumbnailPipeline = self->_thumbnailPipeline;
          self->_thumbnailPipeline = v48;

          if (self->_thumbnailPipeline)
          {
            v51 = [v17 renderCommandEncoderWithDescriptor:self->_thumbnailRenderPass];
            [v51 setRenderPipelineState:self->_thumbnailPipeline];
            [v51 setDepthStencilState:self->_thumbnailDepthStencilState];
            [v51 setFragmentSamplerState:self->_downscaleSampler atIndex:0];
            [v51 setVertexBuffer:self->_quadPositions offset:0 atIndex:0];
            [v51 setVertexBuffer:self->_quadTexCoords offset:0 atIndex:1];
            v58[0] = 0;
            v58[1] = 0;
            *(double *)&v58[2] = (double)(unint64_t)[v36 width];
            *(double *)&v58[3] = (double)(unint64_t)[v36 height];
            long long v59 = xmmword_2557EF8B0;
            [v51 setViewport:v58];
            [v51 setFragmentTexture:v39 atIndex:0];
            [v51 drawIndexedPrimitives:3 indexCount:6 indexType:1 indexBuffer:self->_quadIndicies indexBufferOffset:0];
            [v51 endEncoding];
            v54[0] = MEMORY[0x263EF8330];
            v54[1] = 3221225472;
            v54[2] = __99__DYMTLTextureResize_resizeTexture_resolution_level_slice_depthPlane_inBuffer_withType_completion___block_invoke;
            v54[3] = &unk_2653C2CE0;
            id v56 = v53;
            id v55 = v36;
            uint64_t v57 = v52;
            [v17 addCompletedHandler:v54];
          }
          goto LABEL_35;
      }
      [(MTLRenderPipelineDescriptor *)self->_thumbnailPipelineDescriptor setFragmentFunction:*(Class *)((char *)&self->super.isa + v45)];
      goto LABEL_32;
    }
  }
LABEL_35:
}

uint64_t __99__DYMTLTextureResize_resizeTexture_resolution_level_slice_depthPlane_inBuffer_withType_completion___block_invoke(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[5] + 16))(a1[5], a1[4], a1[6]);
}

+ (id)forDevice:(id)a3
{
  id v3 = a3;
  if (+[DYMTLTextureResize forDevice:]::onceToken != -1) {
    dispatch_once(&+[DYMTLTextureResize forDevice:]::onceToken, &__block_literal_global);
  }
  v4 = [(id)sDeviceThumbnailGenerator objectForKey:v3];
  if (!v4)
  {
    v4 = [[DYMTLTextureResize alloc] initWithDevice:v3];
    [(id)sDeviceThumbnailGenerator setObject:v4 forKey:v3];
  }

  return v4;
}

uint64_t __32__DYMTLTextureResize_forDevice___block_invoke()
{
  sDeviceThumbnailGenerator = [MEMORY[0x263F08968] weakToStrongObjectsMapTable];
  return MEMORY[0x270F9A758]();
}

- (MTLDevice)device
{
  return (MTLDevice *)objc_getProperty(self, a2, 136, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_fragmentFunctionForPixelFormatCache, 0);
  objc_storeStrong((id *)&self->_thumbnailDictionary, 0);
  objc_storeStrong((id *)&self->_thumbnailRenderPass, 0);
  objc_storeStrong((id *)&self->_thumbnailTextureDescriptor, 0);
  objc_storeStrong((id *)&self->_thumbnailPipelineDescriptor, 0);
  objc_storeStrong((id *)&self->_thumbnailPipeline, 0);
  objc_storeStrong((id *)&self->_thumbnailStencilFragment, 0);
  objc_storeStrong((id *)&self->_thumbnailDepthFragment, 0);
  objc_storeStrong((id *)&self->_thumbnailColorFragment, 0);
  objc_storeStrong((id *)&self->_quadIndicies, 0);
  objc_storeStrong((id *)&self->_quadTexCoords, 0);
  objc_storeStrong((id *)&self->_quadPositions, 0);
  objc_storeStrong((id *)&self->_upscaleSampler, 0);
  objc_storeStrong((id *)&self->_downscaleSampler, 0);
  objc_storeStrong((id *)&self->_thumbnailDepthStencilState, 0);
}

@end