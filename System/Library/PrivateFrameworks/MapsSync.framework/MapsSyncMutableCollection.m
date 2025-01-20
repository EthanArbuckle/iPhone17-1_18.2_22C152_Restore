@interface MapsSyncMutableCollection
- (NSData)image;
- (NSSet)places;
- (NSString)collectionDescription;
- (NSString)imageUrl;
- (NSString)title;
- (_TtC8MapsSync25MapsSyncMutableCollection)initWithProxyObject:(id)a3;
- (void)addItemWithCollectionItem:(id)a3;
- (void)removePlaceWithCollectionItem:(id)a3;
- (void)setCollectionDescription:(id)a3;
- (void)setImage:(id)a3;
- (void)setImageUrl:(id)a3;
- (void)setPlaces:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation MapsSyncMutableCollection

- (_TtC8MapsSync25MapsSyncMutableCollection)initWithProxyObject:(id)a3
{
  type metadata accessor for MapsSyncManagedCollection();
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8MapsSync25MapsSyncMutableCollection__proxyCollection) = (Class)swift_dynamicCastClassUnconditional();
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8MapsSync23MapsSyncMutableBaseItem__proxyObject) = (Class)a3;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for MapsSyncMutableBaseItem();
  id v5 = a3;
  return [(MapsSyncMutableBaseItem *)&v7 init];
}

- (NSString)collectionDescription
{
  return (NSString *)sub_1A6FFCC40((char *)self, (uint64_t)a2, (SEL *)&selRef_collectionDescription);
}

- (void)setCollectionDescription:(id)a3
{
}

- (NSData)image
{
  v2 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8MapsSync25MapsSyncMutableCollection__proxyCollection);
  v3 = self;
  id v4 = objc_msgSend(v2, sel_image);
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = sub_1A709D198();
    unint64_t v8 = v7;

    v9 = (void *)sub_1A709D188();
    sub_1A6EEF608(v6, v8);
  }
  else
  {

    v9 = 0;
  }
  return (NSData *)v9;
}

- (void)setImage:(id)a3
{
  v3 = a3;
  if (a3)
  {
    id v5 = self;
    id v6 = v3;
    v3 = (void *)sub_1A709D198();
    unint64_t v8 = v7;

    v9 = *(Class *)((char *)&v5->super.super.isa + OBJC_IVAR____TtC8MapsSync25MapsSyncMutableCollection__proxyCollection);
    if (v8 >> 60 != 15)
    {
      id v10 = v9;
      uint64_t v11 = sub_1A709D188();
      goto LABEL_6;
    }
  }
  else
  {
    v9 = *(Class *)((char *)&self->super.super.isa
                  + OBJC_IVAR____TtC8MapsSync25MapsSyncMutableCollection__proxyCollection);
    v12 = self;
    unint64_t v8 = 0xF000000000000000;
  }
  id v10 = v9;
  uint64_t v11 = 0;
LABEL_6:
  id v13 = (id)v11;
  objc_msgSend(v10, sel_setImage_);
  sub_1A6EEF5F4((uint64_t)v3, v8);
}

- (NSString)imageUrl
{
  return (NSString *)sub_1A6FFCC40((char *)self, (uint64_t)a2, (SEL *)&selRef_imageUrl);
}

- (void)setImageUrl:(id)a3
{
}

- (NSString)title
{
  return (NSString *)sub_1A6FFCC40((char *)self, (uint64_t)a2, (SEL *)&selRef_title);
}

- (void)setTitle:(id)a3
{
}

- (NSSet)places
{
  return (NSSet *)sub_1A6FFD0A8(self, (uint64_t)a2, (uint64_t (*)(void))sub_1A6FFD15C);
}

- (void)setPlaces:(id)a3
{
  unint64_t v3 = (unint64_t)a3;
  if (a3)
  {
    type metadata accessor for MapsSyncCollectionItem();
    sub_1A6FFEE2C((unint64_t *)&qword_1EB66F538, (void (*)(uint64_t))type metadata accessor for MapsSyncCollectionItem);
    unint64_t v3 = sub_1A709D648();
  }
  id v5 = self;
  sub_1A6FFD340(v3);
}

- (void)addItemWithCollectionItem:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_1A6FFD72C((uint64_t)v4);
}

- (void)removePlaceWithCollectionItem:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_1A6FFD8B0();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC8MapsSync25MapsSyncMutableCollection__proxyCollection));
}

@end