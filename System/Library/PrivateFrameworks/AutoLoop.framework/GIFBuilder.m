@interface GIFBuilder
+ (id)builderWithContext:(id)a3 forURL:(id)a4 maxRes:(unint64_t)a5 fps:(float)a6;
- (BOOL)addImage:(id)a3;
- (BOOL)finish;
- (CGImageDestination)imgDest;
- (CIContext)ciCtx;
- (GIFBuilder)initWithContext:(id)a3 forURL:(id)a4 maxRes:(unint64_t)a5 fps:(float)a6;
- (NSDictionary)frameProperties;
- (double)maxRes;
- (void)dealloc;
- (void)setCiCtx:(id)a3;
- (void)setFrameProperties:(id)a3;
- (void)setImgDest:(CGImageDestination *)a3;
- (void)setMaxRes:(double)a3;
@end

@implementation GIFBuilder

+ (id)builderWithContext:(id)a3 forURL:(id)a4 maxRes:(unint64_t)a5 fps:(float)a6
{
  id v9 = a4;
  id v10 = a3;
  v11 = [GIFBuilder alloc];
  *(float *)&double v12 = a6;
  v13 = [(GIFBuilder *)v11 initWithContext:v10 forURL:v9 maxRes:a5 fps:v12];

  return v13;
}

- (GIFBuilder)initWithContext:(id)a3 forURL:(id)a4 maxRes:(unint64_t)a5 fps:(float)a6
{
  v33[1] = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  CFURLRef v12 = (const __CFURL *)a4;
  CFURLRef v13 = v12;
  if (!v11)
  {
    NSLog(&cfstr_GifbuilderNilC.isa);
LABEL_7:
    v24 = 0;
    goto LABEL_10;
  }
  if (!v12)
  {
    NSLog(&cfstr_GifbuilderNilG.isa);
    goto LABEL_7;
  }
  objc_storeStrong((id *)&self->_ciCtx, a3);
  self->_maxRes = (double)a5;
  uint64_t v14 = *MEMORY[0x1E4F2F990];
  uint64_t v32 = *MEMORY[0x1E4F2F990];
  uint64_t v15 = *MEMORY[0x1E4F2F998];
  v30[0] = *MEMORY[0x1E4F2F9A0];
  v30[1] = v15;
  v31[0] = &unk_1F3899A70;
  v31[1] = MEMORY[0x1E4F1CC28];
  v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:v30 count:2];
  v33[0] = v16;
  CFDictionaryRef v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v33 forKeys:&v32 count:1];

  v18 = CGImageDestinationCreateWithURL(v13, (CFStringRef)*MEMORY[0x1E4F225D8], 0, 0);
  self->_imgDest = v18;
  if (v18)
  {
    CGImageDestinationSetProperties(v18, v17);
    uint64_t v28 = v14;
    uint64_t v26 = *MEMORY[0x1E4F2F988];
    *(float *)&double v19 = 1.0 / a6;
    v20 = [NSNumber numberWithFloat:v19];
    v27 = v20;
    v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v27 forKeys:&v26 count:1];
    v29 = v21;
    v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v29 forKeys:&v28 count:1];
    frameProperties = self->_frameProperties;
    self->_frameProperties = v22;

    v24 = self;
  }
  else
  {
    NSLog(&cfstr_GifbuilderCgim.isa);
    v24 = 0;
  }

LABEL_10:
  return v24;
}

- (void)dealloc
{
  imgDest = self->_imgDest;
  if (imgDest) {
    CFRelease(imgDest);
  }
  v4.receiver = self;
  v4.super_class = (Class)GIFBuilder;
  [(GIFBuilder *)&v4 dealloc];
}

- (BOOL)addImage:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    [v4 extent];
    double v7 = v6;
    [v5 extent];
    double maxRes = self->_maxRes;
    double v10 = v7 / v8;
    if (v7 <= v8)
    {
      if (v8 >= maxRes) {
        double v13 = self->_maxRes;
      }
      else {
        double v13 = v8;
      }
      float v15 = v10 * v13;
      double v11 = roundf(v15);
    }
    else
    {
      if (v7 >= maxRes) {
        double v11 = self->_maxRes;
      }
      else {
        double v11 = v7;
      }
      float v12 = v11 / v10;
      double v13 = roundf(v12);
    }
    double v16 = v13 / v8;
    CFDictionaryRef v17 = [MEMORY[0x1E4F1E040] filterWithName:@"CILanczosScaleTransform"];
    [v17 setDefaults];
    [v17 setValue:v5 forKey:*MEMORY[0x1E4F1E480]];
    v18 = [NSNumber numberWithDouble:v16];
    [v17 setValue:v18 forKey:*MEMORY[0x1E4F1E4F0]];
    double v19 = [v17 outputImage];
    v20 = -[CIContext createCGImage:fromRect:](self->_ciCtx, "createCGImage:fromRect:", v19, 0.0, 0.0, v11, v13);
    BOOL v14 = v20 != 0;
    if (v20)
    {
      v21 = v20;
      CGImageDestinationAddImage(self->_imgDest, v20, (CFDictionaryRef)self->_frameProperties);
      CGImageRelease(v21);
    }
    else
    {
      NSLog(&cfstr_GifbuilderAddi_0.isa);
    }
  }
  else
  {
    NSLog(&cfstr_GifbuilderAddi.isa);
    BOOL v14 = 0;
  }

  return v14;
}

- (BOOL)finish
{
  BOOL v2 = CGImageDestinationFinalize(self->_imgDest);
  if (!v2) {
    NSLog(&cfstr_GifbuilderFini.isa);
  }
  return v2;
}

- (CIContext)ciCtx
{
  return (CIContext *)objc_getProperty(self, a2, 8, 1);
}

- (void)setCiCtx:(id)a3
{
}

- (NSDictionary)frameProperties
{
  return (NSDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void)setFrameProperties:(id)a3
{
}

- (CGImageDestination)imgDest
{
  return self->_imgDest;
}

- (void)setImgDest:(CGImageDestination *)a3
{
  self->_imgDest = a3;
}

- (double)maxRes
{
  return self->_maxRes;
}

- (void)setMaxRes:(double)a3
{
  self->_double maxRes = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_frameProperties, 0);

  objc_storeStrong((id *)&self->_ciCtx, 0);
}

@end