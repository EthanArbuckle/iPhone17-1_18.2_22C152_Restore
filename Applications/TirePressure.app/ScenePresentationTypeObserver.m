@interface ScenePresentationTypeObserver
- (_TtC12TirePressure29ScenePresentationTypeObserver)init;
- (void)scene:(id)a3 didUpdateSettings:(id)a4;
@end

@implementation ScenePresentationTypeObserver

- (void)scene:(id)a3 didUpdateSettings:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_1000115DC(v6);
}

- (_TtC12TirePressure29ScenePresentationTypeObserver)init
{
  uint64_t v3 = sub_1000057C4(&qword_10001E358);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  id v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v7 = (char *)self + OBJC_IVAR____TtC12TirePressure29ScenePresentationTypeObserver__presentationType;
  uint64_t v13 = 0;
  type metadata accessor for CRSUIHostedAltScreenPresentationType(0);
  v8 = self;
  Published.init(initialValue:)();
  (*(void (**)(char *, char *, uint64_t))(v4 + 32))(v7, v6, v3);

  v9 = (objc_class *)type metadata accessor for ScenePresentationTypeObserver();
  v12.receiver = v8;
  v12.super_class = v9;
  return [(ScenePresentationTypeObserver *)&v12 init];
}

- (void).cxx_destruct
{
  v2 = (char *)self + OBJC_IVAR____TtC12TirePressure29ScenePresentationTypeObserver__presentationType;
  uint64_t v3 = sub_1000057C4(&qword_10001E358);
  uint64_t v4 = *(void (**)(char *, uint64_t))(*(void *)(v3 - 8) + 8);

  v4(v2, v3);
}

@end