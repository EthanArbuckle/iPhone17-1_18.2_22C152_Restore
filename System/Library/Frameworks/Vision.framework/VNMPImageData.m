@interface VNMPImageData
- (BOOL)freeImageInDealloc;
- (NSString)externalImageId;
- (NSString)imageFilePath;
- (VNMPImageData)initWithCVPixelBufferImage:(__CVBuffer *)a3 externalImageId:(id)a4 andExifTimestampString:(id)a5 error:(id *)a6;
- (VNMPImageData)initWithCVPixelBufferImage:(__CVBuffer *)a3 externalImageId:(id)a4 andExifTimestampValue:(int64_t)a5 error:(id *)a6;
- (VNMPImageData)initWithVImage:(vImage_Buffer *)a3 externalImageId:(id)a4 andExifTimestampString:(id)a5 error:(id *)a6;
- (VNMPImageData)initWithVImage:(vImage_Buffer *)a3 externalImageId:(id)a4 andExifTimestampValue:(int64_t)a5 error:(id *)a6;
- (__CVBuffer)imageCVPixelBuffer;
- (int64_t)exifTimestamp;
- (vImage_Buffer)image;
- (void)dealloc;
- (void)setFreeImageInDealloc:(BOOL)a3;
- (void)setImageFilePath:(id)a3;
@end

@implementation VNMPImageData

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_externalImageId, 0);

  objc_storeStrong((id *)&self->_imageFilePath, 0);
}

- (int64_t)exifTimestamp
{
  return self->_exifTimestamp;
}

- (NSString)externalImageId
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setFreeImageInDealloc:(BOOL)a3
{
  self->_freeImageInDealloc = a3;
}

- (BOOL)freeImageInDealloc
{
  return self->_freeImageInDealloc;
}

- (void)setImageFilePath:(id)a3
{
}

- (NSString)imageFilePath
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (__CVBuffer)imageCVPixelBuffer
{
  return self->_imageCVPixelBuffer;
}

- (vImage_Buffer)image
{
  return self->_image;
}

- (void)dealloc
{
  if (self->_freeImageInDealloc)
  {
    +[VNMPUtils freeVImageBuffer:self->_image];
    self->_image = 0;
  }
  imageCVPixelBuffer = self->_imageCVPixelBuffer;
  if (imageCVPixelBuffer)
  {
    CVPixelBufferRelease(imageCVPixelBuffer);
    self->_imageCVPixelBuffer = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)VNMPImageData;
  [(VNMPImageData *)&v4 dealloc];
}

- (VNMPImageData)initWithCVPixelBufferImage:(__CVBuffer *)a3 externalImageId:(id)a4 andExifTimestampValue:(int64_t)a5 error:(id *)a6
{
  id v11 = a4;
  if (!a6) {
    __assert_rtn("-[VNMPImageData initWithCVPixelBufferImage:externalImageId:andExifTimestampValue:error:]", "MPImageData.m", 62, "error != nil");
  }
  v12 = v11;
  v16.receiver = self;
  v16.super_class = (Class)VNMPImageData;
  v13 = [(VNMPImageData *)&v16 init];
  v14 = v13;
  if (v13)
  {
    v13->_freeImageInDealloc = 1;
    v13->_image = 0;
    v13->_imageCVPixelBuffer = a3;
    CVPixelBufferRetain(a3);
    objc_storeStrong((id *)&v14->_externalImageId, a4);
    v14->_exifTimestamp = a5;
  }

  return v14;
}

- (VNMPImageData)initWithCVPixelBufferImage:(__CVBuffer *)a3 externalImageId:(id)a4 andExifTimestampString:(id)a5 error:(id *)a6
{
  id v10 = a4;
  id v11 = [(VNMPImageData *)self initWithCVPixelBufferImage:a3 externalImageId:v10 andExifTimestampValue:+[VNMPUtils parseExifTimestamp:a5] error:a6];

  return v11;
}

- (VNMPImageData)initWithVImage:(vImage_Buffer *)a3 externalImageId:(id)a4 andExifTimestampValue:(int64_t)a5 error:(id *)a6
{
  id v11 = a4;
  if (!a6) {
    __assert_rtn("-[VNMPImageData initWithVImage:externalImageId:andExifTimestampValue:error:]", "MPImageData.m", 29, "error != nil");
  }
  v12 = v11;
  v17.receiver = self;
  v17.super_class = (Class)VNMPImageData;
  v13 = [(VNMPImageData *)&v17 init];
  v14 = v13;
  if (v13
    && (v13->_freeImageInDealloc = 1,
        v13->_image = a3,
        v13->_imageCVPixelBuffer = 0,
        objc_storeStrong((id *)&v13->_externalImageId, a4),
        v14->_exifTimestamp = a5,
        a3->width > a3->rowBytes >> 2))
  {
    +[VNMPUtils createErrorWithCode:3196 andMessage:@"ERROR: The input image does not seem to be 8888"];
    v15 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = v14;
  }

  return v15;
}

- (VNMPImageData)initWithVImage:(vImage_Buffer *)a3 externalImageId:(id)a4 andExifTimestampString:(id)a5 error:(id *)a6
{
  id v10 = a4;
  id v11 = [(VNMPImageData *)self initWithVImage:a3 externalImageId:v10 andExifTimestampValue:+[VNMPUtils parseExifTimestamp:a5] error:a6];

  return v11;
}

@end