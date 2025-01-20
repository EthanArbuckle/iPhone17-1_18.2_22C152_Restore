@interface UITableViewCell(CNContactStyle)
- (void)_cnui_applyCommonContactStyle:()CNContactStyle;
- (void)_cnui_applyContactStyle;
- (void)_cnui_applySelectedBackgroundViewStyle:()CNContactStyle;
@end

@implementation UITableViewCell(CNContactStyle)

- (void)_cnui_applyContactStyle
{
  objc_msgSend(a1, "_cnui_contactStyle");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_cnui_applyCommonContactStyle:", v2);
  objc_msgSend(a1, "_cnui_applySelectedBackgroundViewStyle:", v2);
}

- (void)_cnui_applySelectedBackgroundViewStyle:()CNContactStyle
{
  id v15 = a3;
  v4 = [v15 selectedCellBackgroundColor];

  v5 = [a1 selectedBackgroundView];
  if (!v4)
  {
    objc_opt_class();
    uint64_t isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass) {
      goto LABEL_9;
    }
    v13 = (void *)[objc_alloc(MEMORY[0x1E4FAE120]) initWithProminence:3];
    [a1 setSelectedBackgroundView:v13];
    goto LABEL_8;
  }
  char v6 = [v5 isMemberOfClass:objc_opt_class()];

  if ((v6 & 1) == 0)
  {
    id v7 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    [a1 setSelectedBackgroundView:v7];
  }
  v8 = [a1 selectedBackgroundView];
  [v8 setAutoresizingMask:18];

  v9 = [v15 selectedCellBackgroundColor];
  v10 = [a1 selectedBackgroundView];
  [v10 setBackgroundColor:v9];

  if ([v15 blurSupported])
  {
    v11 = [a1 selectedBackgroundView];
    [v11 _setDrawsAsBackdropOverlayWithBlendMode:3];

    v12 = [a1 layer];
    [v12 setAllowsGroupOpacity:0];

    v13 = [a1 layer];
    [v13 setAllowsGroupBlending:0];
LABEL_8:
  }
LABEL_9:
}

- (void)_cnui_applyCommonContactStyle:()CNContactStyle
{
  id v27 = a3;
  v4 = [v27 backgroundColor];

  v5 = v27;
  if (v4)
  {
    char v6 = [a1 backgroundView];
    char v7 = [v6 isMemberOfClass:objc_opt_class()];

    if ((v7 & 1) == 0)
    {
      id v8 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
      [a1 setBackgroundView:v8];
    }
    v9 = [v27 backgroundColor];
    v10 = [a1 backgroundView];
    [v10 setBackgroundColor:v9];

    v5 = v27;
  }
  if (([v5 usesOpaqueBackground] & 1) == 0)
  {
    v11 = [a1 backgroundView];
    char v12 = [v11 isMemberOfClass:objc_opt_class()];

    if ((v12 & 1) == 0)
    {
      v13 = (void *)[objc_alloc(MEMORY[0x1E4FAE120]) initWithProminence:3];
      [a1 setBackgroundView:v13];
    }
    [a1 setBackgroundColor:0];
  }
  v14 = [v27 textColor];

  if (v14)
  {
    id v15 = [v27 textColor];
    v16 = [a1 textLabel];
    [v16 setTextColor:v15];
  }
  v17 = [v27 highlightedTextColor];

  if (v17)
  {
    v18 = [v27 highlightedTextColor];
    v19 = [a1 textLabel];
    [v19 setHighlightedTextColor:v18];
  }
  objc_msgSend(a1, "setOpaque:", objc_msgSend(v27, "usesOpaqueBackground"));
  v20 = [a1 textLabel];
  int v21 = objc_msgSend(MEMORY[0x1E4FB08E0], "ab_preferredContentSizeCategoryIsAccessibilityCategory");
  double v22 = 0.0;
  if (v21) {
    *(float *)&double v22 = 0.25;
  }
  [v20 _setHyphenationFactor:v22];

  [v27 separatorInset];
  if (v26 != *(double *)(MEMORY[0x1E4FB2848] + 8)
    || v23 != *MEMORY[0x1E4FB2848]
    || v25 != *(double *)(MEMORY[0x1E4FB2848] + 24)
    || v24 != *(double *)(MEMORY[0x1E4FB2848] + 16))
  {
    [v27 separatorInset];
    objc_msgSend(a1, "setSeparatorInset:");
  }
}

@end