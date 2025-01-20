@interface HUClipScrubberAccessoryToggleView
- (HUClipScrubberAccessoryToggleView)initWithFrame:(CGRect)a3;
- (UIButton)accessoryButton;
- (UIButton)liveButton;
- (UIView)backgroundView;
- (void)displayForTimelineState:(unint64_t)a3;
- (void)displayWithoutBackgroundVisualEffects;
- (void)setAccessoryButton:(id)a3;
- (void)setBackgroundView:(id)a3;
- (void)setLiveButton:(id)a3;
@end

@implementation HUClipScrubberAccessoryToggleView

- (HUClipScrubberAccessoryToggleView)initWithFrame:(CGRect)a3
{
  v12.receiver = self;
  v12.super_class = (Class)HUClipScrubberAccessoryToggleView;
  v3 = -[HUClipScrubberAccessoryToggleView initWithFrame:](&v12, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(HUClipScrubberAccessoryToggleView *)v3 setTranslatesAutoresizingMaskIntoConstraints:0];
    v5 = (UIView *)objc_alloc_init(MEMORY[0x1E4F16708]);
    [(UIView *)v5 setAutoresizingMask:18];
    [(HUClipScrubberAccessoryToggleView *)v4 bounds];
    -[UIView setFrame:](v5, "setFrame:");
    backgroundView = v4->_backgroundView;
    v4->_backgroundView = v5;
    v7 = v5;

    [(HUClipScrubberAccessoryToggleView *)v4 addSubview:v7];
    v8 = [(HUClipScrubberAccessoryToggleView *)v4 liveButton];
    [(HUClipScrubberAccessoryToggleView *)v4 addSubview:v8];

    v9 = [(HUClipScrubberAccessoryToggleView *)v4 accessoryButton];
    [(HUClipScrubberAccessoryToggleView *)v4 addSubview:v9];

    v10 = [(HUClipScrubberAccessoryToggleView *)v4 layer];
    [v10 setCornerRadius:16.0];

    [(HUClipScrubberAccessoryToggleView *)v4 setClipsToBounds:1];
  }
  return v4;
}

- (void)displayForTimelineState:(unint64_t)a3
{
  v5 = [(HUClipScrubberAccessoryToggleView *)self liveButton];
  v6 = v5;
  if (a3 == 1)
  {
    [v5 setHidden:1];

    v7 = [(HUClipScrubberAccessoryToggleView *)self accessoryButton];
    id v9 = v7;
    uint64_t v8 = 0;
  }
  else
  {
    [v5 setHidden:0];

    v7 = [(HUClipScrubberAccessoryToggleView *)self accessoryButton];
    id v9 = v7;
    uint64_t v8 = 1;
  }
  [v7 setHidden:v8];
}

- (UIButton)accessoryButton
{
  accessoryButton = self->_accessoryButton;
  if (!accessoryButton)
  {
    objc_msgSend(MEMORY[0x1E4F427E0], "hu_clipScrubberNearbyAccessoryButton");
    v4 = (UIButton *)objc_claimAutoreleasedReturnValue();
    [(HUClipScrubberAccessoryToggleView *)self bounds];
    -[UIButton setFrame:](v4, "setFrame:");
    v5 = [(UIButton *)v4 layer];
    [v5 setCornerRadius:16.0];

    [(UIButton *)v4 setAutoresizingMask:18];
    v6 = self->_accessoryButton;
    self->_accessoryButton = v4;

    accessoryButton = self->_accessoryButton;
  }

  return accessoryButton;
}

- (UIButton)liveButton
{
  liveButton = self->_liveButton;
  if (!liveButton)
  {
    objc_msgSend(MEMORY[0x1E4F427E0], "hu_clipScrubberLiveButton");
    v4 = (UIButton *)objc_claimAutoreleasedReturnValue();
    [(HUClipScrubberAccessoryToggleView *)self bounds];
    -[UIButton setFrame:](v4, "setFrame:");
    [(UIButton *)v4 setAutoresizingMask:18];
    [(UIButton *)v4 setHidden:1];
    v5 = self->_liveButton;
    self->_liveButton = v4;

    liveButton = self->_liveButton;
  }

  return liveButton;
}

- (void)displayWithoutBackgroundVisualEffects
{
  id v2 = [(HUClipScrubberAccessoryToggleView *)self backgroundView];
  [v2 setHidden:1];
}

- (void)setAccessoryButton:(id)a3
{
}

- (void)setLiveButton:(id)a3
{
}

- (UIView)backgroundView
{
  return self->_backgroundView;
}

- (void)setBackgroundView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_liveButton, 0);

  objc_storeStrong((id *)&self->_accessoryButton, 0);
}

@end