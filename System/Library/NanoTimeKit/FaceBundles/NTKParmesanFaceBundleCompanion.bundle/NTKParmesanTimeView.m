@interface NTKParmesanTimeView
- (BOOL)isFrozen;
- (CGRect)normalizedKeylineRect;
- (CGRect)normalizedTimeRect;
- (NTKParmesanTimeLayout)layout;
- (NTKParmesanTimeView)initWithCoder:(id)a3;
- (NTKParmesanTimeView)initWithFrame:(CGRect)a3;
- (NTKParmesanTimeView)initWithFrame:(CGRect)a3 layout:(id)a4;
- (unint64_t)complicationVisibility;
- (void)layoutSubviews;
- (void)setComplicationVisibility:(unint64_t)a3;
- (void)setFrozen:(BOOL)a3;
- (void)setOverrideDate:(id)a3 duration:(double)a4;
- (void)setTimeOffset:(double)a3;
- (void)timeFormatterTextDidChange:(id)a3;
- (void)transitionFromComplicationVisibility:(unint64_t)a3 toComplicationVisibility:(unint64_t)a4 progress:(double)a5;
- (void)updateTimeLayout:(id)a3;
@end

@implementation NTKParmesanTimeView

- (unint64_t)complicationVisibility
{
  return *(unint64_t *)((char *)&self->super.super.super.isa
                             + OBJC_IVAR___NTKParmesanTimeView_complicationVisibility);
}

- (void)setComplicationVisibility:(unint64_t)a3
{
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___NTKParmesanTimeView_complicationVisibility) = (Class)a3;
  v3 = self;
  sub_246BC5900();
}

- (NTKParmesanTimeLayout)layout
{
  return (NTKParmesanTimeLayout *)objc_retainAutoreleaseReturnValue(*(id *)(*(char **)((char *)&self->super.super.super.isa
                                                                                     + OBJC_IVAR___NTKParmesanTimeView_appearance)
                                                                          + OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion22ParmesanTimeAppearance_layout));
}

- (CGRect)normalizedTimeRect
{
  double v2 = sub_246BC4F30(self, (uint64_t)a2, (double (*)(void))sub_246BC4F00);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (CGRect)normalizedKeylineRect
{
  double v2 = sub_246BC4F30(self, (uint64_t)a2, (double (*)(void))sub_246BC4F94);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (NTKParmesanTimeView)initWithFrame:(CGRect)a3
{
}

- (NTKParmesanTimeView)initWithFrame:(CGRect)a3 layout:(id)a4
{
  return (NTKParmesanTimeView *)sub_246BC50F0(a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (NTKParmesanTimeView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_246BC6EBC();
}

- (void)layoutSubviews
{
  double v2 = self;
  sub_246BC55F4();
}

- (void)updateTimeLayout:(id)a3
{
  uint64_t v4 = *(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR___NTKParmesanTimeView_appearance);
  double v5 = *(void **)(v4 + OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion22ParmesanTimeAppearance_layout);
  *(void *)(v4 + OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion22ParmesanTimeAppearance_layout) = a3;
  id v6 = a3;
  v7 = self;

  sub_246BC5900();
}

- (void)transitionFromComplicationVisibility:(unint64_t)a3 toComplicationVisibility:(unint64_t)a4 progress:(double)a5
{
  v8 = self;
  sub_246BC5DBC(a3, a4, a5);
}

- (void)setOverrideDate:(id)a3 duration:(double)a4
{
  uint64_t v6 = sub_246B80250(&qword_2691D7030);
  MEMORY[0x270FA5388](v6 - 8);
  v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    sub_246C2BC08();
    uint64_t v9 = sub_246C2BC18();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v8, 0, 1, v9);
  }
  else
  {
    uint64_t v10 = sub_246C2BC18();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v8, 1, 1, v10);
  }
  v11 = self;
  sub_246BC6BD4((uint64_t)v8);

  sub_246B8EA34((uint64_t)v8, &qword_2691D7030);
}

- (void)setTimeOffset:(double)a3
{
}

- (BOOL)isFrozen
{
  return *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR___NTKParmesanTimeView_isFrozen);
}

- (void)setFrozen:(BOOL)a3
{
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR___NTKParmesanTimeView_isFrozen) = a3;
}

- (void).cxx_destruct
{
  sub_246B8EA34((uint64_t)self + OBJC_IVAR___NTKParmesanTimeView_overrideDate, &qword_2691D7030);
  id v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___NTKParmesanTimeView_transitioningTimeAppearance);
}

- (void)timeFormatterTextDidChange:(id)a3
{
  id v4 = a3;
  double v5 = self;
  sub_246BC656C();
}

@end