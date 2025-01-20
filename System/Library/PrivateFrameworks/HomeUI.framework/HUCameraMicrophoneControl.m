@interface HUCameraMicrophoneControl
- (BOOL)isTalking;
- (CGSize)intrinsicContentSize;
- (HUCameraMicrophoneControl)initWithFrame:(CGRect)a3;
- (HUIconView)doneButtonIconView;
- (UIButton)doneButton;
- (UIButton)talkButton;
- (void)setDoneButton:(id)a3;
- (void)setDoneButtonIconView:(id)a3;
- (void)setTalkButton:(id)a3;
- (void)setTalking:(BOOL)a3;
@end

@implementation HUCameraMicrophoneControl

- (HUCameraMicrophoneControl)initWithFrame:(CGRect)a3
{
  v8.receiver = self;
  v8.super_class = (Class)HUCameraMicrophoneControl;
  v3 = -[HUCameraMicrophoneControl initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(HUCameraMicrophoneControl *)v3 setTranslatesAutoresizingMaskIntoConstraints:0];
    v5 = [(HUCameraMicrophoneControl *)v4 talkButton];
    [(HUCameraMicrophoneControl *)v4 addSubview:v5];

    v6 = [(HUCameraMicrophoneControl *)v4 doneButton];
    [(HUCameraMicrophoneControl *)v4 addSubview:v6];
  }
  return v4;
}

- (UIButton)talkButton
{
  talkButton = self->_talkButton;
  if (!talkButton)
  {
    v4 = [MEMORY[0x1E4F427E0] buttonWithType:1];
    objc_msgSend(MEMORY[0x1E4F427E0], "hu_talkStateForButton:usingStandardSymbolConfiguration:", v4, 1);
    v5 = [(UIButton *)v4 heightAnchor];
    v6 = [v5 constraintEqualToConstant:44.0];
    [v6 setActive:1];

    [(UIButton *)v4 setUserInteractionEnabled:0];
    [(UIButton *)v4 sizeToFit];
    v7 = self->_talkButton;
    self->_talkButton = v4;

    talkButton = self->_talkButton;
  }

  return talkButton;
}

- (UIButton)doneButton
{
  doneButton = self->_doneButton;
  if (!doneButton)
  {
    v4 = [MEMORY[0x1E4F427E0] buttonWithType:1];
    objc_msgSend(MEMORY[0x1E4F427E0], "hu_doneStateForButton:usingStandardSymbolConfiguration:", v4, 1);
    v5 = [(UIButton *)v4 heightAnchor];
    v6 = [v5 constraintEqualToConstant:44.0];
    [v6 setActive:1];

    [(UIButton *)v4 setHidden:1];
    [(UIButton *)v4 setUserInteractionEnabled:0];
    id v7 = objc_alloc_init(MEMORY[0x1E4F6A428]);
    [v7 setTranslatesAutoresizingMaskIntoConstraints:0];
    id v8 = objc_alloc(MEMORY[0x1E4F68F38]);
    v9 = (void *)[v8 initWithPackageIdentifier:*MEMORY[0x1E4F68330]];
    [v7 updateWithIconDescriptor:v9 displayStyle:1 animated:1];
    [(UIButton *)v4 addSubview:v7];
    v10 = [v7 topAnchor];
    v11 = [(UIButton *)v4 topAnchor];
    v12 = [v10 constraintEqualToAnchor:v11 constant:13.0];
    [v12 setActive:1];

    v13 = [v7 leadingAnchor];
    v14 = [(UIButton *)v4 leadingAnchor];
    v15 = [v13 constraintEqualToAnchor:v14 constant:10.0];
    [v15 setActive:1];

    v16 = [v7 widthAnchor];
    v17 = [v16 constraintEqualToConstant:18.0];
    [v17 setActive:1];

    v18 = [v7 heightAnchor];
    v19 = [v18 constraintEqualToConstant:18.0];
    [v19 setActive:1];

    doneButtonIconView = self->_doneButtonIconView;
    self->_doneButtonIconView = (HUIconView *)v7;
    id v21 = v7;

    v22 = self->_doneButton;
    self->_doneButton = v4;

    doneButton = self->_doneButton;
  }

  return doneButton;
}

- (void)setTalking:(BOOL)a3
{
  if (self->_talking != a3)
  {
    BOOL v3 = a3;
    v5 = [(HUCameraMicrophoneControl *)self talkButton];
    [v5 setHidden:v3];

    v6 = [(HUCameraMicrophoneControl *)self doneButton];
    [v6 setHidden:v3 ^ 1];

    self->_talking = v3;
    [(HUCameraMicrophoneControl *)self invalidateIntrinsicContentSize];
  }
}

- (CGSize)intrinsicContentSize
{
  if ([(HUCameraMicrophoneControl *)self isTalking]) {
    [(HUCameraMicrophoneControl *)self doneButton];
  }
  else {
  BOOL v3 = [(HUCameraMicrophoneControl *)self talkButton];
  }
  [v3 bounds];
  double v5 = v4;

  double v6 = 44.0;
  double v7 = v5;
  result.height = v6;
  result.width = v7;
  return result;
}

- (BOOL)isTalking
{
  return self->_talking;
}

- (void)setTalkButton:(id)a3
{
}

- (void)setDoneButton:(id)a3
{
}

- (HUIconView)doneButtonIconView
{
  return self->_doneButtonIconView;
}

- (void)setDoneButtonIconView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_doneButtonIconView, 0);
  objc_storeStrong((id *)&self->_doneButton, 0);

  objc_storeStrong((id *)&self->_talkButton, 0);
}

@end