@interface LPSubtitleButtonView
- (CGSize)_layoutButtonForSize:(CGSize)a3 applyingLayout:(BOOL)a4;
- (CGSize)sizeThatFits:(CGSize)a3;
- (LPSubtitleButtonView)initWithHost:(id)a3;
- (LPSubtitleButtonView)initWithHost:(id)a3 buttonProperties:(id)a4 style:(id)a5;
- (id)viewForLastBaselineLayout;
- (void)_buildSubviewsIfNeeded;
- (void)buttonPressed:(id)a3;
- (void)layoutComponentView;
- (void)sizeToFit;
@end

@implementation LPSubtitleButtonView

- (LPSubtitleButtonView)initWithHost:(id)a3
{
  return 0;
}

- (LPSubtitleButtonView)initWithHost:(id)a3 buttonProperties:(id)a4 style:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)LPSubtitleButtonView;
  v11 = [(LPComponentView *)&v15 initWithHost:a3];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_buttonProperties, a4);
    objc_storeStrong((id *)&v12->_style, a5);
    v13 = v12;
  }

  return v12;
}

- (void)_buildSubviewsIfNeeded
{
  v35[1] = *MEMORY[0x1E4F143B8];
  if (!self->_button)
  {
    v3 = [MEMORY[0x1E4FB14D0] buttonWithType:1];
    button = self->_button;
    self->_button = v3;

    v5 = [(LPCaptionButtonPresentationProperties *)self->_buttonProperties foregroundColor];

    if (v5)
    {
      v6 = self->_button;
      v7 = [(LPCaptionButtonPresentationProperties *)self->_buttonProperties foregroundColor];
      [(UIButton *)v6 setTitleColor:v7 forState:0];
    }
    [(UIButton *)self->_button _setDisableAutomaticTitleAnimations:1];
    v8 = [(LPCaptionButtonPresentationProperties *)self->_buttonProperties attributedText];

    if (v8)
    {
      id v9 = self->_button;
      id v10 = [(LPCaptionButtonPresentationProperties *)self->_buttonProperties attributedText];
      [(UIButton *)v9 setAttributedTitle:v10 forState:0];
    }
    else
    {
      id v11 = objc_alloc(MEMORY[0x1E4F28E48]);
      v12 = [(LPCaptionButtonPresentationProperties *)self->_buttonProperties text];
      v13 = (void *)[v11 initWithString:v12];

      if (![(LPCaptionButtonPresentationProperties *)self->_buttonProperties type]
        || [(LPCaptionButtonPresentationProperties *)self->_buttonProperties type] == 2)
      {
        id v33 = objc_alloc_init(MEMORY[0x1E4FB1398]);
        v14 = [(LPTextViewStyle *)self->_style font];
        objc_super v15 = [v14 fontDescriptor];

        v32 = v15;
        v31 = [v15 objectForKey:*MEMORY[0x1E4FB2880]];
        v16 = [v31 objectForKeyedSubscript:*MEMORY[0x1E4FB29E0]];
        v30 = v16;
        if (v16) {
          uint64_t v17 = MEMORY[0x1A624B730]([v16 doubleValue]);
        }
        else {
          uint64_t v17 = 4;
        }
        v18 = +[LPResources chevron];
        v19 = [v18 platformImage];
        v20 = (void *)MEMORY[0x1E4FB1830];
        v21 = [(LPTextViewStyle *)self->_style font];
        [v21 pointSize];
        v22 = objc_msgSend(v20, "configurationWithPointSize:weight:scale:", v17, 1);
        v23 = [v19 imageWithConfiguration:v22];
        v24 = [v23 imageWithRenderingMode:2];
        [v33 setImage:v24];

        v25 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:@" "];
        [v13 appendAttributedString:v25];

        v26 = [MEMORY[0x1E4F28B18] attributedStringWithAttachment:v33];
        [v13 appendAttributedString:v26];
      }
      uint64_t v34 = *MEMORY[0x1E4FB12B0];
      v27 = [(LPTextViewStyle *)self->_style font];
      v35[0] = v27;
      v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v35 forKeys:&v34 count:1];
      objc_msgSend(v13, "addAttributes:range:", v28, 0, objc_msgSend(v13, "length"));

      [(UIButton *)self->_button setAttributedTitle:v13 forState:0];
    }
    v29 = [(UIButton *)self->_button titleLabel];
    [v29 setBaselineAdjustment:2];

    [(UIButton *)self->_button addTarget:self action:sel_buttonPressed_ forControlEvents:64];
    [(LPSubtitleButtonView *)self addSubview:self->_button];
  }
}

- (void)layoutComponentView
{
  [(LPSubtitleButtonView *)self _buildSubviewsIfNeeded];
  [(LPSubtitleButtonView *)self bounds];

  -[LPSubtitleButtonView _layoutButtonForSize:applyingLayout:](self, "_layoutButtonForSize:applyingLayout:", 1, v3, v4);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  [(LPSubtitleButtonView *)self _buildSubviewsIfNeeded];

  -[LPSubtitleButtonView _layoutButtonForSize:applyingLayout:](self, "_layoutButtonForSize:applyingLayout:", 0, width, height);
  result.double height = v7;
  result.double width = v6;
  return result;
}

- (CGSize)_layoutButtonForSize:(CGSize)a3 applyingLayout:(BOOL)a4
{
  double height = a3.height;
  double width = a3.width;
  if (a4) {
    -[UIButton setFrame:](self->_button, "setFrame:", 0.0, 0.0, a3.width, a3.height);
  }
  button = self->_button;

  -[UIButton sizeThatFits:](button, "sizeThatFits:", width, height);
  result.double height = v9;
  result.double width = v8;
  return result;
}

- (void)sizeToFit
{
  -[LPSubtitleButtonView sizeThatFits:](self, "sizeThatFits:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));

  -[LPSubtitleButtonView setFrame:](self, "setFrame:", 0.0, 0.0, v3, v4);
}

- (void)buttonPressed:(id)a3
{
  id v5 = [(LPComponentView *)self host];
  objc_msgSend(v5, "componentViewDidTapCaptionButton:buttonType:", self, -[LPCaptionButtonPresentationProperties type](self->_buttonProperties, "type"));

  double v4 = [(LPCaptionButtonPresentationProperties *)self->_buttonProperties callback];

  if (v4)
  {
    double v6 = [(LPCaptionButtonPresentationProperties *)self->_buttonProperties callback];
    v6[2]();
  }
}

- (id)viewForLastBaselineLayout
{
  return self->_button;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_button, 0);
  objc_storeStrong((id *)&self->_style, 0);

  objc_storeStrong((id *)&self->_buttonProperties, 0);
}

@end