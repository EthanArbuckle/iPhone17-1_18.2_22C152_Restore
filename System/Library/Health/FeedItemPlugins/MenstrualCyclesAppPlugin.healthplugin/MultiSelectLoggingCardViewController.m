@interface MultiSelectLoggingCardViewController
- (BOOL)tableView:(id)a3 shouldDrawTopSeparatorForSection:(int64_t)a4;
- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)respondToSizeCategoryChanges;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
- (void)viewDidLoad;
- (void)viewLayoutMarginsDidChange;
@end

@implementation MultiSelectLoggingCardViewController

- (void)viewDidLoad
{
  v2 = self;
  sub_241252E1C();
}

- (void)viewLayoutMarginsDidChange
{
  v4.receiver = self;
  v4.super_class = (Class)swift_getObjectType();
  v2 = (char *)v4.receiver;
  [(MultiSelectLoggingCardViewController *)&v4 viewLayoutMarginsDidChange];
  id v3 = objc_msgSend(*(id *)&v2[OBJC_IVAR____TtC24MenstrualCyclesAppPlugin25LoggingCardViewController_tableView], sel_tableHeaderView, v4.receiver, v4.super_class);

  if (v3) {
    sub_24125316C();
  }
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v6 = sub_24162BB18();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24162BAA8();
  id v10 = a3;
  v11 = self;
  v12 = sub_2412533C0(v10, (uint64_t)v9);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);

  return v12;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  uint64_t v7 = (char *)self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin36MultiSelectLoggingCardViewController_dataSource;
  int64_t result = MEMORY[0x245621790]((char *)self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin36MultiSelectLoggingCardViewController_dataSource, a2);
  if (result)
  {
    uint64_t v9 = *((void *)v7 + 1);
    uint64_t ObjectType = swift_getObjectType();
    v11 = *(uint64_t (**)(int64_t, _TtC24MenstrualCyclesAppPlugin36MultiSelectLoggingCardViewController *, uint64_t, uint64_t))(v9 + 16);
    id v12 = a3;
    v13 = self;
    int64_t v14 = v11(a4, v13, ObjectType, v9);

    swift_unknownObjectRelease();
    return v14;
  }
  return result;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  objc_super v4 = (char *)self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin36MultiSelectLoggingCardViewController_dataSource;
  if (!MEMORY[0x245621790]((char *)self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin36MultiSelectLoggingCardViewController_dataSource, a2, a3))return 1; {
  uint64_t v5 = *((void *)v4 + 1);
  }
  uint64_t ObjectType = swift_getObjectType();
  int64_t v7 = (*(uint64_t (**)(_TtC24MenstrualCyclesAppPlugin36MultiSelectLoggingCardViewController *, uint64_t, uint64_t))(v5 + 24))(self, ObjectType, v5);
  swift_unknownObjectRelease();
  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v6 = sub_24162BB18();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24162BAA8();
  id v10 = a3;
  v11 = self;
  sub_241253B88(v10, (uint64_t)v9);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id v6 = a3;
  uint64_t v7 = self;
  uint64_t v8 = (void *)sub_2412545A8(v6, a4);

  return v8;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  id v6 = (char *)self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin36MultiSelectLoggingCardViewController_dataSource;
  if (MEMORY[0x245621790]((char *)self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin36MultiSelectLoggingCardViewController_dataSource, a2, a3))
  {
    uint64_t v8 = *((void *)v6 + 1);
    uint64_t ObjectType = swift_getObjectType();
    double v10 = (*(double (**)(_TtC24MenstrualCyclesAppPlugin36MultiSelectLoggingCardViewController *, int64_t, uint64_t, uint64_t))(v8 + 56))(self, a4, ObjectType, v8);
    swift_unknownObjectRelease();
    return v10;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  uint64_t v6 = sub_24162BB18();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v10 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24162BAA8();
  objc_msgSend(a4, sel__setShouldHaveFullLengthBottomSeparator_, 1);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (void)respondToSizeCategoryChanges
{
  v2 = self;
  sub_241254D2C();
}

- (void).cxx_destruct
{
  sub_2411CD138((uint64_t)self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin36MultiSelectLoggingCardViewController_dataSource);
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin36MultiSelectLoggingCardViewController_tableHeader));

  swift_bridgeObjectRelease();
}

- (BOOL)tableView:(id)a3 shouldDrawTopSeparatorForSection:(int64_t)a4
{
  uint64_t v6 = (char *)self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin36MultiSelectLoggingCardViewController_dataSource;
  uint64_t v7 = MEMORY[0x245621790]((char *)self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin36MultiSelectLoggingCardViewController_dataSource, a2, a3);
  if (v7)
  {
    uint64_t v8 = *((void *)v6 + 1);
    uint64_t ObjectType = swift_getObjectType();
    char v10 = (*(uint64_t (**)(_TtC24MenstrualCyclesAppPlugin36MultiSelectLoggingCardViewController *, int64_t, uint64_t, uint64_t))(v8 + 64))(self, a4, ObjectType, v8);
    swift_unknownObjectRelease();
    LOBYTE(v7) = v10 & 1;
  }
  else
  {
    __break(1u);
  }
  return v7;
}

@end