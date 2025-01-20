@interface LPTextView
+ (id)attributedString:(id)a3 resolvedAgainstStyle:(id)a4 withEmphasizedTextExpression:(id)a5 tintColor:(id)a6 lineBreakMode:(int64_t)a7 usesVibrancy:(BOOL)a8 forLTR:(BOOL)a9 withFont:(id)a10 userInterfaceStyle:(int64_t)a11;
+ (id)attributedStringHidingNonColoredRanges:(id)a3;
- (BOOL)_lp_isLTR;
- (BOOL)_needsColoredGlyphsView;
- (CGRect)textRect;
- (CGSize)sizeThatFits:(CGSize)a3;
- (LPTextView)initWithHost:(id)a3;
- (LPTextView)initWithHost:(id)a3 text:(id)a4 style:(id)a5;
- (LPTextViewStyle)style;
- (NSAttributedString)attributedString;
- (NSRegularExpression)emphasizedTextExpression;
- (UIEdgeInsets)effectiveInsets;
- (double)ascender;
- (double)descender;
- (double)firstLineLeading;
- (double)lastLineDescent;
- (id)_createLabel;
- (id)effectiveAttributedString;
- (id)firstBaselineAnchor;
- (id)lastBaselineAnchor;
- (id)subtitleButton;
- (int64_t)computedNumberOfLines;
- (int64_t)effectiveMaximumNumberOfLines;
- (int64_t)overrideMaximumNumberOfLines;
- (void)_buildSubviewsIfNeeded;
- (void)_createTextViewWithAttributedString:(id)a3;
- (void)_updateAttributedString;
- (void)_updateEffectViewEffect;
- (void)_userInterfaceStyleDidChange;
- (void)applyAttributedString:(id)a3;
- (void)layoutComponentView;
- (void)setContentInset:(UIEdgeInsets)a3;
- (void)setEmphasizedTextExpression:(id)a3;
- (void)setOverrideMaximumNumberOfLines:(int64_t)a3;
@end

@implementation LPTextView

- (LPTextView)initWithHost:(id)a3
{
  return 0;
}

- (LPTextView)initWithHost:(id)a3 text:(id)a4 style:(id)a5
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v21.receiver = self;
  v21.super_class = (Class)LPTextView;
  v11 = [(LPComponentView *)&v21 initWithHost:v8];
  if (v11)
  {
    uint64_t v12 = truncatedAttributedStringAtMaximumMetadataLength(v9);
    attributedString = v11->_attributedString;
    v11->_attributedString = (NSAttributedString *)v12;

    uint64_t v14 = [v10 adjustedForString:v11->_attributedString];
    style = v11->_style;
    v11->_style = (LPTextViewStyle *)v14;

    v16 = self;
    v22[0] = v16;
    v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:1];
    id v18 = (id)[(LPTextView *)v11 registerForTraitChanges:v17 withHandler:&__block_literal_global_16];

    v19 = v11;
  }

  return v11;
}

uint64_t __38__LPTextView_initWithHost_text_style___block_invoke(uint64_t a1, void *a2)
{
  return [a2 _userInterfaceStyleDidChange];
}

- (void)_buildSubviewsIfNeeded
{
  if (!self->_textView)
  {
    id v9 = [(LPTextView *)self effectiveAttributedString];
    -[LPTextView _createTextViewWithAttributedString:](self, "_createTextViewWithAttributedString:");

    v3 = [(LPTextViewStyle *)self->_style compositingFilter];

    if (v3)
    {
      id v10 = [(LPTextViewStyle *)self->_style compositingFilter];
      v4 = [(UILabel *)self->_textView layer];
      [v4 setCompositingFilter:v10];
    }
    if (+[LPSettings showDebugIndicators])
    {
      id v11 = [MEMORY[0x1E4FB1618] greenColor];
      uint64_t v5 = [v11 CGColor];
      v6 = [(UILabel *)self->_textView layer];
      [v6 setBorderColor:v5];

      id v12 = [(UILabel *)self->_textView layer];
      [v12 setBorderWidth:0.5];
    }
    id v13 = [(LPTextViewStyle *)self->_style font];
    [v13 ascender];
    self->_ascender = v7;

    id v14 = [(LPTextViewStyle *)self->_style font];
    [v14 descender];
    self->_descender = v8;
  }
}

