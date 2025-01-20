@interface LPCollaborationFooterView
- (CGSize)_layoutFooterForSize:(CGSize)a3 applyingLayout:(BOOL)a4;
- (CGSize)sizeThatFits:(CGSize)a3;
- (LPCollaborationFooterView)initWithHost:(id)a3;
- (LPCollaborationFooterView)initWithHost:(id)a3 properties:(id)a4 style:(id)a5;
- (UIEdgeInsets)additionalPadding;
- (id)_resolvedGlyphAttachmentImageFromImage:(id)a3;
- (void)_footerTapRecognized:(id)a3;
- (void)layoutComponentView;
- (void)setAdditionalPadding:(UIEdgeInsets)a3;
- (void)updateIndicator;
@end

@implementation LPCollaborationFooterView

- (LPCollaborationFooterView)initWithHost:(id)a3
{
  return 0;
}

- (id)_resolvedGlyphAttachmentImageFromImage:(id)a3
{
  id v3 = a3;

  return v3;
}

- (LPCollaborationFooterView)initWithHost:(id)a3 properties:(id)a4 style:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v73.receiver = self;
  v73.super_class = (Class)LPCollaborationFooterView;
  v11 = [(LPComponentView *)&v73 initWithHost:v8];
  v12 = v11;
  if (v11)
  {
    p_style = (id *)&v11->_style;
    objc_storeStrong((id *)&v11->_style, a5);
    uint64_t v14 = [v9 action];
    id action = v12->_action;
    v12->_id action = (id)v14;

    id v67 = v8;
    v68 = v10;
    v16 = [v9 title];
    v69 = v16;
    if (v16)
    {
      id v17 = objc_alloc_init(MEMORY[0x1E4F28E48]);
      v18 = [v9 glyphAttachmentImage];

      if (v18)
      {
        id v19 = objc_alloc_init(MEMORY[0x1E4FB1398]);
        v20 = [v9 glyphAttachmentImage];
        v21 = [(LPCollaborationFooterView *)v12 _resolvedGlyphAttachmentImageFromImage:v20];
        [v19 setImage:v21];

        v22 = [MEMORY[0x1E4F28B18] attributedStringWithAttachment:v19];
        [v17 appendAttributedString:v22];

        v23 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:@" "];
        [v17 appendAttributedString:v23];

        v16 = v69;
      }
      v24 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v16];
      [v17 appendAttributedString:v24];

      v25 = [v10 options];
      if ([v10 useInlineIndicator] && v12->_action)
      {
        uint64_t v26 = [v25 copy];

        v66 = (void *)v26;
        v27 = objc_alloc_init(LPGlyphStyle);
        v28 = objc_msgSend(MEMORY[0x1E4FB1830], "_lp_configurationWithTextStyle:weight:scale:", *MEMORY[0x1E4FB28F0], 7, 1);
        v29 = +[LPResources chevron];
        v30 = [v29 platformImage];
        v31 = objc_msgSend(v30, "_lp_imageByApplyingSymbolConfiguration:", v28);

        v25 = v66;
        v32 = [[LPImage alloc] initWithPlatformImage:v31];
        [(LPGlyphStyle *)v27 setImage:v32];

        v33 = [MEMORY[0x1E4FB1618] tertiaryLabelColor];
        [(LPGlyphStyle *)v27 setColor:v33];

        [v66 setTrailingGlyph:v27];
        id v8 = v67;
        id v10 = v68;
      }
      v34 = [[LPTextView alloc] initWithHost:v8 text:v17 style:v25];
      optionsView = v12->_optionsView;
      v12->_optionsView = v34;

      [(LPCollaborationFooterView *)v12 addSubview:v12->_optionsView];
      v16 = v69;
    }
    v36 = [v9 subtitle];
    if (v36
      || ([v9 initiatorNameComponents], (v36 = objc_claimAutoreleasedReturnValue()) != 0))
    {
    }
    else
    {
      v65 = [v9 initiatorName];

      if (!v65) {
        goto LABEL_19;
      }
    }
    v37 = [v9 subtitle];
    v38 = v37;
    if (v37)
    {
      id v39 = v37;
    }
    else
    {
      id v39 = [v9 initiatorName];
    }
    v41 = v39;

    v42 = [v9 initiatorNameComponents];
    v70[0] = MEMORY[0x1E4F143A8];
    v70[1] = 3221225472;
    v70[2] = __59__LPCollaborationFooterView_initWithHost_properties_style___block_invoke;
    v70[3] = &unk_1E5B05330;
    id v43 = v42;
    id v71 = v43;
    id v44 = v41;
    id v72 = v44;
    v45 = __59__LPCollaborationFooterView_initWithHost_properties_style___block_invoke((uint64_t)v70);
    if (v45)
    {
      v46 = [LPTextView alloc];
      v47 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v45];
      v48 = [v68 handle];
      uint64_t v49 = [(LPTextView *)v46 initWithHost:v67 text:v47 style:v48];
      subtitleView = v12->_subtitleView;
      v12->_subtitleView = (LPTextView *)v49;

      [(LPCollaborationFooterView *)v12 addSubview:v12->_subtitleView];
    }

    id v8 = v67;
    id v10 = v68;
    v16 = v69;
