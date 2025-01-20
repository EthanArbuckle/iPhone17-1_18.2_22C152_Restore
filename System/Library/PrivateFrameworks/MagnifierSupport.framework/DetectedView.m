@interface DetectedView
- (BOOL)accessibilityActivate;
- (_TtC16MagnifierSupport12DetectedView)initWithCoder:(id)a3;
- (_TtC16MagnifierSupport12DetectedView)initWithFrame:(CGRect)a3;
- (uint64_t)_accessibilityMediaAnalysisOptions;
- (void)accessibilityElementDidBecomeFocused;
- (void)updateTargetAnimation;
@end

@implementation DetectedView

- (_TtC16MagnifierSupport12DetectedView)initWithCoder:(id)a3
{
  return 0;
}

- (void)updateTargetAnimation
{
  v2 = self;
  sub_235861668();
}

- (BOOL)accessibilityActivate
{
  v2 = self;
  v3 = (void *)sub_235949A88();
  [(DetectedView *)v2 setAccessibilityLabel:v3];

  if (qword_26AF13B78 != -1) {
    swift_once();
  }
  swift_getKeyPath();
  swift_getKeyPath();
  sub_2359470F8();
  sub_2359484E8();

  return 1;
}

- (void)accessibilityElementDidBecomeFocused
{
  v2 = self;
  sub_235861D54();
}

- (_TtC16MagnifierSupport12DetectedView)initWithFrame:(CGRect)a3
{
  result = (_TtC16MagnifierSupport12DetectedView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport12DetectedView__positionLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport12DetectedView__dottedLineLabel));
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC16MagnifierSupport12DetectedView__targetAnimationDisplayLink);
}

- (uint64_t)_accessibilityMediaAnalysisOptions
{
  int v0 = unk_26E8BF6FC;
  if ((unk_26E8BF6FC & ~dword_26E8BF6F8) == 0) {
    int v0 = 0;
  }
  int v1 = v0 | dword_26E8BF6F8;
  int v2 = dword_26E8BF700;
  if ((dword_26E8BF700 & ~v1) == 0) {
    int v2 = 0;
  }
  int v3 = v2 | v1;
  if ((unk_26E8BF704 & ~v3) != 0) {
    int v4 = unk_26E8BF704;
  }
  else {
    int v4 = 0;
  }
  int v5 = v4 | v3;
  int v6 = dword_26E8BF708;
  if ((dword_26E8BF708 & ~v5) == 0) {
    int v6 = 0;
  }
  int v7 = v6 | v5;
  if ((unk_26E8BF70C & ~v7) != 0) {
    int v8 = unk_26E8BF70C;
  }
  else {
    int v8 = 0;
  }
  int v9 = v8 | v7;
  int v10 = dword_26E8BF710;
  if ((dword_26E8BF710 & ~v9) == 0) {
    int v10 = 0;
  }
  int v11 = v10 | v9;
  if ((unk_26E8BF714 & ~v11) != 0) {
    int v12 = unk_26E8BF714;
  }
  else {
    int v12 = 0;
  }
  int v13 = v12 | v11;
  int v14 = dword_26E8BF718;
  if ((dword_26E8BF718 & ~v13) == 0) {
    int v14 = 0;
  }
  int v15 = v14 | v13;
  if ((unk_26E8BF71C & ~v15) != 0) {
    int v16 = unk_26E8BF71C;
  }
  else {
    int v16 = 0;
  }
  int v17 = v16 | v15;
  int v18 = dword_26E8BF720;
  if ((dword_26E8BF720 & ~v17) == 0) {
    int v18 = 0;
  }
  int v19 = v18 | v17;
  if ((unk_26E8BF724 & ~v19) != 0) {
    int v20 = unk_26E8BF724;
  }
  else {
    int v20 = 0;
  }
  int v21 = v20 | v19;
  int v23 = dword_26E8BF728;
  int v22 = unk_26E8BF72C;
  if ((dword_26E8BF728 & ~v21) == 0) {
    int v23 = 0;
  }
  int v24 = v23 | v21;
  if ((unk_26E8BF72C & ~v24) == 0) {
    int v22 = 0;
  }
  return v22 | v24;
}

@end