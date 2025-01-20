@interface PresentationPublisher
- (_TtC10Blackbeard21PresentationPublisher)init;
- (void)presentationController:(id)a3 willPresentWithAdaptiveStyle:(int64_t)a4 transitionCoordinator:(id)a5;
- (void)presentationControllerDidDismiss:(id)a3;
@end

@implementation PresentationPublisher

- (void)presentationController:(id)a3 willPresentWithAdaptiveStyle:(int64_t)a4 transitionCoordinator:(id)a5
{
  if (a4 == -1)
  {
    id v10 = a3;
    if (a5)
    {
      swift_unknownObjectRetain();
      v11 = self;
      int64_t v7 = (int64_t)objc_msgSend(a5, sel_presentationStyle);
    }
    else
    {
      v12 = self;
      int64_t v7 = -1;
    }
  }
  else
  {
    int64_t v7 = a4;
    id v8 = a3;
    swift_unknownObjectRetain();
    v9 = self;
  }
  (*(void (**)(void))((char *)&self->super.isa
                                 + OBJC_IVAR____TtC10Blackbeard21PresentationPublisher_publishPresentationAction))(((v7 & 0xFFFFFFFFFFFFFFF7) == 0) | 0x100u);

  swift_unknownObjectRelease();
}

- (void)presentationControllerDidDismiss:(id)a3
{
  v4 = *(void (**)(uint64_t))((char *)&self->super.isa
                                      + OBJC_IVAR____TtC10Blackbeard21PresentationPublisher_publishPresentationAction);
  id v5 = a3;
  v6 = self;
  v4(32769);
}

- (_TtC10Blackbeard21PresentationPublisher)init
{
  result = (_TtC10Blackbeard21PresentationPublisher *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end