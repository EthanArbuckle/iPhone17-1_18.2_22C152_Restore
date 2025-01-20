@interface HMIVideoAnalyzerEventPerson
+ (BOOL)supportsSecureCoding;
- (BOOL)hasEstimatedBoundingBox;
- (BOOL)isEqual:(id)a3;
- (CGRect)boundingBox;
- (CGRect)boundingBoxForTracker;
- (HMIVideoAnalyzerEventFace)face;
- (HMIVideoAnalyzerEventPerson)initWithCoder:(id)a3;
- (HMIVideoAnalyzerEventPerson)initWithConfidence:(id)a3 boundingBox:(CGRect)a4;
- (HMIVideoAnalyzerEventPerson)initWithConfidence:(id)a3 boundingBox:(CGRect)a4 face:(id)a5;
- (HMIVideoAnalyzerEventPerson)initWithConfidence:(id)a3 boundingBox:(CGRect)a4 face:(id)a5 torso:(id)a6;
- (HMIVideoAnalyzerEventPerson)initWithFaceEvent:(id)a3;
- (HMIVideoAnalyzerEventPerson)initWithFaceEvent:(id)a3 torso:(id)a4;
- (HMIVideoAnalyzerEventPerson)initWithTorsoEvent:(id)a3;
- (HMIVideoAnalyzerEventTorso)torso;
- (NSUUID)sessionEntityUUID;
- (id)allEvents;
- (id)attributeDescriptions;
- (id)confidence;
- (id)copyWithFaceEvent:(id)a3 torso:(id)a4;
- (id)shortDescription;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HMIVideoAnalyzerEventPerson

- (HMIVideoAnalyzerEventPerson)initWithConfidence:(id)a3 boundingBox:(CGRect)a4
{
  v9.receiver = self;
  v9.super_class = (Class)HMIVideoAnalyzerEventPerson;
  v4 = -[HMIVideoAnalyzerEvent initWithConfidence:boundingBox:](&v9, sel_initWithConfidence_boundingBox_, a3, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  v5 = v4;
  if (v4)
  {
    face = v4->_face;
    v4->_face = 0;

    torso = v5->_torso;
    v5->_torso = 0;

    v5->_isBoundingBoxEstimated = 0;
  }
  return v5;
}

- (HMIVideoAnalyzerEventPerson)initWithConfidence:(id)a3 boundingBox:(CGRect)a4 face:(id)a5
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v12 = a5;
  v17.receiver = self;
  v17.super_class = (Class)HMIVideoAnalyzerEventPerson;
  v13 = -[HMIVideoAnalyzerEvent initWithConfidence:boundingBox:](&v17, sel_initWithConfidence_boundingBox_, a3, x, y, width, height);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_face, a5);
    torso = v14->_torso;
    v14->_torso = 0;

    v14->_isBoundingBoxEstimated = 0;
  }

  return v14;
}

- (HMIVideoAnalyzerEventPerson)initWithConfidence:(id)a3 boundingBox:(CGRect)a4 face:(id)a5 torso:(id)a6
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v14 = a5;
  id v15 = a6;
  v19.receiver = self;
  v19.super_class = (Class)HMIVideoAnalyzerEventPerson;
  v16 = -[HMIVideoAnalyzerEvent initWithConfidence:boundingBox:userInfo:](&v19, sel_initWithConfidence_boundingBox_userInfo_, a3, 0, x, y, width, height);
  objc_super v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_face, a5);
    objc_storeStrong((id *)&v17->_torso, a6);
    v17->_isBoundingBoxEstimated = 0;
  }

  return v17;
}

- (HMIVideoAnalyzerEventPerson)initWithFaceEvent:(id)a3
{
  id v5 = a3;
  v6 = [[HMIConfidence alloc] initWithValue:&unk_26D9A9828 levelThresholds:0.0];
  v11.receiver = self;
  v11.super_class = (Class)HMIVideoAnalyzerEventPerson;
  v7 = -[HMIVideoAnalyzerEvent initWithConfidence:boundingBox:](&v11, sel_initWithConfidence_boundingBox_, v6, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_face, a3);
    torso = v8->_torso;
    v8->_torso = 0;

    v8->_isBoundingBoxEstimated = 1;
  }

  return v8;
}

