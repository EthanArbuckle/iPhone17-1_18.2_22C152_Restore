@interface VNTargetedImageRequest
+ (Class)configurationClass;
- (BOOL)allowsCachingOfResults;
- (BOOL)willAcceptCachedResultsFromRequestWithConfiguration:(id)a3;
- (VNTargetedImageRequest)initWithTargetedCGImage:(CGImage *)a3 orientation:(unsigned int)a4 options:(id)a5 session:(id)a6 completionHandler:(id)a7;
- (VNTargetedImageRequest)initWithTargetedCGImage:(CGImageRef)cgImage options:(NSDictionary *)options;
- (VNTargetedImageRequest)initWithTargetedCGImage:(CGImageRef)cgImage options:(NSDictionary *)options completionHandler:(VNRequestCompletionHandler)completionHandler;
- (VNTargetedImageRequest)initWithTargetedCGImage:(CGImageRef)cgImage orientation:(CGImagePropertyOrientation)orientation options:(NSDictionary *)options;
- (VNTargetedImageRequest)initWithTargetedCGImage:(CGImageRef)cgImage orientation:(CGImagePropertyOrientation)orientation options:(NSDictionary *)options completionHandler:(VNRequestCompletionHandler)completionHandler;
- (VNTargetedImageRequest)initWithTargetedCIImage:(CIImage *)ciImage options:(NSDictionary *)options;
- (VNTargetedImageRequest)initWithTargetedCIImage:(CIImage *)ciImage options:(NSDictionary *)options completionHandler:(VNRequestCompletionHandler)completionHandler;
- (VNTargetedImageRequest)initWithTargetedCIImage:(CIImage *)ciImage orientation:(CGImagePropertyOrientation)orientation options:(NSDictionary *)options;
- (VNTargetedImageRequest)initWithTargetedCIImage:(CIImage *)ciImage orientation:(CGImagePropertyOrientation)orientation options:(NSDictionary *)options completionHandler:(VNRequestCompletionHandler)completionHandler;
- (VNTargetedImageRequest)initWithTargetedCIImage:(id)a3 orientation:(unsigned int)a4 options:(id)a5 session:(id)a6 completionHandler:(id)a7;
- (VNTargetedImageRequest)initWithTargetedCMSampleBuffer:(CMSampleBufferRef)sampleBuffer options:(NSDictionary *)options;
- (VNTargetedImageRequest)initWithTargetedCMSampleBuffer:(CMSampleBufferRef)sampleBuffer options:(NSDictionary *)options completionHandler:(VNRequestCompletionHandler)completionHandler;
- (VNTargetedImageRequest)initWithTargetedCMSampleBuffer:(CMSampleBufferRef)sampleBuffer orientation:(CGImagePropertyOrientation)orientation options:(NSDictionary *)options;
- (VNTargetedImageRequest)initWithTargetedCMSampleBuffer:(CMSampleBufferRef)sampleBuffer orientation:(CGImagePropertyOrientation)orientation options:(NSDictionary *)options completionHandler:(VNRequestCompletionHandler)completionHandler;
- (VNTargetedImageRequest)initWithTargetedCMSampleBuffer:(opaqueCMSampleBuffer *)a3 orientation:(unsigned int)a4 options:(id)a5 session:(id)a6 completionHandler:(id)a7;
- (VNTargetedImageRequest)initWithTargetedCVPixelBuffer:(CVPixelBufferRef)pixelBuffer options:(NSDictionary *)options;
- (VNTargetedImageRequest)initWithTargetedCVPixelBuffer:(CVPixelBufferRef)pixelBuffer options:(NSDictionary *)options completionHandler:(VNRequestCompletionHandler)completionHandler;
- (VNTargetedImageRequest)initWithTargetedCVPixelBuffer:(CVPixelBufferRef)pixelBuffer orientation:(CGImagePropertyOrientation)orientation options:(NSDictionary *)options;
- (VNTargetedImageRequest)initWithTargetedCVPixelBuffer:(CVPixelBufferRef)pixelBuffer orientation:(CGImagePropertyOrientation)orientation options:(NSDictionary *)options completionHandler:(VNRequestCompletionHandler)completionHandler;
- (VNTargetedImageRequest)initWithTargetedCVPixelBuffer:(__CVBuffer *)a3 orientation:(unsigned int)a4 options:(id)a5 session:(id)a6;
- (VNTargetedImageRequest)initWithTargetedCVPixelBuffer:(__CVBuffer *)a3 orientation:(unsigned int)a4 options:(id)a5 session:(id)a6 completionHandler:(id)a7;
- (VNTargetedImageRequest)initWithTargetedImageBuffer:(id)a3 completionHandler:(id)a4;
- (VNTargetedImageRequest)initWithTargetedImageData:(NSData *)imageData options:(NSDictionary *)options;
- (VNTargetedImageRequest)initWithTargetedImageData:(NSData *)imageData options:(NSDictionary *)options completionHandler:(VNRequestCompletionHandler)completionHandler;
- (VNTargetedImageRequest)initWithTargetedImageData:(NSData *)imageData orientation:(CGImagePropertyOrientation)orientation options:(NSDictionary *)options;
- (VNTargetedImageRequest)initWithTargetedImageData:(NSData *)imageData orientation:(CGImagePropertyOrientation)orientation options:(NSDictionary *)options completionHandler:(VNRequestCompletionHandler)completionHandler;
- (VNTargetedImageRequest)initWithTargetedImageData:(id)a3 orientation:(unsigned int)a4 options:(id)a5 session:(id)a6 completionHandler:(id)a7;
- (VNTargetedImageRequest)initWithTargetedImageURL:(NSURL *)imageURL options:(NSDictionary *)options;
- (VNTargetedImageRequest)initWithTargetedImageURL:(NSURL *)imageURL options:(NSDictionary *)options completionHandler:(VNRequestCompletionHandler)completionHandler;
- (VNTargetedImageRequest)initWithTargetedImageURL:(NSURL *)imageURL orientation:(CGImagePropertyOrientation)orientation options:(NSDictionary *)options;
- (VNTargetedImageRequest)initWithTargetedImageURL:(NSURL *)imageURL orientation:(CGImagePropertyOrientation)orientation options:(NSDictionary *)options completionHandler:(VNRequestCompletionHandler)completionHandler;
- (VNTargetedImageRequest)initWithTargetedImageURL:(id)a3 orientation:(unsigned int)a4 options:(id)a5 session:(id)a6 completionHandler:(id)a7;
- (id)newDuplicateInstance;
- (id)requiredTargetedImageBufferReturningError:(id *)a3;
- (id)sequencedRequestPreviousObservationsKey;
- (id)targetedImageBuffer;
@end

