@interface HMIFaceClassification
+ (BOOL)supportsSecureCoding;
- (BOOL)fromTorsoClassification;
- (BOOL)isEqual:(id)a3;
- (CGRect)faceBoundingBox;
- (HMIFaceClassification)initWithCoder:(id)a3;
- (HMIFaceClassification)initWithPersonUUID:(id)a3 sourceUUID:(id)a4 confidence:(double)a5 fromTorsoClassification:(BOOL)a6 familiarity:(int64_t)a7;
- (HMIFaceClassification)initWithPersonUUID:(id)a3 sourceUUID:(id)a4 sessionEntityUUID:(id)a5 confidence:(double)a6 familiarity:(int64_t)a7;
- (HMIFaceClassification)initWithUUID:(id)a3 name:(id)a4 personsModelIdentifier:(id)a5 faceBoundingBox:(CGRect)a6;
- (HMIFaceClassification)initWithUUID:(id)a3 sourceUUID:(id)a4 faceBoundingBox:(CGRect)a5;
- (HMIFaceClassification)initWithUUID:(id)a3 sourceUUID:(id)a4 sessionEntityUUID:(id)a5 faceBoundingBox:(CGRect)a6 facecrop:(id)a7 faceprint:(id)a8 confidence:(double)a9;
- (HMIFaceClassification)initWithUUID:(id)a3 sourceUUID:(id)a4 sessionEntityUUID:(id)a5 faceCrop:(id)a6 faceprint:(id)a7 confidence:(double)a8 familiarity:(int64_t)a9;
- (HMIFaceClassification)initWithUUID:(id)a3 sourceUUID:(id)a4 sessionEntityUUID:(id)a5 faceCrop:(id)a6 faceprint:(id)a7 confidence:(double)a8 fromTorsoClassification:(BOOL)a9 familiarity:(int64_t)a10;
- (HMIFaceCrop)faceCrop;
- (HMIFaceprint)faceprint;
- (NSString)identifier;
- (NSString)name;
- (NSString)personsModelIdentifier;
- (NSUUID)personUUID;
- (NSUUID)sessionEntityUUID;
- (NSUUID)sourceUUID;
- (double)confidence;
- (id)attributeDescriptions;
- (int64_t)familiarity;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HMIFaceClassification

- (HMIFaceClassification)initWithPersonUUID:(id)a3 sourceUUID:(id)a4 confidence:(double)a5 fromTorsoClassification:(BOOL)a6 familiarity:(int64_t)a7
{
  id v13 = a3;
  id v14 = a4;
  v18.receiver = self;
  v18.super_class = (Class)HMIFaceClassification;
  v15 = [(HMIFaceClassification *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_personUUID, a3);
    objc_storeStrong((id *)&v16->_sourceUUID, a4);
    v16->_confidence = a5;
    v16->_fromTorsoClassification = a6;
    v16->_familiarity = a7;
  }

  return v16;
}

- (HMIFaceClassification)initWithPersonUUID:(id)a3 sourceUUID:(id)a4 sessionEntityUUID:(id)a5 confidence:(double)a6 familiarity:(int64_t)a7
{
  id v13 = a5;
  id v14 = [(HMIFaceClassification *)self initWithPersonUUID:a3 sourceUUID:a4 confidence:0 fromTorsoClassification:a7 familiarity:a6];
  v15 = v14;
  if (v14) {
    objc_storeStrong((id *)&v14->_sessionEntityUUID, a5);
  }

  return v15;
}

- (HMIFaceClassification)initWithUUID:(id)a3 sourceUUID:(id)a4 sessionEntityUUID:(id)a5 faceCrop:(id)a6 faceprint:(id)a7 confidence:(double)a8 familiarity:(int64_t)a9
{
  id v17 = a6;
  id v18 = a7;
  v19 = [(HMIFaceClassification *)self initWithPersonUUID:a3 sourceUUID:a4 sessionEntityUUID:a5 confidence:a9 familiarity:a8];
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_faceCrop, a6);
    objc_storeStrong((id *)&v20->_faceprint, a7);
  }

  return v20;
}

