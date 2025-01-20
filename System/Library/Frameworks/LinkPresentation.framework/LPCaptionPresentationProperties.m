@interface LPCaptionPresentationProperties
- (LPCaptionPresentationProperties)init;
- (NSAttributedString)attributedText;
- (NSNumber)maximumNumberOfLines;
- (NSString)text;
- (UIColor)color;
- (double)textScale;
- (void)setAttributedText:(id)a3;
- (void)setColor:(id)a3;
- (void)setMaximumNumberOfLines:(id)a3;
- (void)setText:(id)a3;
- (void)setTextScale:(double)a3;
@end

@implementation LPCaptionPresentationProperties

- (LPCaptionPresentationProperties)init
{
  v6.receiver = self;
  v6.super_class = (Class)LPCaptionPresentationProperties;
  v2 = [(LPCaptionPresentationProperties *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_textScale = 1.0;
    v4 = v2;
  }

  return v3;
}

- (void)setTextScale:(double)a3
{
  self->_textScale = fmax(fmin(a3, 2.0), 0.0);
}

- (void)setText:(id)a3
{
  id v10 = a3;
  v4 = (NSString *)[v10 copy];
  text = self->_text;
  self->_text = v4;

  if (v10)
  {
    objc_super v6 = (NSAttributedString *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v10];
    p_attributedText = &self->_attributedText;
    attributedText = self->_attributedText;
    self->_attributedText = v6;
  }
  else
  {
    p_attributedText = &self->_attributedText;
    attributedText = self->_attributedText;
    self->_attributedText = 0;
  }

  uint64_t v9 = objc_msgSend(v10, "_lp_stringType");
  if (v9)
  {
    [(NSString *)self->_text _lp_setStringType:v9];
    [(NSAttributedString *)*p_attributedText _lp_setStringType:v9];
  }
}

- (void)setAttributedText:(id)a3
{
  id v9 = a3;
  v4 = (NSAttributedString *)[v9 copy];
  attributedText = self->_attributedText;
  self->_attributedText = v4;

  objc_super v6 = [v9 string];
  text = self->_text;
  self->_text = v6;

  uint64_t v8 = objc_msgSend(v9, "_lp_stringType");
  if (v8)
  {
    [(NSString *)self->_text _lp_setStringType:v8];
    [(NSAttributedString *)self->_attributedText _lp_setStringType:v8];
  }
}

- (NSString)text
{
  return self->_text;
}

- (NSAttributedString)attributedText
{
  return self->_attributedText;
}

- (UIColor)color
{
  return self->_color;
}

- (void)setColor:(id)a3
{
}

- (double)textScale
{
  return self->_textScale;
}

- (NSNumber)maximumNumberOfLines
{
  return self->_maximumNumberOfLines;
}

- (void)setMaximumNumberOfLines:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maximumNumberOfLines, 0);
  objc_storeStrong((id *)&self->_color, 0);
  objc_storeStrong((id *)&self->_attributedText, 0);

  objc_storeStrong((id *)&self->_text, 0);
}

@end