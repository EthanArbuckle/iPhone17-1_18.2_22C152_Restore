@interface UIView
@end

@implementation UIView

id __68__UIView_MFUtilities__mf_pinToView_layoutMarginEdges_flexibleEdges___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a1 + 48);
  v5 = objc_msgSend(*(id *)(a1 + 32), "_mf_anchorForEdge:relativeToMargin:", a2, 0);
  v6 = objc_msgSend(*(id *)(a1 + 40), "_mf_anchorForEdge:relativeToMargin:", a2, (*(void *)(a1 + 56) & a2) != 0);
  if ((v4 & a2) != 0)
  {
    if ((a2 & 3) != 0) {
      [v5 constraintGreaterThanOrEqualToAnchor:v6];
    }
    else {
    uint64_t v7 = [v5 constraintLessThanOrEqualToAnchor:v6];
    }
  }
  else
  {
    uint64_t v7 = [v5 constraintEqualToAnchor:v6];
  }
  v8 = (void *)v7;

  return v8;
}

@end