- (HMIFaceClassification)initWithUUID:(id)a3 sourceUUID:(id)a4 sessionEntityUUID:(id)a5 faceCrop:(id)a6 faceprint:(id)a7 confidence:(double)a8 fromTorsoClassification:(BOOL)a9 familiarity:(int64_t)a10
{
  result = [(HMIFaceClassification *)self initWithUUID:a3 sourceUUID:a4 sessionEntityUUID:a5 faceCrop:a6 faceprint:a7 confidence:a10 familiarity:a8];
  if (result) {
    result->_fromTorsoClassification = a9;
  }
  return result;
}

- (HMIFaceClassification)initWithUUID:(id)a3 sourceUUID:(id)a4 sessionEntityUUID:(id)a5 faceBoundingBox:(CGRect)a6 facecrop:(id)a7 faceprint:(id)a8 confidence:(double)a9
{
  return -[HMIFaceClassification initWithUUID:sourceUUID:sessionEntityUUID:faceCrop:faceprint:confidence:familiarity:](self, "initWithUUID:sourceUUID:sessionEntityUUID:faceCrop:faceprint:confidence:familiarity:", a9, a6.origin.y, a6.size.width, a6.size.height);
}

- (HMIFaceClassification)initWithUUID:(id)a3 name:(id)a4 personsModelIdentifier:(id)a5 faceBoundingBox:(CGRect)a6
{
  double height = a6.size.height;
  double width = a6.size.width;
  double y = a6.origin.y;
  double x = a6.origin.x;
  v11 = (void *)MEMORY[0x263F08C38];
  id v12 = a3;
  id v13 = [v11 UUID];
  id v14 = -[HMIFaceClassification initWithUUID:sourceUUID:faceBoundingBox:](self, "initWithUUID:sourceUUID:faceBoundingBox:", v12, v13, x, y, width, height);

  return v14;
}

- (HMIFaceClassification)initWithUUID:(id)a3 sourceUUID:(id)a4 faceBoundingBox:(CGRect)a5
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  id v11 = a4;
  id v12 = a3;
  id v13 = [HMIFaceCrop alloc];
  id v14 = [MEMORY[0x263F08C38] UUID];
  v15 = [MEMORY[0x263EFF8F8] data];
  v16 = [MEMORY[0x263EFF910] date];
  id v17 = -[HMIFaceCrop initWithUUID:dataRepresentation:dateCreated:faceBoundingBox:](v13, "initWithUUID:dataRepresentation:dateCreated:faceBoundingBox:", v14, v15, v16, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));

  id v18 = [HMIFaceprint alloc];
  v19 = [MEMORY[0x263F08C38] UUID];
  v20 = [MEMORY[0x263EFF8F8] data];
  v21 = [MEMORY[0x263F08C38] UUID];
  v22 = [(HMIFaceCrop *)v17 UUID];
  v23 = [(HMIFaceprint *)v18 initWithUUID:v19 data:v20 modelUUID:v21 faceCropUUID:v22];

  v24 = [MEMORY[0x263F08C38] UUID];
  v25 = -[HMIFaceClassification initWithUUID:sourceUUID:sessionEntityUUID:faceBoundingBox:facecrop:faceprint:confidence:](self, "initWithUUID:sourceUUID:sessionEntityUUID:faceBoundingBox:facecrop:faceprint:confidence:", v12, v11, v24, v17, v23, x, y, width, height, 0.0);

  return v25;
}