LABEL_19:
    v51 = v12->_optionsView;
    if (v12->_subtitleView)
    {
      if (!v51)
      {
LABEL_26:
        if ([*p_style showSeparator])
        {
          v56 = objc_msgSend(MEMORY[0x1E4FB1618], "_lp_colorWithDynamicProvider:name:", &__block_literal_global_5, @"LPCollaborationFooterSeparatorColor");
          v57 = [[LPBackgroundColorView alloc] initWithColor:v56];
          separatorView = v12->_separatorView;
          v12->_separatorView = &v57->super;

          [(LPCollaborationFooterView *)v12 addSubview:v12->_separatorView];
        }
        if (v12->_optionsView)
        {
          v59 = (void *)[objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:v12 action:sel__footerTapRecognized_];
          [(LPCollaborationFooterView *)v12 addGestureRecognizer:v59];
          [(UIView *)v12 _lp_setHoverEffectEnabled:1];
        }
        v60 = [*p_style cornerRadius];

        if (v60)
        {
          v61 = [*p_style cornerRadius];
          [v61 value];
          -[UIView _lp_setCornerRadius:](v12, "_lp_setCornerRadius:");
        }
        v62 = [*p_style backgroundColor];

        if (v62)
        {
          v63 = [*p_style backgroundColor];
          [(UIView *)v12 _lp_setBackgroundColor:v63];
        }
        v40 = v12;
        goto LABEL_35;
      }
    }
    else if (!v51)
    {
      v40 = 0;
LABEL_35:

      goto LABEL_36;
    }
    if (([v10 useInlineIndicator] & 1) == 0 && v12->_action)
    {
      v52 = (UIImageView *)objc_alloc_init(MEMORY[0x1E4FB1838]);
      indicatorView = v12->_indicatorView;
      v12->_indicatorView = v52;

      [(LPCollaborationFooterView *)v12 updateIndicator];
      v54 = v12->_indicatorView;
      v55 = [MEMORY[0x1E4FB1618] tertiaryLabelColor];
      [(UIImageView *)v54 _lp_setTintColor:v55];

      [(UIImageView *)v12->_indicatorView setContentMode:4];
      [(LPCollaborationFooterView *)v12 addSubview:v12->_indicatorView];
    }
    goto LABEL_26;
  }
  v40 = 0;
LABEL_36:

  return v40;
}

id __59__LPCollaborationFooterView_initWithHost_properties_style___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    id v2 = objc_alloc_init(MEMORY[0x1E4F28F38]);
    id v3 = [v2 stringFromPersonNameComponents:*(void *)(a1 + 32)];
    v4 = v3;
    if (*(void *)(a1 + 40))
    {
      v5 = NSString;
      v6 = LPLocalizedString(@"Share as %@ (%@)");
      objc_msgSend(v5, "stringWithFormat:", v6, v4, *(void *)(a1 + 40));
      id v7 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v7 = v3;
    }
  }
  else
  {
    id v7 = *(id *)(a1 + 40);
  }

  return v7;
}

id __59__LPCollaborationFooterView_initWithHost_properties_style___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 userInterfaceIdiom] == 6) {
    [MEMORY[0x1E4FB1618] separatorColor];
  }
  else {
  id v3 = [MEMORY[0x1E4FB1618] opaqueSeparatorColor];
  }

  return v3;
}

- (void)setAdditionalPadding:(UIEdgeInsets)a3
{
  self->_additionalPadding = a3;
  [(UIView *)self _lp_setNeedsLayout];
}

