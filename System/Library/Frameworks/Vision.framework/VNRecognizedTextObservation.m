@interface VNRecognizedTextObservation
+ (BOOL)supportsSecureCoding;
+ (id)defaultOriginatingRequestClassNameForRequestRevision:(unint64_t)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isTitle;
- (NSArray)textObjects;
- (NSArray)topCandidates:(NSUInteger)maxCandidateCount;
- (NSString)text;
- (VNRecognizedTextObservation)initWithCoder:(id)a3;
- (id)vn_cloneObject;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setIsTitle:(BOOL)a3;
- (void)setText:(id)a3;
- (void)setTextObjects:(id)a3;
@end

@implementation VNRecognizedTextObservation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_text, 0);

  objc_storeStrong((id *)&self->_textObjects, 0);
}

- (NSString)text
{
  return self->_text;
}

- (void)setIsTitle:(BOOL)a3
{
  self->_isTitle = a3;
}

- (BOOL)isTitle
{
  return self->_isTitle;
}

- (void)setTextObjects:(id)a3
{
}

- (NSArray)textObjects
{
  return self->_textObjects;
}

- (void)setText:(id)a3
{
  id v6 = a3;
  v4 = (NSString *)[v6 copy];
  text = self->_text;
  self->_text = v4;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (VNRecognizedTextObservation *)a3;
  if (self == v4)
  {
    char v6 = 1;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)VNRecognizedTextObservation;
    if ([(VNRectangleObservation *)&v8 isEqual:v4]
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v5 = [(VNRecognizedTextObservation *)v4 textObjects];
      char v6 = VisionCoreEqualOrNilObjects();
    }
    else
    {
      char v6 = 0;
    }
  }

  return v6;
}

- (unint64_t)hash
{
  v3.receiver = self;
  v3.super_class = (Class)VNRecognizedTextObservation;
  return [(NSArray *)self->_textObjects hash] ^ __ROR8__([(VNRectangleObservation *)&v3 hash], 51);
}

- (id)vn_cloneObject
{
  v7.receiver = self;
  v7.super_class = (Class)VNRecognizedTextObservation;
  objc_super v3 = [(VNRectangleObservation *)&v7 vn_cloneObject];
  if (v3)
  {
    uint64_t v4 = [(NSArray *)self->_textObjects copy];
    v5 = (void *)v3[29];
    v3[29] = v4;
  }

  return v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)VNRecognizedTextObservation;
  [(VNRectangleObservation *)&v5 encodeWithCoder:v4];
  [v4 encodeObject:self->_text forKey:@"text"];
  [v4 encodeObject:self->_textObjects forKey:@"textObjects"];
}

- (VNRecognizedTextObservation)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)VNRecognizedTextObservation;
  objc_super v5 = [(VNRectangleObservation *)&v15 initWithCoder:v4];
  if (v5)
  {
    char v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    objc_super v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v9 = [v4 decodeObjectOfClasses:v8 forKey:@"textObjects"];
    uint64_t v10 = [v9 copy];
    textObjects = v5->_textObjects;
    v5->_textObjects = (NSArray *)v10;

    v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"text"];
    if (v12) {
      [(VNRecognizedTextObservation *)v5 setText:v12];
    }
    v13 = v5;
  }
  return v5;
}

- (NSArray)topCandidates:(NSUInteger)maxCandidateCount
{
  if (maxCandidateCount)
  {
    id v4 = [(VNRecognizedTextObservation *)self textObjects];
    NSUInteger v5 = [v4 count];
    if (v5 >= maxCandidateCount) {
      NSUInteger v6 = maxCandidateCount;
    }
    else {
      NSUInteger v6 = v5;
    }
    uint64_t v7 = objc_msgSend(v4, "subarrayWithRange:", 0, v6);
  }
  else
  {
    uint64_t v7 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return (NSArray *)v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)defaultOriginatingRequestClassNameForRequestRevision:(unint64_t)a3
{
  return @"VNRecognizeTextRequest";
}

@end