@interface FBAQuestionCellTextView
- (BOOL)canBecomeFirstResponder;
- (unint64_t)characterLimit;
- (void)setCharacterLimit:(unint64_t)a3;
@end

@implementation FBAQuestionCellTextView

- (BOOL)canBecomeFirstResponder
{
  return [(FBAQuestionCellTextView *)self isUserInteractionEnabled];
}

- (unint64_t)characterLimit
{
  return self->_characterLimit;
}

- (void)setCharacterLimit:(unint64_t)a3
{
  self->_characterLimit = a3;
}

@end