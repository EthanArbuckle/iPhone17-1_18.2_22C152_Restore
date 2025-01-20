@interface MapsSyncMutableAnalyticsIdentifier
- (NSData)data;
- (_TtC8MapsSync34MapsSyncMutableAnalyticsIdentifier)initWithProxyObject:(id)a3;
- (void)setData:(id)a3;
@end

@implementation MapsSyncMutableAnalyticsIdentifier

- (_TtC8MapsSync34MapsSyncMutableAnalyticsIdentifier)initWithProxyObject:(id)a3
{
  type metadata accessor for MapsSyncManagedAnalyticsIdentifier();
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8MapsSync34MapsSyncMutableAnalyticsIdentifier__proxy) = (Class)swift_dynamicCastClassUnconditional();
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8MapsSync23MapsSyncMutableBaseItem__proxyObject) = (Class)a3;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for MapsSyncMutableBaseItem();
  id v5 = a3;
  return [(MapsSyncMutableBaseItem *)&v7 init];
}

- (NSData)data
{
  v2 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8MapsSync34MapsSyncMutableAnalyticsIdentifier__proxy);
  v3 = self;
  id v4 = objc_msgSend(v2, sel_data);
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

- (void)setData:(id)a3
{
  v3 = a3;
  if (a3)
  {
    id v5 = self;
    id v6 = v3;
    v3 = (void *)sub_1A709D198();
    unint64_t v8 = v7;

    v9 = *(Class *)((char *)&v5->super.super.isa + OBJC_IVAR____TtC8MapsSync34MapsSyncMutableAnalyticsIdentifier__proxy);
    if (v8 >> 60 != 15)
    {
      id v10 = v9;
      uint64_t v11 = sub_1A709D188();
      goto LABEL_6;
    }
  }
  else
  {
    v9 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8MapsSync34MapsSyncMutableAnalyticsIdentifier__proxy);
    v12 = self;
    unint64_t v8 = 0xF000000000000000;
  }
  id v10 = v9;
  uint64_t v11 = 0;
LABEL_6:
  id v13 = (id)v11;
  objc_msgSend(v10, sel_setData_);
  sub_1A6EEF5F4((uint64_t)v3, v8);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC8MapsSync34MapsSyncMutableAnalyticsIdentifier__proxy));
}

@end