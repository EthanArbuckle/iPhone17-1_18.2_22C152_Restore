@interface AudioSettingsView
- (CGSize)intrinsicContentSize;
- (_TtC34AudioConferenceControlCenterModule17AudioSettingsView)initWithCoder:(id)a3;
- (_TtC34AudioConferenceControlCenterModule17AudioSettingsView)initWithFrame:(CGRect)a3;
@end

@implementation AudioSettingsView

- (CGSize)intrinsicContentSize
{
  v2 = *(double (**)(void))((char *)&stru_20.maxprot + (swift_isaMask & (uint64_t)self->super.super.super.isa));
  v3 = self;
  double v4 = v2();
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (_TtC34AudioConferenceControlCenterModule17AudioSettingsView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  *(CGSize *)((char *)&self->super.super.super.isa
            + OBJC_IVAR____TtC34AudioConferenceControlCenterModule17AudioSettingsView_controlSize) = CGSizeZero;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for AudioSettingsView();
  return -[AudioSettingsView initWithFrame:](&v8, "initWithFrame:", x, y, width, height);
}

- (_TtC34AudioConferenceControlCenterModule17AudioSettingsView)initWithCoder:(id)a3
{
  *(CGSize *)((char *)&self->super.super.super.isa
            + OBJC_IVAR____TtC34AudioConferenceControlCenterModule17AudioSettingsView_controlSize) = CGSizeZero;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for AudioSettingsView();
  return [(AudioSettingsView *)&v5 initWithCoder:a3];
}

@end