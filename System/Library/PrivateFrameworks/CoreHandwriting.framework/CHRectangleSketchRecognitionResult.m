@interface CHRectangleSketchRecognitionResult
+ (BOOL)supportsSecureCoding;
- (CGPoint)lowerLeftPoint;
- (CGPoint)lowerRightPoint;
- (CGPoint)upperLeftPoint;
- (CGPoint)upperRightPoint;
- (CGSize)size;
- (CHRectangleSketchRecognitionResult)initWithCoder:(id)a3;
- (CHRectangleSketchRecognitionResult)initWithString:(id)a3 score:(double)a4 rotation:(double)a5 upperLeftPoint:(CGPoint)a6 upperRightPoint:(CGPoint)a7 lowerLeftPoint:(CGPoint)a8 lowerRightPoint:(CGPoint)a9 size:(CGSize)a10;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CHRectangleSketchRecognitionResult

- (CHRectangleSketchRecognitionResult)initWithString:(id)a3 score:(double)a4 rotation:(double)a5 upperLeftPoint:(CGPoint)a6 upperRightPoint:(CGPoint)a7 lowerLeftPoint:(CGPoint)a8 lowerRightPoint:(CGPoint)a9 size:(CGSize)a10
{
  CGFloat y = a8.y;
  CGFloat x = a8.x;
  CGFloat v12 = a7.y;
  CGFloat v13 = a7.x;
  CGFloat v14 = a6.y;
  CGFloat v15 = a6.x;
  v17.receiver = self;
  v17.super_class = (Class)CHRectangleSketchRecognitionResult;
  result = -[CHSketchRecognitionResult initWithString:score:rotation:](&v17, sel_initWithString_score_rotation_, a3, *(void *)&a9.x, *(void *)&a9.y, *(void *)&a10.width, *(void *)&a10.height, a4, a5);
  if (result)
  {
    result->_upperLeftPoint.CGFloat x = v15;
    result->_upperLeftPoint.CGFloat y = v14;
    result->_upperRightPoint.CGFloat x = v13;
    result->_upperRightPoint.CGFloat y = v12;
    result->_lowerLeftPoint.CGFloat x = x;
    result->_lowerLeftPoint.CGFloat y = y;
    result->_lowerRightPoint.CGFloat x = v18;
    result->_lowerRightPoint.CGFloat y = v19;
    result->_size.width = v20;
    result->_size.height = v21;
  }
  return result;
}

- (CHRectangleSketchRecognitionResult)initWithCoder:(id)a3
{
  id v4 = a3;
  v41.receiver = self;
  v41.super_class = (Class)CHRectangleSketchRecognitionResult;
  v5 = [(CHSketchRecognitionResult *)&v41 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v6, @"upperLeftPoint", v8, v9);
    v10 = (NSString *)objc_claimAutoreleasedReturnValue();
    parseFloatsFromString(v10, (char **)&v42);
    if ((char *)v43 - (char *)v42 == 8)
    {
      double v11 = *v42;
      double v12 = v42[1];
    }
    else
    {
      double v11 = *MEMORY[0x1E4F1DAD8];
      double v12 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
      if (!v42) {
        goto LABEL_6;
      }
    }
    v43 = v42;
    operator delete(v42);
LABEL_6:
    v5->_upperLeftPoint.CGFloat x = v11;
    v5->_upperLeftPoint.CGFloat y = v12;

    uint64_t v13 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v14, v13, @"upperRightPoint", v15, v16);
    objc_super v17 = (NSString *)objc_claimAutoreleasedReturnValue();
    parseFloatsFromString(v17, (char **)&v42);
    if ((char *)v43 - (char *)v42 == 8)
    {
      double v18 = *v42;
      double v19 = v42[1];
    }
    else
    {
      double v18 = *MEMORY[0x1E4F1DAD8];
      double v19 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
      if (!v42) {
        goto LABEL_10;
      }
    }
    v43 = v42;
    operator delete(v42);