- (id)attributeDescriptions
{
  v34[8] = *MEMORY[0x263EF8340];
  id v3 = objc_alloc(MEMORY[0x263F424F8]);
  v33 = [(HMIFaceClassification *)self personUUID];
  v32 = (void *)[v3 initWithName:@"Person UUID" value:v33];
  v34[0] = v32;
  id v4 = objc_alloc(MEMORY[0x263F424F8]);
  v31 = [(HMIFaceClassification *)self sourceUUID];
  v30 = (void *)[v4 initWithName:@"Source UUID" value:v31];
  v34[1] = v30;
  id v5 = objc_alloc(MEMORY[0x263F424F8]);
  v29 = [(HMIFaceClassification *)self sessionEntityUUID];
  v28 = (void *)[v5 initWithName:@"Session Entity UUID" value:v29];
  v34[2] = v28;
  id v6 = objc_alloc(MEMORY[0x263F424F8]);
  v7 = NSNumber;
  [(HMIFaceClassification *)self confidence];
  v27 = objc_msgSend(v7, "numberWithDouble:");
  v26 = (void *)[v6 initWithName:@"Confidence" value:v27];
  v34[3] = v26;
  id v8 = objc_alloc(MEMORY[0x263F424F8]);
  int64_t v9 = [(HMIFaceClassification *)self familiarity];
  v10 = @"Known";
  if (!v9) {
    v10 = @"Unknown";
  }
  if (v9 == 1) {
    id v11 = @"Uncertain";
  }
  else {
    id v11 = v10;
  }
  id v12 = (void *)[v8 initWithName:@"Familiarity" value:v11];
  v34[4] = v12;
  id v13 = objc_alloc(MEMORY[0x263F424F8]);
  id v14 = [(HMIFaceClassification *)self faceCrop];
  v15 = [v14 UUID];
  v16 = (void *)[v13 initWithName:@"FaceCrop UUID" value:v15];
  v34[5] = v16;
  id v17 = objc_alloc(MEMORY[0x263F424F8]);
  id v18 = [(HMIFaceClassification *)self faceprint];
  v19 = [v18 UUID];
  v20 = (void *)[v17 initWithName:@"Faceprint UUID" value:v19];
  v34[6] = v20;
  id v21 = objc_alloc(MEMORY[0x263F424F8]);
  [(HMIFaceClassification *)self fromTorsoClassification];
  v22 = HMFBooleanToString();
  v23 = (void *)[v21 initWithName:@"FromTorsoClassification" value:v22];
  v34[7] = v23;
  v24 = [MEMORY[0x263EFF8C0] arrayWithObjects:v34 count:8];

  return v24;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (HMIFaceClassification *)a3;
  if (v4 == self)
  {
    char v30 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      id v6 = [(HMIFaceClassification *)self personUUID];
      v7 = [(HMIFaceClassification *)v5 personUUID];
      char v8 = HMFEqualObjects();

      int64_t v9 = [(HMIFaceClassification *)self sourceUUID];
      v10 = [(HMIFaceClassification *)v5 sourceUUID];
      char v11 = HMFEqualObjects();

      char v12 = v8 & v11;
      id v13 = [(HMIFaceClassification *)self sessionEntityUUID];
      id v14 = [(HMIFaceClassification *)v5 sessionEntityUUID];
      char v15 = HMFEqualObjects();

      v16 = [(HMIFaceClassification *)self faceCrop];
      id v17 = [(HMIFaceClassification *)v5 faceCrop];
      char v18 = HMFEqualObjects();

      char v19 = v12 & v15 & v18;
      v20 = [(HMIFaceClassification *)self faceprint];
      id v21 = [(HMIFaceClassification *)v5 faceprint];
      char v22 = HMFEqualObjects();

      [(HMIFaceClassification *)self confidence];
      double v24 = v23;
      [(HMIFaceClassification *)v5 confidence];
      if (v24 == v25) {
        char v26 = v19 & v22;
      }
      else {
        char v26 = 0;
      }
      int64_t v27 = [(HMIFaceClassification *)self familiarity];
      if (v27 != [(HMIFaceClassification *)v5 familiarity]) {
        char v26 = 0;
      }
      BOOL v28 = [(HMIFaceClassification *)self fromTorsoClassification];
      BOOL v29 = [(HMIFaceClassification *)v5 fromTorsoClassification];

      char v30 = v26 & (v28 ^ v29 ^ 1);
    }
    else
    {
      char v30 = 0;
    }
  }

  return v30;
}

