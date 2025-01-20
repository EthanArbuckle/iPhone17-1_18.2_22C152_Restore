@interface CertInfoTrustSummaryHeaderCell
@end

@implementation CertInfoTrustSummaryHeaderCell

uint64_t __77___CertInfoTrustSummaryHeaderCell_setActionButtonTitle_destructive_animated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_layoutSubviewsWithActionButtonSize:", *(double *)(a1 + 40), *(double *)(a1 + 48));
}

uint64_t __77___CertInfoTrustSummaryHeaderCell_setActionButtonTitle_destructive_animated___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setTitle:*(void *)(a1 + 40) destructive:*(unsigned __int8 *)(a1 + 48)];
}

@end