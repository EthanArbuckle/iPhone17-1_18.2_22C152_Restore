@interface VNSceneObservation
+ (BOOL)supportsSecureCoding;
+ (VNSceneObservation)observationWithSceneprints:(id)a3;
+ (id)defaultOriginatingRequestClassNameForRequestRevision:(unint64_t)a3;
+ (id)sceneprintCurrentVersion;
- (BOOL)isEqual:(id)a3;
- (NSArray)sceneprints;
- (NSString)sceneprintVersion;
- (VNSceneObservation)initWithCoder:(id)a3;
- (VNSceneObservation)initWithOriginatingRequestSpecifier:(id)a3 sceneprints:(id)a4;
- (VNSceneObservation)initWithRequestRevision:(unint64_t)a3 sceneprints:(id)a4;
- (id)VNCoreMLTransformerSceneprintsAndReturnError:(id *)a3;
- (id)data;
- (id)vn_cloneObject;
- (unint64_t)elementCount;
- (unint64_t)elementType;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation VNSceneObservation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sceneprintVersion, 0);

  objc_storeStrong((id *)&self->_sceneprints, 0);
}

- (NSString)sceneprintVersion
{
  return self->_sceneprintVersion;
}

- (NSArray)sceneprints
{
  return self->_sceneprints;
}

- (id)data
{
  v3 = [(VNSceneObservation *)self sceneprints];
  v4 = [v3 firstObject];

  if (v4)
  {
    uint64_t v5 = [v4 descriptorData];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)VNSceneObservation;
    uint64_t v5 = [(VNFeaturePrintObservation *)&v8 data];
  }
  v6 = (void *)v5;

  return v6;
}

- (unint64_t)elementCount
{
  v2 = [(VNSceneObservation *)self sceneprints];
  v3 = [v2 firstObject];

  unint64_t v4 = [v3 elementCount];
  return v4;
}

- (unint64_t)elementType
{
  v2 = [(VNSceneObservation *)self sceneprints];
  v3 = [v2 firstObject];

  unint64_t v4 = [v3 elementType];
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (VNSceneObservation *)a3;
  if (self == v4)
  {
    char v11 = 1;
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)VNSceneObservation;
    if ([(VNObservation *)&v13 isEqual:v4] && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      uint64_t v5 = v4;
      v6 = [(VNSceneObservation *)self sceneprintVersion];
      v7 = [(VNSceneObservation *)v5 sceneprintVersion];
      char v8 = VisionCoreEqualOrNilObjects();

      if (v8)
      {
        v9 = [(VNSceneObservation *)self sceneprints];
        v10 = [(VNSceneObservation *)v5 sceneprints];
        char v11 = VisionCoreEqualOrNilObjects();
      }
      else
      {
        char v11 = 0;
      }
    }
    else
    {
      char v11 = 0;
    }
  }

  return v11;
}

- (unint64_t)hash
{
  v9.receiver = self;
  v9.super_class = (Class)VNSceneObservation;
  id v3 = [(VNObservation *)&v9 hash];
  unint64_t v4 = [(VNSceneObservation *)self sceneprintVersion];
  uint64_t v5 = [v4 hash];

  v6 = [(VNSceneObservation *)self sceneprints];
  unint64_t v7 = [v6 hash] ^ __ROR8__(v5 ^ __ROR8__(v3, 51), 51);

  return v7;
}

- (id)vn_cloneObject
{
  v7.receiver = self;
  v7.super_class = (Class)VNSceneObservation;
  uint64_t v3 = [(VNObservation *)&v7 vn_cloneObject];
  if (v3)
  {
    uint64_t v4 = [(NSArray *)self->_sceneprints copy];
    uint64_t v5 = *(void **)(v3 + 96);
    *(void *)(v3 + 96) = v4;

    objc_storeStrong((id *)(v3 + 104), self->_sceneprintVersion);
  }

  return (id)v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)VNSceneObservation;
  [(VNObservation *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "vn_encodeCodingVersion:forKey:", 0, @"VNSceneObservation");
  [v4 encodeObject:self->_sceneprintVersion forKey:@"algo"];
  [v4 encodeObject:self->_sceneprints forKey:@"descriptors"];
}

