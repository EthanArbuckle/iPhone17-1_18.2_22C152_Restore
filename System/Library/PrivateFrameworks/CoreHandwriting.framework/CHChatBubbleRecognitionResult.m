@interface CHChatBubbleRecognitionResult
+ (BOOL)supportsSecureCoding;
- (CGPoint)stemLocation;
- (CHChatBubbleRecognitionResult)initWithCoder:(id)a3;
- (CHChatBubbleRecognitionResult)initWithString:(id)a3 score:(double)a4 rotation:(double)a5 center:(CGPoint)a6 size:(CGSize)a7 stemLocation:(CGPoint)a8 stemWidth:(double)a9;
- (double)stemWidth;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CHChatBubbleRecognitionResult

- (CHChatBubbleRecognitionResult)initWithString:(id)a3 score:(double)a4 rotation:(double)a5 center:(CGPoint)a6 size:(CGSize)a7 stemLocation:(CGPoint)a8 stemWidth:(double)a9
{
  CGFloat y = a8.y;
  CGFloat x = a8.x;
  v12.receiver = self;
  v12.super_class = (Class)CHChatBubbleRecognitionResult;
  result = -[CHEllipseRecognitionResult initWithString:score:rotation:center:size:](&v12, sel_initWithString_score_rotation_center_size_, a3, a4, a5, a6.x, a6.y, a7.width, a7.height);
  if (result)
  {
    result->_stemLocation.CGFloat x = x;
    result->_stemLocation.CGFloat y = y;
    result->_stemWidth = a9;
  }
  return result;
}

- (CHChatBubbleRecognitionResult)initWithCoder:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)CHChatBubbleRecognitionResult;
  v5 = [(CHEllipseRecognitionResult *)&v19 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v6, @"stemLocation", v8, v9);
    v10 = (NSString *)objc_claimAutoreleasedReturnValue();
    parseFloatsFromString(v10, (char **)&v20);
    if ((char *)v21 - (char *)v20 == 8)
    {
      double v11 = *v20;
      double v12 = v20[1];
    }
    else
    {
      double v11 = *MEMORY[0x1E4F1DAD8];
      double v12 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
      if (!v20)
      {
LABEL_6:
        v5->_stemLocation.CGFloat x = v11;
        v5->_stemLocation.CGFloat y = v12;

        objc_msgSend_decodeFloatForKey_(v4, v13, @"stemWidth", v14, v15, v16);
        v5->_stemWidth = v17;
        goto LABEL_7;
      }
    }
    v21 = v20;
    operator delete(v20);
    goto LABEL_6;
  }
LABEL_7:

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)CHChatBubbleRecognitionResult;
  id v5 = [(CHEllipseRecognitionResult *)&v20 encodeWithCoder:v4];
  double v11 = pointToString(self->_stemLocation, (uint64_t)v5, v6, v7, v8, v9, v10);
  objc_msgSend_encodeObject_forKey_(v4, v12, (uint64_t)v11, @"stemLocation", v13, v14);

  double stemWidth = self->_stemWidth;
  *(float *)&double stemWidth = stemWidth;
  objc_msgSend_encodeFloat_forKey_(v4, v16, @"stemWidth", v17, v18, v19, stemWidth);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CGPoint)stemLocation
{
  objc_copyStruct(v4, &self->_stemLocation, 16, 1, 0);
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.CGFloat y = v3;
  result.CGFloat x = v2;
  return result;
}

- (double)stemWidth
{
  return self->_stemWidth;
}

@end