- (BOOL)_lp_isLTR
{
  v2 = self;
  v3 = v2;
  if (v2)
  {
    v4 = v2;
    do
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        break;
      }
      uint64_t v5 = [v4 semanticContentAttribute];
      unsigned __int8 v6 = v5 == 3;
      if (v5 == 3 || [v4 semanticContentAttribute] == 4) {
        goto LABEL_10;
      }
      uint64_t v7 = [v4 superview];

      v4 = (void *)v7;
    }
    while (v7);
  }
  else
  {
    v4 = 0;
  }
  v9.receiver = v3;
  v9.super_class = (Class)LPTextView;
  unsigned __int8 v6 = [(UIView *)&v9 _lp_isLTR];
LABEL_10:

  return v6;
}

- (id)effectiveAttributedString
{
  v3 = [(LPComponentView *)self host];
  uint64_t v4 = [v3 allowsVibrancyForComponentView:self];

  if (v4)
  {
    uint64_t v5 = [(LPTextViewStyle *)self->_style color];
    unsigned __int8 v6 = vibrancyEffectStyleForColor(v5);
    uint64_t v4 = v6 != 0;
  }
  BOOL v7 = [(UIView *)self _lp_prefersDarkInterface];
  attributedString = self->_attributedString;
  style = self->_style;
  emphasizedTextExpression = self->_emphasizedTextExpression;
  id v11 = [(UIView *)self _lp_tintColor];
  BOOL v12 = [(LPTextView *)self _lp_isLTR];
  id v13 = [(LPTextViewStyle *)self->_style font];
  LOBYTE(v16) = v12;
  id v14 = +[LPTextView attributedString:attributedString resolvedAgainstStyle:style withEmphasizedTextExpression:emphasizedTextExpression tintColor:v11 lineBreakMode:4 usesVibrancy:v4 forLTR:v16 withFont:v13 userInterfaceStyle:v7];

  return v14;
}

