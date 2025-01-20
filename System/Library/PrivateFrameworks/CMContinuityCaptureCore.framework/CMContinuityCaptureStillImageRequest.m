@interface CMContinuityCaptureStillImageRequest
+ (BOOL)supportsSecureCoding;
- ($2825F4736939C4A6D3AD43837233062D)maxPhotoDimensions;
- (BOOL)captureComplete;
- (BOOL)highResolutionPhotoEnabled;
- (CMContinuityCaptureStillImageRequest)init;
- (CMContinuityCaptureStillImageRequest)initWithCoder:(id)a3;
- (NSData)imageFileData;
- (NSError)error;
- (NSNumber)networkTimestamp;
- (NSString)compressedFormat;
- (id)completionHandler;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int)flashMode;
- (int)imageHeight;
- (int)imageWidth;
- (int)photoQualityPrioritization;
- (int64_t)uniqueID;
- (unsigned)imageCodecType;
- (void)encodeWithCoder:(id)a3;
- (void)setCaptureComplete:(BOOL)a3;
- (void)setCompletionHandler:(id)a3;
- (void)setCompressedFormat:(id)a3;
- (void)setError:(id)a3;
- (void)setFlashMode:(int)a3;
- (void)setHighResolutionPhotoEnabled:(BOOL)a3;
- (void)setImageCodecType:(unsigned int)a3;
- (void)setImageFileData:(id)a3;
- (void)setImageHeight:(int)a3;
- (void)setImageWidth:(int)a3;
- (void)setMaxPhotoDimensions:(id)a3;
- (void)setNetworkTimestamp:(id)a3;
- (void)setPhotoQualityPrioritization:(int)a3;
- (void)setUniqueID:(int64_t)a3;
@end

@implementation CMContinuityCaptureStillImageRequest

- (CMContinuityCaptureStillImageRequest)init
{
  v3.receiver = self;
  v3.super_class = (Class)CMContinuityCaptureStillImageRequest;
  return [(CMContinuityCaptureStillImageRequest *)&v3 init];
}

- (CMContinuityCaptureStillImageRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CMContinuityCaptureStillImageRequest;
  v5 = [(CMContinuityCaptureStillImageRequest *)&v15 init];
  if (v5)
  {
    v5->_uniqueID = [v4 decodeInt64ForKey:@"uniqueID"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"compressedFormat"];
    compressedFormat = v5->_compressedFormat;
    v5->_compressedFormat = (NSString *)v6;

    v5->_highResolutionPhotoEnabled = [v4 decodeBoolForKey:@"highResolutionEnabled"];
    v5->_flashMode = [v4 decodeInt32ForKey:@"flashMode"];
    v5->_photoQualityPrioritization = [v4 decodeInt32ForKey:@"photoQualityPrioritization"];
    v5->_maxPhotoDimensions.width = [v4 decodeInt32ForKey:@"maxPhotoDimensionsWidth"];
    v5->_maxPhotoDimensions.height = [v4 decodeInt32ForKey:@"maxPhotoDimensionsHeight"];
    v5->_captureComplete = [v4 decodeBoolForKey:@"captureComplete"];
    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"networkTimestamp"];
    networkTimestamp = v5->_networkTimestamp;
    v5->_networkTimestamp = (NSNumber *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"error"];
    error = v5->_error;
    v5->_error = (NSError *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"imageFileData"];
    imageFileData = v5->_imageFileData;
    v5->_imageFileData = (NSData *)v12;

    v5->_imageCodecType = [v4 decodeInt32ForKey:@"imageCodecType"];
    v5->_imageWidth = [v4 decodeInt32ForKey:@"imageWidth"];
    v5->_imageHeight = [v4 decodeInt32ForKey:@"imageHeight"];
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  objc_super v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  uint64_t v6 = [v3 stringWithFormat:@"%@: ID:%lld Format:%@ HiRes:%d, Flash:%d, QP:%d, Dimensions:%dx%d Complete:%d Timestamp:%@ Error:%@ Data:%@ [%p]", v5, self->_uniqueID, self->_compressedFormat, self->_highResolutionPhotoEnabled, self->_flashMode, self->_photoQualityPrioritization, self->_maxPhotoDimensions.width, self->_maxPhotoDimensions.height, self->_captureComplete, self->_networkTimestamp, self->_error, self->_imageFileData, self];

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t uniqueID = self->_uniqueID;
  id v5 = a3;
  [v5 encodeInt64:uniqueID forKey:@"uniqueID"];
  [v5 encodeObject:self->_compressedFormat forKey:@"compressedFormat"];
  [v5 encodeBool:self->_highResolutionPhotoEnabled forKey:@"highResolutionEnabled"];
  [v5 encodeInt32:self->_flashMode forKey:@"flashMode"];
  [v5 encodeInt32:self->_photoQualityPrioritization forKey:@"photoQualityPrioritization"];
  [v5 encodeInt32:self->_maxPhotoDimensions.width forKey:@"maxPhotoDimensionsWidth"];
  [v5 encodeInt32:self->_maxPhotoDimensions.height forKey:@"maxPhotoDimensionsHeight"];
  [v5 encodeBool:self->_captureComplete forKey:@"captureComplete"];
  [v5 encodeObject:self->_networkTimestamp forKey:@"networkTimestamp"];
  [v5 encodeObject:self->_error forKey:@"error"];
  [v5 encodeObject:self->_imageFileData forKey:@"imageFileData"];
  [v5 encodeInt32:self->_imageCodecType forKey:@"imageCodecType"];
  [v5 encodeInt32:self->_imageWidth forKey:@"imageWidth"];
  [v5 encodeInt32:self->_imageHeight forKey:@"imageHeight"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setUniqueID:", -[CMContinuityCaptureStillImageRequest uniqueID](self, "uniqueID"));
  id v5 = [(CMContinuityCaptureStillImageRequest *)self compressedFormat];
  uint64_t v6 = (void *)[v5 copy];
  [v4 setCompressedFormat:v6];

  objc_msgSend(v4, "setHighResolutionPhotoEnabled:", -[CMContinuityCaptureStillImageRequest highResolutionPhotoEnabled](self, "highResolutionPhotoEnabled"));
  objc_msgSend(v4, "setFlashMode:", -[CMContinuityCaptureStillImageRequest flashMode](self, "flashMode"));
  objc_msgSend(v4, "setPhotoQualityPrioritization:", -[CMContinuityCaptureStillImageRequest photoQualityPrioritization](self, "photoQualityPrioritization"));
  objc_msgSend(v4, "setMaxPhotoDimensions:", -[CMContinuityCaptureStillImageRequest maxPhotoDimensions](self, "maxPhotoDimensions"));
  objc_msgSend(v4, "setCaptureComplete:", -[CMContinuityCaptureStillImageRequest captureComplete](self, "captureComplete"));
  v7 = [(CMContinuityCaptureStillImageRequest *)self networkTimestamp];
  uint64_t v8 = (void *)[v7 copy];
  [v4 setNetworkTimestamp:v8];

  v9 = [(CMContinuityCaptureStillImageRequest *)self error];
  uint64_t v10 = (void *)[v9 copy];
  [v4 setError:v10];

  v11 = [(CMContinuityCaptureStillImageRequest *)self imageFileData];
  uint64_t v12 = (void *)[v11 copy];
  [v4 setImageFileData:v12];

  objc_msgSend(v4, "setImageCodecType:", -[CMContinuityCaptureStillImageRequest imageCodecType](self, "imageCodecType"));
  objc_msgSend(v4, "setImageWidth:", -[CMContinuityCaptureStillImageRequest imageWidth](self, "imageWidth"));
  objc_msgSend(v4, "setImageHeight:", -[CMContinuityCaptureStillImageRequest imageHeight](self, "imageHeight"));
  return v4;
}

- (int64_t)uniqueID
{
  return self->_uniqueID;
}

- (void)setUniqueID:(int64_t)a3
{
  self->_int64_t uniqueID = a3;
}

- (NSString)compressedFormat
{
  return self->_compressedFormat;
}

- (void)setCompressedFormat:(id)a3
{
}

- (BOOL)highResolutionPhotoEnabled
{
  return self->_highResolutionPhotoEnabled;
}

- (void)setHighResolutionPhotoEnabled:(BOOL)a3
{
  self->_highResolutionPhotoEnabled = a3;
}

- (int)flashMode
{
  return self->_flashMode;
}

- (void)setFlashMode:(int)a3
{
  self->_flashMode = a3;
}

- (int)photoQualityPrioritization
{
  return self->_photoQualityPrioritization;
}

- (void)setPhotoQualityPrioritization:(int)a3
{
  self->_photoQualityPrioritization = a3;
}

- ($2825F4736939C4A6D3AD43837233062D)maxPhotoDimensions
{
  return ($2825F4736939C4A6D3AD43837233062D)self->_maxPhotoDimensions;
}

- (void)setMaxPhotoDimensions:(id)a3
{
  self->_maxPhotoDimensions = ($470D365275581EF16070F5A11344F73E)a3;
}

- (BOOL)captureComplete
{
  return self->_captureComplete;
}

- (void)setCaptureComplete:(BOOL)a3
{
  self->_captureComplete = a3;
}

- (NSNumber)networkTimestamp
{
  return self->_networkTimestamp;
}

- (void)setNetworkTimestamp:(id)a3
{
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (NSData)imageFileData
{
  return self->_imageFileData;
}

- (void)setImageFileData:(id)a3
{
}

- (unsigned)imageCodecType
{
  return self->_imageCodecType;
}

- (void)setImageCodecType:(unsigned int)a3
{
  self->_imageCodecType = a3;
}

- (int)imageWidth
{
  return self->_imageWidth;
}

- (void)setImageWidth:(int)a3
{
  self->_imageWidth = a3;
}

- (int)imageHeight
{
  return self->_imageHeight;
}

- (void)setImageHeight:(int)a3
{
  self->_imageHeight = a3;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_imageFileData, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_networkTimestamp, 0);
  objc_storeStrong((id *)&self->_compressedFormat, 0);
}

@end