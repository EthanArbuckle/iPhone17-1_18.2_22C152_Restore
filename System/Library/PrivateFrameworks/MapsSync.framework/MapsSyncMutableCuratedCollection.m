@interface MapsSyncMutableCuratedCollection
- (_TtC8MapsSync32MapsSyncMutableCuratedCollection)initWithProxyObject:(id)a3;
- (int)resultProviderIdentifier;
- (unint64_t)curatedCollectionIdentifier;
- (void)setCuratedCollectionIdentifier:(unint64_t)a3;
- (void)setResultProviderIdentifier:(int)a3;
@end

@implementation MapsSyncMutableCuratedCollection

- (_TtC8MapsSync32MapsSyncMutableCuratedCollection)initWithProxyObject:(id)a3
{
  type metadata accessor for MapsSyncManagedCuratedCollection();
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8MapsSync32MapsSyncMutableCuratedCollection__proxy) = (Class)swift_dynamicCastClassUnconditional();
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8MapsSync23MapsSyncMutableBaseItem__proxyObject) = (Class)a3;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for MapsSyncMutableBaseItem();
  id v5 = a3;
  return [(MapsSyncMutableBaseItem *)&v7 init];
}

- (unint64_t)curatedCollectionIdentifier
{
  return (unint64_t)objc_msgSend(*(id *)((char *)&self->super.super.isa+ OBJC_IVAR____TtC8MapsSync32MapsSyncMutableCuratedCollection__proxy), sel_curatedCollectionIdentifier);
}

- (void)setCuratedCollectionIdentifier:(unint64_t)a3
{
}

- (int)resultProviderIdentifier
{
  return objc_msgSend(*(id *)((char *)&self->super.super.isa+ OBJC_IVAR____TtC8MapsSync32MapsSyncMutableCuratedCollection__proxy), sel_resultProviderIdentifier);
}

- (void)setResultProviderIdentifier:(int)a3
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC8MapsSync32MapsSyncMutableCuratedCollection__proxy));
}

@end