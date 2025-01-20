@interface HMICameraVideoFrame
+ (BOOL)supportsSecureCoding;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)presentationTime;
- (BOOL)isEqual:(id)a3;
- (CGSize)size;
- (HMICameraVideoFrame)initWithCoder:(id)a3;
- (HMICameraVideoFrame)initWithJPEGData:(id)a3 presentationTime:(id *)a4 frameId:(unint64_t)a5 fragmentSequenceNumber:(unint64_t)a6 size:(CGSize)a7;
- (HMICameraVideoFrame)initWithPixelBuffer:(__CVBuffer *)a3;
- (HMICameraVideoFrame)initWithPixelBuffer:(__CVBuffer *)a3 presentationTime:(id *)a4 frameId:(unint64_t)a5 fragmentSequenceNumber:(unint64_t)a6;
- (NSArray)motionDetections;
- (NSData)jpegData;
- (NSString)description;
- (__CVBuffer)pixelBuffer;
- (unint64_t)fragmentSequenceNumber;
- (unint64_t)frameId;
- (unint64_t)hash;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setMotionDetections:(id)a3;
@end

@implementation HMICameraVideoFrame

- (HMICameraVideoFrame)initWithPixelBuffer:(__CVBuffer *)a3
{
  long long v4 = *MEMORY[0x263F010E0];
  uint64_t v5 = *(void *)(MEMORY[0x263F010E0] + 16);
  return [(HMICameraVideoFrame *)self initWithPixelBuffer:a3 presentationTime:&v4 frameId:0 fragmentSequenceNumber:0];
}

- (HMICameraVideoFrame)initWithPixelBuffer:(__CVBuffer *)a3 presentationTime:(id *)a4 frameId:(unint64_t)a5 fragmentSequenceNumber:(unint64_t)a6
{
  v15.receiver = self;
  v15.super_class = (Class)HMICameraVideoFrame;
  v10 = [(HMICameraVideoFrame *)&v15 init];
  if (v10)
  {
    v10->_pixelBuffer = CVPixelBufferRetain(a3);
    int64_t var3 = a4->var3;
    *(_OWORD *)&v10->_presentationTime.value = *(_OWORD *)&a4->var0;
    v10->_presentationTime.epoch = var3;
    v10->_frameId = a5;
    v10->_fragmentSequenceNumber = a6;
    jpegData = v10->_jpegData;
    v10->_jpegData = 0;

    v10->_size.width = HMICVPixelBufferGetSize(a3);
    v10->_size.height = v13;
  }
  return v10;
}

- (HMICameraVideoFrame)initWithJPEGData:(id)a3 presentationTime:(id *)a4 frameId:(unint64_t)a5 fragmentSequenceNumber:(unint64_t)a6 size:(CGSize)a7
{
  CGFloat height = a7.height;
  CGFloat width = a7.width;
  id v14 = a3;
  v19.receiver = self;
  v19.super_class = (Class)HMICameraVideoFrame;
  objc_super v15 = [(HMICameraVideoFrame *)&v19 init];
  v16 = v15;
  if (v15)
  {
    v15->_pixelBuffer = 0;
    long long v17 = *(_OWORD *)&a4->var0;
    v15->_presentationTime.epoch = a4->var3;
    *(_OWORD *)&v15->_presentationTime.value = v17;
    v15->_frameId = a5;
    v15->_fragmentSequenceNumber = a6;
    objc_storeStrong((id *)&v15->_jpegData, a3);
    v16->_size.CGFloat width = width;
    v16->_size.CGFloat height = height;
  }

  return v16;
}

- (void)dealloc
{
  CVPixelBufferRelease(self->_pixelBuffer);
  v3.receiver = self;
  v3.super_class = (Class)HMICameraVideoFrame;
  [(HMICameraVideoFrame *)&v3 dealloc];
}

- (NSString)description
{
  [(HMICameraVideoFrame *)self presentationTime];
  objc_super v3 = (__CFString *)CMTimeCopyDescription(0, &time);
  long long v4 = [NSString stringWithFormat:@"Frame %lu @ %@", -[HMICameraVideoFrame frameId](self, "frameId"), v3];

  return (NSString *)v4;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)presentationTime
{
  objc_copyStruct(retstr, &self->_presentationTime, 24, 1, 0);
  return result;
}

