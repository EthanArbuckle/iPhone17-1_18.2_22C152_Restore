@interface PDFListItemElement
- (PDFListItemElement)initWithTextLines:(const void *)a3 boundingBox:(id)a4;
- (id).cxx_construct;
- (vector<PageLayout::TextLine,)textLines;
- (void)setTextLines:()vector<PageLayout:(std::allocator<PageLayout::TextLine>> *)a3 :TextLine;
@end

@implementation PDFListItemElement

- (id).cxx_construct
{
  *((void *)self + 6) = 0;
  *((void *)self + 7) = 0;
  *((void *)self + 5) = 0;
  return self;
}

- (void).cxx_destruct
{
  p_textLines = &self->_textLines;
  begin = self->_textLines.__begin_;
  if (begin)
  {
    p_textLines->__end_ = begin;
    operator delete(begin);
  }
}

- (void)setTextLines:()vector<PageLayout:(std::allocator<PageLayout::TextLine>> *)a3 :TextLine
{
}

- (vector<PageLayout::TextLine,)textLines
{
  objc_copyCppObjectAtomic(retstr, &self->_textLines, (void (__cdecl *)(void *, const void *))__copy_helper_atomic_property_);
  return result;
}

- (PDFListItemElement)initWithTextLines:(const void *)a3 boundingBox:(id)a4
{
  id v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)PDFListItemElement;
  v7 = [(PDFAtomicElement *)&v11 initWithType:4 boundingBox:v6 layoutDirection:1];
  v8 = v7;
  if (v7)
  {
    p_textLines = (char *)&v7->_textLines;
    if (&v8->_textLines != a3) {
      std::vector<PageLayout::TextLine>::__assign_with_size[abi:fe180100]<PageLayout::TextLine*,PageLayout::TextLine*>(p_textLines, *(char **)a3, *((void *)a3 + 1), 0x8E38E38E38E38E39 * ((uint64_t)(*((void *)a3 + 1) - *(void *)a3) >> 3));
    }
  }

  return v8;
}

@end