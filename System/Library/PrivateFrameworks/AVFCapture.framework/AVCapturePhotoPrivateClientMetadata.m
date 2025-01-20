@interface AVCapturePhotoPrivateClientMetadata
+ (BOOL)supportsSecureCoding;
- (AVCapturePhotoPrivateClientMetadata)initWithCoder:(id)a3;
- (AVCapturePhotoPrivateClientMetadata)initWithMetadataDictionary:(id)a3;
- (BOOL)spatialOverCaptureImageHorizonLinePresent;
- (NSDictionary)detectedObjectInfo;
- (NSDictionary)inferenceAttachments;
- (NSString)captureFolderClientPath;
- (float)spatialOverCaptureImageHorizonLineAngleInDegrees;
- (float)spatialOverCaptureImageHorizonLineVerticalCenterlineIntersection;
- (unsigned)spatialOverCaptureImageStitchingConfidenceScore;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation AVCapturePhotoPrivateClientMetadata

- (AVCapturePhotoPrivateClientMetadata)initWithMetadataDictionary:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)AVCapturePhotoPrivateClientMetadata;
  v4 = [(AVCapturePhotoPrivateClientMetadata *)&v8 init];
  v5 = (void *)[a3 objectForKeyedSubscript:*MEMORY[0x1E4F51418]];
  if (v4 && (v6 = v5, [v5 count]))
  {
    v4->_inferenceAttachments = (NSDictionary *)objc_msgSend((id)objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E4F51428]), "copy");
    v4->_detectedObjectInfo = (NSDictionary *)objc_msgSend((id)objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E4F51420]), "copy");
  }
  else
  {

    return 0;
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)AVCapturePhotoPrivateClientMetadata;
  [(AVCapturePhotoPrivateClientMetadata *)&v3 dealloc];
}

- (AVCapturePhotoPrivateClientMetadata)initWithCoder:(id)a3
{
  v15.receiver = self;
  v15.super_class = (Class)AVCapturePhotoPrivateClientMetadata;
  v4 = [(AVCapturePhotoPrivateClientMetadata *)&v15 init];
  if (v4)
  {
    v5 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    v4->_inferenceAttachments = (NSDictionary *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v5, "setWithObjects:", v6, v7, v8, objc_opt_class(), 0), *MEMORY[0x1E4F51428]);
    v9 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = objc_opt_class();
    uint64_t v13 = objc_opt_class();
    v4->_detectedObjectInfo = (NSDictionary *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v9, "setWithObjects:", v10, v11, v12, v13, objc_opt_class(), 0), *MEMORY[0x1E4F51420]);
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  [a3 encodeObject:self->_inferenceAttachments forKey:*MEMORY[0x1E4F51428]];
  detectedObjectInfo = self->_detectedObjectInfo;
  uint64_t v6 = *MEMORY[0x1E4F51420];

  [a3 encodeObject:detectedObjectInfo forKey:v6];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSDictionary)inferenceAttachments
{
  v2 = self->_inferenceAttachments;

  return v2;
}

- (NSDictionary)detectedObjectInfo
{
  v2 = self->_detectedObjectInfo;

  return v2;
}

- (unsigned)spatialOverCaptureImageStitchingConfidenceScore
{
  return 0;
}

- (BOOL)spatialOverCaptureImageHorizonLinePresent
{
  return 0;
}

- (float)spatialOverCaptureImageHorizonLineAngleInDegrees
{
  return 0.0;
}

- (float)spatialOverCaptureImageHorizonLineVerticalCenterlineIntersection
{
  return 0.0;
}

- (NSString)captureFolderClientPath
{
  return 0;
}

@end