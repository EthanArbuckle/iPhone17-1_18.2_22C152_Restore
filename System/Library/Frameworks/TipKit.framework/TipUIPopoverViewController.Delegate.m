@interface TipUIPopoverViewController.Delegate
- (BOOL)presentationControllerShouldDismiss:(id)a3;
- (UIPopoverPresentationControllerDelegate)clientDelegate;
- (_TtCC6TipKit26TipUIPopoverViewController8Delegate)init;
- (id)presentationController:(id)a3 viewControllerForAdaptivePresentationStyle:(int64_t)a4;
- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3;
- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3 traitCollection:(id)a4;
- (void)popoverPresentationController:(id)a3 willRepositionPopoverToRect:(CGRect *)a4 inView:(id *)a5;
- (void)prepareForPopoverPresentation:(id)a3;
- (void)presentationController:(id)a3 prepareAdaptivePresentationController:(id)a4;
- (void)presentationController:(id)a3 willPresentWithAdaptiveStyle:(int64_t)a4 transitionCoordinator:(id)a5;
- (void)presentationControllerDidAttemptToDismiss:(id)a3;
- (void)presentationControllerDidDismiss:(id)a3;
- (void)presentationControllerWillDismiss:(id)a3;
- (void)setClientDelegate:(id)a3;
@end

@implementation TipUIPopoverViewController.Delegate

- (UIPopoverPresentationControllerDelegate)clientDelegate
{
  return (UIPopoverPresentationControllerDelegate *)sub_24637DC70((uint64_t)self, (uint64_t)a2, 228, sub_24637DD10);
}

- (void)setClientDelegate:(id)a3
{
  sub_2463870F0();
  sub_2463870E0();
  sub_2463870D0();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_unknownObjectRetain();
  v4 = self;
  sub_24637DE64();
  swift_release();
}

- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3
{
  sub_2463870F0();
  sub_2463870E0();
  sub_2463870D0();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v5 = a3;
  v6 = self;
  sub_24637DF00();
  swift_release();

  return -1;
}

- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3 traitCollection:(id)a4
{
  sub_2463870F0();
  sub_2463870E0();
  sub_2463870D0();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v7 = a3;
  id v8 = a4;
  v9 = self;
  sub_24637E038();
  swift_release();

  return -1;
}

- (void)presentationController:(id)a3 prepareAdaptivePresentationController:(id)a4
{
  sub_2463870F0();
  sub_2463870E0();
  sub_2463870D0();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v7 = a3;
  id v8 = a4;
  v9 = self;
  sub_24637E180((uint64_t)v7, (uint64_t)v8);
  swift_release();
}

- (id)presentationController:(id)a3 viewControllerForAdaptivePresentationStyle:(int64_t)a4
{
  sub_2463870F0();
  sub_2463870E0();
  sub_2463870D0();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v7 = a3;
  id v8 = self;
  id v9 = sub_24637E370((uint64_t)v7, a4);
  swift_release();

  return v9;
}

- (void)presentationController:(id)a3 willPresentWithAdaptiveStyle:(int64_t)a4 transitionCoordinator:(id)a5
{
  sub_2463870F0();
  sub_2463870E0();
  sub_2463870D0();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v7 = a3;
  swift_unknownObjectRetain();
  id v8 = self;
  sub_24637E54C();
  swift_release();

  swift_unknownObjectRelease();
}

- (BOOL)presentationControllerShouldDismiss:(id)a3
{
  sub_2463870F0();
  sub_2463870E0();
  sub_2463870D0();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v5 = a3;
  v6 = self;
  char v7 = sub_24637E748();
  swift_release();

  return v7 & 1;
}

- (void)presentationControllerDidAttemptToDismiss:(id)a3
{
}

- (void)presentationControllerWillDismiss:(id)a3
{
}

- (void)presentationControllerDidDismiss:(id)a3
{
}

- (void)prepareForPopoverPresentation:(id)a3
{
}

- (void)popoverPresentationController:(id)a3 willRepositionPopoverToRect:(CGRect *)a4 inView:(id *)a5
{
  sub_2463870F0();
  sub_2463870E0();
  sub_2463870D0();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v7 = a3;
  id v8 = self;
  sub_24637EB4C();
  swift_release();
}

- (_TtCC6TipKit26TipUIPopoverViewController8Delegate)init
{
  sub_2463870F0();
  sub_2463870E0();
  sub_2463870D0();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  v2 = (_TtCC6TipKit26TipUIPopoverViewController8Delegate *)sub_24637ED38();
  swift_release();
  return v2;
}

- (void).cxx_destruct
{
}

@end