@interface DSParticipant
- (BOOL)isEqual:(id)a3;
- (DSIdentifiable)identity;
- (_TtC13DSNotesPlugin13DSParticipant)init;
- (int64_t)permission;
- (int64_t)role;
@end

@implementation DSParticipant

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_12A68();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  char v6 = sub_122F4((uint64_t)v8);

  sub_101BC((uint64_t)v8);
  return v6 & 1;
}

- (int64_t)role
{
  if ([*(id *)((char *)&self->super.isa + OBJC_IVAR____TtC13DSNotesPlugin13DSParticipant_participant) role] == (char *)&dword_0 + 1)return 1; {
  else
  }
    return 2;
}

- (int64_t)permission
{
  if ([*(id *)((char *)&self->super.isa + OBJC_IVAR____TtC13DSNotesPlugin13DSParticipant_participant) permission] == (char *)&dword_0 + 3)return 2; {
  else
  }
    return 1;
}

- (DSIdentifiable)identity
{
  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC13DSNotesPlugin13DSParticipant_participant);
  v3 = self;
  id v4 = [v2 userIdentity];

  return (DSIdentifiable *)v4;
}

- (_TtC13DSNotesPlugin13DSParticipant)init
{
  result = (_TtC13DSNotesPlugin13DSParticipant *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end