- (VNSceneObservation)initWithCoder:(id)a3
{
  id v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)VNSceneObservation;
  objc_super v5 = [(VNObservation *)&v29 initWithCoder:v4];
  if (v5 && !objc_msgSend(v4, "vn_decodeCodingVersionForKey:", @"VNSceneObservation"))
  {
    objc_super v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"algo"];
    char v8 = +[VNSceneObservation sceneprintCurrentVersion];
    if (+[VNVersionParser isMajorVersion:v7 equalToMajorVersion:v8])
    {
      if (!+[VNVersionParser isMinorVersion:v7 equalToMinorVersion:v8])VNValidatedLog(2, @"Minor component of encoded sceneprint is different than minor component currently supported by software.", v15, v16, v17, v18, v19, v20, v28); {
      objc_storeStrong((id *)&v5->_sceneprintVersion, v7);
      }
      v21 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v22 = objc_opt_class();
      v23 = objc_msgSend(v21, "setWithObjects:", v22, objc_opt_class(), 0);
      v24 = [v4 decodeObjectOfClasses:v23 forKey:@"descriptors"];

      uint64_t v25 = [v24 copy];
      sceneprints = v5->_sceneprints;
      v5->_sceneprints = (NSArray *)v25;

      v6 = v5;
    }
    else
    {
      VNValidatedLog(4, @"Major component of encoded sceneprint is different than major component currently supported by software. The sceneprint object cannot be decoded.", v9, v10, v11, v12, v13, v14, v28);
      v6 = 0;
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (VNSceneObservation)initWithOriginatingRequestSpecifier:(id)a3 sceneprints:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)VNSceneObservation;
  char v8 = [(VNObservation *)&v16 initWithOriginatingRequestSpecifier:v6];
  if (v8)
  {
    uint64_t v9 = [v7 copy];
    uint64_t v10 = 96;
    sceneprints = v8->_sceneprints;
    v8->_sceneprints = (NSArray *)v9;

    uint64_t v12 = v8;
    uint64_t v13 = [(NSArray *)v8->_sceneprints count];
    if (v13)
    {
      uint64_t v10 = [(NSArray *)v8->_sceneprints firstObject];
      uint64_t v12 = [(id)v10 version];
      uint64_t v14 = (__CFString *)[v12 copy];
    }
    else
    {
      uint64_t v14 = @"Undefined";
    }
    objc_storeStrong((id *)&v8->_sceneprintVersion, v14);
    if (v13)
    {
    }
  }

  return v8;
}

- (VNSceneObservation)initWithRequestRevision:(unint64_t)a3 sceneprints:(id)a4
{
  id v6 = a4;
  v16.receiver = self;
  v16.super_class = (Class)VNSceneObservation;
  id v7 = [(VNObservation *)&v16 initWithRequestRevision:a3];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    uint64_t v9 = 96;
    sceneprints = v7->_sceneprints;
    v7->_sceneprints = (NSArray *)v8;

    uint64_t v11 = v7;
    uint64_t v12 = [(NSArray *)v7->_sceneprints count];
    if (v12)
    {
      uint64_t v9 = [(NSArray *)v7->_sceneprints firstObject];
      uint64_t v11 = [(id)v9 version];
      uint64_t v13 = (__CFString *)[v11 copy];
    }
    else
    {
      uint64_t v13 = @"Undefined";
    }
    objc_storeStrong((id *)&v7->_sceneprintVersion, v13);
    if (v12)
    {
    }
    uint64_t v14 = v7;
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (VNSceneObservation)observationWithSceneprints:(id)a3
{
  id v3 = a3;
  id v4 = [[VNSceneObservation alloc] initWithRequestRevision:1 sceneprints:v3];

  return v4;
}

+ (id)defaultOriginatingRequestClassNameForRequestRevision:(unint64_t)a3
{
  if (a3 - 3737841664u >= 5) {
    return @"VNGenerateImageFeaturePrintRequest";
  }
  else {
    return @"VNCreateSceneprintRequest";
  }
}

+ (id)sceneprintCurrentVersion
{
  return +[VNSceneprint currentVersion];
}

- (id)VNCoreMLTransformerSceneprintsAndReturnError:(id *)a3
{
  id v4 = [(VNSceneObservation *)self sceneprints];
  if ([v4 count])
  {
    a3 = v4;
  }
  else if (a3)
  {
    id v5 = [NSString alloc];
    id v6 = (objc_class *)objc_opt_class();
    id v7 = NSStringFromClass(v6);
    uint64_t v8 = (void *)[v5 initWithFormat:@"%@ does not have any sceneprint data", v7];

    *a3 = +[VNError errorForDataUnavailableWithLocalizedDescription:v8];

    a3 = 0;
  }

  return a3;
}

@end