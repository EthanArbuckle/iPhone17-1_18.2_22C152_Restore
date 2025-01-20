@interface LPContactsBadgeStyle
- (BOOL)useShadow;
- (LPContactsBadgeStyle)initWithPlatform:(int64_t)a3;
- (LPPointUnit)size;
- (double)iconOffset;
- (double)margin;
- (int64_t)location;
- (void)setIconOffset:(double)a3;
- (void)setLocation:(int64_t)a3;
- (void)setMargin:(double)a3;
- (void)setSize:(id)a3;
- (void)setUseShadow:(BOOL)a3;
@end

@implementation LPContactsBadgeStyle

- (LPContactsBadgeStyle)initWithPlatform:(int64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)LPContactsBadgeStyle;
  v3 = [(LPContactsBadgeStyle *)&v8 init];
  if (v3)
  {
    v4 = [[LPPointUnit alloc] initWithValue:24.0];
    v5 = (void *)*((void *)v3 + 2);
    *((void *)v3 + 2) = v4;

    *(_OWORD *)(v3 + 24) = xmmword_1A3711AC0;
    *((void *)v3 + 5) = 0;
    v3[8] = 1;
    v6 = v3;
  }

  return (LPContactsBadgeStyle *)v3;
}

- (LPPointUnit)size
{
  return self->_size;
}

- (void)setSize:(id)a3
{
}

- (double)margin
{
  return self->_margin;
}

- (void)setMargin:(double)a3
{
  self->_margin = a3;
}

- (double)iconOffset
{
  return self->_iconOffset;
}

- (void)setIconOffset:(double)a3
{
  self->_iconOffset = a3;
}

- (int64_t)location
{
  return self->_location;
}

- (void)setLocation:(int64_t)a3
{
  self->_location = a3;
}

- (BOOL)useShadow
{
  return self->_useShadow;
}

- (void)setUseShadow:(BOOL)a3
{
  self->_useShadow = a3;
}

- (void).cxx_destruct
{
}

@end