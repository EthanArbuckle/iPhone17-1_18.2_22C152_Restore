@interface _CNAtomTextAttachment
- (BOOL)isPlaceholder;
- (CGRect)attachmentBoundsForTextContainer:(id)a3 proposedLineFragment:(CGRect)a4 glyphPosition:(CGPoint)a5 characterIndex:(unint64_t)a6;
- (CNComposeRecipient)recipient;
- (CNComposeRecipientAtom)atomView;
- (_CNAtomTextAttachment)initWithAtomView:(id)a3;
- (id)attributedStringWithBaseAttributes:(id)a3;
- (id)imageForBounds:(CGRect)a3 textContainer:(id)a4 characterIndex:(unint64_t)a5;
- (void)setAtomView:(id)a3;
- (void)setIsPlaceholder:(BOOL)a3;
@end

@implementation _CNAtomTextAttachment

- (_CNAtomTextAttachment)initWithAtomView:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_CNAtomTextAttachment;
  v5 = [(_CNAtomTextAttachment *)&v8 initWithData:0 ofType:0];
  v6 = v5;
  if (v5)
  {
    [(_CNAtomTextAttachment *)v5 setIsPlaceholder:0];
    [(_CNAtomTextAttachment *)v6 setAtomView:v4];
  }

  return v6;
}

- (CNComposeRecipient)recipient
{
  v2 = [(_CNAtomTextAttachment *)self atomView];
  v3 = [v2 recipient];

  return (CNComposeRecipient *)v3;
}

- (id)attributedStringWithBaseAttributes:(id)a3
{
  id v4 = a3;
  __int16 v10 = -4;
  v5 = [NSString stringWithCharacters:&v10 length:1];
  v6 = [MEMORY[0x1E4F1CA60] dictionary];
  [v6 setObject:self forKeyedSubscript:*MEMORY[0x1E4FB06B8]];
  v7 = +[CNAtomView defaultFont];
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
  if ([(_CNAtomTextAttachment *)self isPlaceholder])
  {
    [(_CNAtomTextAttachment *)self bounds];
    double v10 = v9;
  }
  else
  {
    [(CNAtomView *)self->_atomView intrinsicContentSize];
    double v10 = v11;
  }
  v12 = [(_CNAtomTextAttachment *)self atomView];
  if (([v12 presentationOptions] & 0x4000) != 0) {
    double v13 = 0.2;
  }
  else {
    double v13 = 2.0;
  }

  double v14 = *MEMORY[0x1E4F1DB28];
  v15 = +[CNAtomView defaultFont];
  [v15 descender];
  double v17 = v16;

  if (v10 >= width) {
    double v18 = width;
  }
  else {
    double v18 = v10;
  }
  double v19 = v18 + v13;
  double v20 = v14;
  double v21 = v17;
  double v22 = height;
  result.size.CGFloat height = v22;
  result.size.double width = v19;
  result.origin.y = v21;
  result.origin.x = v20;
  return result;
}

- (CNComposeRecipientAtom)atomView
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