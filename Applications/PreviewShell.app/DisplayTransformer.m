@interface DisplayTransformer
- (_TtC12PreviewShell18DisplayTransformer)init;
- (id)transformDisplayConfiguration:(id)a3;
@end

@implementation DisplayTransformer

- (_TtC12PreviewShell18DisplayTransformer)init
{
  return (_TtC12PreviewShell18DisplayTransformer *)sub_10000FF18();
}

- (id)transformDisplayConfiguration:(id)a3
{
  sub_10000758C(&qword_10006F448);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_100050140;
  *(void *)(inited + 32) = a3;
  unint64_t v8 = inited;
  specialized Array._endMutation()();
  id v5 = a3;
  sub_100010ED0(v8);
  swift_bridgeObjectRelease();
  sub_100011014();
  sub_100011054();
  v6.super.isa = Set._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return v6.super.isa;
}

@end