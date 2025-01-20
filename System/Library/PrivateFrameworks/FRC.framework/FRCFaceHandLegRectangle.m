@interface FRCFaceHandLegRectangle
+ (id)animalFaceRectangleWithBoundingBox:(CGRect)a3;
+ (id)bodyRectangleWithCenter:(CGPoint)a3 tip:(CGPoint)a4 category:(unint64_t)a5 frameAspectRatio:(float)a6;
+ (id)faceRectangleWithBoundingBox:(CGRect)a3 roll:(id)a4 yaw:(id)a5;
+ (id)handRectangleWithObservation:(id)a3;
+ (id)humanRectangleWithBoundingBox:(CGRect)a3;
- (CGRect)boundingBox;
- (NSNumber)roll;
- (NSNumber)yaw;
- (unint64_t)category;
- (void)setBoundingBox:(CGRect)a3;
- (void)setCategory:(unint64_t)a3;
- (void)setRoll:(id)a3;
- (void)setYaw:(id)a3;
@end

@implementation FRCFaceHandLegRectangle

+ (id)faceRectangleWithBoundingBox:(CGRect)a3 roll:(id)a4 yaw:(id)a5
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v11 = a4;
  id v12 = a5;
  v17.receiver = a1;
  v17.super_class = (Class)&OBJC_METACLASS___FRCFaceHandLegRectangle;
  v13 = objc_msgSend(objc_msgSendSuper2(&v17, sel_alloc), "init");
  v14 = v13;
  if (v13)
  {
    [v13 setCategory:0];
    objc_msgSend(v14, "setBoundingBox:", x, y, width, height);
    if (v11) {
      [v14 setRoll:v11];
    }
    if (v12) {
      [v14 setYaw:v12];
    }
    id v15 = v14;
  }

  return v14;
}

+ (id)handRectangleWithObservation:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = objc_alloc_init(FRCFaceHandLegRectangle);
  v5 = v4;
  if (v4)
  {
    [(FRCFaceHandLegRectangle *)v4 setCategory:1];
    uint64_t v6 = *MEMORY[0x1E4F45CF0];
    id v33 = 0;
    v7 = [v3 recognizedPointsForGroupKey:v6 error:&v33];
    id v8 = v33;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v9 = v7;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v29 objects:v34 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v30;
      double v13 = 1.79769313e308;
      double v14 = 2.22507386e-308;
      double v15 = 2.22507386e-308;
      double v16 = 1.79769313e308;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v30 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v18 = *(void *)(*((void *)&v29 + 1) + 8 * i);
          v19 = objc_msgSend(v9, "objectForKeyedSubscript:", v18, (void)v29);
          [v19 confidence];
          float v21 = v20;

          if (v21 > 0.0)
          {
            v22 = [v9 objectForKeyedSubscript:v18];
            [v22 location];
            double v24 = v23;
            double v26 = v25;

            double v16 = fmin(v16, v24);
            double v15 = fmax(v15, v24);
            double v13 = fmin(v13, v26);
            double v14 = fmax(v14, v26);
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v29 objects:v34 count:16];
      }
      while (v11);
    }
    else
    {
      double v13 = 1.79769313e308;
      double v14 = 2.22507386e-308;
      double v15 = 2.22507386e-308;
      double v16 = 1.79769313e308;
    }

    -[FRCFaceHandLegRectangle setBoundingBox:](v5, "setBoundingBox:", v16, v13, v15 - v16, v14 - v13);
    v27 = v5;
  }
  return v5;
}

+ (id)humanRectangleWithBoundingBox:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v11.receiver = a1;
  v11.super_class = (Class)&OBJC_METACLASS___FRCFaceHandLegRectangle;
  v7 = objc_msgSend(objc_msgSendSuper2(&v11, sel_alloc), "init");
  id v8 = v7;
  if (v7)
  {
    [v7 setCategory:4];
    objc_msgSend(v8, "setBoundingBox:", x, y, width, height);
    id v9 = v8;
  }

  return v8;
}

+ (id)bodyRectangleWithCenter:(CGPoint)a3 tip:(CGPoint)a4 category:(unint64_t)a5 frameAspectRatio:(float)a6
{
  double y = a4.y;
  double x = a4.x;
  double v10 = a3.y;
  double v11 = a3.x;
  v19.receiver = a1;
  v19.super_class = (Class)&OBJC_METACLASS___FRCFaceHandLegRectangle;
  uint64_t v12 = objc_msgSend(objc_msgSendSuper2(&v19, sel_alloc), "init");
  double v13 = v12;
  double v14 = vabdd_f64(x, v11);
  float v15 = v14 + v14;
  double v16 = vabdd_f64(y, v10);
  float v17 = v16 + v16;
  if ((float)(v15 * a6) >= v17)
  {
    if ((float)(v15 * a6) > v17) {
      float v17 = fmaxf(v17, (float)(v15 * a6) * 0.5);
    }
  }
  else
  {
    float v15 = fmaxf(v15, (float)(v17 / a6) * 0.5);
  }
  objc_msgSend(v12, "setBoundingBox:", v11 - (float)(v15 * 0.5), v10 - (float)(v17 * 0.5), v15, v17);
  [v13 setCategory:a5];
  return v13;
}

+ (id)animalFaceRectangleWithBoundingBox:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v11.receiver = a1;
  v11.super_class = (Class)&OBJC_METACLASS___FRCFaceHandLegRectangle;
  v7 = objc_msgSend(objc_msgSendSuper2(&v11, sel_alloc), "init");
  id v8 = v7;
  if (v7)
  {
    [v7 setCategory:5];
    objc_msgSend(v8, "setBoundingBox:", x, y, width, height);
    id v9 = v8;
  }

  return v8;
}

- (unint64_t)category
{
  return self->_category;
}

- (void)setCategory:(unint64_t)a3
{
  self->_categordouble y = a3;
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

- (NSNumber)roll
{
  return self->_roll;
}

- (void)setRoll:(id)a3
{
}

- (NSNumber)yaw
{
  return self->_yaw;
}

- (void)setYaw:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_yaw, 0);
  objc_storeStrong((id *)&self->_roll, 0);
}

@end