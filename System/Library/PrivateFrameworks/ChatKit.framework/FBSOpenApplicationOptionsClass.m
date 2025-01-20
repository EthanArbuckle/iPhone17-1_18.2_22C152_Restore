@interface FBSOpenApplicationOptionsClass
@end

@implementation FBSOpenApplicationOptionsClass

uint64_t ____FBSOpenApplicationOptionsClass_block_invoke()
{
  uint64_t result = MEMORY[0x192FBA860](@"FBSOpenApplicationOptions", @"FrontBoardServices");
  __FBSOpenApplicationOptionsClass__optionsClass = result;
  return result;
}

@end