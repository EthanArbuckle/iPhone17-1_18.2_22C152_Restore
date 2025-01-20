@interface MUPlaceHeaderButton
- (BOOL)isPrimary;
- (MUPlaceHeaderButton)initWithFrame:(CGRect)a3;
- (void)setPrimary:(BOOL)a3;
@end

@implementation MUPlaceHeaderButton

- (MUPlaceHeaderButton)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MUPlaceHeaderButton;
  v3 = -[MUPlaceHeaderButton initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(MUPlaceHeaderButton *)v3 setPreferredMenuElementOrder:2];
  }
  return v4;
}

- (BOOL)isPrimary
{
  return self->_primary;
}

- (void)setPrimary:(BOOL)a3
{
  self->_primary = a3;
}

@end