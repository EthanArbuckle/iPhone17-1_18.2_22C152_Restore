@interface AXMVisionFeatureFaceDetectionResult
+ (BOOL)supportsSecureCoding;
+ (id)localizedStringFormatterForExpression:(id)a3;
+ (id)nameForFaceExpression:(int64_t)a3;
- (AXMVisionFeatureFaceAttributes)attributes;
- (AXMVisionFeatureFaceDetectionResult)initWithCoder:(id)a3;
- (AXMVisionFeatureFaceLandmarks)landmarks;
- (AXMVisionFeatureFaceLandmarks)landmarks3d;
- (CGRect)frame;
- (NSDictionary)expressionsAndConfidence;
- (NSString)name;
- (NSUUID)uuid;
- (__n128)pose;
- (__n128)setPose:(__n128)a3;
- (double)attributesConfidence;
- (double)confidenceForExpression:(int64_t)a3;
- (double)landmarksConfidence;
- (double)nameConfidence;
- (double)poseConfidence;
- (double)rectanglesConfidence;
- (id)_init;
- (id)descriptionForExpression:(int64_t)a3;
- (int64_t)_expressionForString:(id)a3;
- (int64_t)likelyExpression;
- (unint64_t)faceId;
- (void)encodeWithCoder:(id)a3;
- (void)setAttributes:(id)a3;
- (void)setAttributesConfidence:(double)a3;
- (void)setExpressionsAndConfidence:(id)a3;
- (void)setFaceId:(unint64_t)a3;
- (void)setFrame:(CGRect)a3;
- (void)setLandmarks3d:(id)a3;
- (void)setLandmarks:(id)a3;
- (void)setLandmarksConfidence:(double)a3;
- (void)setName:(id)a3;
- (void)setNameConfidence:(double)a3;
- (void)setPoseConfidence:(double)a3;
- (void)setRectanglesConfidence:(double)a3;
- (void)setUuid:(id)a3;
@end

@implementation AXMVisionFeatureFaceDetectionResult

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(AXMVisionFeatureFaceDetectionResult *)self uuid];
  [v4 encodeObject:v5 forKey:@"AXMFeatureFaceUUID"];

  [(AXMVisionFeatureFaceDetectionResult *)self frame];
  objc_msgSend(v4, "axmEncodeRect:forKey:", @"AXMFeatureFaceRectangles");
  [(AXMVisionFeatureFaceDetectionResult *)self rectanglesConfidence];
  *(float *)&double v6 = v6;
  [v4 encodeFloat:@"AXMFeatureFaceRectanglesConfidence" forKey:v6];
  v7 = [(AXMVisionFeatureFaceDetectionResult *)self name];
  [v4 encodeObject:v7 forKey:@"AXMFeatureFaceName"];

  [(AXMVisionFeatureFaceDetectionResult *)self nameConfidence];
  *(float *)&double v8 = v8;
  [v4 encodeFloat:@"AXMFeatureFaceNameConfidence " forKey:v8];
  v9 = [(AXMVisionFeatureFaceDetectionResult *)self attributes];
  [v4 encodeObject:v9 forKey:@"AXMFeatureFaceAttributes"];

  [(AXMVisionFeatureFaceDetectionResult *)self attributesConfidence];
  *(float *)&double v10 = v10;
  [v4 encodeFloat:@"AXMFeatureFaceAttributesConfidence" forKey:v10];
  v11 = (void *)MEMORY[0x1E4F28DB0];
  v12 = [(AXMVisionFeatureFaceDetectionResult *)self expressionsAndConfidence];
  id v24 = 0;
  v13 = [v11 archivedDataWithRootObject:v12 requiringSecureCoding:1 error:&v24];
  id v14 = v24;

  if (v14)
  {
    v15 = AXMediaLogCommon();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[AXMVisionFeatureFaceDetectionResult encodeWithCoder:]((uint64_t)v14, v15);
    }
  }
  [v4 encodeObject:v13 forKey:@"AXMFeatureFaceExpressions"];
  [v4 encodeObject:self->_landmarks forKey:@"AXMFeatureFaceLandmarks"];
  [v4 encodeObject:self->_landmarks3d forKey:@"AXMFeatureFaceLandmarks3d"];
  [(AXMVisionFeatureFaceDetectionResult *)self landmarksConfidence];
  *(float *)&double v16 = v16;
  [v4 encodeFloat:@"AXMFeatureFaceLandmarksConfidence" forKey:v16];
  [(AXMVisionFeatureFaceDetectionResult *)self pose];
  v23[0] = v17;
  v23[1] = v18;
  v23[2] = v19;
  v23[3] = v20;
  v21 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v23 length:64];
  [v4 encodeObject:v21 forKey:@"AXMFeatureFacePose"];
  [(AXMVisionFeatureFaceDetectionResult *)self poseConfidence];
  *(float *)&double v22 = v22;
  [v4 encodeFloat:@"AXMVisionFeatureCodingKeyFacePoseConfidence" forKey:v22];
}

