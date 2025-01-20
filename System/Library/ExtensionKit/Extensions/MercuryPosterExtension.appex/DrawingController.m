@interface DrawingController
- (_TtC22MercuryPosterExtension17DrawingController)init;
- (void)renderer:(id)a3 didInitializeWithEnvironment:(id)a4;
- (void)renderer:(id)a3 didReceiveTapAtPoint:(CGPoint)a4;
- (void)renderer:(id)a3 didUpdateEnvironment:(id)a4 withTransition:(id)a5;
- (void)rendererDidInvalidate:(id)a3;
@end

@implementation DrawingController

- (void)renderer:(id)a3 didInitializeWithEnvironment:(id)a4
{
  id v6 = a3;
  swift_unknownObjectRetain();
  v7 = self;
  sub_10002F7F0(v6, a4);

  swift_unknownObjectRelease();
}

- (void)renderer:(id)a3 didUpdateEnvironment:(id)a4 withTransition:(id)a5
{
  id v8 = a3;
  swift_unknownObjectRetain();
  id v9 = a5;
  v10 = self;
  sub_100030768(v8, a4, a5);

  swift_unknownObjectRelease();
}

- (void)rendererDidInvalidate:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100031030(v4);
}

- (void)renderer:(id)a3 didReceiveTapAtPoint:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  id v7 = a3;
  id v8 = self;
  sub_1000312B8(v7, x, y);
}

- (_TtC22MercuryPosterExtension17DrawingController)init
{
  uint64_t v3 = OBJC_IVAR____TtC22MercuryPosterExtension17DrawingController_rendererCoordinators;
  id v4 = self;
  *(Class *)((char *)&self->super.isa + v3) = (Class)sub_10000A9E0((uint64_t)_swiftEmptyArrayStorage);
  uint64_t v5 = OBJC_IVAR____TtC22MercuryPosterExtension17DrawingController_transitionSessions;
  *(Class *)((char *)&v4->super.isa + v5) = (Class)sub_10000AAEC((uint64_t)_swiftEmptyArrayStorage);

  v7.receiver = v4;
  v7.super_class = (Class)type metadata accessor for DrawingController();
  return [(DrawingController *)&v7 init];
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end