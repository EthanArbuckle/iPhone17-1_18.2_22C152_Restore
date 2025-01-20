@interface APSymbolBadgedAppIconView
+ (APSymbolBadgedAppIconViewMetrics)metricsForEducation;
+ (APSymbolBadgedAppIconViewMetrics)metricsForExtensionShield;
- (APSymbolBadgedAppIconView)initWithApplication:(id)a3 badgeImage:(id)a4 metrics:(APSymbolBadgedAppIconViewMetrics *)a5;
- (APSymbolBadgedAppIconView)initWithApplication:(id)a3 symbolType:(id)a4 metrics:(APSymbolBadgedAppIconViewMetrics *)a5;
- (APSymbolBadgedAppIconView)initWithApplicationIconImage:(id)a3 badgeImage:(id)a4 metrics:(APSymbolBadgedAppIconViewMetrics *)a5;
- (APSymbolBadgedAppIconView)initWithApplicationIconImage:(id)a3 symbolType:(id)a4 metrics:(APSymbolBadgedAppIconViewMetrics *)a5;
- (APSymbolBadgedAppIconView)initWithCoder:(id)a3;
- (APSymbolBadgedAppIconView)initWithFrame:(CGRect)a3;
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (void)layoutSubviews;
@end

@implementation APSymbolBadgedAppIconView

+ (APSymbolBadgedAppIconViewMetrics)metricsForEducation
{
  sub_247E0D0CC((__n128 *)retstr, (__n128)xmmword_247E1B760);
  return result;
}

+ (APSymbolBadgedAppIconViewMetrics)metricsForExtensionShield
{
  sub_247E0D0CC((__n128 *)retstr, (__n128)xmmword_247E1B770);
  return result;
}

- (APSymbolBadgedAppIconView)initWithApplicationIconImage:(id)a3 badgeImage:(id)a4 metrics:(APSymbolBadgedAppIconViewMetrics *)a5
{
  return (APSymbolBadgedAppIconView *)sub_247E0DC44((uint64_t)self, (uint64_t)a2, a3, a4, (uint64_t)a5, (uint64_t (*)(void *, void *, _OWORD *))sub_247E0D124);
}

- (APSymbolBadgedAppIconView)initWithApplication:(id)a3 badgeImage:(id)a4 metrics:(APSymbolBadgedAppIconViewMetrics *)a5
{
  return (APSymbolBadgedAppIconView *)sub_247E0DC44((uint64_t)self, (uint64_t)a2, a3, a4, (uint64_t)a5, (uint64_t (*)(void *, void *, _OWORD *))sub_247E0D498);
}

- (APSymbolBadgedAppIconView)initWithApplicationIconImage:(id)a3 symbolType:(id)a4 metrics:(APSymbolBadgedAppIconViewMetrics *)a5
{
  return (APSymbolBadgedAppIconView *)sub_247E0EC50((uint64_t)self, (uint64_t)a2, a3, (uint64_t)a4, (uint64_t)a5, (uint64_t (*)(void *, uint64_t, uint64_t, _OWORD *))sub_247E0DCB0);
}

- (APSymbolBadgedAppIconView)initWithApplication:(id)a3 symbolType:(id)a4 metrics:(APSymbolBadgedAppIconViewMetrics *)a5
{
  return (APSymbolBadgedAppIconView *)sub_247E0EC50((uint64_t)self, (uint64_t)a2, a3, (uint64_t)a4, (uint64_t)a5, (uint64_t (*)(void *, uint64_t, uint64_t, _OWORD *))sub_247E0E3E0);
}

- (APSymbolBadgedAppIconView)initWithCoder:(id)a3
{
  result = (APSymbolBadgedAppIconView *)sub_247E1A468();
  __break(1u);
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  v5 = self;
  CGSize v6 = APSymbolBadgedAppIconView.sizeThatFits(_:)((CGSize)__PAIR128__(*(unint64_t *)&height, *(unint64_t *)&width));

  double v7 = v6.width;
  double v8 = v6.height;
  result.CGFloat height = v8;
  result.CGFloat width = v7;
  return result;
}

- (CGSize)intrinsicContentSize
{
  -[APSymbolBadgedAppIconView sizeThatFits:](self, sel_sizeThatFits_, 1000.0, 1000.0);
  result.CGFloat height = v3;
  result.CGFloat width = v2;
  return result;
}

- (void)layoutSubviews
{
  double v2 = self;
  APSymbolBadgedAppIconView.layoutSubviews()();
}

- (APSymbolBadgedAppIconView)initWithFrame:(CGRect)a3
{
  CGSize result = (APSymbolBadgedAppIconView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  double v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___APSymbolBadgedAppIconView_badgeImageView);
}

@end