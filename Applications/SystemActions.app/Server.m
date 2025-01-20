@interface Server
- (_TtC13SystemActions6Server)init;
- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5;
@end

@implementation Server

- (_TtC13SystemActions6Server)init
{
  return (_TtC13SystemActions6Server *)sub_100005608();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  swift_unknownObjectRetain();
  v9 = self;
  sub_100005AD8((uint64_t)v9, v8);

  swift_unknownObjectRelease();
}

@end