+ (id)attributedString:(id)a3 resolvedAgainstStyle:(id)a4 withEmphasizedTextExpression:(id)a5 tintColor:(id)a6 lineBreakMode:(int64_t)a7 usesVibrancy:(BOOL)a8 forLTR:(BOOL)a9 withFont:(id)a10 userInterfaceStyle:(int64_t)a11
{
  v105[3] = *MEMORY[0x1E4F143B8];
  id v78 = a3;
  id v16 = a4;
  id v77 = a5;
  id v73 = a6;
  id v75 = a10;
  uint64_t v17 = [v16 textAlignment];
  uint64_t v18 = 2;
  if (a9) {
    uint64_t v18 = 0;
  }
  uint64_t v19 = 2;
  if (!a9) {
    uint64_t v19 = 0;
  }
  if (v17 != 1) {
    uint64_t v19 = v17 == 2;
  }
  if (v17) {
    uint64_t v20 = v19;
  }
  else {
    uint64_t v20 = v18;
  }
  objc_super v21 = [MEMORY[0x1E4FB1378] defaultParagraphStyle];
  v22 = (void *)[v21 mutableCopy];

  v74 = v22;
  [v22 setAlignment:v20];
  [v22 setLineBreakMode:a7];
  [v16 hyphenationFactor];
  objc_msgSend(v22, "setHyphenationFactor:");
  v23 = [v16 paragraphSpacing];
  [v23 value];
  objc_msgSend(v22, "setParagraphSpacing:");

  v97[0] = MEMORY[0x1E4F143A8];
  v97[1] = 3221225472;
  v97[2] = __153__LPTextView_attributedString_resolvedAgainstStyle_withEmphasizedTextExpression_tintColor_lineBreakMode_usesVibrancy_forLTR_withFont_userInterfaceStyle___block_invoke;
  v97[3] = &unk_1E5B06338;
  id v24 = v16;
  id v98 = v24;
  BOOL v99 = a8;
  uint64_t v25 = __153__LPTextView_attributedString_resolvedAgainstStyle_withEmphasizedTextExpression_tintColor_lineBreakMode_usesVibrancy_forLTR_withFont_userInterfaceStyle___block_invoke((uint64_t)v97);
  uint64_t v91 = 0;
  v92 = &v91;
  uint64_t v93 = 0x3032000000;
  v94 = __Block_byref_object_copy__4;
  v95 = __Block_byref_object_dispose__4;
  v26 = (void *)MEMORY[0x1E4F1CA60];
  uint64_t v27 = *MEMORY[0x1E4FB12B8];
  v104[0] = *MEMORY[0x1E4FB12B0];
  v104[1] = v27;
  uint64_t v70 = v27;
  v105[0] = v75;
  v105[1] = v25;
  v72 = (void *)v25;
  v104[2] = *MEMORY[0x1E4FB12D0];
  v105[2] = v22;
  v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v105 forKeys:v104 count:3];
  id v96 = [v26 dictionaryWithDictionary:v28];

  uint64_t v29 = [v78 length];
  v30 = objc_msgSend(v78, "attribute:atIndex:longestEffectiveRange:inRange:", @"LPOverrideThemeAttribute", 0, 0, 0, v29);
  LODWORD(v28) = [v30 BOOLValue];

  if (v28)
  {
    v89[0] = 0;
    v89[1] = v89;
    v89[2] = 0x2020000000;
    char v90 = 0;
    v85[0] = MEMORY[0x1E4F143A8];
    v85[1] = 3221225472;
    v85[2] = __153__LPTextView_attributedString_resolvedAgainstStyle_withEmphasizedTextExpression_tintColor_lineBreakMode_usesVibrancy_forLTR_withFont_userInterfaceStyle___block_invoke_13;
    v85[3] = &unk_1E5B06360;
    v87 = v89;
    id v86 = v78;
    v88 = &v91;
    objc_msgSend(v86, "enumerateAttributesInRange:options:usingBlock:", 0, v29, 0, v85);

    _Block_object_dispose(v89, 8);
  }
  v71 = (void *)[v78 mutableCopy];
  v31 = [v24 shadow];

  if (v31)
  {
    if (a11 == 1) {
      uint64_t v32 = 2;
    }
    else {
      uint64_t v32 = 1;
    }
    v33 = [MEMORY[0x1E4FB1E20] traitCollectionWithUserInterfaceStyle:v32];
    v34 = [v24 shadow];
    v35 = [v34 valueForAppearance:v33];

    if (v35)
    {
      id v36 = objc_alloc_init(MEMORY[0x1E4FB1388]);
      v37 = [v35 offset];
      [v37 asSize];
      objc_msgSend(v36, "setShadowOffset:");

      [v35 radius];
      objc_msgSend(v36, "setShadowBlurRadius:");
      v38 = [v35 color];
      [v36 setShadowColor:v38];

      objc_msgSend(v71, "addAttribute:value:range:", *MEMORY[0x1E4FB12D8], v36, 0, v29);
    }
  }
  uint64_t v39 = *MEMORY[0x1E4FB12A0];
  v82[0] = MEMORY[0x1E4F143A8];
  v82[1] = 3221225472;
  v82[2] = __153__LPTextView_attributedString_resolvedAgainstStyle_withEmphasizedTextExpression_tintColor_lineBreakMode_usesVibrancy_forLTR_withFont_userInterfaceStyle___block_invoke_17;
  v82[3] = &unk_1E5B06388;
  id v40 = v75;
  id v83 = v40;
  id v41 = v71;
  id v84 = v41;
  objc_msgSend(v78, "enumerateAttribute:inRange:options:usingBlock:", v39, 0, v29, 0, v82);
  objc_msgSend(v41, "addAttributes:range:", v92[5], 0, v29);
  if (v77)
  {
    v42 = [v78 string];
    v79[0] = MEMORY[0x1E4F143A8];
    v79[1] = 3221225472;
    v79[2] = __153__LPTextView_attributedString_resolvedAgainstStyle_withEmphasizedTextExpression_tintColor_lineBreakMode_usesVibrancy_forLTR_withFont_userInterfaceStyle___block_invoke_2;
    v79[3] = &unk_1E5B063B0;
    id v80 = v41;
    id v81 = v73;
    objc_msgSend(v77, "enumerateMatchesInString:options:range:usingBlock:", v42, 0, 0, v29, v79);
  }
  v43 = [v24 leadingGlyph];
  v76 = [v43 image];

  if (v76)
  {
    v44 = [v76 platformImage];
    v45 = (void *)MEMORY[0x1E4FB1830];
    [v40 pointSize];
    v47 = objc_msgSend(v45, "configurationWithPointSize:weight:", objc_msgSend(v40, "_lp_symbolWeight"), v46);
    v48 = [v44 imageWithConfiguration:v47];
    v49 = [v48 imageWithRenderingMode:2];

    id v50 = objc_alloc_init(MEMORY[0x1E4FB1398]);
    [v50 setImage:v49];
    v51 = [MEMORY[0x1E4F28B18] attributedStringWithAttachment:v50];
    v52 = (void *)[v51 mutableCopy];

    v53 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:@" "];
    [v52 appendAttributedString:v53];

    uint64_t v102 = v70;
    v54 = [v24 leadingGlyph];
    [v54 opacity];
    v55 = objc_msgSend(v72, "colorWithAlphaComponent:");
    v103 = v55;
    v56 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v103 forKeys:&v102 count:1];
    objc_msgSend(v52, "addAttributes:range:", v56, 0, 2);

    [v41 insertAttributedString:v52 atIndex:0];
  }
  v57 = [v24 trailingGlyph];
  v58 = [v57 image];

  if (v58)
  {
    v59 = [v58 platformImage];
    v60 = [v59 imageWithRenderingMode:2];

    id v61 = objc_alloc_init(MEMORY[0x1E4FB1398]);
    [v61 setImage:v60];
    v62 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:@" "];
    v63 = (void *)[v62 mutableCopy];

    v64 = [MEMORY[0x1E4F28B18] attributedStringWithAttachment:v61];
    [v63 appendAttributedString:v64];

    uint64_t v100 = v70;
    v65 = [v24 trailingGlyph];
    v66 = [v65 color];
    v101 = v66;
    v67 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v101 forKeys:&v100 count:1];
    objc_msgSend(v63, "addAttributes:range:", v67, 0, 2);

    [v41 appendAttributedString:v63];
  }
  id v68 = v41;

  _Block_object_dispose(&v91, 8);

  return v68;
}