@implementation VNTargetedImageRequest

- (void).cxx_destruct
{
}

- (id)newDuplicateInstance
{
  id v3 = objc_alloc((Class)objc_opt_class());
  targetedImageBuffer = self->_targetedImageBuffer;
  v5 = [(VNRequest *)self completionHandler];
  v6 = (void *)[v3 initWithTargetedImageBuffer:targetedImageBuffer completionHandler:v5];

  return v6;
}

- (id)sequencedRequestPreviousObservationsKey
{
  id v3 = [NSString alloc];
  v8.receiver = self;
  v8.super_class = (Class)VNTargetedImageRequest;
  v4 = [(VNRequest *)&v8 sequencedRequestPreviousObservationsKey];
  v5 = [(VNImageBuffer *)self->_targetedImageBuffer sequencedRequestPreviousObservationsKey];
  v6 = (void *)[v3 initWithFormat:@"%@:Trk=%@", v4, v5];

  return v6;
}

- (BOOL)willAcceptCachedResultsFromRequestWithConfiguration:(id)a3
{
  return 0;
}

- (BOOL)allowsCachingOfResults
{
  return 0;
}

- (id)requiredTargetedImageBufferReturningError:(id *)a3
{
  v4 = [(VNTargetedImageRequest *)self targetedImageBuffer];
  v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else if (a3)
  {
    *a3 = +[VNError errorForInternalErrorWithLocalizedDescription:@"no valid initial image buffer was provided"];
  }

  return v5;
}

- (id)targetedImageBuffer
{
  return self->_targetedImageBuffer;
}

- (VNTargetedImageRequest)initWithTargetedCMSampleBuffer:(opaqueCMSampleBuffer *)a3 orientation:(unsigned int)a4 options:(id)a5 session:(id)a6 completionHandler:(id)a7
{
  uint64_t v9 = *(void *)&a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  v15 = [[VNImageBuffer alloc] initWithCMSampleBuffer:a3 orientation:v9 options:v12 session:v13];
  v16 = [(VNTargetedImageRequest *)self initWithTargetedImageBuffer:v15 completionHandler:v14];

  return v16;
}

