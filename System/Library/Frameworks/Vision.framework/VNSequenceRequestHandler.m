@interface VNSequenceRequestHandler
+ (void)forcedCleanup;
+ (void)forcedCleanupWithOptions:(id)a3;
+ (void)requestForcedCleanup;
+ (void)requestForcedCleanupWithOptions:(id)a3;
+ (void)requestForcedCleanupWithOptions:(id)a3 completion:(id)a4;
- (BOOL)_performRequests:(id)a3 onImageBuffer:(id)a4 gatheredForensics:(id *)a5 error:(id *)a6;
- (BOOL)performRequests:(NSArray *)requests onCGImage:(CGImageRef)image error:(NSError *)error;
- (BOOL)performRequests:(NSArray *)requests onCGImage:(CGImageRef)image orientation:(CGImagePropertyOrientation)orientation error:(NSError *)error;
- (BOOL)performRequests:(NSArray *)requests onCIImage:(CIImage *)image error:(NSError *)error;
- (BOOL)performRequests:(NSArray *)requests onCIImage:(CIImage *)image orientation:(CGImagePropertyOrientation)orientation error:(NSError *)error;
- (BOOL)performRequests:(NSArray *)requests onCMSampleBuffer:(CMSampleBufferRef)sampleBuffer error:(NSError *)error;
- (BOOL)performRequests:(NSArray *)requests onCMSampleBuffer:(CMSampleBufferRef)sampleBuffer orientation:(CGImagePropertyOrientation)orientation error:(NSError *)error;
- (BOOL)performRequests:(NSArray *)requests onCVPixelBuffer:(CVPixelBufferRef)pixelBuffer error:(NSError *)error;
- (BOOL)performRequests:(NSArray *)requests onCVPixelBuffer:(CVPixelBufferRef)pixelBuffer orientation:(CGImagePropertyOrientation)orientation error:(NSError *)error;
- (BOOL)performRequests:(NSArray *)requests onImageData:(NSData *)imageData error:(NSError *)error;
- (BOOL)performRequests:(NSArray *)requests onImageData:(NSData *)imageData orientation:(CGImagePropertyOrientation)orientation error:(NSError *)error;
- (BOOL)performRequests:(NSArray *)requests onImageURL:(NSURL *)imageURL error:(NSError *)error;
- (BOOL)performRequests:(NSArray *)requests onImageURL:(NSURL *)imageURL orientation:(CGImagePropertyOrientation)orientation error:(NSError *)error;
- (BOOL)performRequests:(id)a3 onCGImage:(CGImage *)a4 gatheredForensics:(id *)a5 error:(id *)a6;
- (BOOL)performRequests:(id)a3 onCGImage:(CGImage *)a4 orientation:(unsigned int)a5 gatheredForensics:(id *)a6 error:(id *)a7;
- (BOOL)performRequests:(id)a3 onCIImage:(id)a4 gatheredForensics:(id *)a5 error:(id *)a6;
- (BOOL)performRequests:(id)a3 onCIImage:(id)a4 orientation:(unsigned int)a5 gatheredForensics:(id *)a6 error:(id *)a7;
- (BOOL)performRequests:(id)a3 onCMSampleBuffer:(opaqueCMSampleBuffer *)a4 gatheredForensics:(id *)a5 error:(id *)a6;
- (BOOL)performRequests:(id)a3 onCMSampleBuffer:(opaqueCMSampleBuffer *)a4 orientation:(unsigned int)a5 gatheredForensics:(id *)a6 error:(id *)a7;
- (BOOL)performRequests:(id)a3 onCVPixelBuffer:(__CVBuffer *)a4 gatheredForensics:(id *)a5 error:(id *)a6;
- (BOOL)performRequests:(id)a3 onCVPixelBuffer:(__CVBuffer *)a4 orientation:(unsigned int)a5 gatheredForensics:(id *)a6 error:(id *)a7;
- (BOOL)performRequests:(id)a3 onImageData:(id)a4 gatheredForensics:(id *)a5 error:(id *)a6;
- (BOOL)performRequests:(id)a3 onImageData:(id)a4 orientation:(unsigned int)a5 gatheredForensics:(id *)a6 error:(id *)a7;
- (BOOL)performRequests:(id)a3 onImageURL:(id)a4 gatheredForensics:(id *)a5 error:(id *)a6;
- (BOOL)performRequests:(id)a3 onImageURL:(id)a4 orientation:(unsigned int)a5 gatheredForensics:(id *)a6 error:(id *)a7;
- (BOOL)prepareForPerformingRequests:(id)a3 error:(id *)a4;
- (VNSequenceRequestHandler)init;
- (VNSequenceRequestHandler)initWithSession:(id)a3;
- (VNSession)session;
- (void)dealloc;
@end

