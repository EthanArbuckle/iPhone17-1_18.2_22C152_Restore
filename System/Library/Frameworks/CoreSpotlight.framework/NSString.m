@interface NSString
@end

@implementation NSString

uint64_t __51__NSString_CSUserQuery__normalizeForSemanticSearch__block_invoke()
{
  normalizeForSemanticSearch_sRegex = ;

  return MEMORY[0x1F41817F8]();
}

uint64_t __36__NSString_CSUserQuery__containsCJK__block_invoke()
{
  containsCJK_sRegex = [MEMORY[0x1E4F28FD8] regularExpressionWithPattern:@"(\\p{script=Han})|(\\p{script=Hangul})" options:1 error:0];

  return MEMORY[0x1F41817F8]();
}

@end