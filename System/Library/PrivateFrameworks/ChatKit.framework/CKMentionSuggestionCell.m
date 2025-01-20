@interface CKMentionSuggestionCell
+ (id)reuseIdentifier;
- (CKAvatarView)avatarView;
- (CKEntity)suggestedEntity;
- (CKLabel)handleLabel;
- (CKMentionSuggestionCell)initWithFrame:(CGRect)a3;
- (UIView)hoverView;
- (void)didHoverOverCell:(id)a3;
- (void)setAvatarView:(id)a3;
- (void)setHandleLabel:(id)a3;
- (void)setHoverView:(id)a3;
- (void)setSuggestedEntity:(id)a3;
@end

@implementation CKMentionSuggestionCell

+ (id)reuseIdentifier
{
  return @"CKMentionSuggestionCell";
}

- (CKMentionSuggestionCell)initWithFrame:(CGRect)a3
{
  v102[13] = *MEMORY[0x1E4F143B8];
  v101.receiver = self;
  v101.super_class = (Class)CKMentionSuggestionCell;
  v3 = -[CKMentionSuggestionCell initWithFrame:](&v101, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [MEMORY[0x1E4F428B8] clearColor];
    [(CKMentionSuggestionCell *)v3 setBackgroundColor:v4];

    uint64_t v5 = [MEMORY[0x1E4F427D8] effectWithStyle:8];
    id v6 = objc_alloc(MEMORY[0x1E4F43028]);
    v100 = (void *)v5;
    v7 = [MEMORY[0x1E4F42FE8] effectForBlurEffect:v5 style:6];
    v8 = (void *)[v6 initWithEffect:v7];

    v9 = [v8 contentView];
    v10 = +[CKUIBehavior sharedBehaviors];
    v11 = [v10 theme];
    v12 = [v11 paddleSelectionColor];
    [v9 setBackgroundColor:v12];

    v99 = v8;
    [(CKMentionSuggestionCell *)v3 setSelectedBackgroundView:v8];
    v13 = objc_alloc_init(CKAvatarView);
    [(CKMentionSuggestionCell *)v3 setAvatarView:v13];

    v14 = [(CKMentionSuggestionCell *)v3 avatarView];
    [v14 setAsynchronousRendering:1];

    v15 = [(CKMentionSuggestionCell *)v3 avatarView];
    [v15 setUserInteractionEnabled:0];

    v16 = [(CKMentionSuggestionCell *)v3 avatarView];
    [v16 setShowsContactOnTap:0];

    v17 = [(CKMentionSuggestionCell *)v3 avatarView];
    [v17 setBypassActionValidation:1];

    v18 = [(CKMentionSuggestionCell *)v3 avatarView];
    [v18 setTranslatesAutoresizingMaskIntoConstraints:0];

    v19 = [(CKMentionSuggestionCell *)v3 contentView];
    v20 = [(CKMentionSuggestionCell *)v3 avatarView];
    [v19 addSubview:v20];

    v21 = [CKLabel alloc];
    v22 = -[CKLabel initWithFrame:](v21, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    [(CKMentionSuggestionCell *)v3 setHandleLabel:v22];

    v23 = [(CKMentionSuggestionCell *)v3 handleLabel];
    v24 = +[CKUIBehavior sharedBehaviors];
    v25 = [v24 mentionsCellNameFont];
    [v23 setFont:v25];

    v26 = [(CKMentionSuggestionCell *)v3 handleLabel];
    v27 = +[CKUIBehavior sharedBehaviors];
    v28 = [v27 theme];
    v29 = [v28 paddleNameColor];
    [v26 setTextColor:v29];

    v30 = [(CKMentionSuggestionCell *)v3 handleLabel];
    [v30 setLineBreakMode:4];

    v31 = [(CKMentionSuggestionCell *)v3 handleLabel];
    [v31 setNumberOfLines:2];

    v32 = [(CKMentionSuggestionCell *)v3 handleLabel];
    [v32 setTextAlignment:1];

    v33 = [(CKMentionSuggestionCell *)v3 handleLabel];
    [v33 setTranslatesAutoresizingMaskIntoConstraints:0];

    v34 = [(CKMentionSuggestionCell *)v3 contentView];
    v35 = [(CKMentionSuggestionCell *)v3 handleLabel];
    [v34 addSubview:v35];

    v36 = [(CKMentionSuggestionCell *)v3 handleLabel];
    LODWORD(v37) = 1148846080;
    [v36 setContentCompressionResistancePriority:1 forAxis:v37];

    v75 = (void *)MEMORY[0x1E4F28DC8];
    v98 = [(CKMentionSuggestionCell *)v3 handleLabel];
    v97 = [v98 widthAnchor];
    v96 = [v97 constraintLessThanOrEqualToConstant:96.0];
    v102[0] = v96;
    v95 = [(CKMentionSuggestionCell *)v3 handleLabel];
    v94 = [v95 widthAnchor];
    v93 = [v94 constraintGreaterThanOrEqualToConstant:62.0];
    v102[1] = v93;
    v92 = [(CKMentionSuggestionCell *)v3 avatarView];
    v90 = [v92 topAnchor];
    v91 = [(CKMentionSuggestionCell *)v3 contentView];
    v89 = [v91 topAnchor];
    v88 = [v90 constraintEqualToAnchor:v89 constant:16.0];
    v102[2] = v88;
    v87 = [(CKMentionSuggestionCell *)v3 avatarView];
    v85 = [v87 centerXAnchor];
    v86 = [(CKMentionSuggestionCell *)v3 contentView];
    v84 = [v86 centerXAnchor];
    v83 = [v85 constraintEqualToAnchor:v84];
    v102[3] = v83;
    v82 = [(CKMentionSuggestionCell *)v3 avatarView];
    v80 = [v82 leadingAnchor];
    v81 = [(CKMentionSuggestionCell *)v3 contentView];
    v79 = [v81 leadingAnchor];
    v78 = [v80 constraintGreaterThanOrEqualToAnchor:v79 constant:12.0];
    v102[4] = v78;
    v77 = [(CKMentionSuggestionCell *)v3 avatarView];
    v74 = [v77 trailingAnchor];
    v76 = [(CKMentionSuggestionCell *)v3 contentView];
    v73 = [v76 trailingAnchor];
    v72 = [v74 constraintLessThanOrEqualToAnchor:v73 constant:-12.0];
    v102[5] = v72;
    v71 = [(CKMentionSuggestionCell *)v3 avatarView];
    v70 = [v71 heightAnchor];
    v69 = [v70 constraintEqualToConstant:40.0];
    v102[6] = v69;
    v68 = [(CKMentionSuggestionCell *)v3 avatarView];
    v67 = [v68 widthAnchor];
    v66 = [v67 constraintEqualToConstant:40.0];
    v102[7] = v66;
    v65 = [(CKMentionSuggestionCell *)v3 handleLabel];
    v63 = [v65 topAnchor];
    v64 = [(CKMentionSuggestionCell *)v3 avatarView];
    v62 = [v64 bottomAnchor];
    v61 = [v63 constraintEqualToAnchor:v62 constant:8.0];
    v102[8] = v61;
    v60 = [(CKMentionSuggestionCell *)v3 handleLabel];
    v58 = [v60 leadingAnchor];
    v59 = [(CKMentionSuggestionCell *)v3 contentView];
    v57 = [v59 leadingAnchor];
    v56 = [v58 constraintGreaterThanOrEqualToAnchor:v57 constant:12.0];
    v102[9] = v56;
    v55 = [(CKMentionSuggestionCell *)v3 handleLabel];
    v53 = [v55 trailingAnchor];
    v54 = [(CKMentionSuggestionCell *)v3 contentView];
    v52 = [v54 trailingAnchor];
    v51 = [v53 constraintLessThanOrEqualToAnchor:v52 constant:-12.0];
    v102[10] = v51;
    v50 = [(CKMentionSuggestionCell *)v3 handleLabel];
    v49 = [v50 centerXAnchor];
    v38 = [(CKMentionSuggestionCell *)v3 contentView];
    v39 = [v38 centerXAnchor];
    v40 = [v49 constraintEqualToAnchor:v39];
    v102[11] = v40;
    v41 = [(CKMentionSuggestionCell *)v3 handleLabel];
    v42 = [v41 bottomAnchor];
    v43 = [(CKMentionSuggestionCell *)v3 contentView];
    v44 = [v43 bottomAnchor];
    v45 = [v42 constraintLessThanOrEqualToAnchor:v44 constant:-12.0];
    v102[12] = v45;
    v46 = [MEMORY[0x1E4F1C978] arrayWithObjects:v102 count:13];
    [v75 activateConstraints:v46];

    if (CKIsRunningInMacCatalyst())
    {
      v47 = (void *)[objc_alloc(MEMORY[0x1E4F42A70]) initWithTarget:v3 action:sel_didHoverOverCell_];
      [(CKMentionSuggestionCell *)v3 addGestureRecognizer:v47];
      [(CKMentionSuggestionCell *)v3 setSelectedBackgroundView:0];
    }
  }
  return v3;
}

- (void)setSuggestedEntity:(id)a3
{
  p_suggestedEntity = &self->_suggestedEntity;
  v12 = (CKEntity *)a3;
  if (*p_suggestedEntity != v12)
  {
    id v6 = [(CKMentionSuggestionCell *)self avatarView];

    if (v6)
    {
      v7 = [(CKEntity *)v12 cnContactWithKeys:MEMORY[0x1E4F1CBF0]];
      if (v7)
      {
        v8 = [(CKMentionSuggestionCell *)self avatarView];
        [v8 setContact:v7];
      }
      else if (_IMWillLog())
      {
        _IMAlwaysLog();
      }
    }
    v9 = [(CKMentionSuggestionCell *)self handleLabel];

    if (v9)
    {
      v10 = [(CKMentionSuggestionCell *)self handleLabel];
      v11 = [(CKEntity *)v12 fullName];
      [v10 setText:v11];
    }
    objc_storeStrong((id *)p_suggestedEntity, a3);
  }
}

- (UIView)hoverView
{
  hoverView = self->_hoverView;
  if (!hoverView)
  {
    [(CKMentionSuggestionCell *)self bounds];
    CGRect v13 = CGRectInset(v12, 6.0, 6.0);
    v4 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E4F42FF0]), "initWithFrame:", v13.origin.x, v13.origin.y, v13.size.width, v13.size.height);
    uint64_t v5 = self->_hoverView;
    self->_hoverView = v4;

    id v6 = self->_hoverView;
    v7 = +[CKUIBehavior sharedBehaviors];
    v8 = [v7 theme];
    v9 = [v8 appTintColor];
    [(UIView *)v6 setBackgroundColor:v9];

    [(UIView *)self->_hoverView _setContinuousCornerRadius:5.0];
    hoverView = self->_hoverView;
  }

  return hoverView;
}

