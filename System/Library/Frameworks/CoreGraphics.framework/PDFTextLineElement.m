@interface PDFTextLineElement
- (PDFTextLineElement)initWithTextLine:(TextLine *)a3 boundingBox:(id)a4;
- (TextLine)textLine;
- (id).cxx_construct;
- (void)setTextLine:(TextLine *)a3;
@end

@implementation PDFTextLineElement

- (id).cxx_construct
{
  *((CGRect *)self + 2) = CGRectNull;
  return self;
}

- (void)setTextLine:(TextLine *)a3
{
}

- (TextLine)textLine
{
  objc_copyStruct(retstr, &self->_textLine, 72, 1, 0);
  return result;
}

- (PDFTextLineElement)initWithTextLine:(TextLine *)a3 boundingBox:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)PDFTextLineElement;
  result = [(PDFAtomicElement *)&v9 initWithType:1 boundingBox:a4 layoutDirection:1];
  if (result)
  {
    result->_textLine.textRange = a3->textRange;
    long long v7 = *(_OWORD *)&a3->bbox.origin.y;
    long long v6 = *(_OWORD *)&a3->bbox.size.height;
    long long v8 = *(_OWORD *)&a3->uniCharStart;
    result->_textLine.identifier = a3->identifier;
    *(_OWORD *)&result->_textLine.bbox.origin.y = v7;
    *(_OWORD *)&result->_textLine.bbox.size.height = v6;
    *(_OWORD *)&result->_textLine.uniCharStart = v8;
  }
  return result;
}

@end