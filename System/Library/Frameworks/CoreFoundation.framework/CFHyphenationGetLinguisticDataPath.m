@interface CFHyphenationGetLinguisticDataPath
@end

@implementation CFHyphenationGetLinguisticDataPath

void ___CFHyphenationGetLinguisticDataPath_block_invoke()
{
  Mutable = CFStringCreateMutable((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0);
  CFStringAppend(Mutable, @"/System/Library/LinguisticData/");
  _CFDefaultHyphenationLinguisticDataPath = (uint64_t)Mutable;
}

@end