@interface PDFAtomicElement
- (CRNormalizedQuad)boundingQuad;
- (PDFAtomicElement)initWithType:(unsigned int)a3 boundingBox:(id)a4 layoutDirection:(unint64_t)a5;
- (PDFCRGroupRegion)parent;
- (unint64_t)layoutDirection;
- (unsigned)type;
- (void)setBoundingQuad:(id)a3;
- (void)setParent:(id)a3;
- (void)setType:(unsigned int)a3;
@end

@implementation PDFAtomicElement

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_parent);

  objc_storeStrong((id *)&self->_boundingQuad, 0);
}

- (PDFCRGroupRegion)parent
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parent);

  return (PDFCRGroupRegion *)WeakRetained;
}

- (void)setType:(unsigned int)a3
{
  self->_type = a3;
}

- (unsigned)type
{
  return self->_type;
}

- (unint64_t)layoutDirection
{
  return self->_layoutDirection;
}

- (CRNormalizedQuad)boundingQuad
{
  return (CRNormalizedQuad *)objc_getProperty(self, a2, 16, 1);
}

- (void)setBoundingQuad:(id)a3
{
}

- (void)setParent:(id)a3
{
}

- (PDFAtomicElement)initWithType:(unsigned int)a3 boundingBox:(id)a4 layoutDirection:(unint64_t)a5
{
  id v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)PDFAtomicElement;
  v10 = [(PDFAtomicElement *)&v13 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_boundingQuad, a4);
    v11->_layoutDirection = a5;
    v11->_type = a3;
    objc_storeWeak((id *)&v11->_parent, 0);
  }

  return v11;
}

@end