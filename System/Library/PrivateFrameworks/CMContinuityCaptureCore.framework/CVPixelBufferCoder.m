@interface CVPixelBufferCoder
+ (BOOL)supportsSecureCoding;
+ (void)initialize;
- (BOOL)transferSourceMedia;
- (CVPixelBufferCoder)initWithCVPixelBuffer:(__CVBuffer *)a3;
- (CVPixelBufferCoder)initWithCoder:(id)a3;
- (NSString)mediaName;
- (__CVBuffer)_createPixelBufferForImage:(id)a3 fillWidth:(int64_t)a4 fillHeight:(int64_t)a5;
- (__CVBuffer)pixelBuffer;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setMediaName:(id)a3;
- (void)setTransferSourceMedia:(BOOL)a3;
@end

@implementation CVPixelBufferCoder

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    FigNote_AllowInternalDefaultLogs();
    fig_note_initialize_category_with_default_work_cf();
    fig_note_initialize_category_with_default_work_cf();
  }
}

- (void)dealloc
{
  pixelBuffer = self->_pixelBuffer;
  if (pixelBuffer)
  {
    CFRelease(pixelBuffer);
    self->_pixelBuffer = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)CVPixelBufferCoder;
  [(CVPixelBufferCoder *)&v4 dealloc];
}

- (CVPixelBufferCoder)initWithCVPixelBuffer:(__CVBuffer *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CVPixelBufferCoder;
  objc_super v4 = [(CVPixelBufferCoder *)&v8 init];
  v5 = v4;
  v6 = 0;
  if (a3 && v4)
  {
    v4->_pixelBuffer = (__CVBuffer *)CFRetain(a3);
    v5->_transferSourceMedia = 1;
    v6 = v5;
  }

  return v6;
}

