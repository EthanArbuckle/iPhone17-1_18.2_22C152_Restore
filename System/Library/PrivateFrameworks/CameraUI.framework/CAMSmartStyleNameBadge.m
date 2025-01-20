@interface CAMSmartStyleNameBadge
- (CAMSmartStyleNameBadge)initWithFrame:(CGRect)a3;
- (CEKSmartStyle)smartStyle;
- (void)_updateText;
- (void)setSmartStyle:(id)a3;
@end

@implementation CAMSmartStyleNameBadge

- (CAMSmartStyleNameBadge)initWithFrame:(CGRect)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CAMSmartStyleNameBadge;
  v3 = -[CEKBadgeTextView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [MEMORY[0x263F825C8] colorWithWhite:0.0 alpha:0.6];
    [(CEKBadgeView *)v3 _setFillColor:v4];

    v5 = [MEMORY[0x263F825C8] whiteColor];
    [(CEKBadgeView *)v3 _setContentColor:v5];

    [(CAMSmartStyleNameBadge *)v3 _updateText];
    v6 = v3;
  }

  return v3;
}

- (void)setSmartStyle:(id)a3
{
  id v5 = a3;
  uint64_t smartStyle = (uint64_t)self->_smartStyle;
  if ((id)smartStyle != v5)
  {
    id v7 = v5;
    uint64_t smartStyle = [(id)smartStyle isEqualToSmartStyle:v5];
    id v5 = v7;
    if ((smartStyle & 1) == 0)
    {
      objc_storeStrong((id *)&self->_smartStyle, a3);
      uint64_t smartStyle = [(CAMSmartStyleNameBadge *)self _updateText];
      id v5 = v7;
    }
  }
  MEMORY[0x270F9A758](smartStyle, v5);
}

- (void)_updateText
{
  v3 = [(CAMSmartStyleNameBadge *)self smartStyle];
  id v6 = [v3 presetDisplayName];

  v4 = CAMPreferredLocale();
  id v5 = [v6 uppercaseStringWithLocale:v4];

  [(CEKBadgeTextView *)self _setText:v5];
}

- (CEKSmartStyle)smartStyle
{
  return self->_smartStyle;
}

- (void).cxx_destruct
{
}

@end