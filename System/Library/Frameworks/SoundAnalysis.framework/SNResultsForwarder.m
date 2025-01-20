@interface SNResultsForwarder
- (_TtC13SoundAnalysis18SNResultsForwarder)init;
- (void)request:(id)a3 didFailWithError:(id)a4;
- (void)request:(id)a3 didProduceResult:(id)a4;
- (void)requestDidComplete:(id)a3;
@end

@implementation SNResultsForwarder

- (void)request:(id)a3 didProduceResult:(id)a4
{
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  v5 = self;
  sub_1DC9EA2D0();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
}

- (void)request:(id)a3 didFailWithError:(id)a4
{
  swift_unknownObjectRetain();
  id v7 = a4;
  v6 = self;
  sub_1DC9EA38C();
  swift_unknownObjectRelease();
}

- (void)requestDidComplete:(id)a3
{
  swift_unknownObjectRetain();
  v5 = self;
  sub_1DC9EA43C((uint64_t)a3);
  swift_unknownObjectRelease();
}

- (_TtC13SoundAnalysis18SNResultsForwarder)init
{
}

- (void).cxx_destruct
{
  swift_release();

  swift_release();
}

@end