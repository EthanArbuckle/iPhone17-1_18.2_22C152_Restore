@interface CHLineSketchRecognitionResult
+ (BOOL)supportsSecureCoding;
- (BOOL)cornerLine;
- (CGPoint)controlPoint;
- (CGPoint)endLocation;
- (CGPoint)midpointLocation;
- (CGPoint)startLocation;
- (CHLineSketchRecognitionResult)initWithCoder:(id)a3;
- (CHLineSketchRecognitionResult)initWithString:(id)a3 score:(double)a4 rotation:(double)a5 startLocation:(CGPoint)a6 startEndpointType:(int)a7 endLocation:(CGPoint)a8 endEndpointType:(int)a9 midPointLocation:(CGPoint)a10 controlPointLocation:(CGPoint)a11;
- (CHLineSketchRecognitionResult)initWithString:(id)a3 score:(double)a4 rotation:(double)a5 startLocation:(CGPoint)a6 startEndpointType:(int)a7 endLocation:(CGPoint)a8 endEndpointType:(int)a9 midPointLocation:(CGPoint)a10 controlPointLocation:(CGPoint)a11 pathPoints:(id)a12;
- (NSArray)pathPoints;
- (int)endEndpointType;
- (int)startEndpointType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CHLineSketchRecognitionResult

- (CHLineSketchRecognitionResult)initWithString:(id)a3 score:(double)a4 rotation:(double)a5 startLocation:(CGPoint)a6 startEndpointType:(int)a7 endLocation:(CGPoint)a8 endEndpointType:(int)a9 midPointLocation:(CGPoint)a10 controlPointLocation:(CGPoint)a11 pathPoints:(id)a12
{
  CGFloat x = a11.x;
  CGFloat y = a10.y;
  CGFloat v14 = a10.x;
  CGFloat v16 = a8.y;
  CGFloat v17 = a8.x;
  CGFloat v19 = a6.y;
  CGFloat v20 = a6.x;
  id v25 = *(id *)&a11.x;
  v29.receiver = self;
  v29.super_class = (Class)CHLineSketchRecognitionResult;
  v26 = [(CHSketchRecognitionResult *)&v29 initWithString:a3 score:a4 rotation:a5];
  v27 = v26;
  if (v26)
  {
    v26->_startLocation.CGFloat x = v20;
    v26->_startLocation.CGFloat y = v19;
    v26->_startEndpointType = a7;
    v26->_endLocation.CGFloat x = v17;
    v26->_endLocation.CGFloat y = v16;
    v26->_endEndpointType = a9;
    v26->_midpointLocation.CGFloat x = v14;
    v26->_midpointLocation.CGFloat y = y;
    v26->_controlPoint.CGFloat x = v30;
    v26->_controlPoint.CGFloat y = v31;
    objc_storeStrong((id *)&v26->_pathPoints, *(id *)&x);
  }

  return v27;
}

- (CHLineSketchRecognitionResult)initWithString:(id)a3 score:(double)a4 rotation:(double)a5 startLocation:(CGPoint)a6 startEndpointType:(int)a7 endLocation:(CGPoint)a8 endEndpointType:(int)a9 midPointLocation:(CGPoint)a10 controlPointLocation:(CGPoint)a11
{
  return (CHLineSketchRecognitionResult *)objc_msgSend_initWithString_score_rotation_startLocation_startEndpointType_endLocation_endEndpointType_midPointLocation_controlPointLocation_pathPoints_(self, a2, (uint64_t)a3, *(uint64_t *)&a7, *(uint64_t *)&a9, 0, *(void *)&a11.y, a4, a5, a6.x, a6.y, a8.x, a8.y, a10.x, a10.y);
}

- (CHLineSketchRecognitionResult)initWithCoder:(id)a3
{
  id v4 = a3;
  v49.receiver = self;
  v49.super_class = (Class)CHLineSketchRecognitionResult;
  v5 = [(CHSketchRecognitionResult *)&v49 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v6, @"starLocation", v8, v9);
    v10 = (NSString *)objc_claimAutoreleasedReturnValue();
    parseFloatsFromString(v10, (char **)&v50);
    if ((char *)v51 - (char *)v50 == 8)
    {
      double v11 = *v50;
      double v12 = v50[1];
    }
    else
    {
      double v11 = *MEMORY[0x1E4F1DAD8];
      double v12 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
      if (!v50) {
        goto LABEL_6;
      }
    }
    v51 = v50;
    operator delete(v50);
LABEL_6:
    v5->_startLocation.CGFloat x = v11;
    v5->_startLocation.CGFloat y = v12;

    v5->_startEndpointType = objc_msgSend_decodeIntegerForKey_(v4, v13, @"startEndpointType", v14, v15, v16);
    uint64_t v17 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v18, v17, @"endLocation", v19, v20);
    v21 = (NSString *)objc_claimAutoreleasedReturnValue();
    parseFloatsFromString(v21, (char **)&v50);
    if ((char *)v51 - (char *)v50 == 8)
    {
      double v22 = *v50;
      double v23 = v50[1];
    }
    else
    {
      double v22 = *MEMORY[0x1E4F1DAD8];
      double v23 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
      if (!v50) {
        goto LABEL_10;
      }
    }
    v51 = v50;
    operator delete(v50);