- (HMIVideoAnalyzerEventPerson)initWithTorsoEvent:(id)a3
{
  id v5 = a3;
  v6 = [[HMIConfidence alloc] initWithValue:&unk_26D9A9840 levelThresholds:0.0];
  v11.receiver = self;
  v11.super_class = (Class)HMIVideoAnalyzerEventPerson;
  v7 = -[HMIVideoAnalyzerEvent initWithConfidence:boundingBox:](&v11, sel_initWithConfidence_boundingBox_, v6, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  v8 = v7;
  if (v7)
  {
    face = v7->_face;
    v7->_face = 0;

    objc_storeStrong((id *)&v8->_torso, a3);
    v8->_isBoundingBoxEstimated = 1;
  }

  return v8;
}

- (HMIVideoAnalyzerEventPerson)initWithFaceEvent:(id)a3 torso:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  objc_super v9 = [[HMIConfidence alloc] initWithValue:&unk_26D9A9858 levelThresholds:0.0];
  v13.receiver = self;
  v13.super_class = (Class)HMIVideoAnalyzerEventPerson;
  v10 = -[HMIVideoAnalyzerEvent initWithConfidence:boundingBox:](&v13, sel_initWithConfidence_boundingBox_, v9, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  objc_super v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_face, a3);
    objc_storeStrong((id *)&v11->_torso, a4);
    v11->_isBoundingBoxEstimated = 1;
  }

  return v11;
}

- (id)copyWithFaceEvent:(id)a3 torso:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(HMIVideoAnalyzerEventPerson *)self hasEstimatedBoundingBox])
  {
    if (v6 && v7)
    {
      id v8 = [[HMIVideoAnalyzerEventPerson alloc] initWithFaceEvent:v6 torso:v7];
LABEL_13:
      objc_super v11 = v8;
      goto LABEL_14;
    }
    if (v6 && !v7)
    {
      id v8 = [[HMIVideoAnalyzerEventPerson alloc] initWithFaceEvent:v6];
      goto LABEL_13;
    }
    id v12 = [HMIVideoAnalyzerEventPerson alloc];
    objc_super v13 = v12;
    if (!v6 && v7)
    {
      id v8 = [(HMIVideoAnalyzerEventPerson *)v12 initWithTorsoEvent:v7];
      goto LABEL_13;
    }
    v10 = [(HMIVideoAnalyzerEventPerson *)self confidence];
    [(HMIVideoAnalyzerEventPerson *)self boundingBox];
    double v16 = v15;
    double v18 = v17;
    double v20 = v19;
    double v22 = v21;
    v23 = [(HMIVideoAnalyzerEventPerson *)self face];
    v24 = [(HMIVideoAnalyzerEventPerson *)self torso];
    objc_super v11 = -[HMIVideoAnalyzerEventPerson initWithConfidence:boundingBox:face:torso:](v13, "initWithConfidence:boundingBox:face:torso:", v10, v23, v24, v16, v18, v20, v22);
  }
  else
  {
    objc_super v9 = [HMIVideoAnalyzerEventPerson alloc];
    v10 = [(HMIVideoAnalyzerEventPerson *)self confidence];
    [(HMIVideoAnalyzerEventPerson *)self boundingBox];
    objc_super v11 = -[HMIVideoAnalyzerEventPerson initWithConfidence:boundingBox:face:torso:](v9, "initWithConfidence:boundingBox:face:torso:", v10, v6, v7);
  }

LABEL_14:
  return v11;
}

- (id)allEvents
{
  v3 = [MEMORY[0x263EFF980] arrayWithObject:self];
  v4 = [(HMIVideoAnalyzerEventPerson *)self face];

  if (v4)
  {
    id v5 = [(HMIVideoAnalyzerEventPerson *)self face];
    [v3 addObject:v5];
  }
  id v6 = [(HMIVideoAnalyzerEventPerson *)self torso];

  if (v6)
  {
    id v7 = [(HMIVideoAnalyzerEventPerson *)self torso];
    [v3 addObject:v7];
  }
  id v8 = (void *)[v3 copy];

  return v8;
}