- (void)didHoverOverCell:(id)a3
{
  uint64_t v4 = [a3 state];
  if (v4 == 3)
  {
    v7 = [(CKMentionSuggestionCell *)self hoverView];
    [v7 removeFromSuperview];

    id v10 = [(CKMentionSuggestionCell *)self handleLabel];
    id v6 = +[CKUIBehavior sharedBehaviors];
    v8 = [v6 theme];
    v9 = [v8 paddleNameColor];
    [v10 setTextColor:v9];
  }
  else
  {
    if (v4 != 1) {
      return;
    }
    uint64_t v5 = [(CKMentionSuggestionCell *)self hoverView];
    [(CKMentionSuggestionCell *)self insertSubview:v5 atIndex:0];

    id v10 = [(CKMentionSuggestionCell *)self handleLabel];
    id v6 = [MEMORY[0x1E4F428B8] whiteColor];
    [v10 setTextColor:v6];
  }
}

- (CKEntity)suggestedEntity
{
  return self->_suggestedEntity;
}

- (CKLabel)handleLabel
{
  return self->_handleLabel;
}

- (void)setHandleLabel:(id)a3
{
}

- (CKAvatarView)avatarView
{
  return self->_avatarView;
}

- (void)setAvatarView:(id)a3
{
}

- (void)setHoverView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hoverView, 0);
  objc_storeStrong((id *)&self->_avatarView, 0);
  objc_storeStrong((id *)&self->_handleLabel, 0);

  objc_storeStrong((id *)&self->_suggestedEntity, 0);
}

@end