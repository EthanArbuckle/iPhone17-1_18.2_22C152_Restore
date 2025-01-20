@interface HMIVideoAnalyzerEventTorso
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (HMITorsoRecognition)torsoRecognition;
- (HMIVideoAnalyzerEventTorso)initWithCoder:(id)a3;
- (HMIVideoAnalyzerEventTorso)initWithConfidence:(id)a3 boundingBox:(CGRect)a4;
- (HMIVideoAnalyzerEventTorso)initWithConfidence:(id)a3 boundingBox:(CGRect)a4 roll:(id)a5 torsoRecognition:(id)a6;
- (NSNumber)roll;
- (NSUUID)sessionEntityUUID;
- (id)attributeDescriptions;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HMIVideoAnalyzerEventTorso

- (HMIVideoAnalyzerEventTorso)initWithConfidence:(id)a3 boundingBox:(CGRect)a4
{
  return -[HMIVideoAnalyzerEventTorso initWithConfidence:boundingBox:roll:torsoRecognition:](self, "initWithConfidence:boundingBox:roll:torsoRecognition:", a3, 0, 0, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
}

- (HMIVideoAnalyzerEventTorso)initWithConfidence:(id)a3 boundingBox:(CGRect)a4 roll:(id)a5 torsoRecognition:(id)a6
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v14 = a5;
  id v15 = a6;
  v19.receiver = self;
  v19.super_class = (Class)HMIVideoAnalyzerEventTorso;
  v16 = -[HMIVideoAnalyzerEvent initWithConfidence:boundingBox:userInfo:](&v19, sel_initWithConfidence_boundingBox_userInfo_, a3, 0, x, y, width, height);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_roll, a5);
    objc_storeStrong((id *)&v17->_torsoRecognition, a6);
  }

  return v17;
}

- (NSUUID)sessionEntityUUID
{
  v3 = [(HMIVideoAnalyzerEventTorso *)self torsoRecognition];
  if (v3)
  {
    v4 = [(HMIVideoAnalyzerEventTorso *)self torsoRecognition];
    v5 = [v4 sessionEntityUUID];
  }
  else
  {
    v5 = 0;
  }

  return (NSUUID *)v5;
}

- (id)attributeDescriptions
{
  v14[2] = *MEMORY[0x263EF8340];
  v13.receiver = self;
  v13.super_class = (Class)HMIVideoAnalyzerEventTorso;
  v3 = [(HMIVideoAnalyzerEvent *)&v13 attributeDescriptions];
  id v4 = objc_alloc(MEMORY[0x263F424F8]);
  v5 = [(HMIVideoAnalyzerEventTorso *)self roll];
  v6 = (void *)[v4 initWithName:@"Torso Roll" value:v5];
  v14[0] = v6;
  id v7 = objc_alloc(MEMORY[0x263F424F8]);
  v8 = [(HMIVideoAnalyzerEventTorso *)self torsoRecognition];
  v9 = (void *)[v7 initWithName:@"Torso Recognition" value:v8];
  v14[1] = v9;
  v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:2];
  v11 = [v3 arrayByAddingObjectsFromArray:v10];

  return v11;
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
  if (v6)
  {
    v9.receiver = self;
    v9.super_class = (Class)HMIVideoAnalyzerEventTorso;
    BOOL v7 = [(HMIVideoAnalyzerEvent *)&v9 isEqual:v6];
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  v3.receiver = self;
  v3.super_class = (Class)HMIVideoAnalyzerEventTorso;
  return [(HMIVideoAnalyzerEvent *)&v3 hash];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)HMIVideoAnalyzerEventTorso;
  id v4 = a3;
  [(HMIVideoAnalyzerEvent *)&v7 encodeWithCoder:v4];
  v5 = [(HMIVideoAnalyzerEventTorso *)self roll];
  [v4 encodeObject:v5 forKey:@"HMIVAET.ro"];

  id v6 = [(HMIVideoAnalyzerEventTorso *)self torsoRecognition];
  [v4 encodeObject:v6 forKey:@"HMIVAET.tr"];
}

- (HMIVideoAnalyzerEventTorso)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [[HMIVideoAnalyzerEvent alloc] initWithCoder:v4];
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMIVAET.ro"];
    objc_super v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMIVAET.tr"];
    v8 = [(HMIVideoAnalyzerEvent *)v5 confidence];
    [(HMIVideoAnalyzerEvent *)v5 boundingBox];
    self = -[HMIVideoAnalyzerEventTorso initWithConfidence:boundingBox:roll:torsoRecognition:](self, "initWithConfidence:boundingBox:roll:torsoRecognition:", v8, v6, v7);

    objc_super v9 = self;
  }
  else
  {
    objc_super v9 = 0;
  }

  return v9;
}

- (HMITorsoRecognition)torsoRecognition
{
  return (HMITorsoRecognition *)objc_getProperty(self, a2, 56, 1);
}

- (NSNumber)roll
{
  return (NSNumber *)objc_getProperty(self, a2, 64, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_roll, 0);
  objc_storeStrong((id *)&self->_torsoRecognition, 0);
}

@end