- (VNTargetedImageRequest)initWithTargetedCMSampleBuffer:(CMSampleBufferRef)sampleBuffer orientation:(CGImagePropertyOrientation)orientation options:(NSDictionary *)options completionHandler:(VNRequestCompletionHandler)completionHandler
{
  uint64_t v7 = *(void *)&orientation;
  v10 = options;
  VNRequestCompletionHandler v11 = completionHandler;
  id v12 = objc_alloc_init(VNSession);
  id v13 = [(VNTargetedImageRequest *)self initWithTargetedCMSampleBuffer:sampleBuffer orientation:v7 options:v10 session:v12 completionHandler:v11];

  return v13;
}

- (VNTargetedImageRequest)initWithTargetedCMSampleBuffer:(CMSampleBufferRef)sampleBuffer orientation:(CGImagePropertyOrientation)orientation options:(NSDictionary *)options
{
  uint64_t v5 = *(void *)&orientation;
  objc_super v8 = options;
  uint64_t v9 = objc_alloc_init(VNSession);
  v10 = [(VNTargetedImageRequest *)self initWithTargetedCMSampleBuffer:sampleBuffer orientation:v5 options:v8 session:v9 completionHandler:0];

  return v10;
}

- (VNTargetedImageRequest)initWithTargetedCMSampleBuffer:(CMSampleBufferRef)sampleBuffer options:(NSDictionary *)options completionHandler:(VNRequestCompletionHandler)completionHandler
{
  objc_super v8 = options;
  VNRequestCompletionHandler v9 = completionHandler;
  v10 = objc_alloc_init(VNSession);
  VNRequestCompletionHandler v11 = [(VNTargetedImageRequest *)self initWithTargetedCMSampleBuffer:sampleBuffer orientation:0 options:v8 session:v10 completionHandler:v9];

  return v11;
}

- (VNTargetedImageRequest)initWithTargetedCMSampleBuffer:(CMSampleBufferRef)sampleBuffer options:(NSDictionary *)options
{
  id v6 = options;
  uint64_t v7 = objc_alloc_init(VNSession);
  objc_super v8 = [(VNTargetedImageRequest *)self initWithTargetedCMSampleBuffer:sampleBuffer orientation:0 options:v6 session:v7 completionHandler:0];

  return v8;
}

- (VNTargetedImageRequest)initWithTargetedImageData:(id)a3 orientation:(unsigned int)a4 options:(id)a5 session:(id)a6 completionHandler:(id)a7
{
  uint64_t v10 = *(void *)&a4;
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  v16 = [[VNImageBuffer alloc] initWithData:v12 orientation:v10 options:v13 session:v14];
  v17 = [(VNTargetedImageRequest *)self initWithTargetedImageBuffer:v16 completionHandler:v15];

  return v17;
}

- (VNTargetedImageRequest)initWithTargetedImageData:(NSData *)imageData orientation:(CGImagePropertyOrientation)orientation options:(NSDictionary *)options completionHandler:(VNRequestCompletionHandler)completionHandler
{
  uint64_t v8 = *(void *)&orientation;
  uint64_t v10 = imageData;
  VNRequestCompletionHandler v11 = options;
  VNRequestCompletionHandler v12 = completionHandler;
  id v13 = objc_alloc_init(VNSession);
  id v14 = [(VNTargetedImageRequest *)self initWithTargetedImageData:v10 orientation:v8 options:v11 session:v13 completionHandler:v12];

  return v14;
}

- (VNTargetedImageRequest)initWithTargetedImageData:(NSData *)imageData orientation:(CGImagePropertyOrientation)orientation options:(NSDictionary *)options
{
  uint64_t v6 = *(void *)&orientation;
  uint64_t v8 = imageData;
  VNRequestCompletionHandler v9 = options;
  uint64_t v10 = objc_alloc_init(VNSession);
  VNRequestCompletionHandler v11 = [(VNTargetedImageRequest *)self initWithTargetedImageData:v8 orientation:v6 options:v9 session:v10 completionHandler:0];

  return v11;
}

- (VNTargetedImageRequest)initWithTargetedImageData:(NSData *)imageData options:(NSDictionary *)options completionHandler:(VNRequestCompletionHandler)completionHandler
{
  uint64_t v8 = imageData;
  VNRequestCompletionHandler v9 = options;
  VNRequestCompletionHandler v10 = completionHandler;
  VNRequestCompletionHandler v11 = objc_alloc_init(VNSession);
  VNRequestCompletionHandler v12 = [(VNTargetedImageRequest *)self initWithTargetedImageData:v8 orientation:0 options:v9 session:v11 completionHandler:v10];

  return v12;
}

