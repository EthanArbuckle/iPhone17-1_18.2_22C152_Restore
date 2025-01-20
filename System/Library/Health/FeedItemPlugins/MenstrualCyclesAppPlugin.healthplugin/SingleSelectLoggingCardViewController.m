@interface SingleSelectLoggingCardViewController
- (BOOL)tableView:(id)a3 shouldDrawTopSeparatorForSection:(int64_t)a4;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation SingleSelectLoggingCardViewController

- (void)viewDidLoad
{
  v2 = self;
  sub_2411D56C8();
}

- (void)viewDidLayoutSubviews
{
  v2 = self;
  sub_2411D592C();
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  v6 = (char *)self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin37SingleSelectLoggingCardViewController_dataSource;
  int64_t result = MEMORY[0x245621790]((char *)self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin37SingleSelectLoggingCardViewController_dataSource, a2, a3, a4);
  if (result)
  {
    uint64_t v8 = *((void *)v6 + 1);
    swift_getObjectType();
    v9 = *(uint64_t (**)(void))(v8 + 8);
    id v10 = a3;
    v11 = self;
    int64_t v12 = v9();

    swift_unknownObjectRelease();
    return v12;
  }
  return result;
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
  int64_t v12 = sub_2411D5B20(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);

  return v12;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v6 = sub_24162BB18();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24162BAA8();
  id v10 = a3;
  v11 = self;
  sub_2411D6160(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  uint64_t v6 = sub_24162BB18();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  v9 = (char *)&v10 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24162BAA8();
  objc_msgSend(a4, sel__setShouldHaveFullLengthBottomSeparator_, 1);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (void).cxx_destruct
{
}

- (BOOL)tableView:(id)a3 shouldDrawTopSeparatorForSection:(int64_t)a4
{
  return 0;
}

@end