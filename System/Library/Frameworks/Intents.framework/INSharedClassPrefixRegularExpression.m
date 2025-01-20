@interface INSharedClassPrefixRegularExpression
@end

@implementation INSharedClassPrefixRegularExpression

uint64_t ___INSharedClassPrefixRegularExpression_block_invoke()
{
  _INSharedClassPrefixRegularExpression_regularExpression = [MEMORY[0x1E4F28FD8] regularExpressionWithPattern:@"^([a-zA-Z]+):" options:0 error:0];

  return MEMORY[0x1F41817F8]();
}

@end