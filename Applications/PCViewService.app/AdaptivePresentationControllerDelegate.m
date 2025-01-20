@interface AdaptivePresentationControllerDelegate
- (_TtC13PCViewService38AdaptivePresentationControllerDelegate)init;
- (void)presentationController:(id)a3 willPresentWithAdaptiveStyle:(int64_t)a4 transitionCoordinator:(id)a5;
- (void)presentationControllerDidAttemptToDismiss:(id)a3;
- (void)presentationControllerDidDismiss:(id)a3;
- (void)presentationControllerWillDismiss:(id)a3;
@end

@implementation AdaptivePresentationControllerDelegate

- (void)presentationControllerDidAttemptToDismiss:(id)a3
{
}

- (void)presentationControllerDidDismiss:(id)a3
{
}

- (void)presentationControllerWillDismiss:(id)a3
{
}

- (void)presentationController:(id)a3 willPresentWithAdaptiveStyle:(int64_t)a4 transitionCoordinator:(id)a5
{
  id v6 = a3;
  swift_unknownObjectRetain();
  v7 = self;
  PassthroughSubject.send(_:)();

  swift_unknownObjectRelease();
}

- (_TtC13PCViewService38AdaptivePresentationControllerDelegate)init
{
  uint64_t v3 = OBJC_IVAR____TtC13PCViewService38AdaptivePresentationControllerDelegate_subject;
  sub_100008614(&qword_1000F8268);
  swift_allocObject();
  v4 = self;
  *(Class *)((char *)&self->super.isa + v3) = (Class)PassthroughSubject.init()();
  *(Class *)((char *)&v4->super.isa
           + OBJC_IVAR____TtC13PCViewService38AdaptivePresentationControllerDelegate____lazy_storage___publisher) = 0;

  v6.receiver = v4;
  v6.super_class = (Class)type metadata accessor for AdaptivePresentationControllerDelegate();
  return [(AdaptivePresentationControllerDelegate *)&v6 init];
}

- (void).cxx_destruct
{
  swift_release();

  swift_release();
}

@end