- (CGRect)boundingBox
{
  if ([(HMIVideoAnalyzerEventPerson *)self hasEstimatedBoundingBox]
    && ([(HMIVideoAnalyzerEventPerson *)self torso],
        v3 = objc_claimAutoreleasedReturnValue(),
        v3,
        v3))
  {
    v4 = [(HMIVideoAnalyzerEventPerson *)self torso];
  }
  else
  {
    if (![(HMIVideoAnalyzerEventPerson *)self hasEstimatedBoundingBox]
      || ([(HMIVideoAnalyzerEventPerson *)self face],
          id v5 = objc_claimAutoreleasedReturnValue(),
          v5,
          !v5))
    {
      v23.receiver = self;
      v23.super_class = (Class)HMIVideoAnalyzerEventPerson;
      [(HMIVideoAnalyzerEvent *)&v23 boundingBox];
      double v8 = v15;
      double v10 = v16;
      double v12 = v17;
      double v14 = v18;
      goto LABEL_9;
    }
    v4 = [(HMIVideoAnalyzerEventPerson *)self face];
  }
  id v6 = v4;
  [v4 boundingBox];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;

LABEL_9:
  double v19 = v8;
  double v20 = v10;
  double v21 = v12;
  double v22 = v14;
  result.size.double height = v22;
  result.size.double width = v21;
  result.origin.double y = v20;
  result.origin.double x = v19;
  return result;
}

- (CGRect)boundingBoxForTracker
{
  if ([(HMIVideoAnalyzerEventPerson *)self hasEstimatedBoundingBox]
    && ([(HMIVideoAnalyzerEventPerson *)self torso],
        v3 = objc_claimAutoreleasedReturnValue(),
        v3,
        v3))
  {
    v4 = [(HMIVideoAnalyzerEventPerson *)self torso];
    [v4 boundingBox];
    CGFloat x = v5;
    CGFloat y = v7;
    CGFloat width = v9;
    CGFloat height = v11;
  }
  else if ([(HMIVideoAnalyzerEventPerson *)self hasEstimatedBoundingBox] {
         && ([(HMIVideoAnalyzerEventPerson *)self face],
  }
             double v13 = objc_claimAutoreleasedReturnValue(),
             v13,
             v13))
  {
    double v14 = [(HMIVideoAnalyzerEventPerson *)self face];
    [v14 boundingBox];
    CGFloat v16 = v15;
    CGFloat v18 = v17;
    CGFloat v20 = v19;
    CGFloat v22 = v21;
    objc_super v23 = [(HMIVideoAnalyzerEventPerson *)self face];
    [v23 boundingBox];
    CGFloat v24 = CGRectGetWidth(v36) * -0.5;
    v25 = [(HMIVideoAnalyzerEventPerson *)self face];
    [v25 boundingBox];
    CGFloat v26 = CGRectGetHeight(v37) * -0.5;
    v38.origin.CGFloat x = v16;
    v38.origin.CGFloat y = v18;
    v38.size.CGFloat width = v20;
    v38.size.CGFloat height = v22;
    CGRect v39 = CGRectInset(v38, v24, v26);
    CGFloat x = v39.origin.x;
    CGFloat y = v39.origin.y;
    CGFloat width = v39.size.width;
    CGFloat height = v39.size.height;
  }
  else
  {
    v35.receiver = self;
    v35.super_class = (Class)HMIVideoAnalyzerEventPerson;
    [(HMIVideoAnalyzerEvent *)&v35 boundingBox];
    CGFloat x = v27;
    CGFloat y = v28;
    CGFloat width = v29;
    CGFloat height = v30;
  }
  double v31 = x;
  double v32 = y;
  double v33 = width;
  double v34 = height;
  result.size.CGFloat height = v34;
  result.size.CGFloat width = v33;
  result.origin.CGFloat y = v32;
  result.origin.CGFloat x = v31;
  return result;
}

