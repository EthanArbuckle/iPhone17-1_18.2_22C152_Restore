@interface VCPPreAnalysisImageLoader
- (VCPPreAnalysisImageLoader)initWithMonochromeBufferCreator:(id)a3;
- (id).cxx_construct;
- (int)_convertFromBuffer:(__CVBuffer *)a3 toLumaPixelBuffer:(__CVBuffer *)a4 abnormalDimension:(unint64_t)a5;
- (int)_createPixelBufferWithWidth:(unint64_t)a3 height:(unint64_t)a4 pixelFormat:(int)a5 pixelBuffer:(__CVBuffer *)a6;
- (int)loadImageURL:(id)a3 abnormalDimension:(unint64_t)a4 withNonPanoPreWarmSizes:(id)a5 toColorPixelBuffer:(__CVBuffer *)a6 lumaPixelBuffer:(__CVBuffer *)a7 andImage:(id *)a8;
@end

@implementation VCPPreAnalysisImageLoader

- (VCPPreAnalysisImageLoader)initWithMonochromeBufferCreator:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)VCPPreAnalysisImageLoader;
  v6 = [(VCPPreAnalysisImageLoader *)&v10 init];
  if (v6)
  {
    uint64_t v7 = +[VCPSceneProcessingImageManager imageManager];
    imageManager = v6->_imageManager;
    v6->_imageManager = (VCPSceneProcessingImageManager *)v7;

    objc_storeStrong((id *)&v6->_monochromeBufferCreator, a3);
  }

  return v6;
}

- (int)_createPixelBufferWithWidth:(unint64_t)a3 height:(unint64_t)a4 pixelFormat:(int)a5 pixelBuffer:(__CVBuffer *)a6
{
  v6 = a6;
  v13[1] = *MEMORY[0x1E4F143B8];
  *a6 = 0;
  uint64_t v12 = *MEMORY[0x1E4F24D20];
  v13[0] = MEMORY[0x1E4F1CC08];
  CFDictionaryRef v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
  LODWORD(v6) = CVPixelBufferCreate(0, a3, a4, a5, v10, v6);

  return (int)v6;
}

- (int)_convertFromBuffer:(__CVBuffer *)a3 toLumaPixelBuffer:(__CVBuffer *)a4 abnormalDimension:(unint64_t)a5
{
  *a4 = 0;
  CFTypeRef cf = 0;
  v8 = self;
  objc_sync_enter(v8);
  if (a5)
  {
    size_t Width = CVPixelBufferGetWidth(a3);
    OSStatus v10 = [(VCPPreAnalysisImageLoader *)v8 _createPixelBufferWithWidth:Width height:CVPixelBufferGetHeight(a3) pixelFormat:1278226488 pixelBuffer:&cf];
  }
  else
  {
    OSStatus v10 = [(VCPPoolBasedPixelBufferCreator *)v8->_monochromeBufferCreator createPixelBuffer:&cf];
  }
  OSStatus v11 = v10;
  if (v10) {
    goto LABEL_11;
  }
  value = v8->_transferSession.value_;
  if (!value)
  {
    OSStatus v11 = VTPixelTransferSessionCreate(0, &v8->_transferSession.value_);
    if (v11) {
      goto LABEL_11;
    }
    value = v8->_transferSession.value_;
  }
  OSStatus v11 = VTPixelTransferSessionTransferImage(value, a3, (CVPixelBufferRef)cf);
  if (v11)
  {
LABEL_11:
    objc_sync_exit(v8);
    goto LABEL_12;
  }
  v13 = (__CVBuffer *)cf;
  if (cf) {
    v13 = (__CVBuffer *)CFRetain(cf);
  }
  *a4 = v13;
  objc_sync_exit(v8);
  OSStatus v11 = 0;
LABEL_12:

  CF<opaqueCMSampleBuffer *>::~CF(&cf);
  return v11;
}

