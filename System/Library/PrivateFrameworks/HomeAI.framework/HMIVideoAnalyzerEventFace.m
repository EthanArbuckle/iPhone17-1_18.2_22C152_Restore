@interface HMIVideoAnalyzerEventFace
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (HMIFaceRecognition)faceRecognition;
- (HMITorsoAnnotation)torsoAnnotation;
- (HMIVideoAnalyzerEventFace)initWithCoder:(id)a3;
- (HMIVideoAnalyzerEventFace)initWithConfidence:(id)a3 boundingBox:(CGRect)a4;
- (HMIVideoAnalyzerEventFace)initWithConfidence:(id)a3 boundingBox:(CGRect)a4 faceRecognition:(id)a5;
- (HMIVideoAnalyzerEventFace)initWithConfidence:(id)a3 boundingBox:(CGRect)a4 yaw:(id)a5 roll:(id)a6 faceRecognition:(id)a7 torsoAnnotation:(id)a8 userInfo:(id)a9;
- (HMIVideoAnalyzerEventFace)initWithConfidence:(id)a3 boundingBox:(CGRect)a4 yaw:(id)a5 roll:(id)a6 faceRecognition:(id)a7 userInfo:(id)a8;
- (NSNumber)roll;
- (NSNumber)yaw;
- (NSUUID)sessionEntityUUID;
- (id)attributeDescriptions;
- (id)description;
- (id)shortDescription;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HMIVideoAnalyzerEventFace

- (HMIVideoAnalyzerEventFace)initWithConfidence:(id)a3 boundingBox:(CGRect)a4
{
  return -[HMIVideoAnalyzerEventFace initWithConfidence:boundingBox:yaw:roll:faceRecognition:userInfo:](self, "initWithConfidence:boundingBox:yaw:roll:faceRecognition:userInfo:", a3, 0, 0, 0, 0, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
}

- (HMIVideoAnalyzerEventFace)initWithConfidence:(id)a3 boundingBox:(CGRect)a4 faceRecognition:(id)a5
{
  return -[HMIVideoAnalyzerEventFace initWithConfidence:boundingBox:yaw:roll:faceRecognition:torsoAnnotation:userInfo:](self, "initWithConfidence:boundingBox:yaw:roll:faceRecognition:torsoAnnotation:userInfo:", a3, 0, 0, a5, 0, 0, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
}

- (HMIVideoAnalyzerEventFace)initWithConfidence:(id)a3 boundingBox:(CGRect)a4 yaw:(id)a5 roll:(id)a6 faceRecognition:(id)a7 userInfo:(id)a8
{
  return -[HMIVideoAnalyzerEventFace initWithConfidence:boundingBox:yaw:roll:faceRecognition:torsoAnnotation:userInfo:](self, "initWithConfidence:boundingBox:yaw:roll:faceRecognition:torsoAnnotation:userInfo:", a3, a5, a6, a7, 0, a8, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
}

- (HMIVideoAnalyzerEventFace)initWithConfidence:(id)a3 boundingBox:(CGRect)a4 yaw:(id)a5 roll:(id)a6 faceRecognition:(id)a7 torsoAnnotation:(id)a8 userInfo:(id)a9
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v26 = a5;
  id v20 = a6;
  id v21 = a7;
  id v22 = a8;
  v27.receiver = self;
  v27.super_class = (Class)HMIVideoAnalyzerEventFace;
  v23 = -[HMIVideoAnalyzerEvent initWithConfidence:boundingBox:userInfo:](&v27, sel_initWithConfidence_boundingBox_userInfo_, a3, a9, x, y, width, height);
  v24 = v23;
  if (v23)
  {
    objc_storeStrong((id *)&v23->_faceRecognition, a7);
    objc_storeStrong((id *)&v24->_torsoAnnotation, a8);
    objc_storeStrong((id *)&v24->_yaw, a5);
    objc_storeStrong((id *)&v24->_roll, a6);
  }

  return v24;
}

- (NSUUID)sessionEntityUUID
{
  v3 = [(HMIVideoAnalyzerEventFace *)self faceRecognition];
  if (v3)
  {
    v4 = [(HMIVideoAnalyzerEventFace *)self faceRecognition];
    v5 = [v4 sessionEntityUUID];
  }
  else
  {
    v5 = 0;
  }

  return (NSUUID *)v5;
}

- (id)description
{
  return (id)MEMORY[0x270F30880](self, a2);
}

- (id)attributeDescriptions
{
  v20[4] = *MEMORY[0x263EF8340];
  v19.receiver = self;
  v19.super_class = (Class)HMIVideoAnalyzerEventFace;
  v3 = [(HMIVideoAnalyzerEvent *)&v19 attributeDescriptions];
  id v4 = objc_alloc(MEMORY[0x263F424F8]);
  v18 = [(HMIVideoAnalyzerEventFace *)self faceRecognition];
  v5 = (void *)[v4 initWithName:@"Face Recognition" value:v18];
  v20[0] = v5;
  id v6 = objc_alloc(MEMORY[0x263F424F8]);
  v7 = [(HMIVideoAnalyzerEventFace *)self torsoAnnotation];
  v8 = (void *)[v6 initWithName:@"Torso Annotation" value:v7];
  v20[1] = v8;
  id v9 = objc_alloc(MEMORY[0x263F424F8]);
  v10 = [(HMIVideoAnalyzerEventFace *)self yaw];
  v11 = (void *)[v9 initWithName:@"Face Yaw" value:v10];
  v20[2] = v11;
  id v12 = objc_alloc(MEMORY[0x263F424F8]);
  v13 = [(HMIVideoAnalyzerEventFace *)self roll];
  v14 = (void *)[v12 initWithName:@"Face Roll" value:v13];
  v20[3] = v14;
  v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v20 count:4];
  v16 = [v3 arrayByAddingObjectsFromArray:v15];

  return v16;
}

- (id)shortDescription
{
  v3 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)HMIVideoAnalyzerEventFace;
  id v4 = [(HMIVideoAnalyzerEvent *)&v11 shortDescription];
  v5 = [(HMIVideoAnalyzerEventFace *)self roll];
  id v6 = HMIFormatNumber(v5, 2);
  v7 = [(HMIVideoAnalyzerEventFace *)self yaw];
  v8 = HMIFormatNumber(v7, 2);
  id v9 = [v3 stringWithFormat:@"%@@(%@,%@)", v4, v6, v8];

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v5 = v4;
  }
  else {
    v5 = 0;
  }
  id v6 = v5;
  if (!v6) {
    goto LABEL_10;
  }
  v19.receiver = self;
  v19.super_class = (Class)HMIVideoAnalyzerEventFace;
  if (![(HMIVideoAnalyzerEvent *)&v19 isEqual:v6]) {
    goto LABEL_10;
  }
  v7 = [(HMIVideoAnalyzerEventFace *)self faceRecognition];
  v8 = [v6 faceRecognition];
  int v9 = HMFEqualObjects();

  if (!v9) {
    goto LABEL_10;
  }
  v10 = [(HMIVideoAnalyzerEventFace *)self torsoAnnotation];
  objc_super v11 = [v6 torsoAnnotation];
  int v12 = HMFEqualObjects();

  if (v12)
  {
    v13 = [(HMIVideoAnalyzerEventFace *)self yaw];
    v14 = [v6 yaw];
    if (v13 == v14)
    {
      v17 = [(HMIVideoAnalyzerEventFace *)self roll];
      v18 = [v6 roll];
      BOOL v15 = v17 == v18;
    }
    else
    {
      BOOL v15 = 0;
    }
  }
  else
  {
LABEL_10:
    BOOL v15 = 0;
  }

  return v15;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)HMIVideoAnalyzerEventFace;
  id v4 = a3;
  [(HMIVideoAnalyzerEvent *)&v9 encodeWithCoder:v4];
  v5 = [(HMIVideoAnalyzerEventFace *)self faceRecognition];
  [v4 encodeObject:v5 forKey:@"HMIVAEF.fr"];

  id v6 = [(HMIVideoAnalyzerEventFace *)self torsoAnnotation];
  [v4 encodeObject:v6 forKey:@"HMIVAEF.ta"];

  v7 = [(HMIVideoAnalyzerEventFace *)self yaw];
  [v4 encodeObject:v7 forKey:@"HMIVAEF.ya"];

  v8 = [(HMIVideoAnalyzerEventFace *)self roll];
  [v4 encodeObject:v8 forKey:@"HMIVAEF.ro"];
}

