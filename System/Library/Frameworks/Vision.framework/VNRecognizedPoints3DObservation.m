@interface VNRecognizedPoints3DObservation
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSArray)availableGroupKeys;
- (NSArray)availableKeys;
- (NSDictionary)recognizedPointsForGroupKey:(VNRecognizedPointGroupKey)groupKey error:(NSError *)error;
- (VNRecognizedPoint3D)recognizedPointForKey:(VNRecognizedPointKey)pointKey error:(NSError *)error;
- (VNRecognizedPoints3DObservation)initWithCoder:(id)a3;
- (VNRecognizedPoints3DObservation)initWithOriginatingRequestSpecifier:(id)a3 keypointsReturningObject:(id)a4;
- (VNRecognizedPoints3DSpecifier)recognizedPointsSpecifier;
- (id)groupIdentifier;
- (id)vn_cloneObject;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation VNRecognizedPoints3DObservation

- (void).cxx_destruct
{
}

- (unint64_t)hash
{
  v3.receiver = self;
  v3.super_class = (Class)VNRecognizedPoints3DObservation;
  return [(VNRecognizedPoints3DSpecifier *)self->_specifier hash] ^ __ROR8__([(VNObservation *)&v3 hash], 51);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)VNRecognizedPoints3DObservation;
  if ([(VNObservation *)&v8 isEqual:v4] && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v5 = self->_specifier;
    char v6 = VisionCoreEqualOrNilObjects();
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (id)vn_cloneObject
{
  v7.receiver = self;
  v7.super_class = (Class)VNRecognizedPoints3DObservation;
  objc_super v3 = [(VNObservation *)&v7 vn_cloneObject];
  if (v3)
  {
    uint64_t v4 = [(VNRecognizedPoints3DSpecifier *)self->_specifier copy];
    v5 = (void *)v3[12];
    v3[12] = v4;
  }

  return v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x1A6257080]();
  v6.receiver = self;
  v6.super_class = (Class)VNRecognizedPoints3DObservation;
  [(VNObservation *)&v6 encodeWithCoder:v4];
  [v4 encodeObject:self->_specifier forKey:@"3DPtSpec"];
}

- (VNRecognizedPoints3DObservation)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)VNRecognizedPoints3DObservation;
  v5 = [(VNObservation *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"3DPtSpec"];
    specifier = v5->_specifier;
    v5->_specifier = (VNRecognizedPoints3DSpecifier *)v6;
  }
  return v5;
}

- (VNRecognizedPoint3D)recognizedPointForKey:(VNRecognizedPointKey)pointKey error:(NSError *)error
{
  return (VNRecognizedPoint3D *)[(VNRecognizedPoints3DSpecifier *)self->_specifier recognizedPointForKey:pointKey error:error];
}

- (NSDictionary)recognizedPointsForGroupKey:(VNRecognizedPointGroupKey)groupKey error:(NSError *)error
{
  return (NSDictionary *)[(VNRecognizedPoints3DSpecifier *)self->_specifier recognizedPointsForGroupKey:groupKey error:error];
}

- (id)groupIdentifier
{
  return &unk_1EF7A7088;
}

- (NSArray)availableGroupKeys
{
  return (NSArray *)[(VNRecognizedPoints3DSpecifier *)self->_specifier availableGroupKeys];
}

- (NSArray)availableKeys
{
  return (NSArray *)[(VNRecognizedPoints3DSpecifier *)self->_specifier availableKeys];
}

- (VNRecognizedPoints3DSpecifier)recognizedPointsSpecifier
{
  return self->_specifier;
}

- (VNRecognizedPoints3DObservation)initWithOriginatingRequestSpecifier:(id)a3 keypointsReturningObject:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)VNRecognizedPoints3DObservation;
  objc_super v8 = [(VNObservation *)&v13 initWithOriginatingRequestSpecifier:v6];
  if (v8)
  {
    if ([v7 isMemberOfClass:objc_opt_class()])
    {
      objc_super v9 = [[VNHumanBodyPose3DSpecifier alloc] initWithHumanBody3DOutput:v7 originatingRequestSpecifier:v6];
      specifier = v8->_specifier;
      v8->_specifier = &v9->super;
    }
    v11 = v8;
  }

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end