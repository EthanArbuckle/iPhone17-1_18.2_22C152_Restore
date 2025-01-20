@interface DebugTodayCardTriggerViewController
- (_TtC22SubscribePageExtension35DebugTodayCardTriggerViewController)initWithCoder:(id)a3;
- (_TtC22SubscribePageExtension35DebugTodayCardTriggerViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtC22SubscribePageExtension35DebugTodayCardTriggerViewController)initWithStyle:(int64_t)a3;
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

- (_TtC22SubscribePageExtension35DebugTodayCardTriggerViewController)initWithCoder:(id)a3
{
  result = (_TtC22SubscribePageExtension35DebugTodayCardTriggerViewController *)sub_100768A40();
  __break(1u);
  return result;
}

- (void)refreshContent
{
  v2 = self;
  sub_1002F9A0C();
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return (*(void **)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension35DebugTodayCardTriggerViewController_sections))[2];
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  if (a4 < 0)
  {
    __break(1u);
    goto LABEL_7;
  }
  if (*(void *)(*(void *)((char *)self
                             + OBJC_IVAR____TtC22SubscribePageExtension35DebugTodayCardTriggerViewController_sections)
                 + 16) <= (unint64_t)a4)
  {
LABEL_7:
    __break(1u);
    return self;
  }
  swift_bridgeObjectRetain();
  NSString v4 = sub_1007675C0();
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
    uint64_t v4 = *(void *)(self + OBJC_IVAR____TtC22SubscribePageExtension35DebugTodayCardTriggerViewController_sections);
    if (*(void *)(v4 + 16) > (unint64_t)a4) {
      return *(void *)(*(void *)(v4 + 32 * a4 + 48) + 16);
    }
  }
  __break(1u);
  return self;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v6 = sub_100756440();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6, v8);
  v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100756380();
  v11 = (_TtC22SubscribePageExtension35DebugTodayCardTriggerViewController *)a3;
  v12 = self;
  NSString v13 = sub_1007675C0();
  id v14 = [(DebugTodayCardTriggerViewController *)v11 dequeueReusableCellWithIdentifier:v13];

  if (!v14)
  {
    id v15 = objc_allocWithZone((Class)UITableViewCell);
    v16 = (_TtC22SubscribePageExtension35DebugTodayCardTriggerViewController *)sub_1007675C0();
    id v14 = [v15 initWithStyle:3 reuseIdentifier:v16];

    v11 = v12;
    v12 = v16;
  }

  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);

  return v14;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  uint64_t v8 = sub_100756440();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8, v10);
  v12 = (char *)&v16 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100756380();
  id v13 = a3;
  id v14 = a4;
  id v15 = self;
  sub_1002FB320(v14);

  (*(void (**)(char *, uint64_t))(v9 + 8))(v12, v8);
}

- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4
{
  uint64_t v6 = sub_100756440();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6, v8);
  uint64_t v10 = (char *)&v22 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_10000FB44(&qword_100934780);
  __chkstk_darwin(v11 - 8, v12);
  id v14 = (char *)&v22 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100756380();
  id v15 = a3;
  uint64_t v16 = self;
  id result = (id)sub_1007563D0();
  if (((unint64_t)result & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_13;
  }
  uint64_t v18 = *(uint64_t *)((char *)&v16->super.super.super.super.isa
                   + OBJC_IVAR____TtC22SubscribePageExtension35DebugTodayCardTriggerViewController_sections);
  if ((unint64_t)result >= *(void *)(v18 + 16))
  {
LABEL_13:
    __break(1u);
    return result;
  }
  if (*(unsigned char *)(v18 + 32 * (void)result + 56) == 2)
  {
    uint64_t v19 = 1;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v14, v10, v6);
    uint64_t v19 = 0;
  }
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v7 + 56))(v14, v19, 1, v6);

  v20 = *(void (**)(char *, uint64_t))(v7 + 8);
  v20(v10, v6);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v14, 1, v6) == 1)
  {
    Class isa = 0;
  }
  else
  {
    Class isa = sub_100756340().super.isa;
    v20(v14, v6);
  }

  return isa;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v6 = sub_100756440();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6, v8);
  uint64_t v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100756380();
  id v11 = a3;
  uint64_t v12 = self;
  sub_1002FB4AC();

  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
}

- (_TtC22SubscribePageExtension35DebugTodayCardTriggerViewController)initWithStyle:(int64_t)a3
{
  id result = (_TtC22SubscribePageExtension35DebugTodayCardTriggerViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC22SubscribePageExtension35DebugTodayCardTriggerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  id result = (_TtC22SubscribePageExtension35DebugTodayCardTriggerViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();

  swift_bridgeObjectRelease();
}

@end