- (id)confidence
{
  if ([(HMIVideoAnalyzerEventPerson *)self hasEstimatedBoundingBox])
  {
    v3 = [(HMIVideoAnalyzerEventPerson *)self torso];

    if (v3)
    {
      v4 = [(HMIVideoAnalyzerEventPerson *)self torso];
LABEL_7:
      id v6 = v4;
      double v7 = [v4 confidence];

      goto LABEL_9;
    }
  }
  if ([(HMIVideoAnalyzerEventPerson *)self hasEstimatedBoundingBox])
  {
    double v5 = [(HMIVideoAnalyzerEventPerson *)self face];

    if (v5)
    {
      v4 = [(HMIVideoAnalyzerEventPerson *)self face];
      goto LABEL_7;
    }
  }
  v9.receiver = self;
  v9.super_class = (Class)HMIVideoAnalyzerEventPerson;
  double v7 = [(HMIVideoAnalyzerEvent *)&v9 confidence];
LABEL_9:
  return v7;
}

- (NSUUID)sessionEntityUUID
{
  uint64_t v3 = [(HMIVideoAnalyzerEventPerson *)self face];
  if (!v3
    || (v4 = (void *)v3,
        [(HMIVideoAnalyzerEventPerson *)self face],
        double v5 = objc_claimAutoreleasedReturnValue(),
        [v5 sessionEntityUUID],
        id v6 = objc_claimAutoreleasedReturnValue(),
        v5,
        v4,
        !v6))
  {
    double v7 = [(HMIVideoAnalyzerEventPerson *)self torso];
    if (v7)
    {
      double v8 = [(HMIVideoAnalyzerEventPerson *)self torso];
      id v6 = [v8 sessionEntityUUID];
    }
    else
    {
      id v6 = 0;
    }
  }
  return (NSUUID *)v6;
}

- (id)attributeDescriptions
{
  v17[3] = *MEMORY[0x263EF8340];
  v16.receiver = self;
  v16.super_class = (Class)HMIVideoAnalyzerEventPerson;
  uint64_t v3 = [(HMIVideoAnalyzerEvent *)&v16 attributeDescriptions];
  id v4 = objc_alloc(MEMORY[0x263F424F8]);
  double v5 = objc_msgSend(NSNumber, "numberWithBool:", -[HMIVideoAnalyzerEventPerson hasEstimatedBoundingBox](self, "hasEstimatedBoundingBox"));
  id v6 = (void *)[v4 initWithName:@"Is Bounding Box & Confidence Estimated" value:v5];
  v17[0] = v6;
  id v7 = objc_alloc(MEMORY[0x263F424F8]);
  double v8 = [(HMIVideoAnalyzerEventPerson *)self face];
  objc_super v9 = (void *)[v7 initWithName:@"Face" value:v8];
  v17[1] = v9;
  id v10 = objc_alloc(MEMORY[0x263F424F8]);
  double v11 = [(HMIVideoAnalyzerEventPerson *)self torso];
  double v12 = (void *)[v10 initWithName:@"Torso" value:v11];
  v17[2] = v12;
  double v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:3];
  double v14 = [v3 arrayByAddingObjectsFromArray:v13];

  return v14;
}

