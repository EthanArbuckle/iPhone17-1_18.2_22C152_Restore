@interface MapsSyncMutableCachedCuratedCollection
- (BOOL)isTombstone;
- (NSData)image;
- (NSDate)lastFetchedDate;
- (NSDate)lastSignificantChangeDate;
- (NSString)collectionDescription;
- (NSString)imageUrl;
- (NSString)publisherAttribution;
- (NSString)title;
- (NSString)titleLocale;
- (_TtC8MapsSync38MapsSyncMutableCachedCuratedCollection)initWithProxyObject:(id)a3;
- (int)placesCount;
- (int)resultProviderIdentifier;
- (unint64_t)curatedCollectionIdentifier;
- (void)setCollectionDescription:(id)a3;
- (void)setCuratedCollectionIdentifier:(unint64_t)a3;
- (void)setImage:(id)a3;
- (void)setImageUrl:(id)a3;
- (void)setIsTombstone:(BOOL)a3;
- (void)setLastFetchedDate:(id)a3;
- (void)setLastSignificantChangeDate:(id)a3;
- (void)setPlacesCount:(int)a3;
- (void)setPublisherAttribution:(id)a3;
- (void)setResultProviderIdentifier:(int)a3;
- (void)setTitle:(id)a3;
- (void)setTitleLocale:(id)a3;
@end

@implementation MapsSyncMutableCachedCuratedCollection

- (_TtC8MapsSync38MapsSyncMutableCachedCuratedCollection)initWithProxyObject:(id)a3
{
  type metadata accessor for MapsSyncManagedCachedCuratedCollection();
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8MapsSync38MapsSyncMutableCachedCuratedCollection__proxy) = (Class)swift_dynamicCastClassUnconditional();
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8MapsSync23MapsSyncMutableBaseItem__proxyObject) = (Class)a3;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for MapsSyncMutableBaseItem();
  id v5 = a3;
  return [(MapsSyncMutableBaseItem *)&v7 init];
}

- (NSString)collectionDescription
{
  return (NSString *)sub_1A6F414A8((char *)self, (uint64_t)a2, (SEL *)&selRef_collectionDescription);
}

- (void)setCollectionDescription:(id)a3
{
}

- (NSData)image
{
  v2 = *(Class *)((char *)&self->super.super.isa
                + OBJC_IVAR____TtC8MapsSync38MapsSyncMutableCachedCuratedCollection__proxy);
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

    v9 = *(Class *)((char *)&v5->super.super.isa
                  + OBJC_IVAR____TtC8MapsSync38MapsSyncMutableCachedCuratedCollection__proxy);
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
                  + OBJC_IVAR____TtC8MapsSync38MapsSyncMutableCachedCuratedCollection__proxy);
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
  return (NSString *)sub_1A6F414A8((char *)self, (uint64_t)a2, (SEL *)&selRef_imageUrl);
}

- (void)setImageUrl:(id)a3
{
}

- (NSString)title
{
  return (NSString *)sub_1A6F414A8((char *)self, (uint64_t)a2, (SEL *)&selRef_title);
}

- (void)setTitle:(id)a3
{
}

- (unint64_t)curatedCollectionIdentifier
{
  return (unint64_t)objc_msgSend(*(id *)((char *)&self->super.super.isa+ OBJC_IVAR____TtC8MapsSync38MapsSyncMutableCachedCuratedCollection__proxy), sel_curatedCollectionIdentifier);
}

- (void)setCuratedCollectionIdentifier:(unint64_t)a3
{
}

- (BOOL)isTombstone
{
  return objc_msgSend(*(id *)((char *)&self->super.super.isa+ OBJC_IVAR____TtC8MapsSync38MapsSyncMutableCachedCuratedCollection__proxy), sel_isTombstone);
}

- (void)setIsTombstone:(BOOL)a3
{
}

- (NSDate)lastFetchedDate
{
  return (NSDate *)sub_1A6F40838((char *)self, (uint64_t)a2, (SEL *)&selRef_lastFetchedDate);
}

- (void)setLastFetchedDate:(id)a3
{
}

- (NSDate)lastSignificantChangeDate
{
  return (NSDate *)sub_1A6F40838((char *)self, (uint64_t)a2, (SEL *)&selRef_lastSignificantChangeDate);
}

- (void)setLastSignificantChangeDate:(id)a3
{
}

- (int)placesCount
{
  return objc_msgSend(*(id *)((char *)&self->super.super.isa+ OBJC_IVAR____TtC8MapsSync38MapsSyncMutableCachedCuratedCollection__proxy), sel_placesCount);
}

- (void)setPlacesCount:(int)a3
{
}

- (NSString)publisherAttribution
{
  return (NSString *)sub_1A6F414A8((char *)self, (uint64_t)a2, (SEL *)&selRef_publisherAttribution);
}

- (void)setPublisherAttribution:(id)a3
{
}

- (NSString)titleLocale
{
  return (NSString *)sub_1A6F414A8((char *)self, (uint64_t)a2, (SEL *)&selRef_titleLocale);
}

- (void)setTitleLocale:(id)a3
{
}

- (int)resultProviderIdentifier
{
  return objc_msgSend(*(id *)((char *)&self->super.super.isa+ OBJC_IVAR____TtC8MapsSync38MapsSyncMutableCachedCuratedCollection__proxy), sel_resultProviderIdentifier);
}

- (void)setResultProviderIdentifier:(int)a3
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC8MapsSync38MapsSyncMutableCachedCuratedCollection__proxy));
}

@end