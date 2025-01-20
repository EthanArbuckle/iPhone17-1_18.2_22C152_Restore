@interface CKDetailsViewAddGroupNameViewUITextField
- (BOOL)canResignFirstResponderInternal;
- (void)setCanResignFirstResponderInternal:(BOOL)a3;
@end

@implementation CKDetailsViewAddGroupNameViewUITextField

- (BOOL)canResignFirstResponderInternal
{
  return self->_canResignFirstResponderInternal;
}

- (void)setCanResignFirstResponderInternal:(BOOL)a3
{
  self->_canResignFirstResponderInternal = a3;
}

@end