- (AXMVisionFeatureFaceDetectionResult)initWithCoder:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)AXMVisionFeatureFaceDetectionResult;
  v5 = [(AXMVisionFeatureFaceDetectionResult *)&v27 init];
  if (v5)
  {
    double v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AXMFeatureFaceUUID"];
    [(AXMVisionFeatureFaceDetectionResult *)v5 setUuid:v6];

    [v4 axmDecodeRectForKey:@"AXMFeatureFaceRectangles"];
    -[AXMVisionFeatureFaceDetectionResult setFrame:](v5, "setFrame:");
    [v4 decodeFloatForKey:@"AXMFeatureFaceRectanglesConfidence"];
    [(AXMVisionFeatureFaceDetectionResult *)v5 setRectanglesConfidence:v7];
    double v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AXMFeatureFaceName"];
    [(AXMVisionFeatureFaceDetectionResult *)v5 setName:v8];

    [v4 decodeFloatForKey:@"AXMFeatureFaceNameConfidence "];
    [(AXMVisionFeatureFaceDetectionResult *)v5 setNameConfidence:v9];
    double v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AXMFeatureFaceAttributes"];
    [(AXMVisionFeatureFaceDetectionResult *)v5 setAttributes:v10];

    [v4 decodeFloatForKey:@"AXMFeatureFaceAttributesConfidence"];
    [(AXMVisionFeatureFaceDetectionResult *)v5 setAttributesConfidence:v11];
    v12 = AXMSecureCodingClasses();
    v13 = [v4 decodeObjectOfClasses:v12 forKey:@"AXMFeatureFaceExpressions"];

    if (v13)
    {
      id v14 = (void *)MEMORY[0x1E4F28DC0];
      uint64_t v15 = objc_opt_class();
      double v16 = AXMSecureCodingClasses();
      id v26 = 0;
      long long v17 = [v14 axmSecurelyUnarchiveData:v13 withExpectedClass:v15 otherAllowedClasses:v16 error:&v26];
      id v18 = v26;

      if (v18)
      {
        long long v19 = AXMediaLogCommon();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)&buf[4] = v18;
          _os_log_impl(&dword_1B57D5000, v19, OS_LOG_TYPE_DEFAULT, "Error decoding face expression dict: %@", buf, 0xCu);
        }
      }
      else
      {
        [(AXMVisionFeatureFaceDetectionResult *)v5 setExpressionsAndConfidence:v17];
      }
    }
    long long v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AXMFeatureFaceLandmarks"];
    [(AXMVisionFeatureFaceDetectionResult *)v5 setLandmarks:v20];

    v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AXMFeatureFaceLandmarks3d"];
    [(AXMVisionFeatureFaceDetectionResult *)v5 setLandmarks3d:v21];

    [v4 decodeFloatForKey:@"AXMFeatureFaceLandmarksConfidence"];
    [(AXMVisionFeatureFaceDetectionResult *)v5 setLandmarksConfidence:v22];
    long long v30 = 0u;
    *(_OWORD *)v31 = 0u;
    *(_OWORD *)buf = 0u;
    long long v29 = 0u;
    v23 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AXMFeatureFacePose"];
    [v23 getBytes:buf length:64];
    -[AXMVisionFeatureFaceDetectionResult setPose:](v5, "setPose:", *(double *)buf, *(double *)&v29, *(double *)&v30, v31[0]);
    [v4 decodeFloatForKey:@"AXMVisionFeatureCodingKeyFacePoseConfidence"];
    [(AXMVisionFeatureFaceDetectionResult *)v5 setPoseConfidence:v24];
  }
  return v5;
}

- (id)_init
{
  v3.receiver = self;
  v3.super_class = (Class)AXMVisionFeatureFaceDetectionResult;
  id result = [(AXMVisionFeatureFaceDetectionResult *)&v3 init];
  if (result) {
    *((void *)result + 1) = 0;
  }
  return result;
}

+ (id)nameForFaceExpression:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 5) {
    return @"Unknown";
  }
  else {
    return off_1E6117A58[a3 - 1];
  }
}

- (double)confidenceForExpression:(int64_t)a3
{
  id v4 = [(AXMVisionFeatureFaceDetectionResult *)self descriptionForExpression:a3];
  if (v4)
  {
    v5 = [(AXMVisionFeatureFaceDetectionResult *)self expressionsAndConfidence];
    double v6 = [v5 objectForKey:v4];
    [v6 floatValue];
    double v8 = v7;
  }
  else
  {
    double v8 = 0.0;
  }

  return v8;
}

- (int64_t)likelyExpression
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  int64_t likelyExpression = self->_likelyExpression;
  if (!likelyExpression)
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v4 = [(AXMVisionFeatureFaceDetectionResult *)self expressionsAndConfidence];
    v5 = [v4 allKeys];

    uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      int64_t likelyExpression = 0;
      uint64_t v8 = *(void *)v18;
      double v9 = 0.0;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v18 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v11 = *(void *)(*((void *)&v17 + 1) + 8 * i);
          v12 = [(AXMVisionFeatureFaceDetectionResult *)self expressionsAndConfidence];
          v13 = [v12 objectForKey:v11];
          [v13 floatValue];
          double v15 = v14;

          if (v9 < v15)
          {
            int64_t likelyExpression = [(AXMVisionFeatureFaceDetectionResult *)self _expressionForString:v11];
            double v9 = v15;
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v7);
    }
    else
    {
      int64_t likelyExpression = 0;
    }

    self->_int64_t likelyExpression = likelyExpression;
  }
  return likelyExpression;
}