- (CGSize)size
{
  objc_copyStruct(v4, &self->_size, 16, 1, 0);
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.CGFloat height = v3;
  result.CGFloat width = v2;
  return result;
}

- (unint64_t)frameId
{
  return self->_frameId;
}

- (unint64_t)fragmentSequenceNumber
{
  return self->_fragmentSequenceNumber;
}

- (__CVBuffer)pixelBuffer
{
  return self->_pixelBuffer;
}

- (NSData)jpegData
{
  return (NSData *)objc_getProperty(self, a2, 32, 1);
}

- (NSArray)motionDetections
{
  return (NSArray *)objc_getProperty(self, a2, 40, 1);
}

- (void)setMotionDetections:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_motionDetections, 0);
  objc_storeStrong((id *)&self->_jpegData, 0);
}

- (HMICameraVideoFrame)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeIntegerForKey:@"HMICVF.fi"];
  uint64_t v6 = [v4 decodeIntegerForKey:@"HMICVF.fsn"];
  long long v16 = 0uLL;
  uint64_t v17 = 0;
  if (v4) {
    [v4 decodeCMTimeForKey:@"HMICVF.pt"];
  }
  CVPixelBufferRef pixelBufferOut = 0;
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMICVF.pb"];
  if (v7)
  {
    CVPixelBufferCreateWithIOSurface((CFAllocatorRef)*MEMORY[0x263EFFB08], v7, 0, &pixelBufferOut);
    long long v13 = v16;
    uint64_t v14 = v17;
    v8 = [(HMICameraVideoFrame *)self initWithPixelBuffer:pixelBufferOut presentationTime:&v13 frameId:v5 fragmentSequenceNumber:v6];
    if (pixelBufferOut) {
      CFRelease(pixelBufferOut);
    }
  }
  else
  {
    v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMICVF.jd"];
    unint64_t v10 = (int)[v4 decodeIntForKey:@"HMICVF.jsw"];
    int v11 = [v4 decodeIntForKey:@"HMICVF.jsh"];
    long long v13 = v16;
    uint64_t v14 = v17;
    v8 = -[HMICameraVideoFrame initWithJPEGData:presentationTime:frameId:fragmentSequenceNumber:size:](self, "initWithJPEGData:presentationTime:frameId:fragmentSequenceNumber:size:", v9, &v13, v5, v6, (double)v10, (double)(unint64_t)v11);
  }
  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[HMICameraVideoFrame frameId](self, "frameId"), @"HMICVF.fi");
  objc_msgSend(v4, "encodeInteger:forKey:", -[HMICameraVideoFrame fragmentSequenceNumber](self, "fragmentSequenceNumber"), @"HMICVF.fsn");
  [(HMICameraVideoFrame *)self presentationTime];
  [v4 encodeCMTime:v11 forKey:@"HMICVF.pt"];
  if ([(HMICameraVideoFrame *)self pixelBuffer])
  {
    uint64_t v5 = CVPixelBufferGetIOSurface([(HMICameraVideoFrame *)self pixelBuffer]);
    if (!v5)
    {
      id v10 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF498] reason:@"HMICameraVideoFrame pixel buffer is not backed by an IOSurface" userInfo:0];
      objc_exception_throw(v10);
    }
    uint64_t v6 = (void *)v5;
    [v4 encodeObject:v5 forKey:@"HMICVF.pb"];
  }
  else
  {
    v7 = [(HMICameraVideoFrame *)self jpegData];
    [v4 encodeObject:v7 forKey:@"HMICVF.jd"];

    [(HMICameraVideoFrame *)self size];
    [v4 encodeInteger:(uint64_t)v8 forKey:@"HMICVF.jsw"];
    [(HMICameraVideoFrame *)self size];
    [v4 encodeInteger:(uint64_t)v9 forKey:@"HMICVF.jsh"];
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (HMICameraVideoFrame *)a3;
  if (v4 == self)
  {
    BOOL v17 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = v4;
      unint64_t v6 = [(HMICameraVideoFrame *)self frameId];
      uint64_t v7 = [(HMICameraVideoFrame *)v5 frameId];
      unint64_t v8 = [(HMICameraVideoFrame *)self fragmentSequenceNumber];
      uint64_t v9 = [(HMICameraVideoFrame *)v5 fragmentSequenceNumber];
      [(HMICameraVideoFrame *)self size];
      double v11 = v10;
      [(HMICameraVideoFrame *)v5 size];
      double v13 = v12;
      [(HMICameraVideoFrame *)self size];
      double v15 = v14;
      [(HMICameraVideoFrame *)v5 size];
      BOOL v17 = 0;
      if (v6 == v7 && v8 == v9 && v11 == v13 && v15 == v16)
      {
        v18 = [(HMICameraVideoFrame *)self jpegData];
        if (v18)
        {
        }
        else
        {
          objc_super v19 = [(HMICameraVideoFrame *)v5 jpegData];

          if (!v19)
          {
LABEL_13:
            [(HMICameraVideoFrame *)self presentationTime];
            if (v5) {
              [(HMICameraVideoFrame *)v5 presentationTime];
            }
            else {
              memset(&v24, 0, sizeof(v24));
            }
            BOOL v17 = CMTimeCompare(&time1, &v24) == 0;
            goto LABEL_18;
          }
        }
        v20 = [(HMICameraVideoFrame *)self jpegData];
        v21 = [(HMICameraVideoFrame *)v5 jpegData];
        int v22 = [v20 isEqualToData:v21];

        if (v22) {
          goto LABEL_13;
        }
        BOOL v17 = 0;
      }
LABEL_18:

      goto LABEL_19;
    }
    BOOL v17 = 0;
  }
