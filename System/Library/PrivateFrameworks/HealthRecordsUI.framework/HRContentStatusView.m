@interface HRContentStatusView
- (HRContentStatusView)initWithCoder:(id)a3;
- (HRContentStatusView)initWithFrame:(CGRect)a3;
- (HRContentStatusView)initWithTitle:(id)a3 subtitle:(id)a4;
- (NSString)subtitle;
- (NSString)title;
- (void)layoutSubviews;
- (void)setSubtitle:(id)a3;
- (void)setTitle:(id)a3;
- (void)startAnimating;
- (void)stopAnimating;
- (void)traitCollectionDidChangeWithTraitEnvironment:(id)a3 previousTraitCollection:(id)a4;
@end

@implementation HRContentStatusView

- (NSString)title
{
  return (NSString *)sub_1C2376514((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___HRContentStatusView_title);
}

- (void)setTitle:(id)a3
{
}

- (NSString)subtitle
{
  return (NSString *)sub_1C2376514((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___HRContentStatusView_subtitle);
}

- (void)setSubtitle:(id)a3
{
}

- (HRContentStatusView)initWithTitle:(id)a3 subtitle:(id)a4
{
  if (!a3)
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
    if (a4) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v8 = 0;
    uint64_t v10 = 0;
    return (HRContentStatusView *)ContentStatusView.init(title:subtitle:)(v5, v7, v8, v10);
  }
  uint64_t v5 = sub_1C254F470();
  uint64_t v7 = v6;
  if (!a4) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v8 = sub_1C254F470();
  uint64_t v10 = v9;
  return (HRContentStatusView *)ContentStatusView.init(title:subtitle:)(v5, v7, v8, v10);
}

- (HRContentStatusView)initWithCoder:(id)a3
{
  return (HRContentStatusView *)ContentStatusView.init(coder:)(a3);
}

- (HRContentStatusView)initWithFrame:(CGRect)a3
{
  return (HRContentStatusView *)ContentStatusView.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)startAnimating
{
}

- (void)stopAnimating
{
}

- (void)traitCollectionDidChangeWithTraitEnvironment:(id)a3 previousTraitCollection:(id)a4
{
  swift_unknownObjectRetain();
  id v6 = a4;
  uint64_t v7 = self;
  sub_1C241508C(a4);
  swift_unknownObjectRelease();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1C2414974();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end