- (VNTargetedImageRequest)initWithTargetedImageData:(NSData *)imageData options:(NSDictionary *)options
{
  uint64_t v6 = imageData;
  uint64_t v7 = options;
  uint64_t v8 = objc_alloc_init(VNSession);
  VNRequestCompletionHandler v9 = [(VNTargetedImageRequest *)self initWithTargetedImageData:v6 orientation:0 options:v7 session:v8 completionHandler:0];

  return v9;
}

- (VNTargetedImageRequest)initWithTargetedImageURL:(id)a3 orientation:(unsigned int)a4 options:(id)a5 session:(id)a6 completionHandler:(id)a7
{
  uint64_t v10 = *(void *)&a4;
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  v16 = [[VNImageBuffer alloc] initWithURL:v12 orientation:v10 options:v13 session:v14];
  v17 = [(VNTargetedImageRequest *)self initWithTargetedImageBuffer:v16 completionHandler:v15];

  return v17;
}

- (VNTargetedImageRequest)initWithTargetedImageURL:(NSURL *)imageURL orientation:(CGImagePropertyOrientation)orientation options:(NSDictionary *)options completionHandler:(VNRequestCompletionHandler)completionHandler
{
  uint64_t v8 = *(void *)&orientation;
  uint64_t v10 = imageURL;
  VNRequestCompletionHandler v11 = options;
  VNRequestCompletionHandler v12 = completionHandler;
  id v13 = objc_alloc_init(VNSession);
  id v14 = [(VNTargetedImageRequest *)self initWithTargetedImageURL:v10 orientation:v8 options:v11 session:v13 completionHandler:v12];

  return v14;
}

- (VNTargetedImageRequest)initWithTargetedImageURL:(NSURL *)imageURL orientation:(CGImagePropertyOrientation)orientation options:(NSDictionary *)options
{
  uint64_t v6 = *(void *)&orientation;
  uint64_t v8 = imageURL;
  VNRequestCompletionHandler v9 = options;
  uint64_t v10 = objc_alloc_init(VNSession);
  VNRequestCompletionHandler v11 = [(VNTargetedImageRequest *)self initWithTargetedImageURL:v8 orientation:v6 options:v9 session:v10 completionHandler:0];

  return v11;
}

- (VNTargetedImageRequest)initWithTargetedImageURL:(NSURL *)imageURL options:(NSDictionary *)options completionHandler:(VNRequestCompletionHandler)completionHandler
{
  uint64_t v8 = imageURL;
  VNRequestCompletionHandler v9 = options;
  VNRequestCompletionHandler v10 = completionHandler;
  VNRequestCompletionHandler v11 = objc_alloc_init(VNSession);
  VNRequestCompletionHandler v12 = [(VNTargetedImageRequest *)self initWithTargetedImageURL:v8 orientation:0 options:v9 session:v11 completionHandler:v10];

  return v12;
}

- (VNTargetedImageRequest)initWithTargetedImageURL:(NSURL *)imageURL options:(NSDictionary *)options
{
  uint64_t v6 = imageURL;
  uint64_t v7 = options;
  uint64_t v8 = objc_alloc_init(VNSession);
  VNRequestCompletionHandler v9 = [(VNTargetedImageRequest *)self initWithTargetedImageURL:v6 orientation:0 options:v7 session:v8 completionHandler:0];

  return v9;
}

- (VNTargetedImageRequest)initWithTargetedCIImage:(id)a3 orientation:(unsigned int)a4 options:(id)a5 session:(id)a6 completionHandler:(id)a7
{
  uint64_t v10 = *(void *)&a4;
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  v16 = [[VNImageBuffer alloc] initWithCIImage:v12 orientation:v10 options:v13 session:v14];
  v17 = [(VNTargetedImageRequest *)self initWithTargetedImageBuffer:v16 completionHandler:v15];

  return v17;
}