- (int)loadImageURL:(id)a3 abnormalDimension:(unint64_t)a4 withNonPanoPreWarmSizes:(id)a5 toColorPixelBuffer:(__CVBuffer *)a6 lumaPixelBuffer:(__CVBuffer *)a7 andImage:(id *)a8
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v14 = a5;
  CVPixelBufferRef pixelBuffer = 0;
  int v15 = [(VCPSceneProcessingImageManager *)self->_imageManager loadFullPixelBuffer:&pixelBuffer scaledPixelBuffer299:0 scaledPixelBuffer360:0 fromImageURL:a3 abnormalDimension:a4];
  if (v15) {
    goto LABEL_2;
  }
  v37 = a6;
  v38 = self;
  v39 = a7;
  id v40 = v14;
  v17 = [VCPPreAnalysisImage alloc];
  *a8 = [(VCPPreAnalysisImage *)v17 initWithPixelBuffer:pixelBuffer];
  uint64_t v18 = 299;
  if (!a4)
  {
    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    id v26 = v14;
    uint64_t v27 = [v26 countByEnumeratingWithState:&v42 objects:v47 count:16];
    if (v27)
    {
      uint64_t v28 = *(void *)v43;
      while (2)
      {
        for (uint64_t i = 0; i != v27; ++i)
        {
          if (*(void *)v43 != v28) {
            objc_enumerationMutation(v26);
          }
          v30 = *(void **)(*((void *)&v42 + 1) + 8 * i);
          v31 = (void *)MEMORY[0x1C186D320]();
          id v32 = *a8;
          [v30 sizeValue];
          double v34 = v33;
          [v30 sizeValue];
          int v15 = [v32 preWarmWidth:(unint64_t)v34 andHeight:(unint64_t)v35];
          if (v15)
          {

            id v14 = v40;
            goto LABEL_2;
          }
        }
        uint64_t v27 = [v26 countByEnumeratingWithState:&v42 objects:v47 count:16];
        if (v27) {
          continue;
        }
        break;
      }
    }

    uint64_t v25 = 299;
    a7 = v39;
    id v14 = v40;
    v21 = v37;
    self = v38;
    goto LABEL_22;
  }
  size_t Width = CVPixelBufferGetWidth(pixelBuffer);
  size_t Height = CVPixelBufferGetHeight(pixelBuffer);
  v21 = v37;
  BOOL v22 = Width > Height;
  size_t v23 = Height / Width;
  if (Width > Height) {
    size_t v23 = Width / Height;
  }
  uint64_t v24 = 299 * v23;
  if (Width <= Height) {
    uint64_t v25 = 299;
  }
  else {
    uint64_t v25 = v24;
  }
  if (!v22) {
    uint64_t v18 = v24;
  }
  int v15 = [*a8 preWarmWidth:v25 andHeight:v18];
  if (!v15)
  {
LABEL_22:
    v41 = 0;
    [*a8 pixelBuffer:&v41 width:v25 height:v18];
    v36 = pixelBuffer;
    if (pixelBuffer) {
      v36 = (__CVBuffer *)CFRetain(pixelBuffer);
    }
    *v21 = v36;
    int v15 = [(VCPPreAnalysisImageLoader *)self _convertFromBuffer:v41 toLumaPixelBuffer:a7 abnormalDimension:a4];
    CF<opaqueCMSampleBuffer *>::~CF(&v41);
  }
LABEL_2:
  CF<opaqueCMSampleBuffer *>::~CF((const void **)&pixelBuffer);

  return v15;
}

- (void).cxx_destruct
{
  CF<opaqueCMSampleBuffer *>::~CF((const void **)&self->_transferSession.value_);
  objc_storeStrong((id *)&self->_monochromeBufferCreator, 0);
  objc_storeStrong((id *)&self->_imageManager, 0);
}

- (id).cxx_construct
{
  *((void *)self + 3) = 0;
  return self;
}

@end