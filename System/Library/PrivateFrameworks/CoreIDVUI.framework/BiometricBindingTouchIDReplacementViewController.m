@interface BiometricBindingTouchIDReplacementViewController
- (_TtC9CoreIDVUI48BiometricBindingTouchIDReplacementViewController)initWithCoder:(id)a3;
- (void)event:(int64_t)a3 params:(id)a4 reply:(id)a5;
- (void)loadView;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation BiometricBindingTouchIDReplacementViewController

- (void)loadView
{
  v2 = self;
  sub_21F498E34();
}

- (void)viewDidAppear:(BOOL)a3
{
  v4 = self;
  sub_21F499058(a3);
}

- (void)event:(int64_t)a3 params:(id)a4 reply:(id)a5
{
  v8 = (void (*)(unint64_t, void))_Block_copy(a5);
  if (a4) {
    a4 = (id)sub_21F5514F0();
  }
  if (v8)
  {
    *(void *)(swift_allocObject() + 16) = v8;
    v8 = (void (*)(unint64_t, void))sub_21F49B280;
  }
  v9 = self;
  sub_21F49A730(a3, (uint64_t)a4, v8);
  sub_21F47D8F8((uint64_t)v8);

  swift_bridgeObjectRelease();
}

- (_TtC9CoreIDVUI48BiometricBindingTouchIDReplacementViewController)initWithCoder:(id)a3
{
  *((unsigned char *)&self->super.super.super.super.isa
  + OBJC_IVAR____TtC9CoreIDVUI48BiometricBindingTouchIDReplacementViewController_hasObtainedTouchIDMatch) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC9CoreIDVUI48BiometricBindingTouchIDReplacementViewController____lazy_storage___glyph) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC9CoreIDVUI48BiometricBindingTouchIDReplacementViewController____lazy_storage___glyphContainerView) = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for BiometricBindingTouchIDReplacementViewController();
  return [(BiometricBindingReplacementViewController *)&v5 initWithCoder:a3];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9CoreIDVUI48BiometricBindingTouchIDReplacementViewController____lazy_storage___glyph));
  v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC9CoreIDVUI48BiometricBindingTouchIDReplacementViewController____lazy_storage___glyphContainerView);
}

@end