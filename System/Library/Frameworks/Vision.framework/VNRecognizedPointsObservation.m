@interface VNRecognizedPointsObservation
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (MLMultiArray)keypointsMultiArrayAndReturnError:(NSError *)error;
- (NSArray)availableGroupKeys;
- (NSArray)availableKeys;
- (NSDictionary)recognizedPointsForGroupKey:(VNRecognizedPointGroupKey)groupKey error:(NSError *)error;
- (NSNumber)groupIdentifier;
- (VNRecognizedPoint)recognizedPointForKey:(VNRecognizedPointKey)pointKey error:(NSError *)error;
- (VNRecognizedPointsObservation)initWithCoder:(id)a3;
- (VNRecognizedPointsObservation)initWithOriginatingRequestSpecifier:(id)a3 keypointReturningObservation:(id)a4;
- (VNRecognizedPointsSpecifier)recognizedPointsSpecifier;
- (id)debugQuickLookObject;
- (id)vn_cloneObject;
- (unint64_t)hash;
- (void)addAllJointsToPath:(CGPath *)a3 imageSize:(CGSize)a4;
- (void)encodeWithCoder:(id)a3;
@end

@implementation VNRecognizedPointsObservation

- (void).cxx_destruct
{
}

- (id)debugQuickLookObject
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  CGMutablePathRef Mutable = CGPathCreateMutable();
  if (Mutable)
  {
    v4 = Mutable;
    v10.receiver = self;
    v10.super_class = (Class)VNRecognizedPointsObservation;
    v5 = [(VNObservation *)&v10 debugQuickLookObject];
    v6 = v5;
    if (v5)
    {
      [(VNRecognizedPointsObservation *)self addAllJointsToPath:v4 imageSize:VNDebugImageSizeFromObject(v5)];
      v11[0] = xmmword_1A4125548;
      v11[1] = unk_1A4125558;
      v7 = (CGColor *)VNDebugColorFromValues((const CGFloat *)v11);
      VNDebugImageRenderNormalizedCGPathOnImage((uint64_t)v4, v6, v7);
    }
    else
    {
      -[VNRecognizedPointsObservation addAllJointsToPath:imageSize:](self, "addAllJointsToPath:imageSize:", v4, 512.0, 512.0);
      VNDebugPathFromNormalizedCGPath((uint64_t)v4, 512.0, 512.0);
    v8 = };

    CGPathRelease(v4);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)addAllJointsToPath:(CGPath *)a3 imageSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  v8 = [(VNRecognizedPointsObservation *)self availableKeys];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    id v11 = 0;
    double v12 = 7.0 / width;
    double v13 = 7.0 / height;
    uint64_t v14 = *(void *)v24;
    do
    {
      uint64_t v15 = 0;
      v16 = v11;
      do
      {
        if (*(void *)v24 != v14) {
          objc_enumerationMutation(v8);
        }
        uint64_t v17 = *(void *)(*((void *)&v23 + 1) + 8 * v15);
        id v22 = v16;
        v18 = [(VNRecognizedPointsObservation *)self recognizedPointForKey:v17 error:&v22];
        id v11 = v22;

        [v18 location];
        CGFloat v20 = v19 - v12 * 0.5;
        [v18 location];
        v29.origin.y = v21 - v13 * 0.5;
        v29.origin.x = v20;
        v29.size.double width = v12;
        v29.size.double height = v13;
        CGPathAddEllipseInRect(a3, 0, v29);

        ++v15;
        v16 = v11;
      }
      while (v10 != v15);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v10);
  }
}

- (unint64_t)hash
{
  v3.receiver = self;
  v3.super_class = (Class)VNRecognizedPointsObservation;
  return [(VNRecognizedPointsSpecifier *)self->_specifier hash] ^ __ROR8__([(VNObservation *)&v3 hash], 51);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)VNRecognizedPointsObservation;
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
  v7.super_class = (Class)VNRecognizedPointsObservation;
  objc_super v3 = [(VNObservation *)&v7 vn_cloneObject];
  if (v3)
  {
    uint64_t v4 = [(VNRecognizedPointsSpecifier *)self->_specifier copy];
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
  v6.super_class = (Class)VNRecognizedPointsObservation;
  [(VNObservation *)&v6 encodeWithCoder:v4];
  [v4 encodeObject:self->_specifier forKey:@"PtSpec"];
}

- (VNRecognizedPointsObservation)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)VNRecognizedPointsObservation;
  v5 = [(VNObservation *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PtSpec"];
    specifier = v5->_specifier;
    v5->_specifier = (VNRecognizedPointsSpecifier *)v6;
  }
  return v5;
}

- (MLMultiArray)keypointsMultiArrayAndReturnError:(NSError *)error
{
  return (MLMultiArray *)[(VNRecognizedPointsSpecifier *)self->_specifier populatedMLMultiArrayAndReturnError:error];
}

- (VNRecognizedPoint)recognizedPointForKey:(VNRecognizedPointKey)pointKey error:(NSError *)error
{
  return (VNRecognizedPoint *)[(VNRecognizedPointsSpecifier *)self->_specifier recognizedPointForKey:pointKey error:error];
}

- (NSDictionary)recognizedPointsForGroupKey:(VNRecognizedPointGroupKey)groupKey error:(NSError *)error
{
  return (NSDictionary *)[(VNRecognizedPointsSpecifier *)self->_specifier recognizedPointsForGroupKey:groupKey error:error];
}

