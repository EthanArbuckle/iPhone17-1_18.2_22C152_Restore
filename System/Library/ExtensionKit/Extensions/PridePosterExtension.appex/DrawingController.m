@interface DrawingController
- (_TtC20PridePosterExtension17DrawingController)init;
- (void)dealloc;
- (void)reduceMotionChanged;
- (void)renderer:(id)a3 didInitializeWithEnvironment:(id)a4;
- (void)renderer:(id)a3 didUpdateEnvironment:(id)a4 withTransition:(id)a5;
- (void)rendererDidInvalidate:(id)a3;
@end

@implementation DrawingController

- (_TtC20PridePosterExtension17DrawingController)init
{
  return (_TtC20PridePosterExtension17DrawingController *)sub_10000B920();
}

- (void)dealloc
{
  v3 = self;
  v4 = self;
  id v5 = [v3 defaultCenter];
  [v5 removeObserver:v4];

  v6.receiver = v4;
  v6.super_class = (Class)type metadata accessor for DrawingController();
  [(DrawingController *)&v6 dealloc];
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)renderer:(id)a3 didInitializeWithEnvironment:(id)a4
{
  id v6 = a3;
  swift_unknownObjectRetain();
  v7 = self;
  sub_10000BB78(v6, a4);

  swift_unknownObjectRelease();
}

- (void)renderer:(id)a3 didUpdateEnvironment:(id)a4 withTransition:(id)a5
{
  id v8 = a3;
  swift_unknownObjectRetain();
  id v9 = a5;
  v10 = self;
  sub_10000CC54(v8, a4, a5);

  swift_unknownObjectRelease();
}

- (void)rendererDidInvalidate:(id)a3
{
  swift_beginAccess();
  id v5 = a3;
  id v6 = self;
  sub_10001EE9C(v5);
  swift_endAccess();

  swift_release();
}

- (void)reduceMotionChanged
{
  v2 = self;
  sub_10000DA28();
}

@end