id __153__LPTextView_attributedString_resolvedAgainstStyle_withEmphasizedTextExpression_tintColor_lineBreakMode_usesVibrancy_forLTR_withFont_userInterfaceStyle___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) shadow];

  if (v2 || !*(unsigned char *)(a1 + 40))
  {
    v3 = [*(id *)(a1 + 32) color];
  }
  else
  {
    v3 = [MEMORY[0x1E4FB1618] labelColor];
  }

  return v3;
}

void __153__LPTextView_attributedString_resolvedAgainstStyle_withEmphasizedTextExpression_tintColor_lineBreakMode_usesVibrancy_forLTR_withFont_userInterfaceStyle___block_invoke_13(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    id v11 = LPLogChannelUI();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      __153__LPTextView_attributedString_resolvedAgainstStyle_withEmphasizedTextExpression_tintColor_lineBreakMode_usesVibrancy_forLTR_withFont_userInterfaceStyle___block_invoke_13_cold_1(a1, v11);
    }
    abort();
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v4 = objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), "allKeys", 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v4);
        }
        uint64_t v8 = *(void *)(*((void *)&v12 + 1) + 8 * i);
        objc_super v9 = [v3 objectForKeyedSubscript:v8];

        if (v9)
        {
          id v10 = [v3 objectForKeyedSubscript:v8];
          [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setObject:v10 forKeyedSubscript:v8];
        }
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }

  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
}

void __153__LPTextView_attributedString_resolvedAgainstStyle_withEmphasizedTextExpression_tintColor_lineBreakMode_usesVibrancy_forLTR_withFont_userInterfaceStyle___block_invoke_17(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7 = a2;
  if (v7)
  {
    id v19 = v7;
    uint64_t v8 = [v7 image];
    if (objc_msgSend(v8, "_lp_isSymbolImage"))
    {
      objc_super v9 = [v8 symbolConfiguration];
      id v10 = (void *)MEMORY[0x1E4FB1830];
      [*(id *)(a1 + 32) pointSize];
      long long v12 = objc_msgSend(v10, "configurationWithPointSize:weight:scale:", objc_msgSend(*(id *)(a1 + 32), "_lp_symbolWeight"), 1, v11);
      if (!v9
        || ([v9 configurationByApplyingConfiguration:v12],
            long long v13 = objc_claimAutoreleasedReturnValue(),
            [v12 configurationByApplyingConfiguration:v9],
            long long v14 = objc_claimAutoreleasedReturnValue(),
            char v15 = [v13 isEqualToConfiguration:v14],
            v14,
            v13,
            (v15 & 1) != 0))
      {
        id v16 = objc_alloc_init(MEMORY[0x1E4FB1398]);
        uint64_t v17 = objc_msgSend(v8, "_lp_imageByApplyingSymbolConfiguration:", v12);
        [v16 setImage:v17];

        uint64_t v18 = [MEMORY[0x1E4F28B18] attributedStringWithAttachment:v16];
        objc_msgSend(*(id *)(a1 + 40), "replaceCharactersInRange:withAttributedString:", a3, a4, v18);
      }
    }

    id v7 = v19;
  }
}

