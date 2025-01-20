@interface FIUIPushyLabelCharacter
- (NSAttributedString)sourceText;
- (UIView)renderedView;
- (void)setRenderedView:(id)a3;
- (void)setSourceText:(id)a3;
@end

@implementation FIUIPushyLabelCharacter

- (NSAttributedString)sourceText
{
  return (NSAttributedString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setSourceText:(id)a3
{
}

- (UIView)renderedView
{
  return (UIView *)objc_getProperty(self, a2, 16, 1);
}

- (void)setRenderedView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_renderedView, 0);
  objc_storeStrong((id *)&self->_sourceText, 0);
}

@end