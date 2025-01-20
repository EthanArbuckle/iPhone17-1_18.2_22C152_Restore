@interface VNRecognizedObjectObservation
+ (BOOL)supportsSecureCoding;
+ (id)defaultOriginatingRequestClassNameForRequestRevision:(unint64_t)a3;
- (BOOL)isEqual:(id)a3;
- (NSArray)labels;
- (VNPixelBufferObservation)segmentationMask;
- (VNRecognizedObjectObservation)initWithCoder:(id)a3;
- (VNRecognizedObjectObservation)initWithOriginatingRequestSpecifier:(id)a3 boundingBox:(CGRect)a4 confidence:(float)a5 labels:(id)a6 segmentationMask:(id)a7 groupId:(id)a8;
- (VNRecognizedObjectObservation)initWithRequestRevision:(unint64_t)a3 boundingBox:(CGRect)a4 confidence:(float)a5 labels:(id)a6;
- (id)description;
- (id)vn_cloneObject;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation VNRecognizedObjectObservation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_segmentationMask, 0);

  objc_storeStrong((id *)&self->_labels, 0);
}

- (NSArray)labels
{
  return self->_labels;
}

- (VNPixelBufferObservation)segmentationMask
{
  return (VNPixelBufferObservation *)objc_getProperty(self, a2, 168, 1);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)VNRecognizedObjectObservation;
  [(VNDetectedObjectObservation *)&v6 encodeWithCoder:v4];
  [v4 encodeObject:self->_labels forKey:@"labels"];
  segmentationMask = self->_segmentationMask;
  if (segmentationMask) {
    [v4 encodeObject:segmentationMask forKey:@"segmentationMask"];
  }
}

- (VNRecognizedObjectObservation)initWithCoder:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)VNRecognizedObjectObservation;
  v5 = [(VNDetectedObjectObservation *)&v16 initWithCoder:v4];
  if (!v5) {
    goto LABEL_6;
  }
  id v6 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v7 = objc_opt_class();
  v8 = objc_msgSend(v6, "initWithObjects:", v7, objc_opt_class(), 0);
  v9 = [v4 decodeObjectOfClasses:v8 forKey:@"labels"];
  uint64_t v10 = [v9 copy];
  labels = v5->_labels;
  v5->_labels = (NSArray *)v10;

  if (!v5->_labels) {
    goto LABEL_6;
  }
  if (![v4 containsValueForKey:@"segmentationMask"]
    || ([v4 decodeObjectOfClass:objc_opt_class() forKey:@"segmentationMask"],
        uint64_t v12 = objc_claimAutoreleasedReturnValue(),
        segmentationMask = v5->_segmentationMask,
        v5->_segmentationMask = (VNPixelBufferObservation *)v12,
        segmentationMask,
        v5->_segmentationMask))
  {
    v14 = v5;
  }
  else
  {
LABEL_6:
    v14 = 0;
  }

  return v14;
}

- (id)description
{
  v3 = [(VNRecognizedObjectObservation *)self labels];
  id v4 = [v3 valueForKey:@"identifier"];

  v5 = NSString;
  v10.receiver = self;
  v10.super_class = (Class)VNRecognizedObjectObservation;
  id v6 = [(VNDetectedObjectObservation *)&v10 description];
  uint64_t v7 = [v4 componentsJoinedByString:@", "];
  v8 = [v5 stringWithFormat:@"%@ labels=[%@]", v6, v7];

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)VNRecognizedObjectObservation;
  if ([(VNDetectedObjectObservation *)&v13 isEqual:v4]
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v5 = v4;
    id v6 = [(VNRecognizedObjectObservation *)self segmentationMask];
    uint64_t v7 = [v5 segmentationMask];
    char v8 = VisionCoreEqualOrNilObjects();

    if (v8)
    {
      v9 = [(VNRecognizedObjectObservation *)self labels];
      objc_super v10 = [v5 labels];
      char v11 = VisionCoreEquivalentOrNilUnorderedArrays();
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
  v3.receiver = self;
  v3.super_class = (Class)VNRecognizedObjectObservation;
  return [(VNPixelBufferObservation *)self->_segmentationMask hash] ^ __ROR8__([(NSArray *)self->_labels hash] ^ __ROR8__([(VNDetectedObjectObservation *)&v3 hash], 51), 51);
}

- (id)vn_cloneObject
{
  v9.receiver = self;
  v9.super_class = (Class)VNRecognizedObjectObservation;
  objc_super v3 = [(VNDetectedObjectObservation *)&v9 vn_cloneObject];
  if (v3)
  {
    uint64_t v4 = [(NSArray *)self->_labels copy];
    id v5 = (void *)v3[20];
    v3[20] = v4;

    uint64_t v6 = [(VNPixelBufferObservation *)self->_segmentationMask copy];
    uint64_t v7 = (void *)v3[21];
    v3[21] = v6;
  }

  return v3;
}

- (VNRecognizedObjectObservation)initWithOriginatingRequestSpecifier:(id)a3 boundingBox:(CGRect)a4 confidence:(float)a5 labels:(id)a6 segmentationMask:(id)a7 groupId:(id)a8
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
  v27.super_class = (Class)VNRecognizedObjectObservation;
  v21 = -[VNDetectedObjectObservation initWithOriginatingRequestSpecifier:boundingBox:groupId:](&v27, sel_initWithOriginatingRequestSpecifier_boundingBox_groupId_, v17, v20, x, y, width, height);
  v23 = v21;
  if (v21)
  {
    *(float *)&double v22 = a5;
    [(VNObservation *)v21 setConfidence:v22];
    uint64_t v24 = [v18 copy];
    labels = v23->_labels;
    v23->_labels = (NSArray *)v24;

    objc_storeStrong((id *)&v23->_segmentationMask, a7);
  }

  return v23;
}

- (VNRecognizedObjectObservation)initWithRequestRevision:(unint64_t)a3 boundingBox:(CGRect)a4 confidence:(float)a5 labels:(id)a6
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v13 = a6;
  v14 = [(id)objc_opt_class() defaultOriginatingRequestSpecifierForRevision:a3];
  if (v14)
  {
    *(float *)&double v15 = a5;
    self = -[VNRecognizedObjectObservation initWithOriginatingRequestSpecifier:boundingBox:confidence:labels:segmentationMask:groupId:](self, "initWithOriginatingRequestSpecifier:boundingBox:confidence:labels:segmentationMask:groupId:", v14, v13, 0, 0, x, y, width, height, v15);
    objc_super v16 = self;
  }
  else
  {
    objc_super v16 = 0;
  }

  return v16;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)defaultOriginatingRequestClassNameForRequestRevision:(unint64_t)a3
{
  return @"VNRecognizeObjectsRequest";
}

@end