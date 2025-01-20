@interface ARHWFaceDetection
+ (BOOL)supportsSecureCoding;
+ (id)faceDetectionFromDictionary:(id)a3;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)time;
- (ARHWFaceDetection)initWithCoder:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToFaceDetection:(id)a3;
- (CGRect)boundingBox;
- (double)rollAngleInDegrees;
- (int64_t)ID;
- (int64_t)detectionOrientation;
- (void)encodeWithCoder:(id)a3;
- (void)setBoundingBox:(CGRect)a3;
- (void)setDetectionOrientation:(int64_t)a3;
- (void)setID:(int64_t)a3;
- (void)setRollAngleInDegrees:(double)a3;
- (void)setTime:(id *)a3;
@end

@implementation ARHWFaceDetection

- (void)encodeWithCoder:(id)a3
{
  int64_t ID = self->_ID;
  id v5 = a3;
  [v5 encodeInt64:ID forKey:@"ID"];
  [v5 encodeDouble:@"rollAngleInDegrees" forKey:self->_rollAngleInDegrees];
  objc_msgSend(v5, "encodeRect:forKey:", @"boundingBox", self->_boundingBox.origin.x, self->_boundingBox.origin.y, self->_boundingBox.size.width, self->_boundingBox.size.height);
  [v5 encodeInteger:self->_detectionOrientation forKey:@"detectionOrientation"];
  $95D729B680665BEAEFA1D6FCA8238556 time = self->_time;
  [v5 encodeCMTime:&time forKey:@"time"];
}

- (ARHWFaceDetection)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)ARHWFaceDetection;
  id v5 = [(ARHWFaceDetection *)&v14 init];
  if (v5)
  {
    v5->_int64_t ID = [v4 decodeInt64ForKey:@"ID"];
    [v4 decodeDoubleForKey:@"rollAngleInDegrees"];
    v5->_rollAngleInDegrees = v6;
    [v4 decodeRectForKey:@"boundingBox"];
    v5->_boundingBox.origin.x = v7;
    v5->_boundingBox.origin.y = v8;
    v5->_boundingBox.size.width = v9;
    v5->_boundingBox.size.height = v10;
    v5->_detectionOrientation = [v4 decodeIntegerForKey:@"detectionOrientation"];
    if (v4)
    {
      [v4 decodeCMTimeForKey:@"time"];
    }
    else
    {
      long long v12 = 0uLL;
      int64_t v13 = 0;
    }
    *(_OWORD *)&v5->_time.value = v12;
    v5->_time.epoch = v13;
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
    && [(ARHWFaceDetection *)self isEqualToFaceDetection:v4];

  return v5;
}

- (BOOL)isEqualToFaceDetection:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(ARHWFaceDetection *)self ID];
  if (v5 != [v4 ID]) {
    goto LABEL_7;
  }
  [(ARHWFaceDetection *)self rollAngleInDegrees];
  double v7 = v6;
  [v4 rollAngleInDegrees];
  if (v7 != v8) {
    goto LABEL_7;
  }
  [(ARHWFaceDetection *)self boundingBox];
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  [v4 boundingBox];
  v27.origin.x = v17;
  v27.origin.y = v18;
  v27.size.width = v19;
  v27.size.height = v20;
  v26.origin.x = v10;
  v26.origin.y = v12;
  v26.size.width = v14;
  v26.size.height = v16;
  if (!CGRectEqualToRect(v26, v27)) {
    goto LABEL_7;
  }
  int64_t v21 = [(ARHWFaceDetection *)self detectionOrientation];
  if (v21 == [v4 detectionOrientation])
  {
    [(ARHWFaceDetection *)self time];
    if (v4) {
      [v4 time];
    }
    else {
      memset(&v24, 0, sizeof(v24));
    }
    BOOL v22 = CMTimeCompare(&time1, &v24) == 0;
  }
  else
  {
LABEL_7:
    BOOL v22 = 0;
  }

  return v22;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)faceDetectionFromDictionary:(id)a3
{
  id v3 = a3;
  id v4 = [v3 objectForKey:@"AngleInfoRoll"];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0) {
    goto LABEL_7;
  }
  double v6 = [v3 objectForKey:@"Rect"];
  objc_opt_class();
  char v7 = objc_opt_isKindOfClass();

  if ((v7 & 1) == 0) {
    goto LABEL_7;
  }
  double v8 = [v3 objectForKey:@"timestamp"];
  objc_opt_class();
  char v9 = objc_opt_isKindOfClass();

  if ((v9 & 1) == 0) {
    goto LABEL_7;
  }
  CGFloat v10 = [v3 objectForKey:@"FaceID"];
  objc_opt_class();
  char v11 = objc_opt_isKindOfClass();

  if ((v11 & 1) == 0) {
    goto LABEL_7;
  }
  memset(&rect, 0, sizeof(rect));
  CFDictionaryRef v12 = [v3 objectForKey:@"Rect"];
  BOOL v13 = CGRectMakeWithDictionaryRepresentation(v12, &rect);

  if (v13)
  {
    CGFloat v14 = objc_opt_new();
    double v15 = [v3 objectForKey:@"FaceID"];
    objc_msgSend(v14, "setID:", objc_msgSend(v15, "integerValue"));

    CGFloat v16 = [v3 objectForKey:@"AngleInfoRoll"];
    [v16 doubleValue];
    objc_msgSend(v14, "setRollAngleInDegrees:");

    objc_msgSend(v14, "setBoundingBox:", rect.origin.x, rect.origin.y, rect.size.width, rect.size.height);
    CGFloat v17 = [v3 objectForKey:@"timestamp"];
    CMTimeMake(&v20, [v17 integerValue], 1);
    CMTime v19 = v20;
    [v14 setTime:&v19];
  }
  else
  {
LABEL_7:
    CGFloat v14 = 0;
  }

  return v14;
}

- (int64_t)ID
{
  return self->_ID;
}

- (void)setID:(int64_t)a3
{
  self->_int64_t ID = a3;
}

- (double)rollAngleInDegrees
{
  return self->_rollAngleInDegrees;
}

- (void)setRollAngleInDegrees:(double)a3
{
  self->_rollAngleInDegrees = a3;
}

- (CGRect)boundingBox
{
  double x = self->_boundingBox.origin.x;
  double y = self->_boundingBox.origin.y;
  double width = self->_boundingBox.size.width;
  double height = self->_boundingBox.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setBoundingBox:(CGRect)a3
{
  self->_boundingBodouble x = a3;
}

- (int64_t)detectionOrientation
{
  return self->_detectionOrientation;
}

- (void)setDetectionOrientation:(int64_t)a3
{
  self->_detectionOrientation = a3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)time
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 32);
  return self;
}

- (void)setTime:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0;
  self->_time.epoch = a3->var3;
  *(_OWORD *)&self->_time.value = v3;
}

@end