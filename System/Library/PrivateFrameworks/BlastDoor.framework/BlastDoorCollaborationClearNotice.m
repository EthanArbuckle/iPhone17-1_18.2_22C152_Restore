@interface BlastDoorCollaborationClearNotice
- (BlastDoorCollaborationClearNotice)init;
- (NSDate)date;
- (NSString)collaborationId;
- (NSString)description;
- (NSString)guidString;
- (int64_t)version;
@end

@implementation BlastDoorCollaborationClearNotice

- (NSString)description
{
  return (NSString *)sub_1B177A380((uint64_t)self, (uint64_t)a2, (uint64_t (*)(void))type metadata accessor for CollaborationClearNotice, &OBJC_IVAR___BlastDoorCollaborationClearNotice_collaborationClearNotice, (uint64_t (*)(void))type metadata accessor for CollaborationClearNotice);
}

- (int64_t)version
{
  return *(int64_t *)((char *)&self->super.isa
                           + OBJC_IVAR___BlastDoorCollaborationClearNotice_collaborationClearNotice);
}

- (NSString)guidString
{
  return (NSString *)sub_1B179F944();
}

- (NSDate)date
{
  uint64_t v3 = sub_1B1969E80();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3);
  v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = (char *)self + OBJC_IVAR___BlastDoorCollaborationClearNotice_collaborationClearNotice;
  uint64_t v8 = type metadata accessor for CollaborationClearNotice();
  (*(void (**)(char *, char *, uint64_t))(v4 + 16))(v6, &v7[*(int *)(v8 + 24)], v3);
  v9 = (void *)sub_1B1969E50();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return (NSDate *)v9;
}

- (NSString)collaborationId
{
  type metadata accessor for CollaborationClearNotice();
  swift_bridgeObjectRetain();
  v2 = (void *)sub_1B196A7E0();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (BlastDoorCollaborationClearNotice)init
{
  result = (BlastDoorCollaborationClearNotice *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end