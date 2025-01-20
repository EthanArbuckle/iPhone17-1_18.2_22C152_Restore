@interface VNFaceLegacyFaceCore
+ (BOOL)supportsSecureCoding;
+ (void)_setFaceExpressionFeatureScoreIfDetected:(id)a3 features:(id)a4 detectionKey:(id)a5 scoreKey:(id)a6 featureKey:(id)a7;
- (BOOL)isEqual:(id)a3;
- (CGPoint)faceCenter;
- (CGPoint)leftEye;
- (CGPoint)mouth;
- (CGPoint)rightEye;
- (CGRect)faceBoundingBox;
- (NSDictionary)features;
- (VNFaceLegacyFaceCore)initWithCoder:(id)a3;
- (VNFaceLegacyFaceCore)initWithFace:(id)a3;
- (double)faceAngle;
- (double)faceSize;
- (int64_t)trackID;
- (unint64_t)profile;
- (unint64_t)requestRevision;
- (unint64_t)trackDuration;
- (void)encodeWithCoder:(id)a3;
@end

@implementation VNFaceLegacyFaceCore

- (void).cxx_destruct
{
}

- (NSDictionary)features
{
  return self->_features;
}

- (unint64_t)trackDuration
{
  return self->_trackDuration;
}

- (int64_t)trackID
{
  return self->_trackID;
}

