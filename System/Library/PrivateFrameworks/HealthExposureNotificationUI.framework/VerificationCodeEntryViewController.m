@interface VerificationCodeEntryViewController
- (_TtC28HealthExposureNotificationUI35VerificationCodeEntryViewController)initWithCoder:(id)a3;
- (_TtC28HealthExposureNotificationUI35VerificationCodeEntryViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)dealloc;
- (void)didTapCancel;
- (void)didTapHelpButton;
- (void)keyboardWillChangeFrame:(id)a3;
- (void)viewDidLoad;
- (void)viewSafeAreaInsetsDidChange;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation VerificationCodeEntryViewController

- (_TtC28HealthExposureNotificationUI35VerificationCodeEntryViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_2293E9204();
}

- (void)dealloc
{
  ObjectType = (objc_class *)swift_getObjectType();
  v4 = self;
  v5 = self;
  id v6 = objc_msgSend(v4, sel_defaultCenter);
  objc_msgSend(v6, sel_removeObserver_, v5);

  v7.receiver = v5;
  v7.super_class = ObjectType;
  [(VerificationCodeEntryViewController *)&v7 dealloc];
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC28HealthExposureNotificationUI35VerificationCodeEntryViewController_healthAgencyModel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC28HealthExposureNotificationUI35VerificationCodeEntryViewController_statusView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC28HealthExposureNotificationUI35VerificationCodeEntryViewController_scrollView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC28HealthExposureNotificationUI35VerificationCodeEntryViewController_entryView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC28HealthExposureNotificationUI35VerificationCodeEntryViewController_contentLayoutGuideBottomConstraint));
  id v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC28HealthExposureNotificationUI35VerificationCodeEntryViewController_itemStackTopConstraint);
}

- (void)viewDidLoad
{
  v2 = self;
  VerificationCodeEntryViewController.viewDidLoad()();
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)swift_getObjectType();
  v4 = (char *)v6.receiver;
  [(VerificationCodeEntryViewController *)&v6 viewWillAppear:v3];
  v5 = *(void **)&v4[OBJC_IVAR____TtC28HealthExposureNotificationUI35VerificationCodeEntryViewController_entryView];
  if (v5) {
    objc_msgSend(v5, sel_becomeFirstResponder, v6.receiver, v6.super_class);
  }
}

- (void)viewSafeAreaInsetsDidChange
{
  v2 = self;
  VerificationCodeEntryViewController.viewSafeAreaInsetsDidChange()();
}

- (void)keyboardWillChangeFrame:(id)a3
{
  uint64_t v4 = sub_229418CC8();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  objc_super v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_229418CA8();
  v8 = self;
  sub_2293E56BC();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void)didTapHelpButton
{
  v2 = self;
  sub_2293E5A00();
}

- (void)didTapCancel
{
  v2 = self;
  sub_2293A8A78(v2);
}

- (_TtC28HealthExposureNotificationUI35VerificationCodeEntryViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC28HealthExposureNotificationUI35VerificationCodeEntryViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end