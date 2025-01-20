@interface CAMFaceResult
- (AVMetadataFaceObject)underlyingFaceObject;
- (CAMFaceResult)initWithFaceObject:(id)a3;
- (CGRect)bounds;
- (NSString)description;
- (NSString)metadataType;
- (NSString)uniqueIdentifier;
- (double)rollAngle;
- (id)burstMetadataRepresentation;
- (unint64_t)syntheticFocusMode;
@end

@implementation CAMFaceResult

- (CAMFaceResult)initWithFaceObject:(id)a3
{
  id v5 = a3;
  v18.receiver = self;
  v18.super_class = (Class)CAMFaceResult;
  v6 = [(CAMFaceResult *)&v18 init];
  if (v6)
  {
    [v5 bounds];
    v6->_bounds.origin.x = v7;
    v6->_bounds.origin.y = v8;
    v6->_bounds.size.width = v9;
    v6->_bounds.size.height = v10;
    if ([v5 hasRollAngle]) {
      [v5 rollAngle];
    }
    else {
      uint64_t v11 = 0x47EFFFFFE0000000;
    }
    *(void *)&v6->_rollAngle = v11;
    objc_storeStrong((id *)&v6->_underlyingFaceObject, a3);
    v12 = NSString;
    v13 = [v5 type];
    uint64_t v14 = [v12 stringWithFormat:@"%@ %ld", v13, objc_msgSend(v5, "faceID")];
    uniqueIdentifier = v6->_uniqueIdentifier;
    v6->_uniqueIdentifier = (NSString *)v14;

    v16 = v6;
  }

  return v6;
}

- (NSString)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  v6 = [(CAMFaceResult *)self underlyingFaceObject];
  uint64_t v7 = [v6 faceID];
  [(CAMFaceResult *)self rollAngle];
  CGFloat v9 = [v3 stringWithFormat:@"<%@: %p identifier: %ld roll: %f>", v5, self, v7, v8];

  return (NSString *)v9;
}

- (NSString)metadataType
{
  v2 = [(CAMFaceResult *)self underlyingFaceObject];
  v3 = [v2 type];

  return (NSString *)v3;
}

