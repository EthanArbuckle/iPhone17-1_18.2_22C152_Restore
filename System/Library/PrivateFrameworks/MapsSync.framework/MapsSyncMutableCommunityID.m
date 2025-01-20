@interface MapsSyncMutableCommunityID
- (BOOL)expired;
- (NSString)communityIdentifier;
- (_TtC8MapsSync26MapsSyncMutableCommunityID)initWithProxyObject:(id)a3;
- (int64_t)usedCount;
- (void)setCommunityIdentifier:(id)a3;
- (void)setExpired:(BOOL)a3;
- (void)setUsedCount:(int64_t)a3;
@end

@implementation MapsSyncMutableCommunityID

- (_TtC8MapsSync26MapsSyncMutableCommunityID)initWithProxyObject:(id)a3
{
  type metadata accessor for MapsSyncManagedCommunityID();
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8MapsSync26MapsSyncMutableCommunityID__proxyObject) = (Class)swift_dynamicCastClassUnconditional();
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8MapsSync23MapsSyncMutableBaseItem__proxyObject) = (Class)a3;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for MapsSyncMutableBaseItem();
  id v5 = a3;
  return [(MapsSyncMutableBaseItem *)&v7 init];
}

- (NSString)communityIdentifier
{
  v2 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8MapsSync26MapsSyncMutableCommunityID__proxyObject);
  v3 = self;
  id v4 = objc_msgSend(v2, sel_communityIdentifier);
  if (v4)
  {
    id v5 = v4;
    sub_1A709D438();

    v6 = (void *)sub_1A709D428();
    swift_bridgeObjectRelease();
  }
  else
  {

    v6 = 0;
  }
  return (NSString *)v6;
}

- (void)setCommunityIdentifier:(id)a3
{
  if (a3)
  {
    sub_1A709D438();
    id v4 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8MapsSync26MapsSyncMutableCommunityID__proxyObject);
    if (v5)
    {
      v6 = self;
      id v7 = v4;
      id v10 = (id)sub_1A709D428();
      swift_bridgeObjectRelease();
      id v8 = v10;
      goto LABEL_6;
    }
  }
  else
  {
    id v4 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8MapsSync26MapsSyncMutableCommunityID__proxyObject);
  }
  v9 = self;
  id v7 = v4;
  id v8 = 0;
LABEL_6:
  id v11 = v8;
  objc_msgSend(v7, sel_setCommunityIdentifier_);
}

- (BOOL)expired
{
  return objc_msgSend(*(id *)((char *)&self->super.super.isa+ OBJC_IVAR____TtC8MapsSync26MapsSyncMutableCommunityID__proxyObject), sel_expired);
}

- (void)setExpired:(BOOL)a3
{
}

- (int64_t)usedCount
{
  return (int64_t)objc_msgSend(*(id *)((char *)&self->super.super.isa+ OBJC_IVAR____TtC8MapsSync26MapsSyncMutableCommunityID__proxyObject), sel_usedCount);
}

- (void)setUsedCount:(int64_t)a3
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC8MapsSync26MapsSyncMutableCommunityID__proxyObject));
}

@end