- (HMIVideoAnalyzerEventFace)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [[HMIVideoAnalyzerEvent alloc] initWithCoder:v4];
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMIVAEF.fr"];
    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMIVAEF.ta"];
    v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMIVAEF.ya"];
    objc_super v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMIVAEF.ro"];
    v10 = [(HMIVideoAnalyzerEvent *)v5 confidence];
    [(HMIVideoAnalyzerEvent *)v5 boundingBox];
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;
    double v18 = v17;
    objc_super v19 = [(HMIVideoAnalyzerEvent *)v5 userInfo];
    self = -[HMIVideoAnalyzerEventFace initWithConfidence:boundingBox:yaw:roll:faceRecognition:torsoAnnotation:userInfo:](self, "initWithConfidence:boundingBox:yaw:roll:faceRecognition:torsoAnnotation:userInfo:", v10, v8, v9, v6, v7, v19, v12, v14, v16, v18);

    id v20 = self;
  }
  else
  {
    id v20 = 0;
  }

  return v20;
}

- (HMIFaceRecognition)faceRecognition
{
  return (HMIFaceRecognition *)objc_getProperty(self, a2, 56, 1);
}

- (NSNumber)yaw
{
  return (NSNumber *)objc_getProperty(self, a2, 64, 1);
}

- (NSNumber)roll
{
  return (NSNumber *)objc_getProperty(self, a2, 72, 1);
}

- (HMITorsoAnnotation)torsoAnnotation
{
  return (HMITorsoAnnotation *)objc_getProperty(self, a2, 80, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_torsoAnnotation, 0);
  objc_storeStrong((id *)&self->_roll, 0);
  objc_storeStrong((id *)&self->_yaw, 0);
  objc_storeStrong((id *)&self->_faceRecognition, 0);
}

@end