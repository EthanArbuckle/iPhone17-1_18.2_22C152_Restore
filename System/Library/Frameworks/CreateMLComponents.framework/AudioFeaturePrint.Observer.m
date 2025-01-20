@interface AudioFeaturePrint.Observer
- (_TtCV18CreateMLComponents17AudioFeaturePrint8Observer)init;
- (void)request:(id)a3 didFailWithError:(id)a4;
- (void)request:(id)a3 didProduceResult:(id)a4;
- (void)requestDidComplete:(id)a3;
@end

@implementation AudioFeaturePrint.Observer

- (void)request:(id)a3 didProduceResult:(id)a4
{
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  v6 = self;
  sub_239402634((uint64_t)a3);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
}

- (void)request:(id)a3 didFailWithError:(id)a4
{
  swift_unknownObjectRetain();
  id v8 = a4;
  v7 = self;
  sub_239402B00((uint64_t)a3, v8);
  swift_unknownObjectRelease();
}

- (void)requestDidComplete:(id)a3
{
  swift_unknownObjectRetain();
  v5 = self;
  sub_239402CFC((uint64_t)a3);
  swift_unknownObjectRelease();
}

- (_TtCV18CreateMLComponents17AudioFeaturePrint8Observer)init
{
  return (_TtCV18CreateMLComponents17AudioFeaturePrint8Observer *)sub_239402EE8();
}

- (void).cxx_destruct
{
}

@end