- (CVPixelBufferCoder)initWithCoder:(id)a3
{
  v44[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v42.receiver = self;
  v42.super_class = (Class)CVPixelBufferCoder;
  v5 = [(CVPixelBufferCoder *)&v42 init];
  if (!v5)
  {
    v11 = 0;
    goto LABEL_38;
  }
  v6 = v5;
  CMBlockBufferRef blockBufferOut = 0;
  CVPixelBufferRef pixelBufferOut = 0;
  uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PixelBufferSourceMediaName"];
  mediaName = v6->_mediaName;
  v6->_mediaName = (NSString *)v7;

  v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PixelBufferSourceMedia"];
  if (v9)
  {
    v10 = [MEMORY[0x263F00650] imageWithData:v9];
    v6->_pixelBuffer = [(CVPixelBufferCoder *)v6 _createPixelBufferForImage:v10 fillWidth:1920 fillHeight:1080];

    v6->_transferSourceMedia = 1;
  }
  else
  {
    v6->_transferSourceMedia = 0;
    size_t dataLength = 0;
    id v12 = v4;
    v13 = (void *)[v12 decodeBytesForKey:@"PixelBufferAtomData" returnedLength:&dataLength];
    if (v13)
    {
      if (CMBlockBufferCreateWithMemoryBlock((CFAllocatorRef)*MEMORY[0x263EFFB08], v13, dataLength, (CFAllocatorRef)*MEMORY[0x263EFFB28], 0, 0, dataLength, 0, &blockBufferOut)|| FigRemote_CreatePixelBufferFromSerializedAtomDataBlockBuffer())
      {
        goto LABEL_31;
      }
      CFDictionaryRef v14 = [MEMORY[0x263F00650] imageWithCVPixelBuffer:pixelBufferOut];
      v6->_pixelBuffer = [(CVPixelBufferCoder *)v6 _createPixelBufferForImage:v14 fillWidth:1920 fillHeight:1080];
    }
    else
    {
      size_t v15 = [v12 decodeInt64ForKey:@"PixelBufferWidth"];
      size_t v16 = [v12 decodeInt64ForKey:@"PixelBufferHeight"];
      OSType v17 = [v12 decodeInt32ForKey:@"PixelBufferFormat"];
      uint64_t v18 = *MEMORY[0x263F04130];
      v43[0] = *MEMORY[0x263F04128];
      v43[1] = v18;
      v44[0] = MEMORY[0x263EFFA88];
      v44[1] = MEMORY[0x263EFFA78];
      CFDictionaryRef v14 = [NSDictionary dictionaryWithObjects:v44 forKeys:v43 count:2];
      if (CVPixelBufferCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], v15, v16, v17, v14, &pixelBufferOut))
      {
        if (pixelBufferOut)
        {
          CFRelease(pixelBufferOut);
          CVPixelBufferRef pixelBufferOut = 0;
        }
      }
      else if (pixelBufferOut)
      {
        CFDictionaryRef v34 = v14;
        id v35 = v4;
        uint64_t v38 = 0;
        id v19 = v12;
        uint64_t v36 = [v19 decodeBytesForKey:@"PixelBufferData" returnedLength:&v38];
        if (v36)
        {
          uint64_t v37 = v38;
          if (v38)
          {
            v20 = [v19 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"PixelBufferLayout"];
            unint64_t v21 = (unint64_t)[v20 count] >> 1;
            if (CVPixelBufferGetPlaneCount(pixelBufferOut) == (int)v21)
            {
              CVPixelBufferLockBaseAddress(pixelBufferOut, 0);
              if (CVPixelBufferGetPlaneCount(pixelBufferOut))
              {
                size_t v22 = 0;
                while (1)
                {
                  v23 = [v20 objectAtIndexedSubscript:2 * v22];
                  uint64_t v24 = [v23 unsignedIntegerValue];

                  v25 = [v20 objectAtIndexedSubscript:(2 * v22) | 1];
                  unint64_t v26 = [v25 unsignedIntegerValue];

                  BaseAddressOfPlane = (char *)CVPixelBufferGetBaseAddressOfPlane(pixelBufferOut, v22);
                  size_t BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(pixelBufferOut, v22);
                  size_t HeightOfPlane = CVPixelBufferGetHeightOfPlane(pixelBufferOut, v22);
                  if (v24 < 1) {
                    break;
                  }
                  if (v24 > v37) {
                    break;
                  }
                  size_t v30 = HeightOfPlane;
                  v31 = (char *)(v36 + v24);
                  if ((unint64_t)&v31[HeightOfPlane * v26] > v36 + v37) {
                    break;
                  }
                  if (v26 == BytesPerRowOfPlane)
                  {
                    memcpy(BaseAddressOfPlane, v31, HeightOfPlane * v26);
                  }
                  else
                  {
                    if (v26 >= BytesPerRowOfPlane) {
                      size_t v32 = BytesPerRowOfPlane;
                    }
                    else {
                      size_t v32 = v26;
                    }
                    if (HeightOfPlane)
                    {
                      do
                      {
                        memcpy(BaseAddressOfPlane, v31, v32);
                        BaseAddressOfPlane += BytesPerRowOfPlane;
                        v31 += v26;
                        --v30;
                      }
                      while (v30);
                    }
                  }
                  if (CVPixelBufferGetPlaneCount(pixelBufferOut) <= ++v22) {
                    goto LABEL_27;
                  }
                }
              }
              else
              {
LABEL_27:
                CVPixelBufferUnlockBaseAddress(pixelBufferOut, 0);
                v6->_pixelBuffer = pixelBufferOut;
                CVPixelBufferRef pixelBufferOut = 0;
              }
            }
          }
        }
        v9 = 0;
        id v4 = v35;
        CFDictionaryRef v14 = v34;
      }
    }
  }
LABEL_31:
  if (pixelBufferOut) {
    CFRelease(pixelBufferOut);
  }
  if (blockBufferOut) {
    CFRelease(blockBufferOut);
  }
  if (!v6->_pixelBuffer)
  {

    v6 = 0;
  }
  v11 = v6;

LABEL_38:
  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = CMGetAttachment(self->_pixelBuffer, @"preference-image-url", 0);
  v6 = v5;
  mediaName = self->_mediaName;
  if (mediaName)
  {
    objc_super v8 = mediaName;
LABEL_4:
    [v4 encodeObject:v8 forKey:@"PixelBufferSourceMediaName"];
    goto LABEL_5;
  }
  objc_super v8 = [v5 lastPathComponent];
  if (v8) {
    goto LABEL_4;
  }
LABEL_5:
  if (self->_transferSourceMedia && v6)
  {
    v9 = [MEMORY[0x263EFF8F8] dataWithContentsOfURL:v6];
    v10 = v9;
    if (v9 && [v9 length])
    {
      [v4 encodeObject:v10 forKey:@"PixelBufferSourceMedia"];

      goto LABEL_21;
    }
  }
  CMBlockBufferRef theBuffer = 0;
  CFAllocatorRef v11 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  if (!FigRemote_CreateSerializedAtomDataBlockBufferForPixelBuffer())
  {
    int IsRangeContiguous = CMBlockBufferIsRangeContiguous(theBuffer, 0, 0);
    v13 = theBuffer;
    if (IsRangeContiguous)
    {
LABEL_17:
      size_t v14 = 0;
      dataPointerOut = 0;
      if (!CMBlockBufferGetDataPointer(v13, 0, 0, &v14, &dataPointerOut)) {
        [v4 encodeBytes:dataPointerOut length:v14 forKey:@"PixelBufferAtomData"];
      }
      goto LABEL_19;
    }
    CMBlockBufferRef blockBufferOut = 0;
    if (!CMBlockBufferCreateContiguous(v11, theBuffer, v11, 0, 0, 0, 0, &blockBufferOut))
    {
      if (theBuffer) {
        CFRelease(theBuffer);
      }
      v13 = blockBufferOut;
      CMBlockBufferRef theBuffer = blockBufferOut;
      goto LABEL_17;
    }
  }
