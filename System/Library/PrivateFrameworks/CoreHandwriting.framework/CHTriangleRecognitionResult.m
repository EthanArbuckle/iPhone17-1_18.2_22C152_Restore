@interface CHTriangleRecognitionResult
+ (BOOL)supportsSecureCoding;
- (CGPoint)vertex1;
- (CGPoint)vertex2;
- (CGPoint)vertex3;
- (CHTriangleRecognitionResult)initWithCoder:(id)a3;
- (CHTriangleRecognitionResult)initWithString:(id)a3 score:(double)a4 rotation:(double)a5 vertex1:(CGPoint)a6 vertex2:(CGPoint)a7 vertex3:(CGPoint)a8;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CHTriangleRecognitionResult

- (CHTriangleRecognitionResult)initWithString:(id)a3 score:(double)a4 rotation:(double)a5 vertex1:(CGPoint)a6 vertex2:(CGPoint)a7 vertex3:(CGPoint)a8
{
  CGFloat y = a8.y;
  CGFloat x = a8.x;
  CGFloat v10 = a7.y;
  CGFloat v11 = a7.x;
  CGFloat v12 = a6.y;
  CGFloat v13 = a6.x;
  v15.receiver = self;
  v15.super_class = (Class)CHTriangleRecognitionResult;
  result = [(CHSketchRecognitionResult *)&v15 initWithString:a3 score:a4 rotation:a5];
  if (result)
  {
    result->_vertex1.CGFloat x = v13;
    result->_vertex1.CGFloat y = v12;
    result->_vertex2.CGFloat x = v11;
    result->_vertex2.CGFloat y = v10;
    result->_vertex3.CGFloat x = x;
    result->_vertex3.CGFloat y = y;
  }
  return result;
}

- (CHTriangleRecognitionResult)initWithCoder:(id)a3
{
  id v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)CHTriangleRecognitionResult;
  v5 = [(CHSketchRecognitionResult *)&v28 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v6, @"vertex1", v8, v9);
    CGFloat v10 = (NSString *)objc_claimAutoreleasedReturnValue();
    parseFloatsFromString(v10, (char **)&v29);
    if ((char *)v30 - (char *)v29 == 8)
    {
      double v11 = *v29;
      double v12 = v29[1];
    }
    else
    {
      double v11 = *MEMORY[0x1E4F1DAD8];
      double v12 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
      if (!v29) {
        goto LABEL_6;
      }
    }
    v30 = v29;
    operator delete(v29);
LABEL_6:
    v5->_vertex1.CGFloat x = v11;
    v5->_vertex1.CGFloat y = v12;

    uint64_t v13 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v14, v13, @"vertex2", v15, v16);
    v17 = (NSString *)objc_claimAutoreleasedReturnValue();
    parseFloatsFromString(v17, (char **)&v29);
    if ((char *)v30 - (char *)v29 == 8)
    {
      double v18 = *v29;
      double v19 = v29[1];
    }
    else
    {
      double v18 = *MEMORY[0x1E4F1DAD8];
      double v19 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
      if (!v29) {
        goto LABEL_10;
      }
    }
    v30 = v29;
    operator delete(v29);
LABEL_10:
    v5->_vertex2.CGFloat x = v18;
    v5->_vertex2.CGFloat y = v19;

    uint64_t v20 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v21, v20, @"vertex3", v22, v23);
    v24 = (NSString *)objc_claimAutoreleasedReturnValue();
    parseFloatsFromString(v24, (char **)&v29);
    if ((char *)v30 - (char *)v29 == 8)
    {
      double v25 = *v29;
      double v26 = v29[1];
    }
    else
    {
      double v25 = *MEMORY[0x1E4F1DAD8];
      double v26 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
      if (!v29)
      {
LABEL_14:
        v5->_vertex3.CGFloat x = v25;
        v5->_vertex3.CGFloat y = v26;

        goto LABEL_15;
      }
    }
    v30 = v29;
    operator delete(v29);
    goto LABEL_14;
  }
LABEL_15:

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v35.receiver = self;
  v35.super_class = (Class)CHTriangleRecognitionResult;
  id v5 = [(CHSketchRecognitionResult *)&v35 encodeWithCoder:v4];
  double v11 = pointToString(self->_vertex1, (uint64_t)v5, v6, v7, v8, v9, v10);
  objc_msgSend_encodeObject_forKey_(v4, v12, (uint64_t)v11, @"vertex1", v13, v14);

  v21 = pointToString(self->_vertex2, v15, v16, v17, v18, v19, v20);
  objc_msgSend_encodeObject_forKey_(v4, v22, (uint64_t)v21, @"vertex2", v23, v24);

  v31 = pointToString(self->_vertex3, v25, v26, v27, v28, v29, v30);
  objc_msgSend_encodeObject_forKey_(v4, v32, (uint64_t)v31, @"vertex3", v33, v34);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CGPoint)vertex1
{
  objc_copyStruct(v4, &self->_vertex1, 16, 1, 0);
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.CGFloat y = v3;
  result.CGFloat x = v2;
  return result;
}

- (CGPoint)vertex2
{
  objc_copyStruct(v4, &self->_vertex2, 16, 1, 0);
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.CGFloat y = v3;
  result.CGFloat x = v2;
  return result;
}

- (CGPoint)vertex3
{
  objc_copyStruct(v4, &self->_vertex3, 16, 1, 0);
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.CGFloat y = v3;
  result.CGFloat x = v2;
  return result;
}

@end