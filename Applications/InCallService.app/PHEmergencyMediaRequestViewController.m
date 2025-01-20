@interface PHEmergencyMediaRequestViewController
- (BOOL)_canShowWhileLocked;
- (PHEmergencyMediaRequestViewController)init;
- (PHEmergencyMediaRequestViewController)initWithCoder:(id)a3;
- (PHEmergencyMediaRequestViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)presentationControllerDidDismiss:(id)a3;
- (void)requestCancel;
- (void)requestContinue;
@end

@implementation PHEmergencyMediaRequestViewController

- (PHEmergencyMediaRequestViewController)init
{
  return (PHEmergencyMediaRequestViewController *)sub_1001D7688();
}

- (PHEmergencyMediaRequestViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1001D7D00();
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (PHEmergencyMediaRequestViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3) {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
  }
  id v5 = a4;
  sub_1001D8F60();
}

- (void).cxx_destruct
{
  sub_1001443AC((uint64_t)self + OBJC_IVAR___PHEmergencyMediaRequestViewController_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___PHEmergencyMediaRequestViewController_toolBarViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___PHEmergencyMediaRequestViewController_actionButtonsWaitingView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___PHEmergencyMediaRequestViewController_photoPickerViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___PHEmergencyMediaRequestViewController_waitingStateTitlelabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___PHEmergencyMediaRequestViewController_waitingStateSubtitlelabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___PHEmergencyMediaRequestViewController_photoImageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___PHEmergencyMediaRequestViewController_titleLabelScrollView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___PHEmergencyMediaRequestViewController_titleLabelScrollViewContentView));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR___PHEmergencyMediaRequestViewController_viewControllerWaitingStateHeightConstraint);
}

- (void)requestCancel
{
  v2 = self;
  sub_1001D90C0();
}

- (void)requestContinue
{
  v2 = self;
  sub_1001D91F4();
}

- (void)presentationControllerDidDismiss:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_1001D932C();
}

@end