- (VNTargetedImageRequest)initWithTargetedCIImage:(CIImage *)ciImage orientation:(CGImagePropertyOrientation)orientation options:(NSDictionary *)options completionHandler:(VNRequestCompletionHandler)completionHandler
{
  uint64_t v8 = *(void *)&orientation;
  uint64_t v10 = ciImage;
  VNRequestCompletionHandler v11 = options;
  VNRequestCompletionHandler v12 = completionHandler;
  id v13 = objc_alloc_init(VNSession);
  id v14 = [(VNTargetedImageRequest *)self initWithTargetedCIImage:v10 orientation:v8 options:v11 session:v13 completionHandler:v12];

  return v14;
}

- (VNTargetedImageRequest)initWithTargetedCIImage:(CIImage *)ciImage orientation:(CGImagePropertyOrientation)orientation options:(NSDictionary *)options
{
  uint64_t v6 = *(void *)&orientation;
  uint64_t v8 = ciImage;
  VNRequestCompletionHandler v9 = options;
  uint64_t v10 = objc_alloc_init(VNSession);
  VNRequestCompletionHandler v11 = [(VNTargetedImageRequest *)self initWithTargetedCIImage:v8 orientation:v6 options:v9 session:v10 completionHandler:0];

  return v11;
}

- (VNTargetedImageRequest)initWithTargetedCIImage:(CIImage *)ciImage options:(NSDictionary *)options completionHandler:(VNRequestCompletionHandler)completionHandler
{
  uint64_t v8 = ciImage;
  VNRequestCompletionHandler v9 = options;
  VNRequestCompletionHandler v10 = completionHandler;
  VNRequestCompletionHandler v11 = objc_alloc_init(VNSession);
  VNRequestCompletionHandler v12 = [(VNTargetedImageRequest *)self initWithTargetedCIImage:v8 orientation:0 options:v9 session:v11 completionHandler:v10];

  return v12;
}

- (VNTargetedImageRequest)initWithTargetedCIImage:(CIImage *)ciImage options:(NSDictionary *)options
{
  uint64_t v6 = ciImage;
  uint64_t v7 = options;
  uint64_t v8 = objc_alloc_init(VNSession);
  VNRequestCompletionHandler v9 = [(VNTargetedImageRequest *)self initWithTargetedCIImage:v6 orientation:0 options:v7 session:v8 completionHandler:0];

  return v9;
}

- (VNTargetedImageRequest)initWithTargetedCGImage:(CGImage *)a3 orientation:(unsigned int)a4 options:(id)a5 session:(id)a6 completionHandler:(id)a7
{
  uint64_t v9 = *(void *)&a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  id v15 = [[VNImageBuffer alloc] initWithCGImage:a3 orientation:v9 options:v12 session:v13];
  v16 = [(VNTargetedImageRequest *)self initWithTargetedImageBuffer:v15 completionHandler:v14];

  return v16;
}

- (VNTargetedImageRequest)initWithTargetedCGImage:(CGImageRef)cgImage orientation:(CGImagePropertyOrientation)orientation options:(NSDictionary *)options completionHandler:(VNRequestCompletionHandler)completionHandler
{
  uint64_t v7 = *(void *)&orientation;
  VNRequestCompletionHandler v10 = options;
  VNRequestCompletionHandler v11 = completionHandler;
  id v12 = objc_alloc_init(VNSession);
  id v13 = [(VNTargetedImageRequest *)self initWithTargetedCGImage:cgImage orientation:v7 options:v10 session:v12 completionHandler:v11];

  return v13;
}

- (VNTargetedImageRequest)initWithTargetedCGImage:(CGImageRef)cgImage orientation:(CGImagePropertyOrientation)orientation options:(NSDictionary *)options
{
  uint64_t v5 = *(void *)&orientation;
  uint64_t v8 = options;
  uint64_t v9 = objc_alloc_init(VNSession);
  VNRequestCompletionHandler v10 = [(VNTargetedImageRequest *)self initWithTargetedCGImage:cgImage orientation:v5 options:v8 session:v9 completionHandler:0];

  return v10;
}

- (VNTargetedImageRequest)initWithTargetedCGImage:(CGImageRef)cgImage options:(NSDictionary *)options completionHandler:(VNRequestCompletionHandler)completionHandler
{
  uint64_t v8 = options;
  VNRequestCompletionHandler v9 = completionHandler;
  VNRequestCompletionHandler v10 = objc_alloc_init(VNSession);
  VNRequestCompletionHandler v11 = [(VNTargetedImageRequest *)self initWithTargetedCGImage:cgImage orientation:0 options:v8 session:v10 completionHandler:v9];

  return v11;
}

