@interface NLStringTokenizerGetSubTokensOfCompound
@end

@implementation NLStringTokenizerGetSubTokensOfCompound

void *___NLStringTokenizerGetSubTokensOfCompound_block_invoke(void *result, uint64_t a2, unsigned char *a3)
{
  uint64_t v3 = result[5];
  if (v3) {
    *(_OWORD *)(v3 + 16 * *(void *)(*(void *)(result[4] + 8) + 24)) = *(_OWORD *)a2;
  }
  uint64_t v4 = result[6];
  if (v4) {
    *(void *)(v4 + 8 * *(void *)(*(void *)(result[4] + 8) + 24)) = *(void *)(a2 + 16);
  }
  if (++*(void *)(*(void *)(result[4] + 8) + 24) == result[7]) {
    *a3 = 1;
  }
  return result;
}

@end