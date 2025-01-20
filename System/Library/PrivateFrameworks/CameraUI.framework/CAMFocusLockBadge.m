@interface CAMFocusLockBadge
- (CAMFocusLockBadge)initWithFrame:(CGRect)a3;
- (int64_t)focusLockType;
- (void)_updateText;
- (void)setFocusLockType:(int64_t)a3;
@end

@implementation CAMFocusLockBadge

- (CAMFocusLockBadge)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CAMFocusLockBadge;
  v3 = -[CEKBadgeTextView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_focusLockType = 2;
    [MEMORY[0x263F30690] _defaultTextInsets];
    -[CEKBadgeTextView _setTextInsets:](v4, "_setTextInsets:");
    [(CAMFocusLockBadge *)v4 _updateText];
    v5 = v4;
  }

  return v4;
}

- (void)_updateText
{
  unint64_t v3 = [(CAMFocusLockBadge *)self focusLockType];
  if (v3 > 3)
  {
    uint64_t v4 = 0;
  }
  else
  {
    uint64_t v4 = CAMLocalizedFrameworkString(off_263FA1CB0[v3], 0);
  }
  id v5 = (id)v4;
  [(CEKBadgeTextView *)self _setText:v4];
}

- (void)setFocusLockType:(int64_t)a3
{
  if (self->_focusLockType != a3)
  {
    self->_focusLockType = a3;
    [(CAMFocusLockBadge *)self _updateText];
  }
}

- (int64_t)focusLockType
{
  return self->_focusLockType;
}

@end