@interface SpatialResampler
- (SpatialResampler)initWithDevice:(id)a3;
- (id)getComputePipeLineStateForShader:(id)a3;
- (void)createKernels;
- (void)encodeSpatialResampleHorizontal:(id)a3 Input:(id)a4 Output:(id)a5;
- (void)encodeSpatialResampleVertical:(id)a3 Input:(id)a4 Output:(id)a5 isChroma:(BOOL)a6;
- (void)encodeToCommandBuffer:(id)a3 input:(__IOSurface *)a4 output:(__IOSurface *)a5;
- (void)setupTextures:(id)a3 input:(__IOSurface *)a4 output:(__IOSurface *)a5;
@end

@implementation SpatialResampler

- (SpatialResampler)initWithDevice:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SpatialResampler;
  v6 = [(SpatialResampler *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_device, a3);
    [(SpatialResampler *)v7 createKernels];
  }

  return v7;
}

- (id)getComputePipeLineStateForShader:(id)a3
{
  return (id)[a3 getComputePipeLineStateForDevice:self->_device Library:self->_defaultLibrary];
}

- (void)createKernels
{
  id v13 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.HDRProcessing"];
  v3 = [v13 pathForResource:@"default.metallib" ofType:0];
  device = self->_device;
  if (v3) {
    id v5 = (MTLLibrary *)[(MTLDeviceSPI *)device newLibraryWithFile:v3 error:0];
  }
  else {
    id v5 = (MTLLibrary *)[(MTLDeviceSPI *)device newDefaultLibrary];
  }
  defaultLibrary = self->_defaultLibrary;
  self->_defaultLibrary = v5;

  v7 = +[ResamplerShader createShaderWithName:@"spatial_resampling_vertical_luma"];
  verticalResampleKernel = self->_verticalResampleKernel;
  self->_verticalResampleKernel = v7;

  objc_super v9 = +[ResamplerShader createShaderWithName:@"spatial_resampling_vertical_chroma"];
  verticalResampleChromaKernel = self->_verticalResampleChromaKernel;
  self->_verticalResampleChromaKernel = v9;

  v11 = +[ResamplerShader createShaderWithName:@"spatial_resampling_horizontal"];
  horizontalResampleKernel = self->_horizontalResampleKernel;
  self->_horizontalResampleKernel = v11;
}

- (void)setupTextures:(id)a3 input:(__IOSurface *)a4 output:(__IOSurface *)a5
{
  id v7 = a3;
  size_t WidthOfPlane = IOSurfaceGetWidthOfPlane(a4, 0);
  size_t HeightOfPlane = IOSurfaceGetHeightOfPlane(a4, 0);
  id v22 = [MEMORY[0x263F12A50] texture2DDescriptorWithPixelFormat:70 width:WidthOfPlane >> 2 height:HeightOfPlane mipmapped:0];
  v10 = [MEMORY[0x263F12A50] texture2DDescriptorWithPixelFormat:70 width:WidthOfPlane >> 2 height:HeightOfPlane >> 1 mipmapped:0];
  v11 = (void *)[(MTLDeviceSPI *)self->_device newTextureWithDescriptor:v22 iosurface:a4 plane:0];
  [v7 setInputTexture:v11];

  v12 = (void *)[(MTLDeviceSPI *)self->_device newTextureWithDescriptor:v10 iosurface:a4 plane:1];
  [v7 setInputTexureUV:v12];

  id v13 = [MEMORY[0x263F12A50] texture2DDescriptorWithPixelFormat:10 width:WidthOfPlane height:2 * HeightOfPlane mipmapped:0];
  v14 = [MEMORY[0x263F12A50] texture2DDescriptorWithPixelFormat:30 width:WidthOfPlane >> 1 height:HeightOfPlane mipmapped:0];
  [v13 setUsage:3];
  [v14 setUsage:3];
  v15 = (void *)[(MTLDeviceSPI *)self->_device newTextureWithDescriptor:v13];
  [v7 setTempTextureY:v15];

  v16 = (void *)[(MTLDeviceSPI *)self->_device newTextureWithDescriptor:v14];
  [v7 setTempTextureUV:v16];

  v17 = [MEMORY[0x263F12A50] texture2DDescriptorWithPixelFormat:10 width:2 * WidthOfPlane height:2 * HeightOfPlane mipmapped:0];
  v18 = [MEMORY[0x263F12A50] texture2DDescriptorWithPixelFormat:30 width:WidthOfPlane height:HeightOfPlane mipmapped:0];
  [v17 setUsage:3];
  [v18 setUsage:3];
  v19 = (void *)[(MTLDeviceSPI *)self->_device newTextureWithDescriptor:v17 iosurface:a5 plane:0];
  [v7 setOutputTextureY:v19];

  v20 = (void *)[(MTLDeviceSPI *)self->_device newTextureWithDescriptor:v18 iosurface:a5 plane:1];
  [v7 setOutputTextureUV:v20];
}