LABEL_19:

  return v17;
}

- (unint64_t)hash
{
  uint64_t v3 = [(HMICameraVideoFrame *)self frameId];
  uint64_t v4 = [(HMICameraVideoFrame *)self fragmentSequenceNumber];
  [(HMICameraVideoFrame *)self presentationTime];
  uint64_t v5 = HMIHashCMTime(v29);
  [(HMICameraVideoFrame *)self size];
  double v7 = -v6;
  if (v6 >= 0.0) {
    double v7 = v6;
  }
  long double v8 = floor(v7 + 0.5);
  double v9 = (v7 - v8) * 1.84467441e19;
  double v10 = fmod(v8, 1.84467441e19);
  unint64_t v11 = 2654435761u * (unint64_t)v10;
  unint64_t v12 = v11 + (unint64_t)v9;
  if (v9 <= 0.0) {
    unint64_t v12 = 2654435761u * (unint64_t)v10;
  }
  unint64_t v13 = v11 - (unint64_t)fabs(v9);
  if (v9 < 0.0) {
    unint64_t v14 = v13;
  }
  else {
    unint64_t v14 = v12;
  }
  [(HMICameraVideoFrame *)self size];
  if (v15 < 0.0) {
    double v15 = -v15;
  }
  long double v16 = floor(v15 + 0.5);
  double v17 = (v15 - v16) * 1.84467441e19;
  double v18 = fmod(v16, 1.84467441e19);
  unint64_t v19 = 2654435761u * (unint64_t)v18;
  unint64_t v20 = v19 + (unint64_t)v17;
  if (v17 <= 0.0) {
    unint64_t v20 = 2654435761u * (unint64_t)v18;
  }
  unint64_t v21 = v19 - (unint64_t)fabs(v17);
  if (v17 >= 0.0) {
    unint64_t v21 = v20;
  }
  if (v3 >= 0) {
    uint64_t v22 = v3;
  }
  else {
    uint64_t v22 = -v3;
  }
  uint64_t v23 = 2654435761 * v22;
  if (v4 >= 0) {
    uint64_t v24 = v4;
  }
  else {
    uint64_t v24 = -v4;
  }
  uint64_t v25 = (2654435761 * v24) ^ v23 ^ v21 ^ v5 ^ v14;
  v26 = [(HMICameraVideoFrame *)self jpegData];
  unint64_t v27 = v25 ^ [v26 hash];

  return v27;
}

@end