LABEL_19:
  if (theBuffer) {
    CFRelease(theBuffer);
  }
LABEL_21:
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (__CVBuffer)_createPixelBufferForImage:(id)a3 fillWidth:(int64_t)a4 fillHeight:(int64_t)a5
{
  v33[2] = *MEMORY[0x263EF8340];
  uint64_t v7 = (__CVBuffer *)a3;
  objc_super v8 = v7;
  CVPixelBufferRef pixelBufferOut = 0;
  if (!v7) {
    goto LABEL_11;
  }
  [(__CVBuffer *)v7 extent];
  double v10 = v9;
  [(__CVBuffer *)v8 extent];
  double v12 = v11;
  double v13 = (double)a5 / v10;
  if ((double)a4 / v12 >= v13) {
    double v13 = (double)a4 / v12;
  }
  if (v13 >= 1.0) {
    goto LABEL_6;
  }
  double v14 = round(v10 * v13 * 0.5);
  double v10 = v14 + v14;
  double v15 = round(v12 * v13 * 0.5);
  double v12 = v15 + v15;
  *(void *)&long long v16 = -1;
  *((void *)&v16 + 1) = -1;
  *(_OWORD *)&v28.c = v16;
  *(_OWORD *)&v28.tx = v16;
  *(_OWORD *)&v28.a = v16;
  CGAffineTransformMakeScale(&v28, (double)a4 / v12, (double)a5 / (v14 + v14));
  CGAffineTransform v27 = v28;
  OSType v17 = [(__CVBuffer *)v8 imageByApplyingTransform:&v27];

  objc_super v8 = v17;
  if (v17)
  {
LABEL_6:
    uint64_t v18 = *MEMORY[0x263F04130];
    v32[0] = *MEMORY[0x263F04128];
    v32[1] = v18;
    v33[0] = MEMORY[0x263EFFA88];
    v33[1] = MEMORY[0x263EFFA78];
    CFDictionaryRef v19 = [NSDictionary dictionaryWithObjects:v33 forKeys:v32 count:2];
    CVReturn v20 = CVPixelBufferCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], (unint64_t)v12, (unint64_t)v10, 0x34323076u, v19, &pixelBufferOut);

    if (!v20 && pixelBufferOut)
    {
      uint64_t v21 = *MEMORY[0x263F03F08];
      uint64_t v22 = *MEMORY[0x263F04020];
      v30[0] = *MEMORY[0x263F03ED8];
      v30[1] = v22;
      uint64_t v23 = *MEMORY[0x263F04050];
      v31[0] = v21;
      v31[1] = v23;
      v30[2] = *MEMORY[0x263F03FC0];
      v31[2] = *MEMORY[0x263F03FD8];
      CFDictionaryRef v24 = [NSDictionary dictionaryWithObjects:v31 forKeys:v30 count:3];
      CMSetAttachments(pixelBufferOut, v24, 1u);
      v25 = [MEMORY[0x263F00628] contextWithOptions:MEMORY[0x263EFFA78]];
      [v25 render:v8 toCVPixelBuffer:pixelBufferOut];

      OSType v17 = pixelBufferOut;
      goto LABEL_12;
    }
    if (pixelBufferOut)
    {
      CFRelease(pixelBufferOut);
      OSType v17 = 0;
      CVPixelBufferRef pixelBufferOut = 0;
      goto LABEL_12;
    }
LABEL_11:
    OSType v17 = 0;
  }
LABEL_12:

  return v17;
}

- (__CVBuffer)pixelBuffer
{
  return self->_pixelBuffer;
}

- (BOOL)transferSourceMedia
{
  return self->_transferSourceMedia;
}

- (void)setTransferSourceMedia:(BOOL)a3
{
  self->_transferSourceMedia = a3;
}

- (NSString)mediaName
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setMediaName:(id)a3
{
}

- (void).cxx_destruct
{
}

@end