LABEL_10:
    v5->_endLocation.CGFloat x = v22;
    v5->_endLocation.CGFloat y = v23;

    v5->_endEndpointType = objc_msgSend_decodeIntegerForKey_(v4, v24, @"endEndpointType", v25, v26, v27);
    uint64_t v28 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v29, v28, @"midLocation", v30, v31);
    v32 = (NSString *)objc_claimAutoreleasedReturnValue();
    parseFloatsFromString(v32, (char **)&v50);
    if ((char *)v51 - (char *)v50 == 8)
    {
      double v33 = *v50;
      double v34 = v50[1];
    }
    else
    {
      double v33 = *MEMORY[0x1E4F1DAD8];
      double v34 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
      if (!v50) {
        goto LABEL_14;
      }
    }
    v51 = v50;
    operator delete(v50);
LABEL_14:
    v5->_midpointLocation.CGFloat x = v33;
    v5->_midpointLocation.CGFloat y = v34;

    uint64_t v35 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v36, v35, @"controlPoint", v37, v38);
    v39 = (NSString *)objc_claimAutoreleasedReturnValue();
    parseFloatsFromString(v39, (char **)&v50);
    if ((char *)v51 - (char *)v50 == 8)
    {
      double v40 = *v50;
      double v41 = v50[1];
    }
    else
    {
      double v40 = *MEMORY[0x1E4F1DAD8];
      double v41 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
      if (!v50)
      {
LABEL_18:
        v5->_controlPoint.CGFloat x = v40;
        v5->_controlPoint.CGFloat y = v41;

        uint64_t v42 = objc_opt_class();
        uint64_t v46 = objc_msgSend_decodeArrayOfObjectsOfClass_forKey_(v4, v43, v42, @"pathPoints", v44, v45);
        pathPoints = v5->_pathPoints;
        v5->_pathPoints = (NSArray *)v46;

        goto LABEL_19;
      }
    }
    v51 = v50;
    operator delete(v50);
    goto LABEL_18;
  }
LABEL_19:

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v54.receiver = self;
  v54.super_class = (Class)CHLineSketchRecognitionResult;
  id v5 = [(CHSketchRecognitionResult *)&v54 encodeWithCoder:v4];
  double v11 = pointToString(self->_startLocation, (uint64_t)v5, v6, v7, v8, v9, v10);
  objc_msgSend_encodeObject_forKey_(v4, v12, (uint64_t)v11, @"starLocation", v13, v14);

  uint64_t v18 = objc_msgSend_encodeInteger_forKey_(v4, v15, self->_startEndpointType, @"startEndpointType", v16, v17);
  v24 = pointToString(self->_endLocation, v18, v19, v20, v21, v22, v23);
  objc_msgSend_encodeObject_forKey_(v4, v25, (uint64_t)v24, @"endLocation", v26, v27);

  uint64_t v31 = objc_msgSend_encodeInteger_forKey_(v4, v28, self->_endEndpointType, @"endEndpointType", v29, v30);
  uint64_t v37 = pointToString(self->_midpointLocation, v31, v32, v33, v34, v35, v36);
  objc_msgSend_encodeObject_forKey_(v4, v38, (uint64_t)v37, @"midLocation", v39, v40);

  v47 = pointToString(self->_controlPoint, v41, v42, v43, v44, v45, v46);
  objc_msgSend_encodeObject_forKey_(v4, v48, (uint64_t)v47, @"controlPoint", v49, v50);

  objc_msgSend_encodeObject_forKey_(v4, v51, (uint64_t)self->_pathPoints, @"pathPoints", v52, v53);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (int)startEndpointType
{
  return self->_startEndpointType;
}

- (int)endEndpointType
{
  return self->_endEndpointType;
}

- (CGPoint)startLocation
{
  objc_copyStruct(v4, &self->_startLocation, 16, 1, 0);
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.CGFloat y = v3;
  result.CGFloat x = v2;
  return result;
}

- (CGPoint)endLocation
{
  objc_copyStruct(v4, &self->_endLocation, 16, 1, 0);
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.CGFloat y = v3;
  result.CGFloat x = v2;
  return result;
}

- (CGPoint)midpointLocation
{
  objc_copyStruct(v4, &self->_midpointLocation, 16, 1, 0);
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.CGFloat y = v3;
  result.CGFloat x = v2;
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

- (NSArray)pathPoints
{
  return (NSArray *)objc_getProperty(self, a2, 48, 1);
}

- (BOOL)cornerLine
{
  return self->_cornerLine;
}

- (void).cxx_destruct
{
}

@end