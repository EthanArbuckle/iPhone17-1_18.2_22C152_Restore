@interface HMMTRProtocolMappingState
- (BOOL)shouldIgnoreSingleMultiPressComplete;
- (void)setShouldIgnoreSingleMultiPressComplete:(BOOL)a3;
@end

@implementation HMMTRProtocolMappingState

- (void)setShouldIgnoreSingleMultiPressComplete:(BOOL)a3
{
  self->_shouldIgnoreSingleMultiPressComplete = a3;
}

- (BOOL)shouldIgnoreSingleMultiPressComplete
{
  return self->_shouldIgnoreSingleMultiPressComplete;
}

@end