- (void)layoutComponentView
{
  [(LPCollaborationFooterView *)self bounds];

  -[LPCollaborationFooterView _layoutFooterForSize:applyingLayout:](self, "_layoutFooterForSize:applyingLayout:", 1, v3, v4);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  -[LPCollaborationFooterView _layoutFooterForSize:applyingLayout:](self, "_layoutFooterForSize:applyingLayout:", 0, a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGSize)_layoutFooterForSize:(CGSize)a3 applyingLayout:(BOOL)a4
{
  BOOL v4 = a4;
  CGFloat height = a3.height;
  double width = a3.width;
  id v8 = [(LPCollaborationFooterStyle *)self->_style padding];
  objc_msgSend(v8, "asInsetsForLTR:", -[UIView _lp_isLTR](self, "_lp_isLTR"));
  double v10 = v9;
  double v12 = v11;
  double v49 = v14;
  double v50 = v13;
  double left = self->_additionalPadding.left;
  double top = self->_additionalPadding.top;
  double bottom = self->_additionalPadding.bottom;
  double right = self->_additionalPadding.right;

  double v47 = height;
  if (self->_indicatorView)
  {
    v18 = [(LPCollaborationFooterStyle *)self->_style indicatorSpacing];
    [v18 value];
    double v20 = v19;

    indicatorView = self->_indicatorView;
  }
  else
  {
    indicatorView = 0;
    double v20 = 0.0;
  }
  v22 = [(UIImageView *)indicatorView image];
  [v22 size];
  double v24 = v23;
  double v25 = v10 + left;
  double v26 = v12 + right;

  double v52 = v20;
  double v27 = width - (v26 + v25 + v20 + v24);
  -[LPTextView sizeThatFits:](self->_optionsView, "sizeThatFits:", v27, 1.79769313e308);
  double v54 = v28;
  double v55 = v29;
  -[LPTextView sizeThatFits:](self->_subtitleView, "sizeThatFits:", v27, 1.79769313e308);
  double v31 = v30;
  double v53 = v32;
  double v33 = 0.0;
  if ([(LPCollaborationFooterStyle *)self->_style showSeparator])
  {
    v34 = [(LPCollaborationFooterStyle *)self->_style separatorMargin];
    v35 = [v34 bottom];
    [v35 value];
    double v33 = v36;
  }
  double v37 = v49 + bottom;
  double v38 = v50 + top + v33;
  if (v4)
  {
    double v51 = v37;
    double v39 = v47 - v38 - v37;
    if ([(UIView *)self _lp_isLTR])
    {
      -[UIImageView setFrame:](self->_indicatorView, "setFrame:", width - v24 - v26, v38, v24, v39);
      -[LPTextView setFrame:](self->_optionsView, "setFrame:", v25, v38, v54, v55);
      [(LPTextView *)self->_optionsView frame];
      double MaxY = CGRectGetMaxY(v57);
      if (MaxY == 0.0) {
        double v41 = v38;
      }
      else {
        double v41 = MaxY;
      }
      double v42 = v25;
    }
    else
    {
      -[UIImageView setFrame:](self->_indicatorView, "setFrame:", v25, v38, v24, v39);
      double v43 = v52 + v25 + v24;
      -[LPTextView setFrame:](self->_optionsView, "setFrame:", v43 + v27 - v54, v38, v54, v55);
      double v42 = v43 + v27 - v31;
      [(LPTextView *)self->_optionsView frame];
      double v44 = CGRectGetMaxY(v58);
      if (v44 == 0.0) {
        double v41 = v38;
      }
      else {
        double v41 = v44;
      }
    }
    -[LPTextView setFrame:](self->_subtitleView, "setFrame:", v42, v41, v31, v53);
    -[UIView setFrame:](self->_separatorView, "setFrame:", v25, 0.0, width - v25 - v26, 0.5);
    double v37 = v51;
  }
  double v45 = v37 + v53 + v55 + v38;
  double v46 = v24 + v52 + fmax(v54, v31);
  result.CGFloat height = v45;
  result.double width = v46;
  return result;
}

- (void)updateIndicator
{
  if (self->_indicatorView)
  {
    id v3 = (id)*MEMORY[0x1E4FB28F0];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __44__LPCollaborationFooterView_updateIndicator__block_invoke;
    v9[3] = &unk_1E5B05378;
    v9[4] = self;
    BOOL v4 = __44__LPCollaborationFooterView_updateIndicator__block_invoke((uint64_t)v9);
    v5 = objc_msgSend(MEMORY[0x1E4FB1818], "_lp_systemImageNamed:", v4);
    v6 = objc_msgSend(MEMORY[0x1E4FB1830], "_lp_configurationWithTextStyle:weight:scale:", v3, 7, 1);
    id v7 = objc_msgSend(v5, "_lp_imageByApplyingSymbolConfiguration:", v6);
    [(UIImageView *)self->_indicatorView setImage:v7];

    id v8 = [(LPCollaborationFooterView *)self window];

    if (v8) {
      [(UIView *)self _lp_setNeedsLayout];
    }
  }
}

__CFString *__44__LPCollaborationFooterView_updateIndicator__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) host];
  char v3 = [v2 showingDisclosureViewForComponentView:*(void *)(a1 + 32)];

  if (v3) {
    return @"chevron.down";
  }
  if (objc_msgSend(*(id *)(a1 + 32), "_lp_isLTR")) {
    return @"chevron.right";
  }
  return @"chevron.left";
}

- (void)_footerTapRecognized:(id)a3
{
  id action = (void (**)(void))self->_action;
  if (action) {
    action[2]();
  }
}

- (UIEdgeInsets)additionalPadding
{
  double top = self->_additionalPadding.top;
  double left = self->_additionalPadding.left;
  double bottom = self->_additionalPadding.bottom;
  double right = self->_additionalPadding.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_style, 0);
  objc_storeStrong(&self->_action, 0);
  objc_storeStrong((id *)&self->_separatorView, 0);
  objc_storeStrong((id *)&self->_indicatorView, 0);
  objc_storeStrong((id *)&self->_subtitleView, 0);

  objc_storeStrong((id *)&self->_optionsView, 0);
}

@end