- (id)shortDescription
{
  uint64_t v3 = [(HMIVideoAnalyzerEventPerson *)self face];
  if (v3)
  {
    id v4 = [(HMIVideoAnalyzerEventPerson *)self face];
    double v5 = [v4 shortDescription];
  }
  else
  {
    double v5 = &stru_26D98B6C8;
  }

  id v6 = [(HMIVideoAnalyzerEventPerson *)self torso];
  if (v6)
  {
    id v7 = [(HMIVideoAnalyzerEventPerson *)self torso];
    double v8 = [v7 shortDescription];
  }
  else
  {
    double v8 = &stru_26D98B6C8;
  }

  objc_super v9 = NSString;
  v13.receiver = self;
  v13.super_class = (Class)HMIVideoAnalyzerEventPerson;
  id v10 = [(HMIVideoAnalyzerEvent *)&v13 shortDescription];
  double v11 = [v9 stringWithFormat:@"%@ %@ %@", v10, v5, v8];

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    double v5 = v4;
  }
  else {
    double v5 = 0;
  }
  id v6 = v5;
  if (!v6) {
    goto LABEL_9;
  }
  int v7 = [(HMIVideoAnalyzerEventPerson *)self hasEstimatedBoundingBox];
  if (v7 != [v6 hasEstimatedBoundingBox]) {
    goto LABEL_9;
  }
  v15.receiver = self;
  v15.super_class = (Class)HMIVideoAnalyzerEventPerson;
  if (![(HMIVideoAnalyzerEvent *)&v15 isEqual:v6]) {
    goto LABEL_9;
  }
  double v8 = [(HMIVideoAnalyzerEventPerson *)self face];
  objc_super v9 = [v6 face];
  int v10 = HMFEqualObjects();

  if (v10)
  {
    double v11 = [(HMIVideoAnalyzerEventPerson *)self torso];
    double v12 = [v6 torso];
    char v13 = HMFEqualObjects();
  }
  else
  {
LABEL_9:
    char v13 = 0;
  }

  return v13;
}

- (unint64_t)hash
{
  uint64_t v3 = [(HMIVideoAnalyzerEventPerson *)self hasEstimatedBoundingBox];
  v5.receiver = self;
  v5.super_class = (Class)HMIVideoAnalyzerEventPerson;
  return [(HMIVideoAnalyzerEvent *)&v5 hash] ^ v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)HMIVideoAnalyzerEventPerson;
  id v4 = a3;
  [(HMIVideoAnalyzerEvent *)&v7 encodeWithCoder:v4];
  objc_super v5 = [(HMIVideoAnalyzerEventPerson *)self face];
  [v4 encodeObject:v5 forKey:@"HMIVAEP.f"];

  id v6 = [(HMIVideoAnalyzerEventPerson *)self torso];
  [v4 encodeObject:v6 forKey:@"HMIVAEP.t"];

  objc_msgSend(v4, "encodeBool:forKey:", -[HMIVideoAnalyzerEventPerson hasEstimatedBoundingBox](self, "hasEstimatedBoundingBox"), @"HMIVAEP.ibbe");
}

- (HMIVideoAnalyzerEventPerson)initWithCoder:(id)a3
{
  id v4 = a3;
  objc_super v5 = [[HMIVideoAnalyzerEvent alloc] initWithCoder:v4];
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMIVAEP.f"];
    objc_super v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMIVAEP.t"];
    if ([v4 decodeBoolForKey:@"HMIVAEP.ibbe"])
    {
      if (v6 && v7)
      {
        double v8 = [(HMIVideoAnalyzerEventPerson *)self initWithFaceEvent:v6 torso:v7];
LABEL_11:
        self = v8;
LABEL_13:

        objc_super v9 = self;
        goto LABEL_14;
      }
      if (v6)
      {
        double v8 = [(HMIVideoAnalyzerEventPerson *)self initWithFaceEvent:v6];
        goto LABEL_11;
      }
      if (v7)
      {
        double v8 = [(HMIVideoAnalyzerEventPerson *)self initWithTorsoEvent:v7];
        goto LABEL_11;
      }
    }
    int v10 = [(HMIVideoAnalyzerEvent *)v5 confidence];
    [(HMIVideoAnalyzerEvent *)v5 boundingBox];
    self = -[HMIVideoAnalyzerEventPerson initWithConfidence:boundingBox:face:torso:](self, "initWithConfidence:boundingBox:face:torso:", v10, v6, v7);

    goto LABEL_13;
  }
  objc_super v9 = 0;
LABEL_14:

  return v9;
}

- (HMIVideoAnalyzerEventFace)face
{
  return (HMIVideoAnalyzerEventFace *)objc_getProperty(self, a2, 64, 1);
}

- (BOOL)hasEstimatedBoundingBox
{
  return self->_isBoundingBoxEstimated;
}

- (HMIVideoAnalyzerEventTorso)torso
{
  return (HMIVideoAnalyzerEventTorso *)objc_getProperty(self, a2, 72, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_torso, 0);
  objc_storeStrong((id *)&self->_face, 0);
}

@end