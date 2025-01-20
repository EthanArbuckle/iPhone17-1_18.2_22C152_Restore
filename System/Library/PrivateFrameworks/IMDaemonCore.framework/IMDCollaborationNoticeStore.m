@interface IMDCollaborationNoticeStore
- (IMDCollaborationNoticeStore)init;
- (id)deleteAllNoticesWithCollaborationIdentifier:(id)a3;
- (id)deleteNotice:(id)a3;
- (id)deleteNoticeWithGUIDString:(id)a3;
- (id)noticesForURLs:(id)a3;
- (void)deleteNoticesForURLs:(id)a3;
- (void)saveNotice:(id)a3;
@end

@implementation IMDCollaborationNoticeStore

- (void)saveNotice:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1D98F2C80(v4);
}

- (id)noticesForURLs:(id)a3
{
  sub_1D9906470();
  uint64_t v4 = sub_1D9906F20();
  v5 = self;
  uint64_t v6 = sub_1D98F36D4(v4);

  swift_bridgeObjectRelease();
  if (v6)
  {
    sub_1D968E084(0, &qword_1EA8CA220);
    v7 = (void *)sub_1D9906F00();
    swift_bridgeObjectRelease();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)deleteNotice:(id)a3
{
  uint64_t v5 = sub_1D96867CC(&qword_1EBE2AF60);
  MEMORY[0x1F4188790](v5 - 8);
  v7 = (char *)&v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v8 = a3;
  v9 = self;
  id v10 = objc_msgSend(v8, sel_guidString);
  uint64_t v11 = sub_1D9906DA0();
  unint64_t v13 = v12;

  sub_1D98F49B4(v11, v13, v7);
  swift_bridgeObjectRelease();
  uint64_t v14 = sub_1D9906470();
  uint64_t v15 = *(void *)(v14 - 8);
  v16 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v7, 1, v14) != 1)
  {
    v16 = (void *)sub_1D99063E0();
    (*(void (**)(char *, uint64_t))(v15 + 8))(v7, v14);
  }

  return v16;
}

- (id)deleteNoticeWithGUIDString:(id)a3
{
  uint64_t v4 = sub_1D96867CC(&qword_1EBE2AF60);
  MEMORY[0x1F4188790](v4 - 8);
  uint64_t v6 = (char *)&v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_1D9906DA0();
  unint64_t v9 = v8;
  id v10 = self;
  sub_1D98F49B4(v7, v9, v6);

  swift_bridgeObjectRelease();
  uint64_t v11 = sub_1D9906470();
  uint64_t v12 = *(void *)(v11 - 8);
  unint64_t v13 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v6, 1, v11) != 1)
  {
    unint64_t v13 = (void *)sub_1D99063E0();
    (*(void (**)(char *, uint64_t))(v12 + 8))(v6, v11);
  }

  return v13;
}

- (id)deleteAllNoticesWithCollaborationIdentifier:(id)a3
{
  uint64_t v4 = sub_1D9906DA0();
  unint64_t v6 = v5;
  uint64_t v7 = self;
  sub_1D98F5768(v4, v6);

  swift_bridgeObjectRelease();
  unint64_t v8 = (void *)sub_1D9906F00();
  swift_bridgeObjectRelease();

  return v8;
}

- (void)deleteNoticesForURLs:(id)a3
{
  sub_1D9906470();
  uint64_t v4 = sub_1D9906F20();
  unint64_t v5 = self;
  sub_1D98F6168(v4);

  swift_bridgeObjectRelease();
}

- (IMDCollaborationNoticeStore)init
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___IMDCollaborationNoticeStore____lazy_storage___persistenceContainer) = (Class)1;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CollaborationNoticeStore();
  return [(IMDCollaborationNoticeStore *)&v3 init];
}

- (void).cxx_destruct
{
  sub_1D98F7374(*(id *)((char *)&self->super.isa
                      + OBJC_IVAR___IMDCollaborationNoticeStore____lazy_storage___persistenceContainer));
}

@end