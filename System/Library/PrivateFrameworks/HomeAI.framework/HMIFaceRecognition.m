@interface HMIFaceRecognition
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (HMIFaceCrop)faceCrop;
- (HMIFaceRecognition)initWithCoder:(id)a3;
- (HMIFaceRecognition)initWithFaceCrop:(id)a3 faceprint:(id)a4 classifications:(id)a5;
- (HMIFaceRecognition)initWithFaceCrop:(id)a3 faceprint:(id)a4 classifications:(id)a5 predictedLinkedEntityUUIDs:(id)a6;
- (HMIFaceRecognition)initWithFaceCrop:(id)a3 faceprint:(id)a4 classifications:(id)a5 predictedLinkedEntityUUIDs:(id)a6 faceQualityScore:(double)a7 sessionEntityAssignment:(int64_t)a8 sessionEntityUUID:(id)a9;
- (HMIFaceprint)faceprint;
- (NSSet)classifications;
- (NSSet)predictedLinkedEntityUUIDs;
- (NSString)description;
- (NSUUID)sessionEntityUUID;
- (double)faceQualityScore;
- (id)attributeDescriptions;
- (int64_t)sessionEntityAssignment;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HMIFaceRecognition

- (HMIFaceRecognition)initWithFaceCrop:(id)a3 faceprint:(id)a4 classifications:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = [v8 anyObject];
  if (v11)
  {
    v12 = [v8 anyObject];
    v13 = [v12 sessionEntityUUID];
  }
  else
  {
    v13 = [MEMORY[0x263F08C38] UUID];
  }

  v14 = [(HMIFaceRecognition *)self initWithFaceCrop:v10 faceprint:v9 classifications:v8 predictedLinkedEntityUUIDs:0 faceQualityScore:0 sessionEntityAssignment:v13 sessionEntityUUID:-1.0];
  return v14;
}

- (HMIFaceRecognition)initWithFaceCrop:(id)a3 faceprint:(id)a4 classifications:(id)a5 predictedLinkedEntityUUIDs:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  id v12 = a4;
  id v13 = a3;
  v14 = [v10 anyObject];
  if (v14)
  {
    v15 = [v10 anyObject];
    v16 = [v15 sessionEntityUUID];
  }
  else
  {
    v16 = [MEMORY[0x263F08C38] UUID];
  }

  v17 = [(HMIFaceRecognition *)self initWithFaceCrop:v13 faceprint:v12 classifications:v10 predictedLinkedEntityUUIDs:v11 faceQualityScore:0 sessionEntityAssignment:v16 sessionEntityUUID:-1.0];
  return v17;
}

- (HMIFaceRecognition)initWithFaceCrop:(id)a3 faceprint:(id)a4 classifications:(id)a5 predictedLinkedEntityUUIDs:(id)a6 faceQualityScore:(double)a7 sessionEntityAssignment:(int64_t)a8 sessionEntityUUID:(id)a9
{
  id v24 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a9;
  v25.receiver = self;
  v25.super_class = (Class)HMIFaceRecognition;
  v20 = [(HMIFaceRecognition *)&v25 init];
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_faceCrop, a3);
    objc_storeStrong((id *)&v21->_faceprint, a4);
    objc_storeStrong((id *)&v21->_classifications, a5);
    objc_storeStrong((id *)&v21->_predictedLinkedEntityUUIDs, a6);
    v21->_faceQualityScore = a7;
    v21->_sessionEntityAssignment = a8;
    objc_storeStrong((id *)&v21->_sessionEntityUUID, a9);
  }

  return v21;
}

- (NSString)description
{
  return (NSString *)MEMORY[0x270F30880](self, a2);
}

- (id)attributeDescriptions
{
  v23[5] = *MEMORY[0x263EF8340];
  id v3 = objc_alloc(MEMORY[0x263F424F8]);
  v22 = [(HMIFaceRecognition *)self faceCrop];
  v21 = [v22 UUID];
  v20 = (void *)[v3 initWithName:@"Face Crop UUID" value:v21];
  v23[0] = v20;
  id v4 = objc_alloc(MEMORY[0x263F424F8]);
  v5 = [(HMIFaceRecognition *)self faceprint];
  v6 = [v5 UUID];
  v7 = (void *)[v4 initWithName:@"Faceprint UUID" value:v6];
  v23[1] = v7;
  id v8 = objc_alloc(MEMORY[0x263F424F8]);
  id v9 = [(HMIFaceRecognition *)self classifications];
  id v10 = (void *)[v8 initWithName:@"Face Classifications" value:v9];
  v23[2] = v10;
  id v11 = objc_alloc(MEMORY[0x263F424F8]);
  id v12 = NSNumber;
  [(HMIFaceRecognition *)self faceQualityScore];
  id v13 = objc_msgSend(v12, "numberWithDouble:");
  v14 = (void *)[v11 initWithName:@"Face Quality Score" value:v13];
  v23[3] = v14;
  id v15 = objc_alloc(MEMORY[0x263F424F8]);
  id v16 = [(HMIFaceRecognition *)self sessionEntityUUID];
  id v17 = (void *)[v15 initWithName:@"Session Entity UUID" value:v16];
  v23[4] = v17;
  id v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:5];

  return v18;
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
    v7 = [(HMIFaceRecognition *)self classifications];
    id v8 = [v6 classifications];
    if ([v7 isEqual:v8])
    {
      id v9 = [(HMIFaceRecognition *)self faceCrop];
      id v10 = [v6 faceCrop];
      if ([v9 isEqual:v10])
      {
        id v11 = [(HMIFaceRecognition *)self faceprint];
        id v12 = [v6 faceprint];
        if ([v11 isEqual:v12]
          && (int64_t v13 = [(HMIFaceRecognition *)self sessionEntityAssignment],
              v13 == [v6 sessionEntityAssignment])
          && ([(HMIFaceRecognition *)self faceQualityScore],
              double v15 = v14,
              [v6 faceQualityScore],
              v15 == v16))
        {
          v20 = [(HMIFaceRecognition *)self sessionEntityUUID];
          id v17 = [v6 sessionEntityUUID];
          char v18 = [v20 isEqual:v17];
        }
        else
        {
          char v18 = 0;
        }
      }
      else
      {
        char v18 = 0;
      }
    }
    else
    {
      char v18 = 0;
    }
  }
  else
  {
    char v18 = 0;
  }

  return v18;
}

