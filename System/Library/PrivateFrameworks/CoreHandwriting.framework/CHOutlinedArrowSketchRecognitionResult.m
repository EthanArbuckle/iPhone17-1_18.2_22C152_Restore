@interface CHOutlinedArrowSketchRecognitionResult
+ (BOOL)supportsSecureCoding;
- (CGPoint)center;
- (CGPoint)controlPoint;
- (CGSize)size;
- (CHOutlinedArrowSketchRecognitionResult)initWithCoder:(id)a3;
- (CHOutlinedArrowSketchRecognitionResult)initWithString:(id)a3 score:(double)a4 rotation:(double)a5 center:(CGPoint)a6 size:(CGSize)a7 controlPointLocation:(CGPoint)a8;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CHOutlinedArrowSketchRecognitionResult

- (CHOutlinedArrowSketchRecognitionResult)initWithString:(id)a3 score:(double)a4 rotation:(double)a5 center:(CGPoint)a6 size:(CGSize)a7 controlPointLocation:(CGPoint)a8
{
  CGFloat y = a8.y;
  CGFloat x = a8.x;
  CGFloat height = a7.height;
  CGFloat width = a7.width;
  CGFloat v12 = a6.y;
  CGFloat v13 = a6.x;
  v15.receiver = self;
  v15.super_class = (Class)CHOutlinedArrowSketchRecognitionResult;
  result = [(CHSketchRecognitionResult *)&v15 initWithString:a3 score:a4 rotation:a5];
  if (result)
  {
    result->_center.CGFloat x = v13;
    result->_center.CGFloat y = v12;
    result->_size.CGFloat width = width;
    result->_size.CGFloat height = height;
    result->_controlPoint.CGFloat x = x;
    result->_controlPoint.CGFloat y = y;
  }
  return result;
}

- (CHOutlinedArrowSketchRecognitionResult)initWithCoder:(id)a3
{
  id v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)CHOutlinedArrowSketchRecognitionResult;
  v5 = [(CHSketchRecognitionResult *)&v27 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v6, @"center", v8, v9);
    v10 = (NSString *)objc_claimAutoreleasedReturnValue();
    parseFloatsFromString(v10, (char **)&v28);
    if ((char *)v29 - (char *)v28 == 8)
    {
      double v11 = *v28;
      double v12 = v28[1];
    }
    else
    {
      double v11 = *MEMORY[0x1E4F1DAD8];
      double v12 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
      if (!v28) {
        goto LABEL_6;
      }
    }
    v29 = v28;
    operator delete(v28);
LABEL_6:
    v5->_center.CGFloat x = v11;
    v5->_center.CGFloat y = v12;

    uint64_t v13 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v14, v13, @"size", v15, v16);
    v17 = (NSString *)objc_claimAutoreleasedReturnValue();
    v5->_size.CGFloat width = sizeFromString(v17);
    v5->_size.CGFloat height = v18;

    uint64_t v19 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v20, v19, @"controlPoint", v21, v22);
    v23 = (NSString *)objc_claimAutoreleasedReturnValue();
    parseFloatsFromString(v23, (char **)&v28);
    if ((char *)v29 - (char *)v28 == 8)
    {
      double v24 = *v28;
      double v25 = v28[1];
    }
    else
    {
      double v24 = *MEMORY[0x1E4F1DAD8];
      double v25 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
      if (!v28)
      {
LABEL_10:
        v5->_controlPoint.CGFloat x = v24;
        v5->_controlPoint.CGFloat y = v25;

        goto LABEL_11;
      }
    }
    v29 = v28;
    operator delete(v28);
    goto LABEL_10;
  }
LABEL_11:

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v35.receiver = self;
  v35.super_class = (Class)CHOutlinedArrowSketchRecognitionResult;
  id v5 = [(CHSketchRecognitionResult *)&v35 encodeWithCoder:v4];
  double v11 = pointToString(self->_center, (uint64_t)v5, v6, v7, v8, v9, v10);
  objc_msgSend_encodeObject_forKey_(v4, v12, (uint64_t)v11, @"center", v13, v14);

  uint64_t v21 = sizeToString(self->_size, v15, v16, v17, v18, v19, v20);
  objc_msgSend_encodeObject_forKey_(v4, v22, (uint64_t)v21, @"size", v23, v24);

  v31 = pointToString(self->_controlPoint, v25, v26, v27, v28, v29, v30);
  objc_msgSend_encodeObject_forKey_(v4, v32, (uint64_t)v31, @"controlPoint", v33, v34);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CGPoint)center
{
  objc_copyStruct(v4, &self->_center, 16, 1, 0);
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.CGFloat y = v3;
  result.CGFloat x = v2;
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

- (CGPoint)controlPoint
{
  objc_copyStruct(v4, &self->_controlPoint, 16, 1, 0);
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.CGFloat y = v3;
  result.CGFloat x = v2;
  return result;
}

@end