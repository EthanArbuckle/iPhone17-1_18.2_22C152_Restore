@interface SelfiePreview
- (_TtC18CoreIDVRGBLiveness13SelfiePreview)init;
- (_TtC18CoreIDVRGBLiveness13SelfiePreview)initWithCoder:(id)a3;
- (_TtC18CoreIDVRGBLiveness13SelfiePreview)initWithFrame:(CGRect)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
@end

@implementation SelfiePreview

- (_TtC18CoreIDVRGBLiveness13SelfiePreview)init
{
  return (_TtC18CoreIDVRGBLiveness13SelfiePreview *)sub_21EE3AB2C();
}

- (_TtC18CoreIDVRGBLiveness13SelfiePreview)initWithCoder:(id)a3
{
  id v3 = a3;
  return (_TtC18CoreIDVRGBLiveness13SelfiePreview *)sub_21EE3BE10();
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v5 = a4;
  v6 = self;
  sub_21EE3BFFC();
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  id v5 = a4;
  v6 = self;
  sub_21EE3C108();
}

- (_TtC18CoreIDVRGBLiveness13SelfiePreview)initWithFrame:(CGRect)a3
{
  result = (_TtC18CoreIDVRGBLiveness13SelfiePreview *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18CoreIDVRGBLiveness13SelfiePreview_playerViewController));
  sub_21EE227B0((uint64_t)self + OBJC_IVAR____TtC18CoreIDVRGBLiveness13SelfiePreview_delegate);

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18CoreIDVRGBLiveness13SelfiePreview_selfieView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18CoreIDVRGBLiveness13SelfiePreview_livePhotoIconContainer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18CoreIDVRGBLiveness13SelfiePreview_livePhotoSymbol));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18CoreIDVRGBLiveness13SelfiePreview_livePhotoText));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18CoreIDVRGBLiveness13SelfiePreview_livePhotoIconTopConstraint));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC18CoreIDVRGBLiveness13SelfiePreview_livePhotoIconLeadingConstraint);
}

@end