- (CGPoint)mouth
{
  double x = self->_mouth.x;
  double y = self->_mouth.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (CGPoint)rightEye
{
  double x = self->_rightEye.x;
  double y = self->_rightEye.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (CGPoint)leftEye
{
  double x = self->_leftEye.x;
  double y = self->_leftEye.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (CGRect)faceBoundingBox
{
  double x = self->_faceBoundingBox.origin.x;
  double y = self->_faceBoundingBox.origin.y;
  double width = self->_faceBoundingBox.size.width;
  double height = self->_faceBoundingBox.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGPoint)faceCenter
{
  double x = self->_faceCenter.x;
  double y = self->_faceCenter.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (double)faceAngle
{
  return self->_faceAngle;
}

- (double)faceSize
{
  return self->_faceSize;
}

- (unint64_t)profile
{
  return self->_profile;
}

- (unint64_t)requestRevision
{
  return 3737841665;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (VNFaceLegacyFaceCore *)a3;
  if (self == v4)
  {
    char v13 = 1;
    goto LABEL_10;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    char v13 = 0;
    goto LABEL_10;
  }
  v5 = v4;
  unint64_t v6 = [(VNFaceLegacyFaceCore *)self profile];
  if (v6 != [(VNFaceLegacyFaceCore *)v5 profile]) {
    goto LABEL_6;
  }
  [(VNFaceLegacyFaceCore *)self faceSize];
  double v8 = v7;
  [(VNFaceLegacyFaceCore *)v5 faceSize];
  if (v8 != v9) {
    goto LABEL_6;
  }
  [(VNFaceLegacyFaceCore *)self faceAngle];
  double v11 = v10;
  [(VNFaceLegacyFaceCore *)v5 faceAngle];
  if (v11 != v12) {
    goto LABEL_6;
  }
  [(VNFaceLegacyFaceCore *)self faceCenter];
  double v16 = v15;
  double v18 = v17;
  [(VNFaceLegacyFaceCore *)v5 faceCenter];
  char v13 = 0;
  if (v16 != v20 || v18 != v19) {
    goto LABEL_7;
  }
  [(VNFaceLegacyFaceCore *)self faceBoundingBox];
  CGFloat v22 = v21;
  CGFloat v24 = v23;
  CGFloat v26 = v25;
  CGFloat v28 = v27;
  [(VNFaceLegacyFaceCore *)v5 faceBoundingBox];
  v56.origin.double x = v29;
  v56.origin.double y = v30;
  v56.size.double width = v31;
  v56.size.double height = v32;
  v55.origin.double x = v22;
  v55.origin.double y = v24;
  v55.size.double width = v26;
  v55.size.double height = v28;
  if (!CGRectEqualToRect(v55, v56)) {
    goto LABEL_6;
  }
  [(VNFaceLegacyFaceCore *)self leftEye];
  double v34 = v33;
  double v36 = v35;
  [(VNFaceLegacyFaceCore *)v5 leftEye];
  char v13 = 0;
  if (v34 != v38) {
    goto LABEL_7;
  }
  if (v36 != v37) {
    goto LABEL_7;
  }
  [(VNFaceLegacyFaceCore *)self rightEye];
  double v40 = v39;
  double v42 = v41;
  [(VNFaceLegacyFaceCore *)v5 rightEye];
  char v13 = 0;
  if (v40 != v44) {
    goto LABEL_7;
  }
  if (v42 != v43) {
    goto LABEL_7;
  }
  [(VNFaceLegacyFaceCore *)self mouth];
  double v46 = v45;
  double v48 = v47;
  [(VNFaceLegacyFaceCore *)v5 mouth];
  char v13 = 0;
  if (v46 != v50 || v48 != v49) {
    goto LABEL_7;
  }
  int64_t v51 = [(VNFaceLegacyFaceCore *)self trackID];
  if (v51 == [(VNFaceLegacyFaceCore *)v5 trackID]
    && (unint64_t v52 = [(VNFaceLegacyFaceCore *)self trackDuration],
        v52 == [(VNFaceLegacyFaceCore *)v5 trackDuration]))
  {
    v53 = [(VNFaceLegacyFaceCore *)self features];
    v54 = [(VNFaceLegacyFaceCore *)v5 features];
    char v13 = [v53 isEqual:v54];
  }
  else
  {
LABEL_6:
    char v13 = 0;
  }
LABEL_7:

LABEL_10:
  return v13;
}

- (VNFaceLegacyFaceCore)initWithCoder:(id)a3
{
  id v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)VNFaceLegacyFaceCore;
  v5 = [(VNFaceLegacyFaceCore *)&v26 init];
  if (v5)
  {
    unint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"VNFaceLegacyFaceCore"];
    double v7 = v6;
    if (v6 && ![v6 unsignedIntValue])
    {
      v5->_profile = (int)[v4 decodeIntForKey:@"fcr_profile"];
      [v4 decodeFloatForKey:@"fcr_size"];
      v5->_faceSize = v9;
      [v4 decodeFloatForKey:@"fcr_angle"];
      v5->_faceAngle = v10;
      objc_msgSend(v4, "vn_decodePointForKey:", @"fcr_center");
      v5->_faceCenter.double x = v11;
      v5->_faceCenter.double y = v12;
      objc_msgSend(v4, "vn_decodeRectForKey:", @"fcr_bbox");
      v5->_faceBoundingBox.origin.double x = v13;
      v5->_faceBoundingBox.origin.double y = v14;
      v5->_faceBoundingBox.size.double width = v15;
      v5->_faceBoundingBox.size.double height = v16;
      objc_msgSend(v4, "vn_decodePointForKey:", @"fcr_lefteye");
      v5->_leftEye.double x = v17;
      v5->_leftEye.double y = v18;
      objc_msgSend(v4, "vn_decodePointForKey:", @"fcr_righteye");
      v5->_rightEye.double x = v19;
      v5->_rightEye.double y = v20;
      objc_msgSend(v4, "vn_decodePointForKey:", @"fcr_mouth");
      v5->_mouth.double x = v21;
      v5->_mouth.double y = v22;
      v5->_trackID = (int)[v4 decodeIntForKey:@"fcr_trackid"];
      v5->_trackDuration = (int)[v4 decodeIntForKey:@"fcr_trackduration"];
      if ([v4 containsValueForKey:@"fcr_features"])
      {
        if (-[VNFaceLegacyFaceCore initWithCoder:]::ourFeaturesClassSetOnceToken != -1) {
          dispatch_once(&-[VNFaceLegacyFaceCore initWithCoder:]::ourFeaturesClassSetOnceToken, &__block_literal_global_23365);
        }
        uint64_t v23 = [v4 decodeObjectOfClasses:-[VNFaceLegacyFaceCore initWithCoder:]::ourFeaturesClassSet forKey:@"fcr_features"];
      }
      else
      {
        uint64_t v23 = [objc_alloc(MEMORY[0x1E4F1C9E8]) initWithCoder:v4];
      }
      features = v5->_features;
      v5->_features = (NSDictionary *)v23;

      double v8 = v5;
    }
    else
    {
      double v8 = 0;
    }
  }
  else
  {
    double v8 = 0;
  }

  return v8;
}

uint64_t __38__VNFaceLegacyFaceCore_initWithCoder___block_invoke()
{
  id v0 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  -[VNFaceLegacyFaceCore initWithCoder:]::ourFeaturesClassSet = objc_msgSend(v0, "initWithObjects:", v1, v2, objc_opt_class(), 0);

  return MEMORY[0x1F41817F8]();
}

- (void)encodeWithCoder:(id)a3
{
  id v8 = a3;
  id v4 = [NSNumber numberWithUnsignedInt:0];
  [v8 encodeObject:v4 forKey:@"VNFaceLegacyFaceCore"];

  objc_msgSend(v8, "encodeInt:forKey:", -[VNFaceLegacyFaceCore profile](self, "profile"), @"fcr_profile");
  [(VNFaceLegacyFaceCore *)self faceSize];
  *(float *)&double v5 = v5;
  [v8 encodeFloat:@"fcr_size" forKey:v5];
  [(VNFaceLegacyFaceCore *)self faceAngle];
  *(float *)&double v6 = v6;
  [v8 encodeFloat:@"fcr_angle" forKey:v6];
  [(VNFaceLegacyFaceCore *)self faceCenter];
  objc_msgSend(v8, "vn_encodePoint:forKey:", @"fcr_center");
  [(VNFaceLegacyFaceCore *)self faceBoundingBox];
  objc_msgSend(v8, "vn_encodeRect:forKey:", @"fcr_bbox");
  [(VNFaceLegacyFaceCore *)self leftEye];
  objc_msgSend(v8, "vn_encodePoint:forKey:", @"fcr_lefteye");
  [(VNFaceLegacyFaceCore *)self rightEye];
  objc_msgSend(v8, "vn_encodePoint:forKey:", @"fcr_righteye");
  [(VNFaceLegacyFaceCore *)self mouth];
  objc_msgSend(v8, "vn_encodePoint:forKey:", @"fcr_mouth");
  objc_msgSend(v8, "encodeInt:forKey:", -[VNFaceLegacyFaceCore trackID](self, "trackID"), @"fcr_trackid");
  objc_msgSend(v8, "encodeInt:forKey:", -[VNFaceLegacyFaceCore trackDuration](self, "trackDuration"), @"fcr_trackduration");
  double v7 = [(VNFaceLegacyFaceCore *)self features];
  [v8 encodeObject:v7 forKey:@"fcr_features"];
}

- (VNFaceLegacyFaceCore)initWithFace:(id)a3
{
  id v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)VNFaceLegacyFaceCore;
  double v5 = [(VNFaceLegacyFaceCore *)&v29 init];
  if (!v5) {
    goto LABEL_6;
  }
  unsigned int v6 = [v4 faceType];
  if (v6 >= 3)
  {
    VNValidatedLog(4, @"VNFaceLegacyFaceCore:initWithFace: unsupported face profile\n", v7, v8, v9, v10, v11, v12, v26);
LABEL_6:
    CGFloat v15 = 0;
    goto LABEL_9;
  }
  *((void *)v5 + 1) = v6;
  [v4 faceSize];
  *((void *)v5 + 2) = v13;
  [v4 faceAngle];
  *((void *)v5 + 3) = v14;
  if (v4)
  {
    [v4 face];
    *(_OWORD *)(v5 + 56) = v26;
    [v4 face];
    *(_OWORD *)(v5 + 120) = v27;
    *(_OWORD *)(v5 + 136) = v28;
    [v4 leftEye];
    *(_OWORD *)(v5 + 72) = v26;
    [v4 rightEye];
    *(_OWORD *)(v5 + 88) = v26;
    [v4 mouth];
  }
  else
  {
    *(_OWORD *)(v5 + 120) = 0u;
    *((void *)v5 + 7) = 0;
    *((void *)v5 + 8) = 0;
    *(_OWORD *)(v5 + 136) = 0u;
    *((void *)v5 + 9) = 0;
    *((void *)v5 + 10) = 0;
    *((void *)v5 + 11) = 0;
    *((void *)v5 + 12) = 0;
    long long v26 = 0u;
  }
  *(_OWORD *)(v5 + 104) = v26;
  *((void *)v5 + 4) = objc_msgSend(v4, "trackID", (void)v26);
  *((void *)v5 + 5) = [v4 trackDuration];
  CGFloat v16 = objc_opt_class();
  CGFloat v17 = (void *)MEMORY[0x1E4F1CA60];
  CGFloat v18 = [v4 expressionFeatures];
  CGFloat v19 = objc_msgSend(v17, "dictionaryWithCapacity:", objc_msgSend(v18, "count"));

  CGFloat v20 = [v4 expressionFeatures];
  [v16 _setFaceExpressionFeatureScoreIfDetected:v20 features:v19 detectionKey:*MEMORY[0x1E4F45D98] scoreKey:*MEMORY[0x1E4F45DA0] featureKey:@"VNFaceLegacyFaceCoreFeature_LeftEyeClosedScore"];

  CGFloat v21 = [v4 expressionFeatures];
  [v16 _setFaceExpressionFeatureScoreIfDetected:v21 features:v19 detectionKey:*MEMORY[0x1E4F45DA8] scoreKey:*MEMORY[0x1E4F45DB0] featureKey:@"VNFaceLegacyFaceCoreFeature_RightEyeClosedScore"];

  CGFloat v22 = [v4 expressionFeatures];
  [v16 _setFaceExpressionFeatureScoreIfDetected:v22 features:v19 detectionKey:*MEMORY[0x1E4F45DB8] scoreKey:*MEMORY[0x1E4F45DC0] featureKey:@"VNFaceLegacyFaceCoreFeature_SmileScore"];

  uint64_t v23 = [v19 copy];
  CGFloat v24 = (void *)*((void *)v5 + 6);
  *((void *)v5 + 6) = v23;

  CGFloat v15 = v5;
LABEL_9:

  return v15;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (void)_setFaceExpressionFeatureScoreIfDetected:(id)a3 features:(id)a4 detectionKey:(id)a5 scoreKey:(id)a6 featureKey:(id)a7
{
  id v17 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = a7;
  uint64_t v14 = [v17 objectForKey:a5];
  CGFloat v15 = v14;
  if (v14 && ([v14 isEqual:MEMORY[0x1E4F1CC28]] & 1) == 0)
  {
    CGFloat v16 = [v17 objectForKey:v12];
    if (v16) {
      [v11 setObject:v16 forKeyedSubscript:v13];
    }
  }
}

@end