+ (id)localizedStringFormatterForExpression:(id)a3
{
  objc_super v3 = 0;
  switch([a3 integerValue])
  {
    case 1:
      id v4 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.accessibility.AXMediaUtilities"];
      v5 = v4;
      uint64_t v6 = @"photo.description.expression.disgust";
      goto LABEL_7;
    case 3:
      id v4 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.accessibility.AXMediaUtilities"];
      v5 = v4;
      uint64_t v6 = @"photo.description.expression.scream";
      goto LABEL_7;
    case 4:
      id v4 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.accessibility.AXMediaUtilities"];
      v5 = v4;
      uint64_t v6 = @"photo.description.expression.smile";
      goto LABEL_7;
    case 5:
      id v4 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.accessibility.AXMediaUtilities"];
      v5 = v4;
      uint64_t v6 = @"photo.description.expression.surprise";
      goto LABEL_7;
    case 6:
      id v4 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.accessibility.AXMediaUtilities"];
      v5 = v4;
      uint64_t v6 = @"photo.description.expression.suspicious";
LABEL_7:
      objc_super v3 = [v4 localizedStringForKey:v6 value:&stru_1F0E72D10 table:@"Accessibility"];

      break;
    default:
      break;
  }

  return v3;
}

- (id)descriptionForExpression:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 5) {
    return 0;
  }
  else {
    return off_1E6117A58[a3 - 1];
  }
}

- (int64_t)_expressionForString:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Disgust"])
  {
    int64_t v4 = 1;
  }
  else if ([v3 isEqualToString:@"Neutral"])
  {
    int64_t v4 = 2;
  }
  else if ([v3 isEqualToString:@"Scream"])
  {
    int64_t v4 = 3;
  }
  else if ([v3 isEqualToString:@"Smile"])
  {
    int64_t v4 = 4;
  }
  else if ([v3 isEqualToString:@"Surprise"])
  {
    int64_t v4 = 5;
  }
  else if ([v3 isEqualToString:@"Suspicious"])
  {
    int64_t v4 = 6;
  }
  else
  {
    int64_t v4 = 0;
  }

  return v4;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
}

- (unint64_t)faceId
{
  return self->_faceId;
}

- (void)setFaceId:(unint64_t)a3
{
  self->_faceId = a3;
}

- (CGRect)frame
{
  double x = self->_frame.origin.x;
  double y = self->_frame.origin.y;
  double width = self->_frame.size.width;
  double height = self->_frame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setFrame:(CGRect)a3
{
  self->_frame = a3;
}

- (double)rectanglesConfidence
{
  return self->_rectanglesConfidence;
}

- (void)setRectanglesConfidence:(double)a3
{
  self->_rectanglesConfidence = a3;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (double)nameConfidence
{
  return self->_nameConfidence;
}

- (void)setNameConfidence:(double)a3
{
  self->_nameConfidence = a3;
}

- (AXMVisionFeatureFaceAttributes)attributes
{
  return self->_attributes;
}

- (void)setAttributes:(id)a3
{
}

- (double)attributesConfidence
{
  return self->_attributesConfidence;
}

- (void)setAttributesConfidence:(double)a3
{
  self->_attributesConfidence = a3;
}

- (NSDictionary)expressionsAndConfidence
{
  return self->_expressionsAndConfidence;
}

- (void)setExpressionsAndConfidence:(id)a3
{
}

- (AXMVisionFeatureFaceLandmarks)landmarks
{
  return self->_landmarks;
}

- (void)setLandmarks:(id)a3
{
}

- (AXMVisionFeatureFaceLandmarks)landmarks3d
{
  return self->_landmarks3d;
}

- (void)setLandmarks3d:(id)a3
{
}

- (double)landmarksConfidence
{
  return self->_landmarksConfidence;
}

- (void)setLandmarksConfidence:(double)a3
{
  self->_landmarksConfidence = a3;
}

- (__n128)pose
{
  return a1[9];
}

- (__n128)setPose:(__n128)a3
{
  result[9] = a2;
  result[10] = a3;
  result[11] = a4;
  result[12] = a5;
  return result;
}

- (double)poseConfidence
{
  return self->_poseConfidence;
}

- (void)setPoseConfidence:(double)a3
{
  self->_poseConfidence = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_landmarks3d, 0);
  objc_storeStrong((id *)&self->_landmarks, 0);
  objc_storeStrong((id *)&self->_expressionsAndConfidence, 0);
  objc_storeStrong((id *)&self->_attributes, 0);
  objc_storeStrong((id *)&self->_uuid, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

- (void)encodeWithCoder:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1B57D5000, a2, OS_LOG_TYPE_ERROR, "Failed to archive expressionsAndConfidence data: %@", (uint8_t *)&v2, 0xCu);
}

@end