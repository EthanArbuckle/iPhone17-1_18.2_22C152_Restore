@interface HDCMSwimTracker
- (CMSwimTracker)tracker;
- (_TtC12HealthDaemon15HDCMSwimTracker)init;
- (id)init:(id)a3;
- (void)querySwimUpdatesFromRecord:(id)a3 handler:(id)a4;
- (void)setTracker:(id)a3;
- (void)startUpdatesFromRecord:(id)a3 handler:(id)a4;
- (void)stopUpdates;
@end

@implementation HDCMSwimTracker

- (CMSwimTracker)tracker
{
  return (CMSwimTracker *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                  + OBJC_IVAR____TtC12HealthDaemon15HDCMSwimTracker_tracker));
}

- (void)setTracker:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12HealthDaemon15HDCMSwimTracker_tracker);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12HealthDaemon15HDCMSwimTracker_tracker) = (Class)a3;
  id v3 = a3;
}

- (void)startUpdatesFromRecord:(id)a3 handler:(id)a4
{
}

- (void)stopUpdates
{
}

- (void)querySwimUpdatesFromRecord:(id)a3 handler:(id)a4
{
}

- (id)init:(id)a3
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12HealthDaemon15HDCMSwimTracker_tracker) = (Class)a3;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for HDCMSwimTracker();
  id v4 = a3;
  v5 = [(HDCMSwimTracker *)&v7 init];

  return v5;
}

- (_TtC12HealthDaemon15HDCMSwimTracker)init
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12HealthDaemon15HDCMSwimTracker_tracker) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for HDCMSwimTracker();
  return [(HDCMSwimTracker *)&v3 init];
}

- (void).cxx_destruct
{
}

@end