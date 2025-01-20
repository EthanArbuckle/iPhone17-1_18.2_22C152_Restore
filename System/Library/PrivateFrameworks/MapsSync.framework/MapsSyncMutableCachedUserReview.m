@interface MapsSyncMutableCachedUserReview
- (_TtC8MapsSync31MapsSyncMutableCachedUserReview)initWithProxyObject:(id)a3;
- (int)numberPhotosUploaded;
- (signed)rating;
- (unint64_t)muid;
- (void)setMuid:(unint64_t)a3;
- (void)setNumberPhotosUploaded:(int)a3;
- (void)setRating:(signed __int16)a3;
@end

@implementation MapsSyncMutableCachedUserReview

- (_TtC8MapsSync31MapsSyncMutableCachedUserReview)initWithProxyObject:(id)a3
{
  type metadata accessor for MapsSyncManagedCachedUserReview();
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8MapsSync31MapsSyncMutableCachedUserReview__proxy) = (Class)swift_dynamicCastClassUnconditional();
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8MapsSync23MapsSyncMutableBaseItem__proxyObject) = (Class)a3;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for MapsSyncMutableBaseItem();
  id v5 = a3;
  return [(MapsSyncMutableBaseItem *)&v7 init];
}

- (unint64_t)muid
{
  return (unint64_t)objc_msgSend(*(id *)((char *)&self->super.super.isa+ OBJC_IVAR____TtC8MapsSync31MapsSyncMutableCachedUserReview__proxy), sel_muid);
}

- (void)setMuid:(unint64_t)a3
{
}

- (int)numberPhotosUploaded
{
  return objc_msgSend(*(id *)((char *)&self->super.super.isa+ OBJC_IVAR____TtC8MapsSync31MapsSyncMutableCachedUserReview__proxy), sel_numberPhotosUploaded);
}

- (void)setNumberPhotosUploaded:(int)a3
{
}

- (signed)rating
{
  v2 = self;
  signed __int16 v3 = sub_1A6F37C58();

  return v3;
}

- (void)setRating:(signed __int16)a3
{
}

- (void).cxx_destruct
{
}

@end