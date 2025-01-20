@interface UIView(MFUtilities)
- (double)mf_currentScreenScale;
- (id)_mf_anchorForEdge:()MFUtilities relativeToMargin:;
- (id)mf_enclosingScrollView;
- (id)mf_frontSibling;
- (uint64_t)mf_pinToView:()MFUtilities usingLayoutMargins:;
- (void)mf_pinToView:()MFUtilities layoutMarginEdges:flexibleEdges:;
@end

@implementation UIView(MFUtilities)

- (void)mf_pinToView:()MFUtilities layoutMarginEdges:flexibleEdges:
{
  v21[4] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __68__UIView_MFUtilities__mf_pinToView_layoutMarginEdges_flexibleEdges___block_invoke;
  aBlock[3] = &unk_1E5F7D428;
  uint64_t v19 = a5;
  aBlock[4] = a1;
  id v9 = v8;
  id v18 = v9;
  uint64_t v20 = a4;
  v10 = (void (**)(void *, uint64_t))_Block_copy(aBlock);
  v11 = (void *)MEMORY[0x1E4F28DC8];
  v12 = v10[2](v10, 1);
  v21[0] = v12;
  v13 = v10[2](v10, 4);
  v21[1] = v13;
  v14 = v10[2](v10, 2);
  v21[2] = v14;
  v15 = v10[2](v10, 8);
  v21[3] = v15;
  v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:4];
  [v11 activateConstraints:v16];
}

- (id)_mf_anchorForEdge:()MFUtilities relativeToMargin:
{
  if (a3)
  {
    if (!a4)
    {
      uint64_t v7 = [a1 topAnchor];
      goto LABEL_19;
    }
    v5 = [a1 layoutMarginsGuide];
    uint64_t v6 = [v5 topAnchor];
LABEL_16:
    v4 = (void *)v6;

    goto LABEL_20;
  }
  if ((a3 & 4) != 0)
  {
    if (!a4)
    {
      uint64_t v7 = [a1 bottomAnchor];
      goto LABEL_19;
    }
    v5 = [a1 layoutMarginsGuide];
    uint64_t v6 = [v5 bottomAnchor];
    goto LABEL_16;
  }
  if ((a3 & 2) != 0)
  {
    if (!a4)
    {
      uint64_t v7 = [a1 leadingAnchor];
      goto LABEL_19;
    }
    v5 = [a1 layoutMarginsGuide];
    uint64_t v6 = [v5 leadingAnchor];
    goto LABEL_16;
  }
  if ((a3 & 8) == 0)
  {
    v4 = 0;
    goto LABEL_20;
  }
  if (a4)
  {
    v5 = [a1 layoutMarginsGuide];
    uint64_t v6 = [v5 trailingAnchor];
    goto LABEL_16;
  }
  uint64_t v7 = [a1 trailingAnchor];
LABEL_19:
  v4 = (void *)v7;
LABEL_20:

  return v4;
}

- (uint64_t)mf_pinToView:()MFUtilities usingLayoutMargins:
{
  if (a4) {
    uint64_t v4 = 15;
  }
  else {
    uint64_t v4 = 0;
  }
  return objc_msgSend(a1, "mf_pinToView:layoutMarginEdges:flexibleEdges:", a3, v4, 0);
}

- (id)mf_enclosingScrollView
{
  id v1 = a1;
  if (v1)
  {
    do
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        break;
      }
      uint64_t v2 = [v1 superview];

      id v1 = (id)v2;
    }
    while (v2);
  }

  return v1;
}

- (id)mf_frontSibling
{
  id v1 = a1;
  uint64_t v2 = [a1 superview];
  v3 = [v2 subviews];
  uint64_t v4 = [v3 objectEnumerator];

  v5 = 0;
  while (1)
  {
    uint64_t v6 = [v4 nextObject];

    if (!v6) {
      break;
    }
    v5 = v6;
    if (v6 == v1)
    {
      uint64_t v6 = [v4 nextObject];
      goto LABEL_6;
    }
  }
  id v1 = 0;
LABEL_6:

  return v6;
}

- (double)mf_currentScreenScale
{
  id v1 = [a1 window];
  uint64_t v2 = [v1 screen];

  if (!v2)
  {
    uint64_t v2 = [MEMORY[0x1E4FB1BA8] mainScreen];
  }
  [v2 scale];
  double v4 = v3;

  return v4;
}

@end