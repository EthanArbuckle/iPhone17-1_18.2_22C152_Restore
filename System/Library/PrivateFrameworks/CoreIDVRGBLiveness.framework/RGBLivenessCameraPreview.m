@interface RGBLivenessCameraPreview
+ (Class)layerClass;
- (_TtC18CoreIDVRGBLiveness24RGBLivenessCameraPreview)initWithCoder:(id)a3;
- (_TtC18CoreIDVRGBLiveness24RGBLivenessCameraPreview)initWithFrame:(CGRect)a3;
- (void)dealloc;
- (void)didMoveToWindow;
- (void)layoutSubviews;
@end

@implementation RGBLivenessCameraPreview

- (void)dealloc
{
  ObjectType = (objc_class *)swift_getObjectType();
  if (*(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC18CoreIDVRGBLiveness24RGBLivenessCameraPreview_flashAnimationTask))
  {
    v4 = self;
    swift_retain();
    sub_21EE9AFC8();
    swift_release();
  }
  else
  {
    v5 = self;
  }
  v6.receiver = self;
  v6.super_class = ObjectType;
  [(RGBLivenessCameraPreview *)&v6 dealloc];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18CoreIDVRGBLiveness24RGBLivenessCameraPreview_sessionManager));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18CoreIDVRGBLiveness24RGBLivenessCameraPreview____lazy_storage___previewLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18CoreIDVRGBLiveness24RGBLivenessCameraPreview____lazy_storage___objectLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18CoreIDVRGBLiveness24RGBLivenessCameraPreview____lazy_storage___debugLayer));
  sub_21EE2E5E0(*(id *)((char *)&self->super.super.super.isa
                      + OBJC_IVAR____TtC18CoreIDVRGBLiveness24RGBLivenessCameraPreview____lazy_storage___rotationCoordinator));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18CoreIDVRGBLiveness24RGBLivenessCameraPreview____lazy_storage___regionOfInterestLayer));

  swift_release();
}

- (void)didMoveToWindow
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  id v2 = v3.receiver;
  [(RGBLivenessCameraPreview *)&v3 didMoveToWindow];
  sub_21EE2B8A0();
  sub_21EE2BDA8();
}

- (void)layoutSubviews
{
  v6.receiver = self;
  v6.super_class = (Class)swift_getObjectType();
  id v2 = v6.receiver;
  [(RGBLivenessCameraPreview *)&v6 layoutSubviews];
  sub_21EE2B8A0();
  sub_21EE2BDA8();
  sub_21EDFBBC8(0, (unint64_t *)&qword_267EA9520);
  uint64_t v3 = sub_21EE9A718();
  char v4 = MEMORY[0x223C3C140](v3);
  swift_bridgeObjectRelease();
  if ((v4 & 1) == 0)
  {
    id v5 = objc_msgSend(v2, sel_layer, v6.receiver, v6.super_class);
    objc_msgSend(v5, sel_setDisableUpdateMask_, 18);

    id v2 = v5;
  }
}

+ (Class)layerClass
{
  sub_21EDFBBC8(0, &qword_267EA8F18);

  return (Class)swift_getObjCClassFromMetadata();
}

- (_TtC18CoreIDVRGBLiveness24RGBLivenessCameraPreview)initWithFrame:(CGRect)a3
{
  return (_TtC18CoreIDVRGBLiveness24RGBLivenessCameraPreview *)sub_21EE2D870(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC18CoreIDVRGBLiveness24RGBLivenessCameraPreview)initWithCoder:(id)a3
{
  return (_TtC18CoreIDVRGBLiveness24RGBLivenessCameraPreview *)sub_21EE2D9A8(a3);
}

@end