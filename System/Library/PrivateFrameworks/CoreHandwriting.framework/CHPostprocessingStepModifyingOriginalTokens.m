@interface CHPostprocessingStepModifyingOriginalTokens
- (BOOL)modifiesOriginalTokens;
@end

@implementation CHPostprocessingStepModifyingOriginalTokens

- (BOOL)modifiesOriginalTokens
{
  return 1;
}

@end