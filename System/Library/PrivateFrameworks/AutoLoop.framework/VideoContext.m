@interface VideoContext
- (BOOL)colorManagement;
- (BOOL)pixelBuffer:(__CVBuffer *)a3 conformsToImage:(id)a4;
- (CIContext)ciCtx;
- (NSDictionary)pixelAttrs;
- (VideoContext)initWithWriter:(id)a3 pixelFormatFlags:(unsigned int)a4;
- (VideoContext)initWithWriter:(id)a3 pixelFormatFlags:(unsigned int)a4 colorManagement:(BOOL)a5;
- (VideoWriter)writer;
- (__CVBuffer)createPixelBuffer;
- (__CVBuffer)createPixelBuffer:(unint64_t)a3 height:(unint64_t)a4;
- (__CVBuffer)pixelBufferFromImage:(id)a3;
- (__CVBuffer)pixelBufferFromImage:(id)a3 withAttachFrom:(__CVBuffer *)a4;
- (int)appendFrame:(id)a3 frameTime:(id *)a4 srcPixBuf:(__CVBuffer *)a5;
- (unsigned)pixelFormat;
- (unsigned)pixelFormatFlags;
- (void)setColorManagement:(BOOL)a3;
@end

@implementation VideoContext

- (VideoContext)initWithWriter:(id)a3 pixelFormatFlags:(unsigned int)a4 colorManagement:(BOOL)a5
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  v18.receiver = self;
  v18.super_class = (Class)VideoContext;
  v10 = [(VideoContext *)&v18 init];
  if (v10)
  {
    id v11 = objc_alloc(MEMORY[0x1E4F1CA60]);
    uint64_t v19 = *MEMORY[0x1E4F1E1E0];
    v20[0] = MEMORY[0x1E4F1CC28];
    v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:&v19 count:1];
    v13 = (void *)[v11 initWithDictionary:v12];

    if (!a5)
    {
      v14 = [MEMORY[0x1E4F1CA98] null];
      [v13 setObject:v14 forKeyedSubscript:*MEMORY[0x1E4F1E240]];
    }
    uint64_t v15 = [MEMORY[0x1E4F1E018] contextWithOptions:v13];
    ciCtx = v10->ciCtx;
    v10->ciCtx = (CIContext *)v15;

    objc_storeStrong((id *)&v10->writer, a3);
    v10->pixelFormatFlags = a4;
    v10->_colorManagement = a5;
  }
  return v10;
}

- (VideoContext)initWithWriter:(id)a3 pixelFormatFlags:(unsigned int)a4
{
  return [(VideoContext *)self initWithWriter:a3 pixelFormatFlags:*(void *)&a4 colorManagement:0];
}

- (__CVBuffer)createPixelBuffer:(unint64_t)a3 height:(unint64_t)a4
{
  writer = self->writer;
  if (!writer)
  {
    pixelAttrs = self->pixelAttrs;
    if (pixelAttrs)
    {
      unsigned int pixelFormat = self->pixelFormat;
    }
    else
    {
      sub_1DD3D9ABC(self->pixelFormatFlags, 0);
      v10 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
      id v11 = self->pixelAttrs;
      self->pixelAttrs = v10;

      if (!self->pixelAttrs)
      {
        NSLog(&cfstr_Createpixelbuf.isa);
        return 0;
      }
      unsigned int pixelFormat = sub_1DD3DA90C(self->pixelFormatFlags);
      self->unsigned int pixelFormat = pixelFormat;
      pixelAttrs = self->pixelAttrs;
    }
    CVPixelBufferRef pixelBufferOut = 0;
    uint64_t v12 = CVPixelBufferCreate(0, a3, a4, pixelFormat, (CFDictionaryRef)pixelAttrs, &pixelBufferOut);
    if (!v12) {
      return pixelBufferOut;
    }
    NSLog(&cfstr_Cvpixelbufferc.isa, v12);
    return 0;
  }

  return (__CVBuffer *)MEMORY[0x1F4181798](writer, sel_createPixelBuffer);
}

