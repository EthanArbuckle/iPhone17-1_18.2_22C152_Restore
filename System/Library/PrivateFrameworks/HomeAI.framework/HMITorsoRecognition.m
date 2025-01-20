@interface HMITorsoRecognition
+ (BOOL)supportsSecureCoding;
- (HMITorsoClassification)classification;
- (HMITorsoRecognition)initWithCoder:(id)a3;
- (HMITorsoRecognition)initWithTorsoprint:(id)a3 classification:(id)a4 predictedLinkedEntityUUIDs:(id)a5 sessionEntityAssignment:(int64_t)a6 sessionEntityUUID:(id)a7;
- (HMITorsoprint)torsoprint;
- (NSSet)predictedLinkedEntityUUIDs;
- (NSUUID)sessionEntityUUID;
- (int64_t)sessionEntityAssignment;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HMITorsoRecognition

- (HMITorsoRecognition)initWithTorsoprint:(id)a3 classification:(id)a4 predictedLinkedEntityUUIDs:(id)a5 sessionEntityAssignment:(int64_t)a6 sessionEntityUUID:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a7;
  v20.receiver = self;
  v20.super_class = (Class)HMITorsoRecognition;
  v17 = [(HMITorsoRecognition *)&v20 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_torsoprint, a3);
    objc_storeStrong((id *)&v18->_classification, a4);
    objc_storeStrong((id *)&v18->_predictedLinkedEntityUUIDs, a5);
    v18->_sessionEntityAssignment = a6;
    objc_storeStrong((id *)&v18->_sessionEntityUUID, a7);
  }

  return v18;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(HMITorsoRecognition *)self classification];
  [v4 encodeObject:v5 forKey:@"HMITR.c"];

  v6 = [(HMITorsoRecognition *)self torsoprint];
  [v4 encodeObject:v6 forKey:@"HMITR.tp"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[HMITorsoRecognition sessionEntityAssignment](self, "sessionEntityAssignment"), @"HMITR.sea");
  id v7 = [(HMITorsoRecognition *)self sessionEntityUUID];
  [v4 encodeObject:v7 forKey:@"HMITR.seu"];
}

- (HMITorsoRecognition)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMITR.tp"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMITR.c"];
  uint64_t v7 = [v4 decodeIntegerForKey:@"HMITR.sea"];
  v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMITR.seu"];

  v9 = [MEMORY[0x263EFFA08] set];
  v10 = [(HMITorsoRecognition *)self initWithTorsoprint:v5 classification:v6 predictedLinkedEntityUUIDs:v9 sessionEntityAssignment:v7 sessionEntityUUID:v8];

  return v10;
}

- (HMITorsoprint)torsoprint
{
  return (HMITorsoprint *)objc_getProperty(self, a2, 8, 1);
}

- (HMITorsoClassification)classification
{
  return (HMITorsoClassification *)objc_getProperty(self, a2, 16, 1);
}

- (NSSet)predictedLinkedEntityUUIDs
{
  return (NSSet *)objc_getProperty(self, a2, 24, 1);
}

- (int64_t)sessionEntityAssignment
{
  return self->_sessionEntityAssignment;
}

- (NSUUID)sessionEntityUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 40, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionEntityUUID, 0);
  objc_storeStrong((id *)&self->_predictedLinkedEntityUUIDs, 0);
  objc_storeStrong((id *)&self->_classification, 0);
  objc_storeStrong((id *)&self->_torsoprint, 0);
}

@end