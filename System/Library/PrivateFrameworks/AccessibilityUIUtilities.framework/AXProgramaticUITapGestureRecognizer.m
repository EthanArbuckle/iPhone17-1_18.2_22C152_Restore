@interface AXProgramaticUITapGestureRecognizer
- (int64_t)axProgramaticState;
- (void)setAxProgramaticState:(int64_t)a3;
@end

@implementation AXProgramaticUITapGestureRecognizer

- (int64_t)axProgramaticState
{
  return self->_axProgramaticState;
}

- (void)setAxProgramaticState:(int64_t)a3
{
  self->_axProgramaticState = a3;
}

@end