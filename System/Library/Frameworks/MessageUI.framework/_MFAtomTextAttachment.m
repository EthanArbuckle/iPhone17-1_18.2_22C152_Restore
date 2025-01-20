@interface _MFAtomTextAttachment
- (BOOL)isPlaceholder;
- (CGRect)attachmentBoundsForTextContainer:(id)a3 proposedLineFragment:(CGRect)a4 glyphPosition:(CGPoint)a5 characterIndex:(unint64_t)a6;
- (MFComposeRecipient)recipient;
- (MFModernComposeRecipientAtom)atomView;
- (_MFAtomTextAttachment)initWithAtomView:(id)a3;
- (id)attributedStringWithBaseAttributes:(id)a3;
- (id)imageForBounds:(CGRect)a3 textContainer:(id)a4 characterIndex:(unint64_t)a5;
- (void)setAtomView:(id)a3;
- (void)setIsPlaceholder:(BOOL)a3;
@end

@implementation _MFAtomTextAttachment

- (_MFAtomTextAttachment)initWithAtomView:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_MFAtomTextAttachment;
  v5 = [(_MFAtomTextAttachment *)&v8 initWithData:0 ofType:0];
  v6 = v5;
  if (v5)
  {
    [(_MFAtomTextAttachment *)v5 setIsPlaceholder:0];
    [(_MFAtomTextAttachment *)v6 setAtomView:v4];
  }

  return v6;
}

- (MFComposeRecipient)recipient
{
  v2 = [(_MFAtomTextAttachment *)self atomView];
  v3 = [v2 recipient];

  return (MFComposeRecipient *)v3;
}

- (id)attributedStringWithBaseAttributes:(id)a3
{
  id v4 = a3;
  __int16 v10 = -4;
  v5 = [NSString stringWithCharacters:&v10 length:1];
  v6 = [MEMORY[0x1E4F1CA60] dictionary];
  [v6 setObject:self forKeyedSubscript:*MEMORY[0x1E4FB06B8]];
  v7 = +[MFModernAtomView defaultFont];
  [v6 setObject:v7 forKeyedSubscript:*MEMORY[0x1E4FB06F8]];

  if (v4) {
    [v6 setValuesForKeysWithDictionary:v4];
  }
  objc_super v8 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v5 attributes:v6];

  return v8;
}

- (id)imageForBounds:(CGRect)a3 textContainer:(id)a4 characterIndex:(unint64_t)a5
{
  return 0;
}

- (CGRect)attachmentBoundsForTextContainer:(id)a3 proposedLineFragment:(CGRect)a4 glyphPosition:(CGPoint)a5 characterIndex:(unint64_t)a6
{
  CGFloat height = a4.size.height;
  double width = a4.size.width;
  if ([(_MFAtomTextAttachment *)self isPlaceholder])
  {
    [(_MFAtomTextAttachment *)self bounds];
    double v10 = v9;
  }
  else
  {
    [(MFModernAtomView *)self->_atomView intrinsicContentSize];
    double v10 = v11;
  }
  v12 = +[MFModernAtomView defaultFont];
  [v12 descender];
  double v14 = v13;
  double v15 = *MEMORY[0x1E4F1DB28];

  if (v10 >= width) {
    double v16 = width;
  }
  else {
    double v16 = v10;
  }
  double v17 = v15;
  double v18 = v14;
  double v19 = height;
  result.size.CGFloat height = v19;
  result.size.double width = v16;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

- (MFModernComposeRecipientAtom)atomView
{
  return self->_atomView;
}

- (void)setAtomView:(id)a3
{
}

- (BOOL)isPlaceholder
{
  return self->_isPlaceholder;
}

- (void)setIsPlaceholder:(BOOL)a3
{
  self->_isPlaceholder = a3;
}

- (void).cxx_destruct
{
}

@end