@interface MapsSyncMutableCollectionItem
- (NSSet)collections;
- (_TtC8MapsSync29MapsSyncMutableCollectionItem)initWithProxyObject:(id)a3;
- (void)setCollections:(id)a3;
@end

@implementation MapsSyncMutableCollectionItem

- (_TtC8MapsSync29MapsSyncMutableCollectionItem)initWithProxyObject:(id)a3
{
  type metadata accessor for MapsSyncManagedCollectionItem();
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC8MapsSync29MapsSyncMutableCollectionItem__proxyCollectionItem) = (Class)swift_dynamicCastClassUnconditional();
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8MapsSync23MapsSyncMutableBaseItem__proxyObject) = (Class)a3;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for MapsSyncMutableBaseItem();
  id v5 = a3;
  return [(MapsSyncMutableBaseItem *)&v7 init];
}

- (NSSet)collections
{
  v2 = self;
  id v3 = sub_1A6FC3CC4();

  if (v3)
  {
    type metadata accessor for MapsSyncCollection();
    sub_1A6FC93CC(&qword_1E96E80F0, (void (*)(uint64_t))type metadata accessor for MapsSyncCollection);
    v4 = (void *)sub_1A709D618();
    swift_bridgeObjectRelease();
  }
  else
  {
    v4 = 0;
  }
  return (NSSet *)v4;
}

- (void)setCollections:(id)a3
{
  unint64_t v3 = (unint64_t)a3;
  if (a3)
  {
    type metadata accessor for MapsSyncCollection();
    sub_1A6FC93CC(&qword_1E96E80F0, (void (*)(uint64_t))type metadata accessor for MapsSyncCollection);
    unint64_t v3 = sub_1A709D648();
  }
  id v5 = self;
  sub_1A6FC3DB4(v3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC8MapsSync29MapsSyncMutableCollectionItem__proxyCollectionItem));
}

@end