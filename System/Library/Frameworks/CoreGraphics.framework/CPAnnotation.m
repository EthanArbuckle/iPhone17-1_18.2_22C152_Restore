@interface CPAnnotation
- (CGPDFAnnotation)cgAnnotation;
- (CPAnnotation)initWithCGPDFAnnotation:(CGPDFAnnotation *)a3;
- (void)dealloc;
- (void)setCgAnnotation:(CGPDFAnnotation *)a3;
@end

@implementation CPAnnotation

- (void)setCgAnnotation:(CGPDFAnnotation *)a3
{
  self->_cgAnnotation = a3;
}

- (CGPDFAnnotation)cgAnnotation
{
  return self->_cgAnnotation;
}

- (void)dealloc
{
  cgAnnotation = self->_cgAnnotation;
  if (cgAnnotation) {
    CFRelease(cgAnnotation);
  }
  v4.receiver = self;
  v4.super_class = (Class)CPAnnotation;
  [(CPGraphicObject *)&v4 dealloc];
}

- (CPAnnotation)initWithCGPDFAnnotation:(CGPDFAnnotation *)a3
{
  if (!a3) {
    return 0;
  }
  long long v10 = 0u;
  long long v11 = 0u;
  if (!CGPDFDictionaryGetRect(*((CGPDFDictionary **)a3 + 2), "Rect", (double *)&v10)) {
    return 0;
  }
  v9.receiver = self;
  v9.super_class = (Class)CPAnnotation;
  v5 = [(CPGraphicObject *)&v9 init];
  if (v5)
  {
    CFRetain(a3);
    *((void *)v5 + 21) = a3;
    long long v6 = v11;
    *(_OWORD *)(v5 + 104) = v10;
    *(_OWORD *)(v5 + 120) = v6;
    long long v7 = v11;
    *((_OWORD *)v5 + 3) = v10;
    *((_OWORD *)v5 + 4) = v7;
  }
  return (CPAnnotation *)v5;
}

@end