@interface HMIVideoFrame
+ (BOOL)supportsSecureCoding;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)presentationTimeStamp;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)time;
- (CGSize)size;
- (HMIVideoFrame)initWithCoder:(id)a3;
- (HMIVideoFrame)initWithJPEGData:(id)a3 size:(CGSize)a4 presentationTimeStamp:(id *)a5;
- (HMIVideoFrame)initWithPixelBuffer:(__CVBuffer *)a3 presentationTimeStamp:(id *)a4;
- (HMIVideoFrame)initWithSampleBuffer:(opaqueCMSampleBuffer *)a3;
- (NSData)data;
- (__CVBuffer)pixelBuffer;
- (id)attributeDescriptions;
- (id)base64Encoded;
- (id)compressedFrameWithScale:(double)a3 quality:(double)a4 error:(id *)a5;
- (id)pixelBufferFrameWithError:(id *)a3;
- (id)redactedCopy;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)printWithHeight:(unint64_t)a3;
- (void)printWithScale:(double)a3;
@end

@implementation HMIVideoFrame

- (HMIVideoFrame)initWithJPEGData:(id)a3 size:(CGSize)a4 presentationTimeStamp:(id *)a5
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  id v10 = a3;
  if (v10)
  {
    v11 = v10;
    v20.receiver = self;
    v20.super_class = (Class)HMIVideoFrame;
    v12 = [(HMIVideoFrame *)&v20 init];
    v13 = v12;
    if (v12)
    {
      int64_t var3 = a5->var3;
      *(_OWORD *)&v12->_presentationTimeStamp.value = *(_OWORD *)&a5->var0;
      v12->_presentationTimeStamp.epoch = var3;
      objc_storeStrong((id *)&v12->_data, a3);
      v13->_size.CGFloat width = width;
      v13->_size.CGFloat height = height;
      v13->_store = 1;
    }

    return v13;
  }
  else
  {
    v16 = (HMIVideoFrame *)_HMFPreconditionFailure();
    return [(HMIVideoFrame *)v16 initWithPixelBuffer:v18 presentationTimeStamp:v19];
  }
}

- (HMIVideoFrame)initWithPixelBuffer:(__CVBuffer *)a3 presentationTimeStamp:(id *)a4
{
  v11.receiver = self;
  v11.super_class = (Class)HMIVideoFrame;
  v6 = [(HMIVideoFrame *)&v11 init];
  v7 = v6;
  if (v6)
  {
    int64_t var3 = a4->var3;
    *(_OWORD *)&v6->_presentationTimeStamp.value = *(_OWORD *)&a4->var0;
    v6->_presentationTimeStamp.epoch = var3;
    v6->_size.CGFloat width = HMICVPixelBufferGetSize(a3);
    v7->_size.CGFloat height = v9;
    v7->_pixelBuffer = (__CVBuffer *)CFRetain(a3);
    v7->_store = 0;
  }
  return v7;
}

- (HMIVideoFrame)initWithSampleBuffer:(opaqueCMSampleBuffer *)a3
{
  CVImageBufferRef ImageBuffer = CMSampleBufferGetImageBuffer(a3);
  CMSampleBufferGetPresentationTimeStamp(&v7, a3);
  return [(HMIVideoFrame *)self initWithPixelBuffer:ImageBuffer presentationTimeStamp:&v7];
}

- (id)redactedCopy
{
  id v3 = objc_alloc((Class)objc_opt_class());
  v4 = [MEMORY[0x263EFF8F8] data];
  [(HMIVideoFrame *)self size];
  double v6 = v5;
  double v8 = v7;
  [(HMIVideoFrame *)self presentationTimeStamp];
  CGFloat v9 = objc_msgSend(v3, "initWithJPEGData:size:presentationTimeStamp:", v4, v11, v6, v8);

  return v9;
}

- (id)base64Encoded
{
  v2 = [(HMIVideoFrame *)self data];
  id v3 = [v2 base64EncodedStringWithOptions:32];

  return v3;
}