- (__CVBuffer)createPixelBuffer
{
  writer = self->writer;
  if (writer)
  {
    return (__CVBuffer *)MEMORY[0x1F4181798](writer, sel_createPixelBuffer);
  }
  else
  {
    NSLog(&cfstr_VideocontextEr.isa, a2);
    return 0;
  }
}

- (__CVBuffer)pixelBufferFromImage:(id)a3 withAttachFrom:(__CVBuffer *)a4
{
  id v6 = a3;
  [v6 extent];
  id v9 = [(VideoContext *)self createPixelBuffer:(unint64_t)v7 height:(unint64_t)v8];
  if (v9)
  {
    if (a4) {
      CVBufferPropagateAttachments(a4, v9);
    }
    [(CIContext *)self->ciCtx render:v6 toCVPixelBuffer:v9];
  }
  else
  {
    NSLog(&cfstr_ErrorObtaining_1.isa);
  }

  return v9;
}

- (__CVBuffer)pixelBufferFromImage:(id)a3
{
  return [(VideoContext *)self pixelBufferFromImage:a3 withAttachFrom:0];
}

- (BOOL)pixelBuffer:(__CVBuffer *)a3 conformsToImage:(id)a4
{
  id v5 = a4;
  if (CVPixelBufferIsPlanar(a3))
  {
    size_t WidthOfPlane = CVPixelBufferGetWidthOfPlane(a3, 0);
    size_t HeightOfPlane = CVPixelBufferGetHeightOfPlane(a3, 0);
  }
  else
  {
    size_t WidthOfPlane = CVPixelBufferGetWidth(a3);
    size_t HeightOfPlane = CVPixelBufferGetHeight(a3);
  }
  unint64_t v8 = HeightOfPlane;
  [v5 extent];
  if (v9 == (double)WidthOfPlane)
  {
    [v5 extent];
    BOOL v11 = v10 == (double)v8;
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (int)appendFrame:(id)a3 frameTime:(id *)a4 srcPixBuf:(__CVBuffer *)a5
{
  id v8 = a3;
  if (self->_colorManagement) {
    double v9 = [(VideoContext *)self pixelBufferFromImage:v8 withAttachFrom:a5];
  }
  else {
    double v9 = [(VideoContext *)self pixelBufferFromImage:v8];
  }
  double v10 = v9;
  if (v9)
  {
    if (a5 && !self->_colorManagement) {
      CVBufferPropagateAttachments(a5, v9);
    }
    writer = self->writer;
    long long v16 = *(_OWORD *)&a4->var0;
    int64_t var3 = a4->var3;
    uint64_t v12 = [(VideoWriter *)writer addFrameAsPixelBuf:v10 atFrameTime:&v16];
    v13 = (void *)v12;
    if (v12)
    {
      NSLog(&cfstr_VideocontextAp_0.isa, v12);
      int v14 = -1;
    }
    else
    {
      int v14 = 0;
    }
    CFRelease(v10);
  }
  else
  {
    NSLog(&cfstr_VideocontextAp.isa);
    int v14 = -1;
  }

  return v14;
}

- (CIContext)ciCtx
{
  return (CIContext *)objc_getProperty(self, a2, 24, 1);
}

- (VideoWriter)writer
{
  return (VideoWriter *)objc_getProperty(self, a2, 32, 1);
}

- (unsigned)pixelFormatFlags
{
  return self->pixelFormatFlags;
}

- (NSDictionary)pixelAttrs
{
  return (NSDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (unsigned)pixelFormat
{
  return self->pixelFormat;
}

- (BOOL)colorManagement
{
  return self->_colorManagement;
}

- (void)setColorManagement:(BOOL)a3
{
  self->_colorManagement = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->pixelAttrs, 0);
  objc_storeStrong((id *)&self->writer, 0);

  objc_storeStrong((id *)&self->ciCtx, 0);
}

@end