@implementation VNSequenceRequestHandler

- (BOOL)prepareForPerformingRequests:(id)a3 error:(id *)a4
{
  return [(VNSession *)self->_session prepareForPerformingRequests:a3 error:a4];
}

- (VNSequenceRequestHandler)init
{
  v3 = +[VNSession globalSession];
  v4 = [(VNSequenceRequestHandler *)self initWithSession:v3];

  return v4;
}

- (VNSequenceRequestHandler)initWithSession:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)VNSequenceRequestHandler;
  v6 = [(VNSequenceRequestHandler *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_session, a3);
    v8 = objc_alloc_init(VNRequestPerformer);
    requestPerformer = v7->_requestPerformer;
    v7->_requestPerformer = v8;
  }
  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestPerformer, 0);

  objc_storeStrong((id *)&self->_session, 0);
}

- (VNSession)session
{
  return self->_session;
}

- (BOOL)performRequests:(id)a3 onCMSampleBuffer:(opaqueCMSampleBuffer *)a4 orientation:(unsigned int)a5 gatheredForensics:(id *)a6 error:(id *)a7
{
  uint64_t v9 = *(void *)&a5;
  id v12 = a3;
  v13 = [[VNImageBuffer alloc] initWithCMSampleBuffer:a4 orientation:v9 options:0 session:self->_session];
  if (v13)
  {
    BOOL v14 = [(VNSequenceRequestHandler *)self _performRequests:v12 onImageBuffer:v13 gatheredForensics:a6 error:a7];
  }
  else if (a7)
  {
    +[VNError errorForInvalidArgument:0 named:@"data"];
    BOOL v14 = 0;
    *a7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

- (BOOL)performRequests:(NSArray *)requests onCMSampleBuffer:(CMSampleBufferRef)sampleBuffer orientation:(CGImagePropertyOrientation)orientation error:(NSError *)error
{
  return [(VNSequenceRequestHandler *)self performRequests:requests onCMSampleBuffer:sampleBuffer orientation:*(void *)&orientation gatheredForensics:0 error:error];
}

- (BOOL)performRequests:(id)a3 onCMSampleBuffer:(opaqueCMSampleBuffer *)a4 gatheredForensics:(id *)a5 error:(id *)a6
{
  return [(VNSequenceRequestHandler *)self performRequests:a3 onCMSampleBuffer:a4 orientation:0 gatheredForensics:a5 error:a6];
}

- (BOOL)performRequests:(NSArray *)requests onCMSampleBuffer:(CMSampleBufferRef)sampleBuffer error:(NSError *)error
{
  return [(VNSequenceRequestHandler *)self performRequests:requests onCMSampleBuffer:sampleBuffer orientation:0 gatheredForensics:0 error:error];
}

- (BOOL)performRequests:(id)a3 onImageData:(id)a4 orientation:(unsigned int)a5 gatheredForensics:(id *)a6 error:(id *)a7
{
  uint64_t v9 = *(void *)&a5;
  id v12 = a3;
  id v13 = a4;
  BOOL v14 = [[VNImageBuffer alloc] initWithData:v13 orientation:v9 options:0 session:self->_session];
  if (v14)
  {
    BOOL v15 = [(VNSequenceRequestHandler *)self _performRequests:v12 onImageBuffer:v14 gatheredForensics:a6 error:a7];
  }
  else if (a7)
  {
    +[VNError errorForInvalidArgument:0 named:@"data"];
    BOOL v15 = 0;
    *a7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v15 = 0;
  }

  return v15;
}

- (BOOL)performRequests:(NSArray *)requests onImageData:(NSData *)imageData orientation:(CGImagePropertyOrientation)orientation error:(NSError *)error
{
  return [(VNSequenceRequestHandler *)self performRequests:requests onImageData:imageData orientation:*(void *)&orientation gatheredForensics:0 error:error];
}

- (BOOL)performRequests:(id)a3 onImageData:(id)a4 gatheredForensics:(id *)a5 error:(id *)a6
{
  return [(VNSequenceRequestHandler *)self performRequests:a3 onImageData:a4 orientation:0 gatheredForensics:a5 error:a6];
}

- (BOOL)performRequests:(NSArray *)requests onImageData:(NSData *)imageData error:(NSError *)error
{
  return [(VNSequenceRequestHandler *)self performRequests:requests onImageData:imageData orientation:0 gatheredForensics:0 error:error];
}

- (BOOL)performRequests:(id)a3 onImageURL:(id)a4 orientation:(unsigned int)a5 gatheredForensics:(id *)a6 error:(id *)a7
{
  uint64_t v9 = *(void *)&a5;
  id v12 = a3;
  id v13 = a4;
  BOOL v14 = [[VNImageBuffer alloc] initWithURL:v13 orientation:v9 options:0 session:self->_session];
  if (v14)
  {
    BOOL v15 = [(VNSequenceRequestHandler *)self _performRequests:v12 onImageBuffer:v14 gatheredForensics:a6 error:a7];
  }
  else if (a7)
  {
    +[VNError errorForInvalidArgument:0 named:@"url"];
    BOOL v15 = 0;
    *a7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v15 = 0;
  }

  return v15;
}

- (BOOL)performRequests:(NSArray *)requests onImageURL:(NSURL *)imageURL orientation:(CGImagePropertyOrientation)orientation error:(NSError *)error
{
  return [(VNSequenceRequestHandler *)self performRequests:requests onImageURL:imageURL orientation:*(void *)&orientation gatheredForensics:0 error:error];
}

- (BOOL)performRequests:(id)a3 onImageURL:(id)a4 gatheredForensics:(id *)a5 error:(id *)a6
{
  return [(VNSequenceRequestHandler *)self performRequests:a3 onImageURL:a4 orientation:0 gatheredForensics:a5 error:a6];
}

- (BOOL)performRequests:(NSArray *)requests onImageURL:(NSURL *)imageURL error:(NSError *)error
{
  return [(VNSequenceRequestHandler *)self performRequests:requests onImageURL:imageURL orientation:0 gatheredForensics:0 error:error];
}

- (BOOL)performRequests:(id)a3 onCIImage:(id)a4 orientation:(unsigned int)a5 gatheredForensics:(id *)a6 error:(id *)a7
{
  uint64_t v9 = *(void *)&a5;
  id v12 = a3;
  id v13 = a4;
  BOOL v14 = [[VNImageBuffer alloc] initWithCIImage:v13 orientation:v9 options:0 session:self->_session];
  if (v14)
  {
    BOOL v15 = [(VNSequenceRequestHandler *)self _performRequests:v12 onImageBuffer:v14 gatheredForensics:a6 error:a7];
  }
  else if (a7)
  {
    +[VNError errorForInvalidArgument:0 named:@"ciImage"];
    BOOL v15 = 0;
    *a7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v15 = 0;
  }

  return v15;
}

- (BOOL)performRequests:(NSArray *)requests onCIImage:(CIImage *)image orientation:(CGImagePropertyOrientation)orientation error:(NSError *)error
{
  return [(VNSequenceRequestHandler *)self performRequests:requests onCIImage:image orientation:*(void *)&orientation gatheredForensics:0 error:error];
}

- (BOOL)performRequests:(id)a3 onCIImage:(id)a4 gatheredForensics:(id *)a5 error:(id *)a6
{
  return [(VNSequenceRequestHandler *)self performRequests:a3 onCIImage:a4 orientation:0 gatheredForensics:a5 error:a6];
}

- (BOOL)performRequests:(NSArray *)requests onCIImage:(CIImage *)image error:(NSError *)error
{
  return [(VNSequenceRequestHandler *)self performRequests:requests onCIImage:image orientation:0 gatheredForensics:0 error:error];
}

- (BOOL)performRequests:(id)a3 onCGImage:(CGImage *)a4 orientation:(unsigned int)a5 gatheredForensics:(id *)a6 error:(id *)a7
{
  uint64_t v9 = *(void *)&a5;
  id v12 = a3;
  id v13 = [[VNImageBuffer alloc] initWithCGImage:a4 orientation:v9 options:0 session:self->_session];
  if (v13)
  {
    BOOL v14 = [(VNSequenceRequestHandler *)self _performRequests:v12 onImageBuffer:v13 gatheredForensics:a6 error:a7];
  }
  else if (a7)
  {
    +[VNError errorForInvalidArgument:0 named:@"cgImage"];
    BOOL v14 = 0;
    *a7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

- (BOOL)performRequests:(NSArray *)requests onCGImage:(CGImageRef)image orientation:(CGImagePropertyOrientation)orientation error:(NSError *)error
{
  return [(VNSequenceRequestHandler *)self performRequests:requests onCGImage:image orientation:*(void *)&orientation gatheredForensics:0 error:error];
}

- (BOOL)performRequests:(id)a3 onCGImage:(CGImage *)a4 gatheredForensics:(id *)a5 error:(id *)a6
{
  return [(VNSequenceRequestHandler *)self performRequests:a3 onCGImage:a4 orientation:0 gatheredForensics:a5 error:a6];
}

- (BOOL)performRequests:(NSArray *)requests onCGImage:(CGImageRef)image error:(NSError *)error
{
  return [(VNSequenceRequestHandler *)self performRequests:requests onCGImage:image orientation:0 gatheredForensics:0 error:error];
}

- (BOOL)performRequests:(id)a3 onCVPixelBuffer:(__CVBuffer *)a4 orientation:(unsigned int)a5 gatheredForensics:(id *)a6 error:(id *)a7
{
  uint64_t v9 = *(void *)&a5;
  id v12 = a3;
  id v13 = [[VNImageBuffer alloc] initWithCVPixelBuffer:a4 orientation:v9 options:0 session:self->_session];
  if (v13)
  {
    BOOL v14 = [(VNSequenceRequestHandler *)self _performRequests:v12 onImageBuffer:v13 gatheredForensics:a6 error:a7];
  }
  else if (a7)
  {
    +[VNError errorForInvalidArgument:0 named:@"pixelBuffer"];
    BOOL v14 = 0;
    *a7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

- (BOOL)performRequests:(NSArray *)requests onCVPixelBuffer:(CVPixelBufferRef)pixelBuffer orientation:(CGImagePropertyOrientation)orientation error:(NSError *)error
{
  return [(VNSequenceRequestHandler *)self performRequests:requests onCVPixelBuffer:pixelBuffer orientation:*(void *)&orientation gatheredForensics:0 error:error];
}

- (BOOL)performRequests:(id)a3 onCVPixelBuffer:(__CVBuffer *)a4 gatheredForensics:(id *)a5 error:(id *)a6
{
  return [(VNSequenceRequestHandler *)self performRequests:a3 onCVPixelBuffer:a4 orientation:0 gatheredForensics:a5 error:a6];
}

- (BOOL)performRequests:(NSArray *)requests onCVPixelBuffer:(CVPixelBufferRef)pixelBuffer error:(NSError *)error
{
  return [(VNSequenceRequestHandler *)self performRequests:requests onCVPixelBuffer:pixelBuffer orientation:0 gatheredForensics:0 error:error];
}

- (void)dealloc
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  [(VNRequestPerformer *)self->_requestPerformer getCurrentTrackersAndReset];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v3);
        }
        [(VNSession *)self->_session releaseTracker:*(void *)(*((void *)&v8 + 1) + 8 * v6++)];
      }
      while (v4 != v6);
      uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }

  v7.receiver = self;
  v7.super_class = (Class)VNSequenceRequestHandler;
  [(VNSequenceRequestHandler *)&v7 dealloc];
}

- (BOOL)_performRequests:(id)a3 onImageBuffer:(id)a4 gatheredForensics:(id *)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  if (v11)
  {
    id v12 = (void *)MEMORY[0x1A6257080]();
    if (a5)
    {
      uint64_t v13 = [[VNRequestForensics alloc] initWithOriginalRequests:v10];
      *a5 = v13;
    }
    else
    {
      uint64_t v13 = 0;
    }
    BOOL v15 = objc_alloc_init(VNObservationsCache);
    v16 = [[VNRequestPerformingContext alloc] initWithSession:self->_session requestPerformer:self->_requestPerformer imageBuffer:v11 forensics:v13 observationsCache:v15];
    [(VNRequestPerformingContext *)v16 qosClass];
    requestPerformer = self->_requestPerformer;
    id v20 = 0;
    BOOL v14 = [(VNRequestPerformer *)requestPerformer performRequests:v10 inContext:v16 error:&v20];
    id v18 = v20;

    if (a6) {
      *a6 = v18;
    }
  }
  else if (a6)
  {
    +[VNError errorForInvalidArgumentWithLocalizedDescription:@"no image buffer available"];
    BOOL v14 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

+ (void)forcedCleanupWithOptions:(id)a3
{
  id v4 = a3;
  id v3 = +[VNSession globalSession];
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
  id v3 = +[VNSession globalSession];
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