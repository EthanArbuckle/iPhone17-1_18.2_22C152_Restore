@interface NSMutableDictionary
@end

@implementation NSMutableDictionary

uint64_t __60__NSMutableDictionary_RFC2231Support__mf_fixupRFC2231Values__block_invoke()
{
  uint64_t v0 = [objc_alloc(MEMORY[0x1E4F28FD8]) initWithPattern:@"\\*([0-9]+)?(\\*)?$" options:0 error:0];
  mf_fixupRFC2231Values_keyRegex = v0;
  return MEMORY[0x1F41817F8](v0);
}

@end