- (unint64_t)hash
{
  id v3 = [(HMIFaceClassification *)self personUUID];
  uint64_t v4 = [v3 hash];
  id v5 = [(HMIFaceClassification *)self sourceUUID];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HMIFaceClassification)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMIFC.pu"];
  unint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMIFC.su"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMIFC.seu"];
  char v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMIFC.fc"];
  int64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMIFC.fp"];
  [v4 decodeDoubleForKey:@"HMIFC.c"];
  double v11 = v10;
  uint64_t v12 = [v4 decodeBoolForKey:@"HMIFC.ftc"];
  uint64_t v13 = [v4 decodeIntegerForKey:@"HMIFC.f"];

  id v14 = [(HMIFaceClassification *)self initWithUUID:v5 sourceUUID:v6 sessionEntityUUID:v7 faceCrop:v8 faceprint:v9 confidence:v12 fromTorsoClassification:v11 familiarity:v13];
  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  id v9 = a3;
  id v4 = [(HMIFaceClassification *)self personUUID];
  [v9 encodeObject:v4 forKey:@"HMIFC.pu"];

  id v5 = [(HMIFaceClassification *)self sourceUUID];
  [v9 encodeObject:v5 forKey:@"HMIFC.su"];

  unint64_t v6 = [(HMIFaceClassification *)self sessionEntityUUID];
  [v9 encodeObject:v6 forKey:@"HMIFC.seu"];

  v7 = [(HMIFaceClassification *)self faceCrop];
  [v9 encodeObject:v7 forKey:@"HMIFC.fc"];

  char v8 = [(HMIFaceClassification *)self faceprint];
  [v9 encodeObject:v8 forKey:@"HMIFC.fp"];

  [(HMIFaceClassification *)self confidence];
  objc_msgSend(v9, "encodeDouble:forKey:", @"HMIFC.c");
  objc_msgSend(v9, "encodeBool:forKey:", -[HMIFaceClassification fromTorsoClassification](self, "fromTorsoClassification"), @"HMIFC.ftc");
  objc_msgSend(v9, "encodeInteger:forKey:", -[HMIFaceClassification familiarity](self, "familiarity"), @"HMIFC.f");
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)personsModelIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (CGRect)faceBoundingBox
{
  objc_copyStruct(v6, &self->_faceBoundingBox, 32, 1, 0);
  double v2 = *(double *)v6;
  double v3 = *(double *)&v6[1];
  double v4 = *(double *)&v6[2];
  double v5 = *(double *)&v6[3];
  result.size.double height = v5;
  result.size.double width = v4;
  result.origin.double y = v3;
  result.origin.double x = v2;
  return result;
}

- (HMIFaceCrop)faceCrop
{
  return (HMIFaceCrop *)objc_getProperty(self, a2, 40, 1);
}

- (HMIFaceprint)faceprint
{
  return (HMIFaceprint *)objc_getProperty(self, a2, 48, 1);
}

- (NSUUID)personUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 56, 1);
}

- (NSUUID)sourceUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 64, 1);
}

- (NSUUID)sessionEntityUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 72, 1);
}

- (int64_t)familiarity
{
  return self->_familiarity;
}

- (double)confidence
{
  return self->_confidence;
}

- (BOOL)fromTorsoClassification
{
  return self->_fromTorsoClassification;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionEntityUUID, 0);
  objc_storeStrong((id *)&self->_sourceUUID, 0);
  objc_storeStrong((id *)&self->_personUUID, 0);
  objc_storeStrong((id *)&self->_faceprint, 0);
  objc_storeStrong((id *)&self->_faceCrop, 0);
  objc_storeStrong((id *)&self->_personsModelIdentifier, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end