- (NSNumber)groupIdentifier
{
  return (NSNumber *)&unk_1EF7A7148;
}

- (NSArray)availableGroupKeys
{
  return (NSArray *)[(VNRecognizedPointsSpecifier *)self->_specifier availableGroupKeys];
}

- (NSArray)availableKeys
{
  return (NSArray *)[(VNRecognizedPointsSpecifier *)self->_specifier availableKeys];
}

- (VNRecognizedPointsSpecifier)recognizedPointsSpecifier
{
  return self->_specifier;
}

- (VNRecognizedPointsObservation)initWithOriginatingRequestSpecifier:(id)a3 keypointReturningObservation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v27.receiver = self;
  v27.super_class = (Class)VNRecognizedPointsObservation;
  objc_super v8 = [(VNObservation *)&v27 initWithOriginatingRequestSpecifier:v6];
  if (!v8) {
    goto LABEL_21;
  }
  uint64_t v33 = 0;
  v34 = &v33;
  uint64_t v35 = 0x2050000000;
  objc_super v9 = (void *)getVCPPersonObservationClass_softClass;
  uint64_t v36 = getVCPPersonObservationClass_softClass;
  if (!getVCPPersonObservationClass_softClass)
  {
    uint64_t v28 = MEMORY[0x1E4F143A8];
    uint64_t v29 = 3221225472;
    v30 = __getVCPPersonObservationClass_block_invoke;
    v31 = &unk_1E5B20220;
    v32 = &v33;
    __getVCPPersonObservationClass_block_invoke((uint64_t)&v28);
    objc_super v9 = (void *)v34[3];
  }
  id v10 = v9;
  _Block_object_dispose(&v33, 8);
  if ([v7 isMemberOfClass:objc_opt_class()])
  {
    id v11 = (VNRecognizedPointsSpecifier *)v7;
    double v12 = [[VNRecognizedBodyPointsSpecifier alloc] initWithVCPPersonObservation:v11 originatingRequestSpecifier:v6];
    specifier = v8->_specifier;
    v8->_specifier = &v12->super;

    if ([v6 requestRevision] == 3737841664)
    {
      uint64_t v14 = [(VNRecognizedPointsSpecifier *)v11 leftHand];
      if (v14)
      {
        uint64_t v15 = +[VNRequestSpecifier specifierForRequestClass:objc_opt_class() revision:1 error:0];
        v16 = [(VNRecognizedPointsObservation *)[VNHumanHandPoseObservation alloc] initWithOriginatingRequestSpecifier:v15 keypointReturningObservation:v14];
        [(VNRecognizedPointsObservation *)v8 setLeftHand:v16];
      }
      uint64_t v17 = [(VNRecognizedPointsSpecifier *)v11 rightHand];
      if (v17)
      {
        v18 = +[VNRequestSpecifier specifierForRequestClass:objc_opt_class() revision:1 error:0];
        double v19 = [(VNRecognizedPointsObservation *)[VNHumanHandPoseObservation alloc] initWithOriginatingRequestSpecifier:v18 keypointReturningObservation:v17];
        [(VNRecognizedPointsObservation *)v8 setRightHand:v19];
      }
    }
    goto LABEL_20;
  }
  uint64_t v33 = 0;
  v34 = &v33;
  uint64_t v35 = 0x2050000000;
  CGFloat v20 = (void *)getVCPHandObservationClass_softClass;
  uint64_t v36 = getVCPHandObservationClass_softClass;
  if (!getVCPHandObservationClass_softClass)
  {
    uint64_t v28 = MEMORY[0x1E4F143A8];
    uint64_t v29 = 3221225472;
    v30 = __getVCPHandObservationClass_block_invoke;
    v31 = &unk_1E5B20220;
    v32 = &v33;
    __getVCPHandObservationClass_block_invoke((uint64_t)&v28);
    CGFloat v20 = (void *)v34[3];
  }
  id v21 = v20;
  _Block_object_dispose(&v33, 8);
  if (![v7 isMemberOfClass:objc_opt_class()])
  {
    uint64_t v33 = 0;
    v34 = &v33;
    uint64_t v35 = 0x2050000000;
    long long v23 = (void *)getVCPPetsObservationClass_softClass;
    uint64_t v36 = getVCPPetsObservationClass_softClass;
    if (!getVCPPetsObservationClass_softClass)
    {
      uint64_t v28 = MEMORY[0x1E4F143A8];
      uint64_t v29 = 3221225472;
      v30 = __getVCPPetsObservationClass_block_invoke;
      v31 = &unk_1E5B20220;
      v32 = &v33;
      __getVCPPetsObservationClass_block_invoke((uint64_t)&v28);
      long long v23 = (void *)v34[3];
    }
    id v24 = v23;
    _Block_object_dispose(&v33, 8);
    if ([v7 isMemberOfClass:objc_opt_class()])
    {
      id v22 = [[VNRecognizedAnimalBodyPointsSpecifier alloc] initWithVCPPetsObservation:v7 originatingRequestSpecifier:v6];
      goto LABEL_19;
    }
LABEL_21:
    long long v25 = 0;
    goto LABEL_22;
  }
  id v22 = [[VNRecognizedHandPointsSpecifier alloc] initWithVCPHandObservation:v7 originatingRequestSpecifier:v6];
LABEL_19:
  id v11 = v8->_specifier;
  v8->_specifier = &v22->super;
LABEL_20:

  long long v25 = v8;
LABEL_22:

  return v25;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end