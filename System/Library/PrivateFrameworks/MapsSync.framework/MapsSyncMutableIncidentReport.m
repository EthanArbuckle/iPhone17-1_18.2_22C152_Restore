@interface MapsSyncMutableIncidentReport
- (NSString)countryCode;
- (_TtC8MapsSync29MapsSyncMutableIncidentReport)initWithProxyObject:(id)a3;
- (signed)type;
- (void)setCountryCode:(id)a3;
- (void)setType:(signed __int16)a3;
@end

@implementation MapsSyncMutableIncidentReport

- (_TtC8MapsSync29MapsSyncMutableIncidentReport)initWithProxyObject:(id)a3
{
  type metadata accessor for MapsSyncManagedIncidentReport();
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8MapsSync29MapsSyncMutableIncidentReport__proxy) = (Class)swift_dynamicCastClassUnconditional();
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8MapsSync23MapsSyncMutableBaseItem__proxyObject) = (Class)a3;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for MapsSyncMutableBaseItem();
  id v5 = a3;
  return [(MapsSyncMutableBaseItem *)&v7 init];
}

- (NSString)countryCode
{
  v2 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8MapsSync29MapsSyncMutableIncidentReport__proxy);
  v3 = self;
  id v4 = objc_msgSend(v2, sel_countryCode);
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

- (void)setCountryCode:(id)a3
{
  if (a3)
  {
    sub_1A709D438();
    id v4 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8MapsSync29MapsSyncMutableIncidentReport__proxy);
    id v5 = self;
    id v7 = (id)sub_1A709D428();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v4 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8MapsSync29MapsSyncMutableIncidentReport__proxy);
    v6 = self;
    id v7 = 0;
  }
  objc_msgSend(v4, sel_setCountryCode_, v7);
}

- (signed)type
{
  return (unsigned __int16)objc_msgSend(*(id *)((char *)&self->super.super.isa+ OBJC_IVAR____TtC8MapsSync29MapsSyncMutableIncidentReport__proxy), sel_type);
}

- (void)setType:(signed __int16)a3
{
}

- (void).cxx_destruct
{
}

@end