@interface VNAnimalObservation
+ (BOOL)supportsSecureCoding;
+ (id)defaultOriginatingRequestClassNameForRequestRevision:(unint64_t)a3;
- (BOOL)isEqual:(id)a3;
- (VNAnimalObservation)initWithAnimalprint:(id)a3 confidence:(float)a4;
- (VNAnimalObservation)initWithCoder:(id)a3;
- (VNAnimalObservation)initWithOriginatingRequestSpecifier:(id)a3 boundingBox:(CGRect)a4 confidence:(float)a5 labels:(id)a6 groupId:(id)a7 animalprint:(id)a8;
- (VNAnimalprint)animalprint;
- (id)VNEntityIdentificationModelPrintWithOriginatingRequestSpecifier:(id)a3 error:(id *)a4;
- (id)vn_cloneObject;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setAnimalprint:(id)a3;
@end

@implementation VNAnimalObservation

- (void).cxx_destruct
{
}

- (BOOL)isEqual:(id)a3
{
  v4 = (VNAnimalObservation *)a3;
  if (self == v4)
  {
    char v8 = 1;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)VNAnimalObservation;
    if ([(VNRecognizedObjectObservation *)&v10 isEqual:v4]
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v5 = v4;
      v6 = [(VNAnimalObservation *)self animalprint];
      v7 = [(VNAnimalObservation *)v5 animalprint];
      char v8 = VisionCoreEqualOrNilObjects();
    }
    else
    {
      char v8 = 0;
    }
  }

  return v8;
}

- (unint64_t)hash
{
  v7.receiver = self;
  v7.super_class = (Class)VNAnimalObservation;
  id v3 = [(VNRecognizedObjectObservation *)&v7 hash];
  v4 = [(VNAnimalObservation *)self animalprint];
  unint64_t v5 = [v4 hash] ^ __ROR8__(v3, 51);

  return v5;
}

- (id)vn_cloneObject
{
  v7.receiver = self;
  v7.super_class = (Class)VNAnimalObservation;
  id v3 = [(VNRecognizedObjectObservation *)&v7 vn_cloneObject];
  if (v3)
  {
    uint64_t v4 = [(VNAnimalprint *)self->_animalprint copy];
    unint64_t v5 = (void *)v3[22];
    v3[22] = v4;
  }

  return v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)VNAnimalObservation;
  [(VNRecognizedObjectObservation *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "vn_encodeCodingVersion:forKey:", 0, @"VNAnimalObservation");
  [v4 encodeObject:self->_animalprint forKey:@"anmlPrnt"];
}

- (VNAnimalObservation)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)VNAnimalObservation;
  objc_super v5 = [(VNRecognizedObjectObservation *)&v13 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = objc_msgSend(v4, "vn_decodeCodingVersionForKey:", @"VNAnimalObservation");
    if (!v6)
    {
      uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"anmlPrnt"];
      animalprint = v5->_animalprint;
      v5->_animalprint = (VNAnimalprint *)v10;

      v9 = v5;
      goto LABEL_6;
    }
    objc_super v7 = objc_msgSend([NSString alloc], "initWithFormat:", @"Failed to unarchive %@ object due to coding version mismatch: Currently supported: %u; encoded: %u",
                   objc_opt_class(),
                   0,
                   v6);
    char v8 = +[VNError errorForInternalErrorWithLocalizedDescription:v7];
    [v4 failWithError:v8];
  }
  v9 = 0;
LABEL_6:

  return v9;
}

- (VNAnimalObservation)initWithOriginatingRequestSpecifier:(id)a3 boundingBox:(CGRect)a4 confidence:(float)a5 labels:(id)a6 groupId:(id)a7 animalprint:(id)a8
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v17 = a3;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  v27.receiver = self;
  v27.super_class = (Class)VNAnimalObservation;
  *(float *)&double v21 = a5;
  v22 = -[VNRecognizedObjectObservation initWithOriginatingRequestSpecifier:boundingBox:confidence:labels:segmentationMask:groupId:](&v27, sel_initWithOriginatingRequestSpecifier_boundingBox_confidence_labels_segmentationMask_groupId_, v17, v18, 0, v19, x, y, width, height, v21);
  if (v22)
  {
    uint64_t v23 = [v20 copy];
    animalprint = v22->_animalprint;
    v22->_animalprint = (VNAnimalprint *)v23;

    v25 = v22;
  }

  return v22;
}

- (VNAnimalObservation)initWithAnimalprint:(id)a3 confidence:(float)a4
{
  id v6 = a3;
  objc_super v7 = [v6 originatingRequestSpecifier];
  *(float *)&double v8 = a4;
  v9 = -[VNAnimalObservation initWithOriginatingRequestSpecifier:boundingBox:confidence:labels:groupId:animalprint:](self, "initWithOriginatingRequestSpecifier:boundingBox:confidence:labels:groupId:animalprint:", v7, MEMORY[0x1E4F1CBF0], 0, v6, 0.0, 0.0, 1.0, 1.0, v8);

  return v9;
}

- (void)setAnimalprint:(id)a3
{
}

- (VNAnimalprint)animalprint
{
  return self->_animalprint;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)defaultOriginatingRequestClassNameForRequestRevision:(unint64_t)a3
{
  return @"VNRecognizeAnimalsRequest";
}

- (id)VNEntityIdentificationModelPrintWithOriginatingRequestSpecifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  objc_super v7 = [(VNAnimalObservation *)self animalprint];
  double v8 = _validatedEntityPrintOriginatingRequestSpecifierCompatibility(self, @"animalprint", v7, v6, a4);

  return v8;
}

@end