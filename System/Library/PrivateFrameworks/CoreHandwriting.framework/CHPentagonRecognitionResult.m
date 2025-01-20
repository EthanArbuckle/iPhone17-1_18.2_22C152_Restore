@interface CHPentagonRecognitionResult
+ (BOOL)supportsSecureCoding;
- (CGPoint)center;
- (CGSize)size;
- (CHPentagonRecognitionResult)initWithCoder:(id)a3;
- (CHPentagonRecognitionResult)initWithString:(id)a3 score:(double)a4 rotation:(double)a5 center:(CGPoint)a6 size:(CGSize)a7;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CHPentagonRecognitionResult

- (CHPentagonRecognitionResult)initWithString:(id)a3 score:(double)a4 rotation:(double)a5 center:(CGPoint)a6 size:(CGSize)a7
{
  CGFloat height = a7.height;
  CGFloat width = a7.width;
  CGFloat y = a6.y;
  CGFloat x = a6.x;
  v12.receiver = self;
  v12.super_class = (Class)CHPentagonRecognitionResult;
  result = [(CHSketchRecognitionResult *)&v12 initWithString:a3 score:a4 rotation:a5];
  if (result)
  {
    result->_center.CGFloat x = x;
    result->_center.CGFloat y = y;
    result->_size.CGFloat width = width;
    result->_size.CGFloat height = height;
  }
  return result;
}

- (CHPentagonRecognitionResult)initWithCoder:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)CHPentagonRecognitionResult;
  v5 = [(CHSketchRecognitionResult *)&v20 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v6, @"center", v8, v9);
    v10 = (NSString *)objc_claimAutoreleasedReturnValue();
    parseFloatsFromString(v10, (char **)&v21);
    if ((char *)v22 - (char *)v21 == 8)
    {
      double v11 = *v21;
      double v12 = v21[1];
    }
    else
    {
      double v11 = *MEMORY[0x1E4F1DAD8];
      double v12 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
      if (!v21)
      {
LABEL_6:
        v5->_center.CGFloat x = v11;
        v5->_center.CGFloat y = v12;

        uint64_t v13 = objc_opt_class();
        objc_msgSend_decodeObjectOfClass_forKey_(v4, v14, v13, @"size", v15, v16);
        v17 = (NSString *)objc_claimAutoreleasedReturnValue();
        v5->_size.CGFloat width = sizeFromString(v17);
        v5->_size.CGFloat height = v18;

        goto LABEL_7;
      }
    }
    v22 = v21;
    operator delete(v21);
    goto LABEL_6;
  }
LABEL_7:

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)CHPentagonRecognitionResult;
  id v5 = [(CHSketchRecognitionResult *)&v25 encodeWithCoder:v4];
  double v11 = pointToString(self->_center, (uint64_t)v5, v6, v7, v8, v9, v10);
  objc_msgSend_encodeObject_forKey_(v4, v12, (uint64_t)v11, @"center", v13, v14);

  v21 = sizeToString(self->_size, v15, v16, v17, v18, v19, v20);
  objc_msgSend_encodeObject_forKey_(v4, v22, (uint64_t)v21, @"size", v23, v24);
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

@end