void __153__LPTextView_attributedString_resolvedAgainstStyle_withEmphasizedTextExpression_tintColor_lineBreakMode_usesVibrancy_forLTR_withFont_userInterfaceStyle___block_invoke_2(uint64_t a1, void *a2)
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v5 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v9 = *MEMORY[0x1E4FB12B8];
  v10[0] = v4;
  uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
  uint64_t v7 = [v3 range];
  objc_msgSend(v5, "addAttributes:range:", v6, v7, v8);
}

+ (id)attributedStringHidingNonColoredRanges:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)[a3 mutableCopy];
  uint64_t v4 = [v3 length];
  uint64_t v5 = [MEMORY[0x1E4F1CA80] set];
  objc_msgSend(v3, "fixAttributesInRange:", 0, v4);
  uint64_t v6 = *MEMORY[0x1E4FB12B0];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  void v22[2] = __53__LPTextView_attributedStringHidingNonColoredRanges___block_invoke;
  v22[3] = &unk_1E5B063D8;
  id v7 = v5;
  id v23 = v7;
  objc_msgSend(v3, "enumerateAttribute:inRange:options:usingBlock:", v6, 0, v4, 0, v22);
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v8 = v7;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v24 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v19;
    uint64_t v11 = *MEMORY[0x1E4FB12B8];
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(v8);
        }
        long long v13 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        long long v14 = objc_msgSend(MEMORY[0x1E4FB1618], "clearColor", (void)v18);
        uint64_t v15 = [v13 rangeValue];
        objc_msgSend(v3, "addAttribute:value:range:", v11, v14, v15, v16);
      }
      uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v24 count:16];
    }
    while (v9);
  }

  return v3;
}

void __53__LPTextView_attributedStringHidingNonColoredRanges___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v11 = a2;
  id v7 = [v11 fontDescriptor];
  __int16 v8 = [v7 symbolicTraits];

  if ((v8 & 0x2000) == 0)
  {
    uint64_t v9 = *(void **)(a1 + 32);
    uint64_t v10 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:", a3, a4);
    [v9 addObject:v10];
  }
}

- (NSAttributedString)attributedString
{
  return self->_attributedString;
}

- (void)setContentInset:(UIEdgeInsets)a3
{
  if (a3.left != self->_contentInset.left
    || a3.top != self->_contentInset.top
    || a3.right != self->_contentInset.right
    || a3.bottom != self->_contentInset.bottom)
  {
    self->_contentInset = a3;
  }
}

- (LPTextViewStyle)style
{
  return self->_style;
}

- (double)firstLineLeading
{
  v2 = [(LPTextViewStyle *)self->_style firstLineLeading];
  [v2 value];
  double v4 = v3;

  return v4;
}

- (double)lastLineDescent
{
  v2 = [(LPTextViewStyle *)self->_style lastLineDescent];
  [v2 value];
  double v4 = v3;

  return v4;
}

- (double)ascender
{
  return self->_ascender;
}

- (double)descender
{
  return self->_descender;
}

- (int64_t)computedNumberOfLines
{
  [(LPTextView *)self _buildSubviewsIfNeeded];
  textView = self->_textView;

  return [(UILabel *)textView _measuredNumberOfLines];
}

- (void)setOverrideMaximumNumberOfLines:(int64_t)a3
{
  self->_overrideMaximumNumberOfLines = a3;
  [(UILabel *)self->_textView setNumberOfLines:[(LPTextView *)self effectiveMaximumNumberOfLines]];
  int64_t v4 = [(LPTextView *)self effectiveMaximumNumberOfLines];
  coloredGlyphsView = self->_coloredGlyphsView;

  [(UILabel *)coloredGlyphsView setNumberOfLines:v4];
}