- (id)compressedFrameWithScale:(double)a3 quality:(double)a4 error:(id *)a5
{
  BOOL v8 = a3 <= 0.0;
  double v7 = 1.0;
  BOOL v8 = v8 || a3 > 1.0;
  if (v8)
  {
    _HMFPreconditionFailure();
LABEL_31:
    v31 = (HMIVideoFrame *)_HMFPreconditionFailure();
    return [(HMIVideoFrame *)v31 pixelBufferFrameWithError:v33];
  }
  double v9 = a4;
  if (a4 <= 0.0 || a4 > 1.0) {
    goto LABEL_31;
  }
  int64_t store = self->_store;
  if (store != 1)
  {
    if (!store)
    {
      *(float *)&double v7 = a3;
      *(float *)&a4 = a4;
      v14 = +[HMIVisionUtilities createJPEGDataFromPixelBuffer:self->_pixelBuffer scale:a5 encodeQuality:v7 error:a4];
      if (v14)
      {
        double Size = HMICVPixelBufferGetSize(self->_pixelBuffer);
        double v17 = v16;
        CGAffineTransformMakeScale(&v37, a3, a3);
        double v18 = v17 * v37.c + v37.a * Size;
        double v19 = v17 * v37.d + v37.b * Size;
        id v20 = objc_alloc((Class)objc_opt_class());
        long long v35 = *(_OWORD *)&self->_presentationTimeStamp.value;
        int64_t epoch = self->_presentationTimeStamp.epoch;
        double v5 = objc_msgSend(v20, "initWithJPEGData:size:presentationTimeStamp:", v14, &v35, v18, v19);
      }
      else
      {
        double v5 = 0;
      }
    }
    goto LABEL_27;
  }
  if (a3 == 1.0 && a4 == 1.0)
  {
    v24 = self;
  }
  else
  {
    if ([(NSData *)self->_data length])
    {
      v22 = [(HMIVideoFrame *)self pixelBufferFrameWithError:a5];
      v23 = v22;
      if (v22)
      {
        double v5 = [v22 compressedFrameWithScale:a5 quality:a3 error:v9];
      }
      else
      {
        double v5 = 0;
      }

      goto LABEL_27;
    }
    CGAffineTransformMakeScale(&v34, a3, a3);
    double height = self->_size.height;
    double v26 = height * v34.c + v34.a * self->_size.width;
    double v27 = height * v34.d + v34.b * self->_size.width;
    id v28 = objc_alloc((Class)objc_opt_class());
    data = self->_data;
    long long v35 = *(_OWORD *)&self->_presentationTimeStamp.value;
    int64_t epoch = self->_presentationTimeStamp.epoch;
    v24 = (HMIVideoFrame *)objc_msgSend(v28, "initWithJPEGData:size:presentationTimeStamp:", data, &v35, v26, v27);
  }
  double v5 = v24;
LABEL_27:
  return v5;
}

- (id)pixelBufferFrameWithError:(id *)a3
{
  if ([(HMIVideoFrame *)self pixelBuffer])
  {
    double v5 = self;
  }
  else
  {
    double v6 = +[HMIVisionUtilities createPixelBufferFromImageData:self->_data error:a3];
    if (v6)
    {
      double v7 = v6;
      id v8 = objc_alloc((Class)objc_opt_class());
      [(HMIVideoFrame *)self presentationTimeStamp];
      double v5 = (HMIVideoFrame *)[v8 initWithPixelBuffer:v7 presentationTimeStamp:v10];
      CVPixelBufferRelease(v7);
    }
    else
    {
      double v5 = 0;
    }
  }
  return v5;
}

- (NSData)data
{
  data = self->_data;
  if (!data)
  {
    id v11 = 0;
    v4 = [(HMIVideoFrame *)self compressedFrameWithScale:&v11 quality:1.0 error:1.0];
    id v5 = v11;
    if (!v4)
    {
      id v10 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF498] reason:@"HMIVideoFrame failed to create compressed representation." userInfo:0];
      objc_exception_throw(v10);
    }
    double v6 = v5;
    double v7 = [v4 data];
    id v8 = self->_data;
    self->_data = v7;

    data = self->_data;
  }
  return data;
}

- (void)printWithHeight:(unint64_t)a3
{
  double v4 = (double)a3;
  [(HMIVideoFrame *)self size];
  [(HMIVideoFrame *)self printWithScale:v4 / v5];
}

- (void)printWithScale:(double)a3
{
  id v10 = [(HMIVideoFrame *)self compressedFrameWithScale:0 quality:fmax(fmin(a3, 1.0), 0.1) error:1.0];
  id v3 = [NSString alloc];
  double v4 = [v10 data];
  double v5 = [v4 base64EncodedDataWithOptions:1];
  double v6 = (void *)[v3 initWithData:v5 encoding:4];

  objc_msgSend(NSString, "stringWithFormat:", @"\x1B]1337;File=inline=1;preserveAspectRatio=1:%@\a",
  double v7 = v6);
  id v8 = (FILE *)*MEMORY[0x263EF8358];
  id v9 = v7;
  fprintf(v8, "%s\n", (const char *)[v9 UTF8String]);
}

- (void)dealloc
{
  pixelBuffer = self->_pixelBuffer;
  if (pixelBuffer) {
    CFRelease(pixelBuffer);
  }
  v4.receiver = self;
  v4.super_class = (Class)HMIVideoFrame;
  [(HMIVideoFrame *)&v4 dealloc];
}

