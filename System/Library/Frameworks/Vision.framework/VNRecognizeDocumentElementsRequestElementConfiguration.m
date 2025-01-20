@interface VNRecognizeDocumentElementsRequestElementConfiguration
- (BOOL)generateSegmentationMask;
- (BOOL)isEqual:(id)a3;
- (BOOL)recognize;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)setGenerateSegmentationMask:(BOOL)a3;
- (void)setRecognize:(BOOL)a3;
@end

@implementation VNRecognizeDocumentElementsRequestElementConfiguration

- (void)setGenerateSegmentationMask:(BOOL)a3
{
  self->_generateSegmentationMask = a3;
}

- (BOOL)generateSegmentationMask
{
  return self->_generateSegmentationMask;
}

- (void)setRecognize:(BOOL)a3
{
  self->_recognize = a3;
}

- (BOOL)recognize
{
  return self->_recognize;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  if (v4)
  {
    objc_msgSend(v4, "setRecognize:", -[VNRecognizeDocumentElementsRequestElementConfiguration recognize](self, "recognize"));
    objc_msgSend(v4, "setGenerateSegmentationMask:", -[VNRecognizeDocumentElementsRequestElementConfiguration generateSegmentationMask](self, "generateSegmentationMask"));
  }
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (VNRecognizeDocumentElementsRequestElementConfiguration *)a3;
  if (self == v4)
  {
    LOBYTE(v7) = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      BOOL v6 = [(VNRecognizeDocumentElementsRequestElementConfiguration *)self recognize];
      if (v6 == [(VNRecognizeDocumentElementsRequestElementConfiguration *)v5 recognize])
      {
        BOOL v8 = [(VNRecognizeDocumentElementsRequestElementConfiguration *)self generateSegmentationMask];
        BOOL v7 = v8 ^ [(VNRecognizeDocumentElementsRequestElementConfiguration *)v5 generateSegmentationMask] ^ 1;
      }
      else
      {
        LOBYTE(v7) = 0;
      }
    }
    else
    {
      LOBYTE(v7) = 0;
    }
  }

  return v7;
}

- (unint64_t)hash
{
  if ([(VNRecognizeDocumentElementsRequestElementConfiguration *)self recognize]) {
    uint64_t v3 = 357908480;
  }
  else {
    uint64_t v3 = 178954240;
  }
  BOOL v4 = [(VNRecognizeDocumentElementsRequestElementConfiguration *)self generateSegmentationMask];
  uint64_t v5 = 21845;
  if (v4) {
    uint64_t v5 = 43690;
  }
  return v5 ^ v3;
}

@end