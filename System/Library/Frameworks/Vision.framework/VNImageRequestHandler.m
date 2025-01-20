@interface VNImageRequestHandler
+ (void)forcedCleanup;
+ (void)forcedCleanupWithOptions:(id)a3;
+ (void)requestForcedCleanup;
+ (void)requestForcedCleanupWithOptions:(id)a3;
+ (void)requestForcedCleanupWithOptions:(id)a3 completion:(id)a4;
- (BOOL)performRequests:(NSArray *)requests error:(NSError *)error;
- (BOOL)performRequests:(id)a3 gatheredForensics:(id *)a4 error:(id *)a5;
- (BOOL)prepareForPerformingRequests:(id)a3 error:(id *)a4;
- (VNImageBuffer)imageBuffer;
- (VNImageRequestHandler)initWithCGImage:(CGImage *)a3 options:(id)a4 session:(id)a5;
- (VNImageRequestHandler)initWithCGImage:(CGImage *)a3 orientation:(unsigned int)a4 options:(id)a5 session:(id)a6;
- (VNImageRequestHandler)initWithCGImage:(CGImageRef)image options:(NSDictionary *)options;
- (VNImageRequestHandler)initWithCGImage:(CGImageRef)image orientation:(CGImagePropertyOrientation)orientation options:(NSDictionary *)options;
- (VNImageRequestHandler)initWithCIImage:(CIImage *)image options:(NSDictionary *)options;
- (VNImageRequestHandler)initWithCIImage:(CIImage *)image orientation:(CGImagePropertyOrientation)orientation options:(NSDictionary *)options;
- (VNImageRequestHandler)initWithCIImage:(id)a3 options:(id)a4 session:(id)a5;
- (VNImageRequestHandler)initWithCIImage:(id)a3 orientation:(unsigned int)a4 options:(id)a5 session:(id)a6;
- (VNImageRequestHandler)initWithCMSampleBuffer:(CMSampleBufferRef)sampleBuffer depthData:(AVDepthData *)depthData orientation:(CGImagePropertyOrientation)orientation options:(NSDictionary *)options;
- (VNImageRequestHandler)initWithCMSampleBuffer:(CMSampleBufferRef)sampleBuffer options:(NSDictionary *)options;
- (VNImageRequestHandler)initWithCMSampleBuffer:(CMSampleBufferRef)sampleBuffer orientation:(CGImagePropertyOrientation)orientation options:(NSDictionary *)options;
- (VNImageRequestHandler)initWithCMSampleBuffer:(opaqueCMSampleBuffer *)a3 depthData:(id)a4 orientation:(unsigned int)a5 options:(id)a6 session:(id)a7;
- (VNImageRequestHandler)initWithCMSampleBuffer:(opaqueCMSampleBuffer *)a3 options:(id)a4 session:(id)a5;
- (VNImageRequestHandler)initWithCMSampleBuffer:(opaqueCMSampleBuffer *)a3 orientation:(unsigned int)a4 options:(id)a5 session:(id)a6;
- (VNImageRequestHandler)initWithCVPixelBuffer:(CVPixelBufferRef)pixelBuffer depthData:(AVDepthData *)depthData orientation:(CGImagePropertyOrientation)orientation options:(NSDictionary *)options;
- (VNImageRequestHandler)initWithCVPixelBuffer:(CVPixelBufferRef)pixelBuffer options:(NSDictionary *)options;
- (VNImageRequestHandler)initWithCVPixelBuffer:(CVPixelBufferRef)pixelBuffer orientation:(CGImagePropertyOrientation)orientation options:(NSDictionary *)options;
- (VNImageRequestHandler)initWithCVPixelBuffer:(__CVBuffer *)a3 depthData:(id)a4 orientation:(unsigned int)a5 options:(id)a6 session:(id)a7;
- (VNImageRequestHandler)initWithCVPixelBuffer:(__CVBuffer *)a3 options:(id)a4 session:(id)a5;
- (VNImageRequestHandler)initWithCVPixelBuffer:(__CVBuffer *)a3 orientation:(unsigned int)a4 options:(id)a5 session:(id)a6;
- (VNImageRequestHandler)initWithData:(NSData *)imageData options:(NSDictionary *)options;
- (VNImageRequestHandler)initWithData:(NSData *)imageData orientation:(CGImagePropertyOrientation)orientation options:(NSDictionary *)options;
- (VNImageRequestHandler)initWithData:(id)a3 options:(id)a4 session:(id)a5;
- (VNImageRequestHandler)initWithData:(id)a3 orientation:(unsigned int)a4 options:(id)a5 session:(id)a6;
- (VNImageRequestHandler)initWithSession:(id)a3 imageBuffer:(id)a4;
- (VNImageRequestHandler)initWithURL:(NSURL *)imageURL options:(NSDictionary *)options;
- (VNImageRequestHandler)initWithURL:(NSURL *)imageURL orientation:(CGImagePropertyOrientation)orientation options:(NSDictionary *)options;
- (VNImageRequestHandler)initWithURL:(id)a3 options:(id)a4 session:(id)a5;
- (VNImageRequestHandler)initWithURL:(id)a3 orientation:(unsigned int)a4 options:(id)a5 session:(id)a6;
- (VNSession)session;
- (id)debugQuickLookObject;
- (void)cancelAllRequests;
@end

