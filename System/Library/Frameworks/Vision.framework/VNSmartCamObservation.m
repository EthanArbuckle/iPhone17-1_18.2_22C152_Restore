@interface VNSmartCamObservation
+ (BOOL)supportsSecureCoding;
+ (id)defaultOriginatingRequestClassNameForRequestRevision:(unint64_t)a3;
+ (id)observationWithSmartCamprints:(id)a3;
+ (id)smartCamprintCurrentVersion;
- (BOOL)isEqual:(id)a3;
- (NSArray)smartCamprints;
- (NSString)smartCamprintVersion;
- (VNSmartCamObservation)initWithCoder:(id)a3;
- (VNSmartCamObservation)initWithOriginatingRequestSpecifier:(id)a3 smartCamprints:(id)a4;
- (VNSmartCamObservation)initWithRequestRevision:(unint64_t)a3 smartCamprints:(id)a4;
- (id)vn_cloneObject;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setSmartCamprints:(id)a3;
@end

@implementation VNSmartCamObservation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_smartCamprintVersion, 0);

  objc_storeStrong((id *)&self->_smartCamprints, 0);
}

- (NSString)smartCamprintVersion
{
  return self->_smartCamprintVersion;
}

- (void)setSmartCamprints:(id)a3
{
}

- (NSArray)smartCamprints
{
  return self->_smartCamprints;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)VNSmartCamObservation;
  if ([(VNObservation *)&v13 isEqual:v4] && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v5 = v4;
    v6 = [(VNSmartCamObservation *)self smartCamprintVersion];
    v7 = [v5 smartCamprintVersion];
    char v8 = VisionCoreEqualOrNilObjects();

    if (v8)
    {
      v9 = [(VNSmartCamObservation *)self smartCamprints];
      v10 = [v5 smartCamprints];
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

  return v11;
}

- (unint64_t)hash
{
  v9.receiver = self;
  v9.super_class = (Class)VNSmartCamObservation;
  id v3 = [(VNObservation *)&v9 hash];
  id v4 = [(VNSmartCamObservation *)self smartCamprintVersion];
  uint64_t v5 = [v4 hash];

  v6 = [(VNSmartCamObservation *)self smartCamprints];
  unint64_t v7 = [v6 hash] ^ __ROR8__(v5 ^ __ROR8__(v3, 51), 51);

  return v7;
}

- (id)vn_cloneObject
{
  v6.receiver = self;
  v6.super_class = (Class)VNSmartCamObservation;
  id v3 = [(VNObservation *)&v6 vn_cloneObject];
  id v4 = v3;
  if (v3)
  {
    [v3 setSmartCamprints:self->_smartCamprints];
    objc_storeStrong(v4 + 13, self->_smartCamprintVersion);
  }

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)VNSmartCamObservation;
  [(VNObservation *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "vn_encodeCodingVersion:forKey:", 0, @"VNSmartCamObservation");
  [v4 encodeObject:self->_smartCamprintVersion forKey:@"sc_algo"];
  [v4 encodeObject:self->_smartCamprints forKey:@"sc_descriptors"];
}

- (VNSmartCamObservation)initWithCoder:(id)a3
{
  id v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)VNSmartCamObservation;
  objc_super v5 = [(VNObservation *)&v29 initWithCoder:v4];
  if (v5 && !objc_msgSend(v4, "vn_decodeCodingVersionForKey:", @"VNSmartCamObservation"))
  {
    unint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sc_algo"];
    char v8 = +[VNSmartCamObservation smartCamprintCurrentVersion];
    if (+[VNVersionParser isMajorVersion:v7 equalToMajorVersion:v8])
    {
      if (!+[VNVersionParser isMinorVersion:v7 equalToMinorVersion:v8])VNValidatedLog(2, @"Minor component of encoded smartCamprint is different than minor component currently supported by software.", v15, v16, v17, v18, v19, v20, v28); {
      objc_storeStrong((id *)&v5->_smartCamprintVersion, v7);
      }
      v21 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v22 = objc_opt_class();
      v23 = objc_msgSend(v21, "setWithObjects:", v22, objc_opt_class(), 0);
      v24 = [v4 decodeObjectOfClasses:v23 forKey:@"sc_descriptors"];

      uint64_t v25 = [v24 copy];
      smartCamprints = v5->_smartCamprints;
      v5->_smartCamprints = (NSArray *)v25;

      objc_super v6 = v5;
    }
    else
    {
      VNValidatedLog(4, @"Major component of encoded smartCamprint is different than major component currently supported by software. The smartCamprint object cannot be decoded.", v9, v10, v11, v12, v13, v14, v28);
      objc_super v6 = 0;
    }
  }
  else
  {
    objc_super v6 = 0;
  }

  return v6;
}

- (VNSmartCamObservation)initWithOriginatingRequestSpecifier:(id)a3 smartCamprints:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)VNSmartCamObservation;
  char v8 = [(VNObservation *)&v16 initWithOriginatingRequestSpecifier:v6];
  if (v8)
  {
    uint64_t v9 = [v7 copy];
    uint64_t v10 = 96;
    smartCamprints = v8->_smartCamprints;
    v8->_smartCamprints = (NSArray *)v9;

    uint64_t v12 = v8;
    uint64_t v13 = [(NSArray *)v8->_smartCamprints count];
    if (v13)
    {
      uint64_t v10 = [(NSArray *)v8->_smartCamprints firstObject];
      uint64_t v12 = [(id)v10 version];
      uint64_t v14 = (__CFString *)[v12 copy];
    }
    else
    {
      uint64_t v14 = @"Undefined";
    }
    objc_storeStrong((id *)&v8->_smartCamprintVersion, v14);
    if (v13)
    {
    }
  }

  return v8;
}

- (VNSmartCamObservation)initWithRequestRevision:(unint64_t)a3 smartCamprints:(id)a4
{
  id v6 = a4;
  v15.receiver = self;
  v15.super_class = (Class)VNSmartCamObservation;
  id v7 = [(VNObservation *)&v15 initWithRequestRevision:a3];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    uint64_t v9 = 96;
    smartCamprints = v7->_smartCamprints;
    v7->_smartCamprints = (NSArray *)v8;

    uint64_t v11 = v7;
    uint64_t v12 = [(NSArray *)v7->_smartCamprints count];
    if (v12)
    {
      uint64_t v9 = [(NSArray *)v7->_smartCamprints firstObject];
      uint64_t v11 = [(id)v9 version];
      uint64_t v13 = (__CFString *)[v11 copy];
    }
    else
    {
      uint64_t v13 = @"Undefined";
    }
    objc_storeStrong((id *)&v7->_smartCamprintVersion, v13);
    if (v12)
    {
    }
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)defaultOriginatingRequestClassNameForRequestRevision:(unint64_t)a3
{
  return @"VNCreateSmartCamprintRequest";
}

+ (id)smartCamprintCurrentVersion
{
  return +[VNSmartCamprint currentVersion];
}

+ (id)observationWithSmartCamprints:(id)a3
{
  id v4 = a3;
  objc_super v5 = (void *)[objc_alloc((Class)a1) initWithRequestRevision:1 smartCamprints:v4];

  return v5;
}

@end