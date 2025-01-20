@interface AAUIMessageBubbleView
- (AAUIMessageBubbleView)initWithText:(id)a3;
- (id)_horizontalStackView;
- (id)_memoBalloonViewWithText:(id)a3;
- (void)_setupContentViewWithBubbleText:(id)a3;
@end

@implementation AAUIMessageBubbleView

- (AAUIMessageBubbleView)initWithText:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AAUIMessageBubbleView;
  v6 = -[AAUIMessageBubbleView initWithFrame:](&v9, sel_initWithFrame_, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_bubbleText, a3);
    [(AAUIMessageBubbleView *)v7 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(AAUIMessageBubbleView *)v7 _setupContentViewWithBubbleText:v5];
  }

  return v7;
}

- (void)_setupContentViewWithBubbleText:(id)a3
{
  v32[6] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v31 = objc_alloc_init(AAUIProfilePictureStore);
  [(AAUIProfilePictureStore *)v31 setPictureDiameter:40.0];
  id v5 = [(AAUIProfilePictureStore *)v31 profilePictureForAccountOwner];
  v30 = objc_msgSend(v5, "imageWithAlignmentRectInsets:", 0.0, 0.0, 10.0, 0.0);

  v6 = (void *)[objc_alloc(MEMORY[0x263F82828]) initWithImage:v30];
  [v6 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v6 setContentMode:2];
  v7 = [(AAUIMessageBubbleView *)self _memoBalloonViewWithText:v4];

  [v7 setTranslatesAutoresizingMaskIntoConstraints:0];
  v8 = [(AAUIMessageBubbleView *)self _horizontalStackView];
  v29 = v6;
  [v8 addArrangedSubview:v6];
  [v8 addArrangedSubview:v7];
  [(AAUIMessageBubbleView *)self addSubview:v8];
  [v7 prepareForDisplay];
  objc_msgSend(v7, "sizeThatFits:", 200.0, 1.79769313e308);
  double v10 = v9;
  double v12 = v11;
  v22 = (void *)MEMORY[0x263F08938];
  v28 = [(AAUIMessageBubbleView *)self heightAnchor];
  v27 = [v28 constraintEqualToConstant:v12];
  v32[0] = v27;
  v26 = [v6 widthAnchor];
  v25 = [v26 constraintEqualToConstant:40.0];
  v32[1] = v25;
  v24 = [v7 topAnchor];
  v23 = [v8 topAnchor];
  v21 = [v24 constraintEqualToAnchor:v23];
  v32[2] = v21;
  v13 = [v7 widthAnchor];
  v14 = [v13 constraintEqualToConstant:v10];
  v32[3] = v14;
  v15 = [v7 heightAnchor];
  v16 = [v15 constraintEqualToConstant:v12 * 0.899999976];
  v32[4] = v16;
  v17 = [v8 centerXAnchor];
  v18 = [(AAUIMessageBubbleView *)self centerXAnchor];
  v19 = [v17 constraintEqualToAnchor:v18];
  v32[5] = v19;
  v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:v32 count:6];
  [v22 activateConstraints:v20];
}

- (id)_memoBalloonViewWithText:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x263F31AB0] sharedBehaviors];
  objc_opt_class();
  id v5 = CKBalloonViewForClass();
  [v5 setHasTail:1];
  [v5 setBalloonCorners:-1];
  [v5 setColor:0xFFFFFFFFLL];
  [v5 setCanUseOpaqueMask:0];
  v6 = (void *)[objc_alloc(MEMORY[0x263F089B8]) initWithString:v3];
  if ([v4 hyphenatesTextContent])
  {
    v7 = [MEMORY[0x263F81658] defaultParagraphStyle];
    v8 = (void *)[v7 mutableCopy];

    LODWORD(v9) = 1.0;
    [v8 setHyphenationFactor:v9];
    objc_msgSend(v6, "addAttribute:value:range:", *MEMORY[0x263F81540], v8, 0, objc_msgSend(v6, "length"));
  }
  uint64_t v10 = [v6 length];
  if (objc_msgSend(v3, "__ck_shouldUseBigEmoji")) {
    [v4 bigEmojiFont];
  }
  else {
  double v11 = [v4 balloonTextFont];
  }
  objc_msgSend(v6, "addAttribute:value:range:", *MEMORY[0x263F814F0], v11, 0, v10);
  uint64_t v12 = *MEMORY[0x263F81500];
  v13 = [MEMORY[0x263F31AB0] sharedBehaviors];
  v14 = [v13 theme];
  v15 = objc_msgSend(v14, "balloonTextColorForColorType:", objc_msgSend(v5, "color"));
  objc_msgSend(v6, "addAttribute:value:range:", v12, v15, 0, v10);

  [v5 setAttributedText:v6];
  [v5 setOrientation:0];

  return v5;
}

- (id)_horizontalStackView
{
  id v2 = objc_alloc_init(MEMORY[0x263F82BF8]);
  [v2 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v2 setAxis:0];
  [v2 setAlignment:4];
  [v2 setDistribution:0];
  id v3 = [MEMORY[0x263F825C8] clearColor];
  [v2 setBackgroundColor:v3];

  [v2 setSpacing:20.0];
  return v2;
}

- (void).cxx_destruct
{
}

@end