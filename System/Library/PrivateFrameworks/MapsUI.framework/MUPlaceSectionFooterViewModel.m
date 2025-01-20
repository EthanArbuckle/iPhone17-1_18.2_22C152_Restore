@interface MUPlaceSectionFooterViewModel
- (NSAttributedString)attributedText;
- (id)actionBlock;
- (void)setActionBlock:(id)a3;
@end

@implementation MUPlaceSectionFooterViewModel

- (NSAttributedString)attributedText
{
  return self->_attributedText;
}

- (id)actionBlock
{
  return self->_actionBlock;
}

- (void)setActionBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_actionBlock, 0);
  objc_storeStrong((id *)&self->_attributedText, 0);
}

@end