- (UIEdgeInsets)effectiveInsets
{
  double v3 = [(LPTextViewStyle *)self->_style padding];
  objc_msgSend(v3, "asInsetsForLTR:", -[LPTextView _lp_isLTR](self, "_lp_isLTR"));
  double v5 = v4 + self->_contentInset.top;
  double v7 = v6 + self->_contentInset.left;
  double v9 = v8 + self->_contentInset.bottom;
  double v11 = v10 + self->_contentInset.right;

  double v12 = v5;
  double v13 = v7;
  double v14 = v9;
  double v15 = v11;
  result.right = v15;
  result.bottom = v14;
  result.left = v13;
  result.top = v12;
  return result;
}

- (CGRect)textRect
{
  [(LPTextView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  [(LPTextView *)self effectiveInsets];
  double v12 = v6 + v11;
  double v15 = v8 - (v13 + v14);
  double v17 = v10 - (v11 + v16);
  double v18 = v4 + v13;
  double v19 = v12;
  double v20 = v15;
  result.size.height = v17;
  result.size.width = v20;
  result.origin.y = v19;
  result.origin.x = v18;
  return result;
}

- (int64_t)effectiveMaximumNumberOfLines
{
  int64_t overrideMaximumNumberOfLines = self->_overrideMaximumNumberOfLines;
  if (!overrideMaximumNumberOfLines) {
    return [(LPTextViewStyle *)self->_style maximumLines];
  }
  return overrideMaximumNumberOfLines;
}

- (void)layoutComponentView
{
  [(LPTextView *)self _buildSubviewsIfNeeded];
  [(LPTextView *)self textRect];
  double v7 = v3;
  double v8 = v4;
  double v9 = v5;
  double v10 = v6;
  effectView = self->_effectView;
  if (effectView)
  {
    -[UIVisualEffectView setFrame:](effectView, "setFrame:", v3, v4, v5, v6);
    -[UILabel setFrame:](self->_coloredGlyphsView, "setFrame:", v7, v8, v9, v10);
    double v7 = 0.0;
    double v8 = 0.0;
  }
  textView = self->_textView;

  -[UILabel setFrame:](textView, "setFrame:", v7, v8, v9, v10);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  [(LPTextView *)self _buildSubviewsIfNeeded];
  [(LPTextView *)self effectiveInsets];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  -[UILabel sizeThatFits:](self->_textView, "sizeThatFits:", width - (v8 + v12), height - (v6 + v10));
  double v16 = ceil(v14) - (-v13 - v9);
  double v17 = ceil(v15) - (-v11 - v7);
  result.double height = v17;
  result.double width = v16;
  return result;
}

- (void)_updateAttributedString
{
  id v3 = [(LPTextView *)self effectiveAttributedString];
  -[LPTextView applyAttributedString:](self, "applyAttributedString:");
}

- (void)setEmphasizedTextExpression:(id)a3
{
  objc_storeStrong((id *)&self->_emphasizedTextExpression, a3);

  [(LPTextView *)self _updateAttributedString];
}

- (void)_userInterfaceStyleDidChange
{
  if (self->_effectView) {
    [(LPTextView *)self _updateEffectViewEffect];
  }

  [(LPTextView *)self _updateAttributedString];
}

- (id)_createLabel
{
  id v3 = objc_alloc_init(MEMORY[0x1E4FB1930]);
  objc_msgSend(v3, "setNumberOfLines:", -[LPTextView effectiveMaximumNumberOfLines](self, "effectiveMaximumNumberOfLines"));
  [v3 setBaselineAdjustment:2];
  LODWORD(v4) = 1148846080;
  [v3 setContentCompressionResistancePriority:1 forAxis:v4];
  [v3 setPreferredVibrancy:0];

  return v3;
}

- (BOOL)_needsColoredGlyphsView
{
  id v3 = [(LPComponentView *)self host];
  char v4 = [v3 allowsVibrancyForComponentView:self];

  if ((v4 & 1) == 0) {
    return 0;
  }
  double v5 = [(LPTextViewStyle *)self->_style color];
  double v6 = vibrancyEffectStyleForColor(v5);

  if (v6) {
    BOOL v7 = [v6 integerValue] != 0;
  }
  else {
    BOOL v7 = 0;
  }

  return v7;
}

- (void)_updateEffectViewEffect
{
  id v10 = [(LPComponentView *)self host];
  char v3 = [v10 allowsVibrancyForComponentView:self];

  if (v3)
  {
    char v4 = [(LPTextViewStyle *)self->_style color];
    vibrancyEffectStyleForColor(v4);
    id v11 = (id)objc_claimAutoreleasedReturnValue();

    double v5 = v11;
    if (v11)
    {
      double v6 = (void *)MEMORY[0x1E4FB14C8];
      BOOL v7 = [(LPComponentView *)self host];
      double v8 = objc_msgSend(v6, "effectWithStyle:", objc_msgSend(v7, "blurEffectStyleBehindComponentView:", self));

      double v9 = objc_msgSend(MEMORY[0x1E4FB1EA0], "effectForBlurEffect:style:", v8, objc_msgSend(v11, "integerValue"));
      [(UIVisualEffectView *)self->_effectView setEffect:v9];

      double v5 = v11;
    }
  }
}

- (void)_createTextViewWithAttributedString:(id)a3
{
  id v15 = a3;
  char v4 = [(LPTextView *)self _createLabel];
  textView = self->_textView;
  self->_textView = v4;

  double v6 = [(LPComponentView *)self host];
  int v7 = [v6 allowsVibrancyForComponentView:self];

  if (v7)
  {
    double v8 = [(LPTextViewStyle *)self->_style color];
    double v9 = vibrancyEffectStyleForColor(v8);

    if (v9)
    {
      id v10 = (UIVisualEffectView *)objc_alloc_init(MEMORY[0x1E4FB1F00]);
      effectView = self->_effectView;
      self->_effectView = v10;

      [(LPTextView *)self _updateEffectViewEffect];
      double v12 = [(UIVisualEffectView *)self->_effectView contentView];
      [v12 addSubview:self->_textView];

      [(LPTextView *)self addSubview:self->_effectView];
      if ([(LPTextView *)self _needsColoredGlyphsView])
      {
        double v13 = [(LPTextView *)self _createLabel];
        coloredGlyphsView = self->_coloredGlyphsView;
        self->_coloredGlyphsView = v13;

        [(LPTextView *)self addSubview:self->_coloredGlyphsView];
      }
    }
  }
  if (!self->_effectView) {
    [(LPTextView *)self addSubview:self->_textView];
  }
  [(LPTextView *)self applyAttributedString:v15];
}

- (void)applyAttributedString:(id)a3
{
  id v5 = a3;
  -[UILabel setAttributedText:](self->_textView, "setAttributedText:");
  if (self->_coloredGlyphsView)
  {
    char v4 = +[LPTextView attributedStringHidingNonColoredRanges:v5];
    [(UILabel *)self->_coloredGlyphsView setAttributedText:v4];
  }
}

- (id)firstBaselineAnchor
{
  [(LPTextView *)self _buildSubviewsIfNeeded];
  textView = self->_textView;

  return (id)[(UILabel *)textView firstBaselineAnchor];
}

- (id)lastBaselineAnchor
{
  [(LPTextView *)self _buildSubviewsIfNeeded];
  textView = self->_textView;

  return (id)[(UILabel *)textView lastBaselineAnchor];
}

- (id)subtitleButton
{
  return 0;
}

- (int64_t)overrideMaximumNumberOfLines
{
  return self->_overrideMaximumNumberOfLines;
}

- (NSRegularExpression)emphasizedTextExpression
{
  return self->_emphasizedTextExpression;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_emphasizedTextExpression, 0);
  objc_storeStrong((id *)&self->_attributedString, 0);
  objc_storeStrong((id *)&self->_style, 0);
  objc_storeStrong((id *)&self->_effectView, 0);
  objc_storeStrong((id *)&self->_coloredGlyphsView, 0);

  objc_storeStrong((id *)&self->_textView, 0);
}

void __153__LPTextView_attributedString_resolvedAgainstStyle_withEmphasizedTextExpression_tintColor_lineBreakMode_usesVibrancy_forLTR_withFont_userInterfaceStyle___block_invoke_13_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_1A35DC000, a2, OS_LOG_TYPE_ERROR, "All the attributes in the attributed string must span the entire string range: %@", (uint8_t *)&v3, 0xCu);
}

@end