- (VNTargetedImageRequest)initWithTargetedCGImage:(CGImageRef)cgImage options:(NSDictionary *)options
{
  uint64_t v6 = options;
  uint64_t v7 = objc_alloc_init(VNSession);
  uint64_t v8 = [(VNTargetedImageRequest *)self initWithTargetedCGImage:cgImage orientation:0 options:v6 session:v7 completionHandler:0];

  return v8;
}

- (VNTargetedImageRequest)initWithTargetedCVPixelBuffer:(__CVBuffer *)a3 orientation:(unsigned int)a4 options:(id)a5 session:(id)a6 completionHandler:(id)a7
{
  uint64_t v9 = *(void *)&a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  id v15 = [[VNImageBuffer alloc] initWithCVPixelBuffer:a3 orientation:v9 options:v12 session:v13];
  v16 = [(VNTargetedImageRequest *)self initWithTargetedImageBuffer:v15 completionHandler:v14];

  return v16;
}

- (VNTargetedImageRequest)initWithTargetedCVPixelBuffer:(CVPixelBufferRef)pixelBuffer orientation:(CGImagePropertyOrientation)orientation options:(NSDictionary *)options completionHandler:(VNRequestCompletionHandler)completionHandler
{
  uint64_t v7 = *(void *)&orientation;
  VNRequestCompletionHandler v10 = options;
  VNRequestCompletionHandler v11 = completionHandler;
  id v12 = objc_alloc_init(VNSession);
  id v13 = [(VNTargetedImageRequest *)self initWithTargetedCVPixelBuffer:pixelBuffer orientation:v7 options:v10 session:v12 completionHandler:v11];

  return v13;
}

- (VNTargetedImageRequest)initWithTargetedCVPixelBuffer:(__CVBuffer *)a3 orientation:(unsigned int)a4 options:(id)a5 session:(id)a6
{
  return [(VNTargetedImageRequest *)self initWithTargetedCVPixelBuffer:a3 orientation:*(void *)&a4 options:a5 session:a6 completionHandler:0];
}

- (VNTargetedImageRequest)initWithTargetedCVPixelBuffer:(CVPixelBufferRef)pixelBuffer orientation:(CGImagePropertyOrientation)orientation options:(NSDictionary *)options
{
  uint64_t v5 = *(void *)&orientation;
  uint64_t v8 = options;
  uint64_t v9 = objc_alloc_init(VNSession);
  VNRequestCompletionHandler v10 = [(VNTargetedImageRequest *)self initWithTargetedCVPixelBuffer:pixelBuffer orientation:v5 options:v8 session:v9 completionHandler:0];

  return v10;
}

- (VNTargetedImageRequest)initWithTargetedCVPixelBuffer:(CVPixelBufferRef)pixelBuffer options:(NSDictionary *)options completionHandler:(VNRequestCompletionHandler)completionHandler
{
  uint64_t v8 = options;
  VNRequestCompletionHandler v9 = completionHandler;
  VNRequestCompletionHandler v10 = objc_alloc_init(VNSession);
  VNRequestCompletionHandler v11 = [(VNTargetedImageRequest *)self initWithTargetedCVPixelBuffer:pixelBuffer orientation:0 options:v8 session:v10 completionHandler:v9];

  return v11;
}

- (VNTargetedImageRequest)initWithTargetedCVPixelBuffer:(CVPixelBufferRef)pixelBuffer options:(NSDictionary *)options
{
  uint64_t v6 = options;
  uint64_t v7 = objc_alloc_init(VNSession);
  uint64_t v8 = [(VNTargetedImageRequest *)self initWithTargetedCVPixelBuffer:pixelBuffer orientation:0 options:v6 session:v7 completionHandler:0];

  return v8;
}

- (VNTargetedImageRequest)initWithTargetedImageBuffer:(id)a3 completionHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (v7
    && (v12.receiver = self,
        v12.super_class = (Class)VNTargetedImageRequest,
        VNRequestCompletionHandler v9 = [(VNRequest *)&v12 initWithCompletionHandler:v8],
        (self = v9) != 0))
  {
    objc_storeStrong((id *)&v9->_targetedImageBuffer, a3);
    self = self;
    VNRequestCompletionHandler v10 = self;
  }
  else
  {
    VNRequestCompletionHandler v10 = 0;
  }

  return v10;
}

+ (Class)configurationClass
{
  return (Class)objc_opt_class();
}

@end