LABEL_10:
    v5->_upperRightPoint.CGFloat x = v18;
    v5->_upperRightPoint.CGFloat y = v19;

    uint64_t v20 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v21, v20, @"lowerLeftPoint", v22, v23);
    v24 = (NSString *)objc_claimAutoreleasedReturnValue();
    parseFloatsFromString(v24, (char **)&v42);
    if ((char *)v43 - (char *)v42 == 8)
    {
      double v25 = *v42;
      double v26 = v42[1];
    }
    else
    {
      double v25 = *MEMORY[0x1E4F1DAD8];
      double v26 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
      if (!v42) {
        goto LABEL_14;
      }
    }
    v43 = v42;
    operator delete(v42);
LABEL_14:
    v5->_lowerLeftPoint.CGFloat x = v25;
    v5->_lowerLeftPoint.CGFloat y = v26;

    uint64_t v27 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v28, v27, @"lowerRightPoint", v29, v30);
    v31 = (NSString *)objc_claimAutoreleasedReturnValue();
    parseFloatsFromString(v31, (char **)&v42);
    if ((char *)v43 - (char *)v42 == 8)
    {
      double v32 = *v42;
      double v33 = v42[1];
    }
    else
    {
      double v32 = *MEMORY[0x1E4F1DAD8];
      double v33 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
      if (!v42)
      {
LABEL_18:
        v5->_lowerRightPoint.CGFloat x = v32;
        v5->_lowerRightPoint.CGFloat y = v33;

        uint64_t v34 = objc_opt_class();
        objc_msgSend_decodeObjectOfClass_forKey_(v4, v35, v34, @"size", v36, v37);
        v38 = (NSString *)objc_claimAutoreleasedReturnValue();
        v5->_size.width = sizeFromString(v38);
        v5->_size.height = v39;

        goto LABEL_19;
      }
    }
    v43 = v42;
    operator delete(v42);
    goto LABEL_18;
  }
LABEL_19:

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v55.receiver = self;
  v55.super_class = (Class)CHRectangleSketchRecognitionResult;
  id v5 = [(CHSketchRecognitionResult *)&v55 encodeWithCoder:v4];
  double v11 = pointToString(self->_upperLeftPoint, (uint64_t)v5, v6, v7, v8, v9, v10);
  objc_msgSend_encodeObject_forKey_(v4, v12, (uint64_t)v11, @"upperLeftPoint", v13, v14);

  CGFloat v21 = pointToString(self->_upperRightPoint, v15, v16, v17, v18, v19, v20);
  objc_msgSend_encodeObject_forKey_(v4, v22, (uint64_t)v21, @"upperRightPoint", v23, v24);

  v31 = pointToString(self->_lowerLeftPoint, v25, v26, v27, v28, v29, v30);
  objc_msgSend_encodeObject_forKey_(v4, v32, (uint64_t)v31, @"lowerLeftPoint", v33, v34);

  objc_super v41 = pointToString(self->_lowerRightPoint, v35, v36, v37, v38, v39, v40);
  objc_msgSend_encodeObject_forKey_(v4, v42, (uint64_t)v41, @"lowerRightPoint", v43, v44);

  v51 = sizeToString(self->_size, v45, v46, v47, v48, v49, v50);
  objc_msgSend_encodeObject_forKey_(v4, v52, (uint64_t)v51, @"size", v53, v54);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CGPoint)upperLeftPoint
{
  objc_copyStruct(v4, &self->_upperLeftPoint, 16, 1, 0);
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.CGFloat y = v3;
  result.CGFloat x = v2;
  return result;
}

- (CGPoint)upperRightPoint
{
  objc_copyStruct(v4, &self->_upperRightPoint, 16, 1, 0);
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.CGFloat y = v3;
  result.CGFloat x = v2;
  return result;
}

- (CGPoint)lowerLeftPoint
{
  objc_copyStruct(v4, &self->_lowerLeftPoint, 16, 1, 0);
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.CGFloat y = v3;
  result.CGFloat x = v2;
  return result;
}

- (CGPoint)lowerRightPoint
{
  objc_copyStruct(v4, &self->_lowerRightPoint, 16, 1, 0);
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
  result.height = v3;
  result.width = v2;
  return result;
}

@end