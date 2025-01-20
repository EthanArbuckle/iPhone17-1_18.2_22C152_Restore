@interface CKEnumerateRangesOfEmphasisInFormatString
@end

@implementation CKEnumerateRangesOfEmphasisInFormatString

double ___CKEnumerateRangesOfEmphasisInFormatString_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v6 = objc_msgSend(*(id *)(a1 + 32), "rangeOfString:options:range:", @"#", 0, a2, a3);
  *a4 = v6;
  a4[1] = v7;
  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v10 = *(void *)(v9 + 32);
    if (v10 == 0x7FFFFFFFFFFFFFFFLL) {
      *(void *)(v9 + 32) = v6;
    }
    else {
      *(void *)(v9 + 40) = v6 - v10 + v7;
    }
    if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
    {
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
      *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) += 2;
      ++*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
      double result = NAN;
      *(_OWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 32) = xmmword_18F81B060;
    }
  }
  return result;
}

@end