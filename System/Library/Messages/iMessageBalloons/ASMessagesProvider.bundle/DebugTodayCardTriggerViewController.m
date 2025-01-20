@interface DebugTodayCardTriggerViewController
- (_TtC18ASMessagesProvider35DebugTodayCardTriggerViewController)initWithCoder:(id)a3;
- (_TtC18ASMessagesProvider35DebugTodayCardTriggerViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtC18ASMessagesProvider35DebugTodayCardTriggerViewController)initWithStyle:(int64_t)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)refreshContent;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
@end

@implementation DebugTodayCardTriggerViewController

- (_TtC18ASMessagesProvider35DebugTodayCardTriggerViewController)initWithCoder:(id)a3
{
  result = (_TtC18ASMessagesProvider35DebugTodayCardTriggerViewController *)sub_77EB20();
  __break(1u);
  return result;
}

- (void)refreshContent
{
  v2 = self;
  sub_1E6D24();
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return (*(void **)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider35DebugTodayCardTriggerViewController_sections))[2];
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  if (a4 < 0)
  {
    __break(1u);
    goto LABEL_7;
  }
  if (*(void *)(*(void *)((char *)self
                             + OBJC_IVAR____TtC18ASMessagesProvider35DebugTodayCardTriggerViewController_sections)
                 + 16) <= (unint64_t)a4)
  {
LABEL_7:
    __break(1u);
    return self;
  }
  swift_bridgeObjectRetain();
  NSString v4 = sub_77D640();
  swift_bridgeObjectRelease();

  return v4;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  if (a4 < 0)
  {
    __break(1u);
  }
  else
  {
    uint64_t v4 = *(void *)(self + OBJC_IVAR____TtC18ASMessagesProvider35DebugTodayCardTriggerViewController_sections);
    if (*(void *)(v4 + 16) > (unint64_t)a4) {
      return *(void *)(*(void *)(v4 + 32 * a4 + 48) + 16);
    }
  }
  __break(1u);
  return self;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v6 = sub_76C1E0();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_76C120();
  v10 = (_TtC18ASMessagesProvider35DebugTodayCardTriggerViewController *)a3;
  v11 = self;
  NSString v12 = sub_77D640();
  id v13 = [(DebugTodayCardTriggerViewController *)v10 dequeueReusableCellWithIdentifier:v12];

  if (!v13)
  {
    id v14 = objc_allocWithZone((Class)UITableViewCell);
    v15 = (_TtC18ASMessagesProvider35DebugTodayCardTriggerViewController *)sub_77D640();
    id v13 = [v14 initWithStyle:3 reuseIdentifier:v15];

    v10 = v11;
    v11 = v15;
  }

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);

  return v13;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  uint64_t v8 = sub_76C1E0();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_76C120();
  id v12 = a3;
  id v13 = a4;
  id v14 = self;
  sub_1E865C(v13);

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4
{
  uint64_t v6 = sub_76C1E0();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_FD50((uint64_t *)&unk_9586F0);
  __chkstk_darwin(v10 - 8);
  id v12 = (char *)&v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_76C120();
  id v13 = a3;
  id v14 = self;
  id result = (id)sub_76C170();
  if (((unint64_t)result & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_13;
  }
  uint64_t v16 = *(uint64_t *)((char *)&v14->super.super.super.super.isa
                   + OBJC_IVAR____TtC18ASMessagesProvider35DebugTodayCardTriggerViewController_sections);
  if ((unint64_t)result >= *(void *)(v16 + 16))
  {
LABEL_13:
    __break(1u);
    return result;
  }
  if (*(unsigned char *)(v16 + 32 * (void)result + 56) == 2)
  {
    uint64_t v17 = 1;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v12, v9, v6);
    uint64_t v17 = 0;
  }
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v7 + 56))(v12, v17, 1, v6);

  v18 = *(void (**)(char *, uint64_t))(v7 + 8);
  v18(v9, v6);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v12, 1, v6) == 1)
  {
    Class isa = 0;
  }
  else
  {
    Class isa = sub_76C0E0().super.isa;
    v18(v12, v6);
  }

  return isa;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v6 = sub_76C1E0();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_76C120();
  id v10 = a3;
  uint64_t v11 = self;
  sub_1E87E8();

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (_TtC18ASMessagesProvider35DebugTodayCardTriggerViewController)initWithStyle:(int64_t)a3
{
  id result = (_TtC18ASMessagesProvider35DebugTodayCardTriggerViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC18ASMessagesProvider35DebugTodayCardTriggerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  id result = (_TtC18ASMessagesProvider35DebugTodayCardTriggerViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();

  swift_bridgeObjectRelease();
}

@end