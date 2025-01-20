@interface BlastDoorCollaborationNotice
- (BlastDoorCollaborationNotice)init;
- (NSData)highlightEvent;
- (NSDate)noticeDate;
- (NSString)description;
- (NSString)guidString;
- (int64_t)version;
- (unint64_t)highlightEventType;
@end

@implementation BlastDoorCollaborationNotice

- (NSString)description
{
  return (NSString *)sub_1B177A380((uint64_t)self, (uint64_t)a2, type metadata accessor for CollaborationNotice, &OBJC_IVAR___BlastDoorCollaborationNotice_collaborationNotice, type metadata accessor for CollaborationNotice);
}

- (int64_t)version
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR___BlastDoorCollaborationNotice_collaborationNotice);
}

- (NSString)guidString
{
  return (NSString *)sub_1B179F944();
}

- (NSData)highlightEvent
{
  uint64_t v3 = type metadata accessor for CollaborationHighlightEvent(0);
  MEMORY[0x1F4188790](v3 - 8);
  v5 = (char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = (char *)self + OBJC_IVAR___BlastDoorCollaborationNotice_collaborationNotice;
  uint64_t v7 = type metadata accessor for CollaborationNotice(0);
  sub_1B17B4094((uint64_t)&v6[*(int *)(v7 + 24)], (uint64_t)v5, type metadata accessor for CollaborationHighlightEvent);
  v8 = self;
  uint64_t v9 = sub_1B19109B0();
  unint64_t v11 = v10;
  v12 = (void *)sub_1B1969DB0();
  sub_1B11ED78C(v9, v11);
  sub_1B17B42FC((uint64_t)v5, type metadata accessor for CollaborationHighlightEvent);

  return (NSData *)v12;
}

- (unint64_t)highlightEventType
{
  v2 = self;
  unint64_t v3 = sub_1B177F300();

  return v3;
}

- (NSDate)noticeDate
{
  uint64_t v3 = sub_1B1969E80();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3);
  v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = (char *)self + OBJC_IVAR___BlastDoorCollaborationNotice_collaborationNotice;
  uint64_t v8 = type metadata accessor for CollaborationNotice(0);
  (*(void (**)(char *, char *, uint64_t))(v4 + 16))(v6, &v7[*(int *)(v8 + 28)], v3);
  uint64_t v9 = (void *)sub_1B1969E50();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return (NSDate *)v9;
}

- (BlastDoorCollaborationNotice)init
{
  result = (BlastDoorCollaborationNotice *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end