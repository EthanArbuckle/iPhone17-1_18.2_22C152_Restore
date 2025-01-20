@interface CAMFilterNameBadge
- (CAMFilterNameBadge)initWithFrame:(CGRect)a3;
- (int64_t)filterType;
- (void)_updateText;
- (void)setFilterType:(int64_t)a3;
@end

@implementation CAMFilterNameBadge

- (CAMFilterNameBadge)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CAMFilterNameBadge;
  v3 = -[CEKBadgeTextView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [MEMORY[0x263F825C8] whiteColor];
    [(CEKBadgeView *)v3 _setFillColor:v4];

    [(CAMFilterNameBadge *)v3 _updateText];
    v5 = v3;
  }

  return v3;
}

- (void)setFilterType:(int64_t)a3
{
  if (self->_filterType != a3)
  {
    self->_filterType = a3;
    [(CAMFilterNameBadge *)self _updateText];
  }
}

- (void)_updateText
{
  id v4 = +[CAMEffectFilterManager displayNameForType:self->_filterType];
  v3 = objc_msgSend(v4, "cam_uppercaseStringWithPreferredLocale");
  [(CEKBadgeTextView *)self _setText:v3];
}

- (int64_t)filterType
{
  return self->_filterType;
}

@end