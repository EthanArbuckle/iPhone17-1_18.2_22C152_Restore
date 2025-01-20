@interface ISTimestampedEvent
- (ISTimestampedEvent)init;
- (SIOrderedEvent)orderedEvent;
- (double)timestamp;
- (id)dictionaryRepresentation;
@end

@implementation ISTimestampedEvent

- (double)timestamp
{
  return *(double *)((char *)&self->super.isa + OBJC_IVAR___ISTimestampedEvent_timestamp);
}

- (SIOrderedEvent)orderedEvent
{
  return (SIOrderedEvent *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                   + OBJC_IVAR___ISTimestampedEvent_orderedEvent));
}

- (id)dictionaryRepresentation
{
  v2 = self;
  sub_22AE800A8();

  v3 = (void *)sub_22AEA9EF8();
  swift_bridgeObjectRelease();
  return v3;
}

- (ISTimestampedEvent)init
{
  result = (ISTimestampedEvent *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end