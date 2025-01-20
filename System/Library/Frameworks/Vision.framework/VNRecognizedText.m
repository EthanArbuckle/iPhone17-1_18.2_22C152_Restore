@interface VNRecognizedText
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (CRImageReaderOutput)crOutput;
- (NSString)string;
- (VNConfidence)confidence;
- (VNRecognizedText)initWithCoder:(id)a3;
- (VNRecognizedText)initWithRequestRevision:(unint64_t)a3 CRImageReaderOutput:(id)a4;
- (VNRectangleObservation)boundingBoxForRange:(NSRange)range error:(NSError *)error;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescription;
- (unint64_t)hash;
- (unint64_t)requestRevision;
- (void)encodeWithCoder:(id)a3;
- (void)setRequestRevision:(unint64_t)a3;
@end

@implementation VNRecognizedText

- (void).cxx_destruct
{
}

- (CRImageReaderOutput)crOutput
{
  return (CRImageReaderOutput *)objc_getProperty(self, a2, 16, 1);
}

- (void)setRequestRevision:(unint64_t)a3
{
  self->_requestRevision = a3;
}

- (unint64_t)requestRevision
{
  return self->_requestRevision;
}

- (id)debugDescription
{
  v8.receiver = self;
  v8.super_class = (Class)VNRecognizedText;
  v3 = [(VNRecognizedText *)&v8 debugDescription];
  v4 = [(VNRecognizedText *)self string];
  [(VNRecognizedText *)self confidence];
  v6 = [v3 stringByAppendingFormat:@" \"%@\" - (%f) revision: %ld", v4, v5, -[VNRecognizedText requestRevision](self, "requestRevision")];

  return v6;
}

- (VNRectangleObservation)boundingBoxForRange:(NSRange)range error:(NSError *)error
{
  NSUInteger length = range.length;
  NSUInteger location = range.location;
  objc_super v8 = [(VNRecognizedText *)self crOutput];
  v9 = objc_msgSend(v8, "cornersForCharacterRange:error:", location, length, error);

  if (v9 && [v9 count] == 4)
  {
    v10 = [v9 objectAtIndexedSubscript:0];
    [v10 pointValue];
    double v12 = v11;
    double v14 = v13;

    v15 = [v9 objectAtIndexedSubscript:1];
    [v15 pointValue];
    double v17 = v16;
    double v19 = v18;

    v20 = [v9 objectAtIndexedSubscript:2];
    [v20 pointValue];
    double v22 = v21;
    double v24 = v23;

    v25 = [v9 objectAtIndexedSubscript:3];
    [v25 pointValue];
    double v27 = v26;
    double v29 = v28;

    v30 = -[VNRectangleObservation initWithRequestRevision:topLeft:bottomLeft:bottomRight:topRight:]([VNRectangleObservation alloc], "initWithRequestRevision:topLeft:bottomLeft:bottomRight:topRight:", [(VNRecognizedText *)self requestRevision], v12, 1.0 - v14, v27, 1.0 - v29, v22, 1.0 - v24, v17, 1.0 - v19);
  }
  else
  {
    v30 = 0;
  }

  return v30;
}

- (VNConfidence)confidence
{
  v2 = [(VNRecognizedText *)self crOutput];
  unsigned int v3 = [v2 confidence];
  float v4 = 0.0;
  if (v3 < 3) {
    float v4 = *(float *)&dword_1A41233A0[v3];
  }

  return v4;
}

- (NSString)string
{
  v2 = [(VNRecognizedText *)self crOutput];
  unsigned int v3 = [v2 stringValue];

  return (NSString *)v3;
}

- (BOOL)isEqual:(id)a3
{
  float v4 = (VNRecognizedText *)a3;
  if (self == v4)
  {
    char v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      float v5 = v4;
      v6 = [(VNRecognizedText *)v5 crOutput];
      char v7 = VisionCoreEqualOrNilObjects();

      if (v7)
      {
        objc_super v8 = v5;
        [(VNRecognizedText *)self requestRevision];
        [(VNRecognizedText *)v8 requestRevision];
      }
    }
    else
    {
      char v7 = 0;
    }
  }

  return v7;
}

- (unint64_t)hash
{
  v3.receiver = self;
  v3.super_class = (Class)VNRecognizedText;
  return self->_requestRevision ^ __ROR8__([(CRImageReaderOutput *)self->_crOutput hash] ^ __ROR8__([(VNRecognizedText *)&v3 hash], 51), 51);
}

- (id)copyWithZone:(_NSZone *)a3
{
  float v4 = [VNRecognizedText alloc];
  unint64_t requestRevision = self->_requestRevision;
  v6 = (void *)[(CRImageReaderOutput *)self->_crOutput copy];
  char v7 = [(VNRecognizedText *)v4 initWithRequestRevision:requestRevision CRImageReaderOutput:v6];

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  [v5 encodeObject:self->_crOutput forKey:@"crOutput"];
  float v4 = [NSNumber numberWithUnsignedInteger:self->_requestRevision];
  [v5 encodeObject:v4 forKey:@"requestRevision"];
}

- (VNRecognizedText)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"crOutput"];
  v6 = (void *)[v5 copy];

  if (v6)
  {
    char v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"requestRevision"];
    objc_super v8 = v7;
    if (v7)
    {
      self = -[VNRecognizedText initWithRequestRevision:CRImageReaderOutput:](self, "initWithRequestRevision:CRImageReaderOutput:", [v7 unsignedIntegerValue], v6);
      v9 = self;
    }
    else
    {
      v9 = 0;
    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (VNRecognizedText)initWithRequestRevision:(unint64_t)a3 CRImageReaderOutput:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)VNRecognizedText;
  objc_super v8 = [(VNRecognizedText *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_crOutput, a4);
    v9->_unint64_t requestRevision = a3;
  }

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end