- (void)encodeToCommandBuffer:(id)a3 input:(__IOSurface *)a4 output:(__IOSurface *)a5
{
  id v8 = a3;
  v21 = objc_alloc_init(ResamplerTextures);
  [(SpatialResampler *)self setupTextures:v21 input:a4 output:a5];
  objc_super v9 = [v8 computeCommandEncoder];
  v10 = [(ResamplerTextures *)v21 inputTexture];
  v11 = [(ResamplerTextures *)v21 tempTextureY];
  [(SpatialResampler *)self encodeSpatialResampleVertical:v9 Input:v10 Output:v11 isChroma:0];

  v12 = [v8 computeCommandEncoder];
  id v13 = [(ResamplerTextures *)v21 tempTextureY];
  v14 = [(ResamplerTextures *)v21 outputTextureY];
  [(SpatialResampler *)self encodeSpatialResampleHorizontal:v12 Input:v13 Output:v14];

  v15 = [v8 computeCommandEncoder];
  v16 = [(ResamplerTextures *)v21 inputTexureUV];
  v17 = [(ResamplerTextures *)v21 tempTextureUV];
  [(SpatialResampler *)self encodeSpatialResampleVertical:v15 Input:v16 Output:v17 isChroma:1];

  v18 = [v8 computeCommandEncoder];

  v19 = [(ResamplerTextures *)v21 tempTextureUV];
  v20 = [(ResamplerTextures *)v21 outputTextureUV];
  [(SpatialResampler *)self encodeSpatialResampleHorizontal:v18 Input:v19 Output:v20];
}

- (void)encodeSpatialResampleVertical:(id)a3 Input:(id)a4 Output:(id)a5 isChroma:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = [v11 width];
  uint64_t v14 = [v11 height];
  uint64_t v15 = 24;
  if (v6) {
    uint64_t v15 = 32;
  }
  v16 = [(SpatialResampler *)self getComputePipeLineStateForShader:*(Class *)((char *)&self->super.isa + v15)];
  if (v16)
  {
    [v10 setComputePipelineState:v16];
    [v10 setTexture:v11 atIndex:0];
    [v10 setTexture:v12 atIndex:1];
    *(void *)&long long buf = (unint64_t)(v13 + 15) >> 4;
    *((void *)&buf + 1) = (unint64_t)(v14 + 15) >> 4;
    uint64_t v21 = 1;
    int64x2_t v18 = vdupq_n_s64(0x10uLL);
    uint64_t v19 = 1;
    [v10 dispatchThreadgroups:&buf threadsPerThreadgroup:&v18];
    [v10 endEncoding];
  }
  else if (enableLogInstance)
  {
    if (logInstanceID) {
      uint64_t v17 = logInstanceID;
    }
    else {
      uint64_t v17 = prevLogInstanceID;
    }
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 134217984;
      *(void *)((char *)&buf + 4) = WORD1(v17);
      _os_log_impl(&dword_22224D000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.419.54] #%04llx Assertion: \"0\" warned in \"/Library/Caches/com.apple.xbs/Sources/HDRProcessing/Metal/Composer/SpatialResampler.m\" at line 211\n", (uint8_t *)&buf, 0xCu);
    }
    prevLogInstanceID = v17;
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf) = 0;
    _os_log_impl(&dword_22224D000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.419.54] Assertion: \"0\" warned in \"/Library/Caches/com.apple.xbs/Sources/HDRProcessing/Metal/Composer/SpatialResampler.m\" at line 211\n", (uint8_t *)&buf, 2u);
  }
}

- (void)encodeSpatialResampleHorizontal:(id)a3 Input:(id)a4 Output:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [v9 width];
  uint64_t v12 = [v9 height];
  uint64_t v13 = [(SpatialResampler *)self getComputePipeLineStateForShader:self->_horizontalResampleKernel];
  if (v13)
  {
    [v8 setComputePipelineState:v13];
    [v8 setTexture:v9 atIndex:0];
    [v8 setTexture:v10 atIndex:1];
    v16[0] = (unint64_t)(v11 + 15) >> 4;
    v16[1] = (unint64_t)(v12 + 15) >> 4;
    v16[2] = 1;
    int64x2_t v14 = vdupq_n_s64(0x10uLL);
    uint64_t v15 = 1;
    [v8 dispatchThreadgroups:v16 threadsPerThreadgroup:&v14];
    [v8 endEncoding];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_horizontalResampleKernel, 0);
  objc_storeStrong((id *)&self->_verticalResampleChromaKernel, 0);
  objc_storeStrong((id *)&self->_verticalResampleKernel, 0);
  objc_storeStrong((id *)&self->_defaultLibrary, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

@end