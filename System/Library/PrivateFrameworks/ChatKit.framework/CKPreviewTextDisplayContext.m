@interface CKPreviewTextDisplayContext
- (UIColor)baseTextColor;
- (UIColor)mentionsColor;
- (UIFont)baseTextFont;
- (UIFont)mentionsFont;
- (void)setBaseTextColor:(id)a3;
- (void)setBaseTextFont:(id)a3;
- (void)setMentionsColor:(id)a3;
- (void)setMentionsFont:(id)a3;
@end

@implementation CKPreviewTextDisplayContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mentionsFont, 0);
  objc_storeStrong((id *)&self->_baseTextFont, 0);
  objc_storeStrong((id *)&self->_mentionsColor, 0);

  objc_storeStrong((id *)&self->_baseTextColor, 0);
}

- (void)setMentionsFont:(id)a3
{
}

- (void)setMentionsColor:(id)a3
{
}

- (void)setBaseTextFont:(id)a3
{
}

- (void)setBaseTextColor:(id)a3
{
}

- (UIFont)baseTextFont
{
  return self->_baseTextFont;
}

- (UIColor)baseTextColor
{
  return self->_baseTextColor;
}

- (UIColor)mentionsColor
{
  return self->_mentionsColor;
}

- (UIFont)mentionsFont
{
  return self->_mentionsFont;
}

@end