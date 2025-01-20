@interface CUIKNotesFieldCIDNotationPattern
@end

@implementation CUIKNotesFieldCIDNotationPattern

void ___CUIKNotesFieldCIDNotationPattern_block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F28FD8] regularExpressionWithPattern:@"\\[cid:[^\\]]*\\]" options:0 error:0];
  v1 = (void *)_CUIKNotesFieldCIDNotationPattern_cidNotationPattern;
  _CUIKNotesFieldCIDNotationPattern_cidNotationPattern = v0;
}

@end