- (unint64_t)hash
{
  id v3 = [(HMIFaceRecognition *)self faceCrop];
  uint64_t v4 = [v3 hash];
  v5 = [(HMIFaceRecognition *)self faceprint];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(HMIFaceRecognition *)self classifications];
  [v4 encodeObject:v5 forKey:@"HMIFR.c"];

  unint64_t v6 = [(HMIFaceRecognition *)self faceCrop];
  [v4 encodeObject:v6 forKey:@"HMIFR.fc"];

  v7 = [(HMIFaceRecognition *)self faceprint];
  [v4 encodeObject:v7 forKey:@"HMIFR.fp"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[HMIFaceRecognition sessionEntityAssignment](self, "sessionEntityAssignment"), @"HMIFR.sea");
  [(HMIFaceRecognition *)self faceQualityScore];
  objc_msgSend(v4, "encodeDouble:forKey:", @"HMIFR.fqs");
  id v8 = [(HMIFaceRecognition *)self sessionEntityUUID];
  [v4 encodeObject:v8 forKey:@"HMIFR.seu"];

  id v9 = [(HMIFaceRecognition *)self predictedLinkedEntityUUIDs];
  [v4 encodeObject:v9 forKey:@"HMIFR.leus"];
}

- (HMIFaceRecognition)initWithCoder:(id)a3
{
  v22[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMIFR.fc"];
  unint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMIFR.fp"];
  v7 = (void *)MEMORY[0x263EFFA08];
  v22[0] = objc_opt_class();
  v22[1] = objc_opt_class();
  id v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:2];
  id v9 = [v7 setWithArray:v8];
  id v10 = [v4 decodeObjectOfClasses:v9 forKey:@"HMIFR.c"];

  uint64_t v11 = [v4 decodeIntegerForKey:@"HMIFR.sea"];
  [v4 decodeDoubleForKey:@"HMIFR.fqs"];
  double v13 = v12;
  double v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMIFR.seu"];
  double v15 = (void *)MEMORY[0x263EFFA08];
  v21[0] = objc_opt_class();
  v21[1] = objc_opt_class();
  double v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v21 count:2];
  id v17 = [v15 setWithArray:v16];
  char v18 = [v4 decodeObjectOfClasses:v17 forKey:@"HMIFR.leus"];

  id v19 = [(HMIFaceRecognition *)self initWithFaceCrop:v5 faceprint:v6 classifications:v10 predictedLinkedEntityUUIDs:v18 faceQualityScore:v11 sessionEntityAssignment:v14 sessionEntityUUID:v13];
  return v19;
}

- (HMIFaceCrop)faceCrop
{
  return (HMIFaceCrop *)objc_getProperty(self, a2, 8, 1);
}

- (HMIFaceprint)faceprint
{
  return (HMIFaceprint *)objc_getProperty(self, a2, 16, 1);
}

- (NSSet)classifications
{
  return (NSSet *)objc_getProperty(self, a2, 24, 1);
}

- (double)faceQualityScore
{
  return self->_faceQualityScore;
}

- (NSUUID)sessionEntityUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 40, 1);
}

- (NSSet)predictedLinkedEntityUUIDs
{
  return (NSSet *)objc_getProperty(self, a2, 48, 1);
}

- (int64_t)sessionEntityAssignment
{
  return self->_sessionEntityAssignment;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_predictedLinkedEntityUUIDs, 0);
  objc_storeStrong((id *)&self->_sessionEntityUUID, 0);
  objc_storeStrong((id *)&self->_classifications, 0);
  objc_storeStrong((id *)&self->_faceprint, 0);
  objc_storeStrong((id *)&self->_faceCrop, 0);
}

@end