- (id)attributeDescriptions
{
  v16[3] = *MEMORY[0x263EF8340];
  if (self->_store == 1) {
    id v3 = @"Data (JPEG)";
  }
  else {
    id v3 = @"CVPixelBuffer";
  }
  objc_super v4 = (objc_class *)MEMORY[0x263F424F8];
  double v5 = v3;
  id v6 = [v4 alloc];
  $95D729B680665BEAEFA1D6FCA8238556 presentationTimeStamp = self->_presentationTimeStamp;
  double v7 = HMICMTimeDescription((CMTime *)&presentationTimeStamp);
  id v8 = (void *)[v6 initWithName:@"Presentation Time Stamp" value:v7];
  v16[0] = v8;
  id v9 = objc_alloc(MEMORY[0x263F424F8]);
  id v10 = HMICGSizeDescription(self->_size.width, self->_size.height);
  id v11 = (void *)[v9 initWithName:@"Size" value:v10];
  v16[1] = v11;
  v12 = (void *)[objc_alloc(MEMORY[0x263F424F8]) initWithName:@"Store" value:v5];

  v16[2] = v12;
  v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:3];

  return v13;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)time
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = ($95D729B680665BEAEFA1D6FCA8238556)self[2];
  return self;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HMIVideoFrame)initWithCoder:(id)a3
{
  id v4 = a3;
  long long v22 = 0uLL;
  uint64_t v23 = 0;
  double v5 = NSStringFromSelector(sel_presentationTimeStamp);
  if (v4)
  {
    [v4 decodeCMTimeForKey:v5];
  }
  else
  {
    long long v22 = 0uLL;
    uint64_t v23 = 0;
  }

  uint64_t v6 = objc_opt_class();
  double v7 = NSStringFromSelector(sel_surface);
  id v8 = [v4 decodeObjectOfClass:v6 forKey:v7];

  if (v8)
  {
    CVPixelBufferRef pixelBufferOut = 0;
    CVPixelBufferCreateWithIOSurface((CFAllocatorRef)*MEMORY[0x263EFFB08], v8, 0, &pixelBufferOut);
    long long v19 = v22;
    uint64_t v20 = v23;
    id v9 = [(HMIVideoFrame *)self initWithPixelBuffer:pixelBufferOut presentationTimeStamp:&v19];
    if (pixelBufferOut) {
      CFRelease(pixelBufferOut);
    }
  }
  else
  {
    uint64_t v10 = objc_opt_class();
    id v11 = NSStringFromSelector(sel_data);
    v12 = [v4 decodeObjectOfClass:v10 forKey:v11];

    v13 = NSStringFromSelector(sel_size);
    [v4 decodeSizeForKey:v13];
    double v15 = v14;
    double v17 = v16;

    long long v19 = v22;
    uint64_t v20 = v23;
    id v9 = -[HMIVideoFrame initWithJPEGData:size:presentationTimeStamp:](self, "initWithJPEGData:size:presentationTimeStamp:", v12, &v19, v15, v17);
  }
  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  double v5 = NSStringFromSelector(sel_presentationTimeStamp);
  $95D729B680665BEAEFA1D6FCA8238556 presentationTimeStamp = self->_presentationTimeStamp;
  [v4 encodeCMTime:&presentationTimeStamp forKey:v5];

  int64_t store = self->_store;
  if (store == 1)
  {
    data = self->_data;
    id v11 = NSStringFromSelector(sel_data);
    [v4 encodeObject:data forKey:v11];

    double width = self->_size.width;
    double height = self->_size.height;
    id v8 = NSStringFromSelector(sel_size);
    objc_msgSend(v4, "encodeSize:forKey:", v8, width, height);
LABEL_6:

    goto LABEL_7;
  }
  if (!store)
  {
    uint64_t v7 = CVPixelBufferGetIOSurface(self->_pixelBuffer);
    if (!v7)
    {
      id v14 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF498] reason:@"HMIVideoFrame pixel buffer is not backed by an IOSurface" userInfo:0];
      objc_exception_throw(v14);
    }
    id v8 = (void *)v7;
    id v9 = NSStringFromSelector(sel_surface);
    [v4 encodeObject:v8 forKey:v9];

    goto LABEL_6;
  }
LABEL_7:
}

- (CGSize)size
{
  objc_copyStruct(v4, &self->_size, 16, 1, 0);
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.double height = v3;
  result.double width = v2;
  return result;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)presentationTimeStamp
{
  objc_copyStruct(retstr, &self->_presentationTimeStamp, 24, 1, 0);
  return result;
}

- (__CVBuffer)pixelBuffer
{
  return self->_pixelBuffer;
}

- (void).cxx_destruct
{
}

@end