- (id)burstMetadataRepresentation
{
  v2 = [(CAMFaceResult *)self underlyingFaceObject];
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  [v2 bounds];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  if (v2) {
    [v2 time];
  }
  else {
    memset(&time, 0, sizeof(time));
  }
  CFDictionaryRef v12 = CMTimeCopyAsDictionary(&time, (CFAllocatorRef)*MEMORY[0x263EFFB08]);
  v13 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v2, "faceID"));
  [v3 setObject:v13 forKeyedSubscript:@"FaceID"];

  v45.origin.CGFloat x = v5;
  v45.origin.CGFloat y = v7;
  v45.size.CGFloat width = v9;
  v45.size.CGFloat height = v11;
  uint64_t v14 = [NSNumber numberWithDouble:CGRectGetMidX(v45)];
  [v3 setObject:v14 forKeyedSubscript:@"X"];

  v46.origin.CGFloat x = v5;
  v46.origin.CGFloat y = v7;
  v46.size.CGFloat width = v9;
  v46.size.CGFloat height = v11;
  v15 = [NSNumber numberWithDouble:CGRectGetMidY(v46)];
  [v3 setObject:v15 forKeyedSubscript:@"Y"];

  v47.origin.CGFloat x = v5;
  v47.origin.CGFloat y = v7;
  v47.size.CGFloat width = v9;
  v47.size.CGFloat height = v11;
  v16 = [NSNumber numberWithDouble:CGRectGetWidth(v47)];
  [v3 setObject:v16 forKeyedSubscript:@"Width"];

  v48.origin.CGFloat x = v5;
  v48.origin.CGFloat y = v7;
  v48.size.CGFloat width = v9;
  v48.size.CGFloat height = v11;
  v17 = [NSNumber numberWithDouble:CGRectGetHeight(v48)];
  [v3 setObject:v17 forKeyedSubscript:@"Height"];

  [v3 setObject:v12 forKeyedSubscript:@"Timestamp"];
  if ([v2 hasRollAngle])
  {
    objc_super v18 = NSNumber;
    [v2 rollAngle];
    v19 = objc_msgSend(v18, "numberWithDouble:");
    [v3 setObject:v19 forKeyedSubscript:@"RollAngle"];
  }
  if ([v2 hasYawAngle])
  {
    v20 = NSNumber;
    [v2 yawAngle];
    v21 = objc_msgSend(v20, "numberWithDouble:");
    [v3 setObject:v21 forKeyedSubscript:@"YawAngle"];
  }
  if ([v2 hasLeftEyeBounds])
  {
    [v2 leftEyeBounds];
    CGFloat x = v49.origin.x;
    CGFloat y = v49.origin.y;
    CGFloat width = v49.size.width;
    CGFloat height = v49.size.height;
    v26 = [NSNumber numberWithDouble:CGRectGetMidX(v49)];
    [v3 setObject:v26 forKeyedSubscript:@"LeftEyeX"];

    v50.origin.CGFloat x = x;
    v50.origin.CGFloat y = y;
    v50.size.CGFloat width = width;
    v50.size.CGFloat height = height;
    v27 = [NSNumber numberWithDouble:CGRectGetMidY(v50)];
    [v3 setObject:v27 forKeyedSubscript:@"LeftEyeY"];

    v51.origin.CGFloat x = x;
    v51.origin.CGFloat y = y;
    v51.size.CGFloat width = width;
    v51.size.CGFloat height = height;
    v28 = [NSNumber numberWithDouble:CGRectGetWidth(v51)];
    [v3 setObject:v28 forKeyedSubscript:@"LeftEyeWidth"];

    v52.origin.CGFloat x = x;
    v52.origin.CGFloat y = y;
    v52.size.CGFloat width = width;
    v52.size.CGFloat height = height;
    v29 = [NSNumber numberWithDouble:CGRectGetHeight(v52)];
    [v3 setObject:v29 forKeyedSubscript:@"LeftEyeHeight"];

    if ([v2 hasLeftEyeClosedConfidence])
    {
      v30 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v2, "leftEyeClosedConfidence"));
      [v3 setObject:v30 forKeyedSubscript:@"LeftEyeBlinkLevel"];
    }
  }
  if ([v2 hasRightEyeBounds])
  {
    [v2 rightEyeBounds];
    CGFloat v31 = v53.origin.x;
    CGFloat v32 = v53.origin.y;
    CGFloat v33 = v53.size.width;
    CGFloat v34 = v53.size.height;
    v35 = [NSNumber numberWithDouble:CGRectGetMidX(v53)];
    [v3 setObject:v35 forKeyedSubscript:@"RightEyeX"];

    v54.origin.CGFloat x = v31;
    v54.origin.CGFloat y = v32;
    v54.size.CGFloat width = v33;
    v54.size.CGFloat height = v34;
    v36 = [NSNumber numberWithDouble:CGRectGetMidY(v54)];
    [v3 setObject:v36 forKeyedSubscript:@"RightEyeY"];

    v55.origin.CGFloat x = v31;
    v55.origin.CGFloat y = v32;
    v55.size.CGFloat width = v33;
    v55.size.CGFloat height = v34;
    v37 = [NSNumber numberWithDouble:CGRectGetWidth(v55)];
    [v3 setObject:v37 forKeyedSubscript:@"RightEyeWidth"];

    v56.origin.CGFloat x = v31;
    v56.origin.CGFloat y = v32;
    v56.size.CGFloat width = v33;
    v56.size.CGFloat height = v34;
    v38 = [NSNumber numberWithDouble:CGRectGetHeight(v56)];
    [v3 setObject:v38 forKeyedSubscript:@"RightEyeHeight"];

    if ([v2 hasRightEyeClosedConfidence])
    {
      v39 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v2, "rightEyeClosedConfidence"));
      [v3 setObject:v39 forKeyedSubscript:@"RightEyeBlinkLevel"];
    }
  }
  if ([v2 hasSmileConfidence])
  {
    v40 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v2, "smileConfidence"));
    [v3 setObject:v40 forKeyedSubscript:@"SmileLevel"];
  }
  v41 = (void *)[v3 copy];

  return v41;
}

- (unint64_t)syntheticFocusMode
{
  v2 = [(CAMFaceResult *)self underlyingMetadataObject];
  unint64_t v3 = +[CAMCaptureConversions CAMMetadataObjectSyntheticFocusModeForAVCaptureMetadataObjectSyntheticFocusMode:](CAMCaptureConversions, "CAMMetadataObjectSyntheticFocusModeForAVCaptureMetadataObjectSyntheticFocusMode:", [v2 syntheticFocusMode]);

  return v3;
}

- (NSString)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (CGRect)bounds
{
  double x = self->_bounds.origin.x;
  double y = self->_bounds.origin.y;
  double width = self->_bounds.size.width;
  double height = self->_bounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (double)rollAngle
{
  return self->_rollAngle;
}

- (AVMetadataFaceObject)underlyingFaceObject
{
  return self->_underlyingFaceObject;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingFaceObject, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
}

@end