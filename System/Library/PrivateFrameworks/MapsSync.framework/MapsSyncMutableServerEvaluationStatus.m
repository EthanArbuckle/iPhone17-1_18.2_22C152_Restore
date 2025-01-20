@interface MapsSyncMutableServerEvaluationStatus
- (BOOL)arpStatus;
- (BOOL)rapStatus;
- (_TtC8MapsSync37MapsSyncMutableServerEvaluationStatus)initWithProxyObject:(id)a3;
- (void)setArpStatus:(BOOL)a3;
- (void)setRapStatus:(BOOL)a3;
@end

@implementation MapsSyncMutableServerEvaluationStatus

- (_TtC8MapsSync37MapsSyncMutableServerEvaluationStatus)initWithProxyObject:(id)a3
{
  type metadata accessor for MapsSyncManagedServerEvaluationStatus();
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8MapsSync37MapsSyncMutableServerEvaluationStatus__proxy) = (Class)swift_dynamicCastClassUnconditional();
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8MapsSync23MapsSyncMutableBaseItem__proxyObject) = (Class)a3;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for MapsSyncMutableBaseItem();
  id v5 = a3;
  return [(MapsSyncMutableBaseItem *)&v7 init];
}

- (BOOL)arpStatus
{
  return objc_msgSend(*(id *)((char *)&self->super.super.isa+ OBJC_IVAR____TtC8MapsSync37MapsSyncMutableServerEvaluationStatus__proxy), sel_arpStatus);
}

- (void)setArpStatus:(BOOL)a3
{
}

- (BOOL)rapStatus
{
  return objc_msgSend(*(id *)((char *)&self->super.super.isa+ OBJC_IVAR____TtC8MapsSync37MapsSyncMutableServerEvaluationStatus__proxy), sel_rapStatus);
}

- (void)setRapStatus:(BOOL)a3
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC8MapsSync37MapsSyncMutableServerEvaluationStatus__proxy));
}

@end