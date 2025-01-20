@interface CFStringDecodeByteStream3
@end

@implementation CFStringDecodeByteStream3

_OWORD *____CFStringDecodeByteStream3_block_invoke()
{
  result = CFStringEncodingGetConverter(134217984);
  __CFStringDecodeByteStream3___CFFromUTF8 = (uint64_t (*)(void, void, void, void, void, void))*((void *)result + 1);
  return result;
}

@end