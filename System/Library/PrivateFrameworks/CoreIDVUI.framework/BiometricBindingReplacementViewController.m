@interface BiometricBindingReplacementViewController
- (_TtC9CoreIDVUI41BiometricBindingReplacementViewController)initWithCoder:(id)a3;
- (_TtC9CoreIDVUI41BiometricBindingReplacementViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)cancelBarButtonClicked;
- (void)loadView;
- (void)performBinding;
@end

@implementation BiometricBindingReplacementViewController

- (_TtC9CoreIDVUI41BiometricBindingReplacementViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_21F54E1C8();
}

- (void)loadView
{
  v2 = self;
  sub_21F54CD90();
}

- (void)performBinding
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EE0070);
  MEMORY[0x270FA5388](v3 - 8);
  v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_21F551710();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 1, 1, v6);
  sub_21F5516F0();
  v7 = self;
  uint64_t v8 = sub_21F5516E0();
  v9 = (void *)swift_allocObject();
  uint64_t v10 = MEMORY[0x263F8F500];
  v9[2] = v8;
  v9[3] = v10;
  v9[4] = v7;
  sub_21F47D908((uint64_t)v5, (uint64_t)&unk_267EDEEA8, (uint64_t)v9);
  swift_release();
}

- (void)cancelBarButtonClicked
{
  v2 = self;
  sub_21F54CCA4();
}

- (_TtC9CoreIDVUI41BiometricBindingReplacementViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC9CoreIDVUI41BiometricBindingReplacementViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9CoreIDVUI41BiometricBindingReplacementViewController_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9CoreIDVUI41BiometricBindingReplacementViewController_textLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9CoreIDVUI41BiometricBindingReplacementViewController_primaryButton));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9CoreIDVUI41BiometricBindingReplacementViewController_context));
  sub_21F47F030((uint64_t)self + OBJC_IVAR____TtC9CoreIDVUI41BiometricBindingReplacementViewController_delegate, &qword_267EDEEA0);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9CoreIDVUI41BiometricBindingReplacementViewController____lazy_storage___cancelButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9CoreIDVUI41BiometricBindingReplacementViewController____lazy_storage___activityIndicator));
  uint64_t v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC9CoreIDVUI41BiometricBindingReplacementViewController____lazy_storage___activityIndicatorBarButtonItem);
}

@end