@implementation VNImageRequestHandler

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observationsCache, 0);
  objc_storeStrong((id *)&self->_requestPerformer, 0);
  objc_storeStrong((id *)&self->_imageBuffer, 0);

  objc_storeStrong((id *)&self->_session, 0);
}

- (VNSession)session
{
  return self->_session;
}

- (VNImageBuffer)imageBuffer
{
  return self->_imageBuffer;
}

- (id)debugQuickLookObject
{
  return [(VNImageBuffer *)self->_imageBuffer debugQuickLookObject];
}

- (BOOL)prepareForPerformingRequests:(id)a3 error:(id *)a4
{
  return [(VNSession *)self->_session prepareForPerformingRequests:a3 error:a4];
}

- (void)cancelAllRequests
{
}

- (VNImageRequestHandler)initWithCMSampleBuffer:(opaqueCMSampleBuffer *)a3 depthData:(id)a4 orientation:(unsigned int)a5 options:(id)a6 session:(id)a7
{
  uint64_t v9 = *(void *)&a5;
  id v12 = a4;
  id v13 = a6;
  id v14 = a7;
  v15 = (void *)MEMORY[0x1A6257080]();
  v16 = [[VNImageBuffer alloc] initWithCMSampleBuffer:a3 depthData:v12 orientation:v9 options:v13 session:v14];
  if (v16)
  {
    self = [(VNImageRequestHandler *)self initWithSession:v14 imageBuffer:v16];
    v17 = self;
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (VNImageRequestHandler)initWithCMSampleBuffer:(opaqueCMSampleBuffer *)a3 orientation:(unsigned int)a4 options:(id)a5 session:(id)a6
{
  uint64_t v7 = *(void *)&a4;
  id v10 = a5;
  id v11 = a6;
  id v12 = (void *)MEMORY[0x1A6257080]();
  id v13 = [[VNImageBuffer alloc] initWithCMSampleBuffer:a3 orientation:v7 options:v10 session:v11];
  if (v13)
  {
    self = [(VNImageRequestHandler *)self initWithSession:v11 imageBuffer:v13];
    id v14 = self;
  }
  else
  {
    id v14 = 0;
  }

  return v14;
}

- (VNImageRequestHandler)initWithCMSampleBuffer:(opaqueCMSampleBuffer *)a3 options:(id)a4 session:(id)a5
{
  return [(VNImageRequestHandler *)self initWithCMSampleBuffer:a3 orientation:0 options:a4 session:a5];
}

- (VNImageRequestHandler)initWithData:(id)a3 orientation:(unsigned int)a4 options:(id)a5 session:(id)a6
{
  uint64_t v8 = *(void *)&a4;
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  id v13 = (void *)MEMORY[0x1A6257080]();
  id v14 = [[VNImageBuffer alloc] initWithData:v10 orientation:v8 options:v11 session:v12];
  if (v14)
  {
    self = [(VNImageRequestHandler *)self initWithSession:v12 imageBuffer:v14];
    v15 = self;
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (VNImageRequestHandler)initWithData:(id)a3 options:(id)a4 session:(id)a5
{
  return [(VNImageRequestHandler *)self initWithData:a3 orientation:0 options:a4 session:a5];
}

- (VNImageRequestHandler)initWithURL:(id)a3 orientation:(unsigned int)a4 options:(id)a5 session:(id)a6
{
  uint64_t v8 = *(void *)&a4;
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  id v13 = (void *)MEMORY[0x1A6257080]();
  id v14 = [[VNImageBuffer alloc] initWithURL:v10 orientation:v8 options:v11 session:v12];
  if (v14)
  {
    self = [(VNImageRequestHandler *)self initWithSession:v12 imageBuffer:v14];
    v15 = self;
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (VNImageRequestHandler)initWithURL:(id)a3 options:(id)a4 session:(id)a5
{
  return [(VNImageRequestHandler *)self initWithURL:a3 orientation:0 options:a4 session:a5];
}

- (VNImageRequestHandler)initWithCIImage:(id)a3 orientation:(unsigned int)a4 options:(id)a5 session:(id)a6
{
  uint64_t v8 = *(void *)&a4;
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  id v13 = (void *)MEMORY[0x1A6257080]();
  id v14 = [[VNImageBuffer alloc] initWithCIImage:v10 orientation:v8 options:v11 session:v12];
  if (v14)
  {
    self = [(VNImageRequestHandler *)self initWithSession:v12 imageBuffer:v14];
    v15 = self;
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (VNImageRequestHandler)initWithCIImage:(id)a3 options:(id)a4 session:(id)a5
{
  return [(VNImageRequestHandler *)self initWithCIImage:a3 orientation:0 options:a4 session:a5];
}

- (VNImageRequestHandler)initWithCGImage:(CGImage *)a3 orientation:(unsigned int)a4 options:(id)a5 session:(id)a6
{
  uint64_t v7 = *(void *)&a4;
  id v10 = a5;
  id v11 = a6;
  id v12 = (void *)MEMORY[0x1A6257080]();
  id v13 = [[VNImageBuffer alloc] initWithCGImage:a3 orientation:v7 options:v10 session:v11];
  if (v13)
  {
    self = [(VNImageRequestHandler *)self initWithSession:v11 imageBuffer:v13];
    id v14 = self;
  }
  else
  {
    id v14 = 0;
  }

  return v14;
}

- (VNImageRequestHandler)initWithCGImage:(CGImage *)a3 options:(id)a4 session:(id)a5
{
  return [(VNImageRequestHandler *)self initWithCGImage:a3 orientation:0 options:a4 session:a5];
}

- (VNImageRequestHandler)initWithCVPixelBuffer:(__CVBuffer *)a3 depthData:(id)a4 orientation:(unsigned int)a5 options:(id)a6 session:(id)a7
{
  uint64_t v9 = *(void *)&a5;
  id v12 = a4;
  id v13 = a6;
  id v14 = a7;
  v15 = (void *)MEMORY[0x1A6257080]();
  v16 = [[VNImageBuffer alloc] initWithCVPixelBuffer:a3 depthData:v12 orientation:v9 options:v13 session:v14];
  if (v16)
  {
    self = [(VNImageRequestHandler *)self initWithSession:v14 imageBuffer:v16];
    v17 = self;
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (VNImageRequestHandler)initWithCVPixelBuffer:(__CVBuffer *)a3 orientation:(unsigned int)a4 options:(id)a5 session:(id)a6
{
  uint64_t v7 = *(void *)&a4;
  id v10 = a5;
  id v11 = a6;
  id v12 = (void *)MEMORY[0x1A6257080]();
  id v13 = [[VNImageBuffer alloc] initWithCVPixelBuffer:a3 orientation:v7 options:v10 session:v11];
  if (v13)
  {
    self = [(VNImageRequestHandler *)self initWithSession:v11 imageBuffer:v13];
    id v14 = self;
  }
  else
  {
    id v14 = 0;
  }

  return v14;
}

- (VNImageRequestHandler)initWithCVPixelBuffer:(__CVBuffer *)a3 options:(id)a4 session:(id)a5
{
  return [(VNImageRequestHandler *)self initWithCVPixelBuffer:a3 orientation:0 options:a4 session:a5];
}

- (BOOL)performRequests:(id)a3 gatheredForensics:(id *)a4 error:(id *)a5
{
  id v8 = a3;
  if (a4)
  {
    uint64_t v9 = [[VNRequestForensics alloc] initWithOriginalRequests:v8];
    *a4 = v9;
  }
  else
  {
    uint64_t v9 = 0;
  }
  id v10 = (void *)MEMORY[0x1A6257080]();
  id v11 = [[VNRequestPerformingContext alloc] initWithSession:self->_session requestPerformer:self->_requestPerformer imageBuffer:self->_imageBuffer forensics:v9 observationsCache:self->_observationsCache];
  [(VNRequestPerformingContext *)v11 qosClass];
  requestPerformer = self->_requestPerformer;
  id v17 = 0;
  BOOL v13 = [(VNRequestPerformer *)requestPerformer performRequests:v8 inContext:v11 error:&v17];
  id v14 = v17;

  if (a5) {
    char v15 = v13;
  }
  else {
    char v15 = 1;
  }
  if ((v15 & 1) == 0) {
    *a5 = v14;
  }

  return v13;
}

- (BOOL)performRequests:(NSArray *)requests error:(NSError *)error
{
  return [(VNImageRequestHandler *)self performRequests:requests gatheredForensics:0 error:error];
}

- (VNImageRequestHandler)initWithCMSampleBuffer:(CMSampleBufferRef)sampleBuffer depthData:(AVDepthData *)depthData orientation:(CGImagePropertyOrientation)orientation options:(NSDictionary *)options
{
  uint64_t v7 = *(void *)&orientation;
  id v10 = depthData;
  id v11 = options;
  id v12 = +[VNSession globalSession];
  BOOL v13 = [(VNImageRequestHandler *)self initWithCMSampleBuffer:sampleBuffer depthData:v10 orientation:v7 options:v11 session:v12];

  return v13;
}

- (VNImageRequestHandler)initWithCMSampleBuffer:(CMSampleBufferRef)sampleBuffer orientation:(CGImagePropertyOrientation)orientation options:(NSDictionary *)options
{
  uint64_t v5 = *(void *)&orientation;
  id v8 = options;
  uint64_t v9 = +[VNSession globalSession];
  id v10 = [(VNImageRequestHandler *)self initWithCMSampleBuffer:sampleBuffer orientation:v5 options:v8 session:v9];

  return v10;
}

- (VNImageRequestHandler)initWithCMSampleBuffer:(CMSampleBufferRef)sampleBuffer options:(NSDictionary *)options
{
  return [(VNImageRequestHandler *)self initWithCMSampleBuffer:sampleBuffer orientation:0 options:options];
}

- (VNImageRequestHandler)initWithData:(NSData *)imageData orientation:(CGImagePropertyOrientation)orientation options:(NSDictionary *)options
{
  uint64_t v6 = *(void *)&orientation;
  id v8 = imageData;
  uint64_t v9 = options;
  id v10 = +[VNSession globalSession];
  id v11 = [(VNImageRequestHandler *)self initWithData:v8 orientation:v6 options:v9 session:v10];

  return v11;
}

- (VNImageRequestHandler)initWithData:(NSData *)imageData options:(NSDictionary *)options
{
  return [(VNImageRequestHandler *)self initWithData:imageData orientation:0 options:options];
}

- (VNImageRequestHandler)initWithURL:(NSURL *)imageURL orientation:(CGImagePropertyOrientation)orientation options:(NSDictionary *)options
{
  uint64_t v6 = *(void *)&orientation;
  id v8 = imageURL;
  uint64_t v9 = options;
  id v10 = +[VNSession globalSession];
  id v11 = [(VNImageRequestHandler *)self initWithURL:v8 orientation:v6 options:v9 session:v10];

  return v11;
}

- (VNImageRequestHandler)initWithURL:(NSURL *)imageURL options:(NSDictionary *)options
{
  return [(VNImageRequestHandler *)self initWithURL:imageURL orientation:0 options:options];
}

- (VNImageRequestHandler)initWithCIImage:(CIImage *)image orientation:(CGImagePropertyOrientation)orientation options:(NSDictionary *)options
{
  uint64_t v6 = *(void *)&orientation;
  id v8 = image;
  uint64_t v9 = options;
  id v10 = +[VNSession globalSession];
  id v11 = [(VNImageRequestHandler *)self initWithCIImage:v8 orientation:v6 options:v9 session:v10];

  return v11;
}

- (VNImageRequestHandler)initWithCIImage:(CIImage *)image options:(NSDictionary *)options
{
  return [(VNImageRequestHandler *)self initWithCIImage:image orientation:0 options:options];
}

- (VNImageRequestHandler)initWithCGImage:(CGImageRef)image orientation:(CGImagePropertyOrientation)orientation options:(NSDictionary *)options
{
  uint64_t v5 = *(void *)&orientation;
  id v8 = options;
  uint64_t v9 = +[VNSession globalSession];
  id v10 = [(VNImageRequestHandler *)self initWithCGImage:image orientation:v5 options:v8 session:v9];

  return v10;
}

- (VNImageRequestHandler)initWithCGImage:(CGImageRef)image options:(NSDictionary *)options
{
  return [(VNImageRequestHandler *)self initWithCGImage:image orientation:0 options:options];
}

- (VNImageRequestHandler)initWithCVPixelBuffer:(CVPixelBufferRef)pixelBuffer depthData:(AVDepthData *)depthData orientation:(CGImagePropertyOrientation)orientation options:(NSDictionary *)options
{
  uint64_t v7 = *(void *)&orientation;
  id v10 = depthData;
  id v11 = options;
  id v12 = +[VNSession globalSession];
  BOOL v13 = [(VNImageRequestHandler *)self initWithCVPixelBuffer:pixelBuffer depthData:v10 orientation:v7 options:v11 session:v12];

  return v13;
}

- (VNImageRequestHandler)initWithCVPixelBuffer:(CVPixelBufferRef)pixelBuffer orientation:(CGImagePropertyOrientation)orientation options:(NSDictionary *)options
{
  uint64_t v5 = *(void *)&orientation;
  id v8 = options;
  uint64_t v9 = +[VNSession globalSession];
  id v10 = [(VNImageRequestHandler *)self initWithCVPixelBuffer:pixelBuffer orientation:v5 options:v8 session:v9];

  return v10;
}

- (VNImageRequestHandler)initWithCVPixelBuffer:(CVPixelBufferRef)pixelBuffer options:(NSDictionary *)options
{
  return [(VNImageRequestHandler *)self initWithCVPixelBuffer:pixelBuffer orientation:0 options:options];
}

- (VNImageRequestHandler)initWithSession:(id)a3 imageBuffer:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)VNImageRequestHandler;
  uint64_t v9 = [(VNImageRequestHandler *)&v16 init];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_session, a3);
    objc_storeStrong((id *)&v10->_imageBuffer, a4);
    id v11 = objc_alloc_init(VNRequestPerformer);
    requestPerformer = v10->_requestPerformer;
    v10->_requestPerformer = v11;

    BOOL v13 = objc_alloc_init(VNObservationsCache);
    observationsCache = v10->_observationsCache;
    v10->_observationsCache = v13;
  }
  return v10;
}

+ (void)forcedCleanupWithOptions:(id)a3
{
  id v4 = a3;
  v3 = +[VNSession globalSession];
  [v3 legacyForcedCleanupWithOptions:v4];
}

+ (void)requestForcedCleanupWithOptions:(id)a3 completion:(id)a4
{
  id v7 = a3;
  uint64_t v5 = (void (**)(void))a4;
  uint64_t v6 = +[VNSession globalSession];
  [v6 legacyForcedCleanupWithOptions:v7];
  v5[2](v5);
}

+ (void)requestForcedCleanupWithOptions:(id)a3
{
  id v4 = a3;
  v3 = +[VNSession globalSession];
  [v3 legacyForcedCleanupWithOptions:v4];
}

+ (void)forcedCleanup
{
  id v2 = +[VNSession globalSession];
  [v2 releaseCachedResources];
}

+ (void)requestForcedCleanup
{
  id v2 = +[VNSession globalSession];
  [v2 releaseCachedResources];
}

@end