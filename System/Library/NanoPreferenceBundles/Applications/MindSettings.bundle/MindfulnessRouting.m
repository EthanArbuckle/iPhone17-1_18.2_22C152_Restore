@interface MindfulnessRouting
+ (id)HPRFMindfulnessRoutingStateOfMindOptionsRoute;
- (_TtC12MindSettings18MindfulnessRouting)init;
@end

@implementation MindfulnessRouting

+ (id)HPRFMindfulnessRoutingStateOfMindOptionsRoute
{
  uint64_t v2 = sub_C148(&qword_1A0F8);
  __chkstk_darwin(v2 - 8);
  v4 = (char *)&v20 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_C148(&qword_1A100);
  __chkstk_darwin(v5 - 8);
  v7 = (char *)&v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_E080();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = enum case for Route.options(_:);
  uint64_t v13 = sub_E280();
  uint64_t v14 = *(void *)(v13 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v14 + 104))(v7, v12, v13);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v14 + 56))(v7, 0, 1, v13);
  uint64_t v15 = sub_E270();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v4, 1, 1, v15);
  sub_E060();
  sub_C1D8((uint64_t)v4, &qword_1A0F8);
  sub_C1D8((uint64_t)v7, &qword_1A100);
  sub_E070(v16);
  v18 = v17;
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);

  return v18;
}

- (_TtC12MindSettings18MindfulnessRouting)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for MindfulnessRouting();
  return [(MindfulnessRouting *)&v3 init];
}

@end