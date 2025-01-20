@interface PopoverPresentationDelegate
- (BOOL)presentationControllerShouldDismiss:(id)a3;
- (_TtC7SwiftUI27PopoverPresentationDelegate)init;
- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3 traitCollection:(id)a4;
- (void)popoverPresentationController:(id)a3 willRepositionPopoverToRect:(CGRect *)a4 inView:(id *)a5;
- (void)presentationControllerDidAttemptToDismiss:(id)a3;
@end

@implementation PopoverPresentationDelegate

- (void)popoverPresentationController:(id)a3 willRepositionPopoverToRect:(CGRect *)a4 inView:(id *)a5
{
  uint64_t v7 = OBJC_IVAR____TtC7SwiftUI27PopoverPresentationDelegate_isLayoutPreventionActive;
  char v8 = *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC7SwiftUI27PopoverPresentationDelegate_isLayoutPreventionActive);
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC7SwiftUI27PopoverPresentationDelegate_isLayoutPreventionActive) = 1;
  id v9 = a3;
  v10 = self;
  closure #1 in PopoverPresentationDelegate.popoverPresentationController(_:willRepositionPopoverTo:in:)((uint64_t)v10, a4);
  *((unsigned char *)&self->super.isa + v7) = v8;
}

- (BOOL)presentationControllerShouldDismiss:(id)a3
{
  return 1;
}

- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3 traitCollection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  char v8 = self;
  UIModalPresentationStyle v9 = PopoverPresentationDelegate.adaptivePresentationStyle(for:traitCollection:)((UIPresentationController)v6, (UITraitCollection)v7);

  return v9;
}

- (void)presentationControllerDidAttemptToDismiss:(id)a3
{
  id v4 = a3;
  v5 = self;
  specialized PopoverPresentationDelegate.presentationControllerDidAttemptToDismiss(_:)(v4);
}

- (_TtC7SwiftUI27PopoverPresentationDelegate)init
{
  result = (_TtC7SwiftUI27PopoverPresentationDelegate *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end