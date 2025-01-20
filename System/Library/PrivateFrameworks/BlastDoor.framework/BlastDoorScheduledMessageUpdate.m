@interface BlastDoorScheduledMessageUpdate
- (BlastDoorMetadata)metadata;
- (BlastDoorScheduledMessageUpdate)init;
- (NSString)description;
- (int64_t)scheduleState;
@end

@implementation BlastDoorScheduledMessageUpdate

- (NSString)description
{
  return (NSString *)sub_1B177A380((uint64_t)self, (uint64_t)a2, (uint64_t (*)(void))type metadata accessor for ScheduledMessageUpdate, &OBJC_IVAR___BlastDoorScheduledMessageUpdate_scheduledMessageUpdate, (uint64_t (*)(void))type metadata accessor for ScheduledMessageUpdate);
}

- (BlastDoorMetadata)metadata
{
  v2 = self;
  id v3 = sub_1B179E1E0();

  return (BlastDoorMetadata *)v3;
}

- (int64_t)scheduleState
{
  v2 = (char *)self + OBJC_IVAR___BlastDoorScheduledMessageUpdate_scheduledMessageUpdate;
  return qword_1B19BB730[v2[*(int *)(type metadata accessor for ScheduledMessageUpdate() + 20)]];
}

- (BlastDoorScheduledMessageUpdate)init
{
  result = (BlastDoorScheduledMessageUpdate *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end