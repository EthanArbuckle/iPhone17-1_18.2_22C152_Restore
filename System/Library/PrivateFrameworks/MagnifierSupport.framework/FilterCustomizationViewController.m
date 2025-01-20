@interface FilterCustomizationViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4;
- (_TtC16MagnifierSupport33FilterCustomizationViewController)initWithCoder:(id)a3;
- (_TtC16MagnifierSupport33FilterCustomizationViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation FilterCustomizationViewController

- (void)viewDidLoad
{
  v2 = self;
  sub_23575C7DC();
}

- (void)viewWillAppear:(BOOL)a3
{
  v4 = self;
  sub_23575C978(a3);
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (_TtC16MagnifierSupport33FilterCustomizationViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    uint64_t v5 = sub_235949AC8();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  return (_TtC16MagnifierSupport33FilterCustomizationViewController *)sub_23575CB40(v5, v7, a4);
}

- (_TtC16MagnifierSupport33FilterCustomizationViewController)initWithCoder:(id)a3
{
  return (_TtC16MagnifierSupport33FilterCustomizationViewController *)sub_23575CD04(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport33FilterCustomizationViewController_tableView));
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 2;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  if (a4 == 1)
  {
    uint64_t v11 = qword_26880E598;
    id v12 = a3;
    v13 = self;
    if (v11 != -1) {
      swift_once();
    }
    int64_t v10 = *(void *)(qword_26882BFC8 + 16);
  }
  else if (a4)
  {
    return 0;
  }
  else
  {
    uint64_t v5 = qword_26E8BD030;
    uint64_t v6 = qword_26880E598;
    id v7 = a3;
    id v8 = self;
    if (v6 != -1) {
      swift_once();
    }
    uint64_t v9 = *(void *)(qword_26882BFC8 + 16);

    return v5 - v9;
  }
  return v10;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v6 = sub_235947B38();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6, v8, v9, v10, v11);
  v13 = (char *)&v18 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_235947AC8();
  id v14 = a3;
  v15 = self;
  id v16 = sub_23575CF84(v14);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v13, v6);
  return v16;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  return sub_23575D39C((uint64_t)self, (uint64_t)a2, (uint64_t)a3, a4, (void (*)(uint64_t))sub_23575DAC8);
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  return sub_23575D39C((uint64_t)self, (uint64_t)a2, (uint64_t)a3, a4, (void (*)(uint64_t))sub_23575DBCC);
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  uint64_t v6 = sub_235947B38();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6, v8, v9, v10, v11);
  v13 = (char *)&v17 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_235947AC8();
  id v14 = a3;
  v15 = self;
  LOBYTE(self) = sub_23575DCD0();

  (*(void (**)(char *, uint64_t))(v7 + 8))(v13, v6);
  return self & 1;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v6 = sub_235947B38();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6, v8, v9, v10, v11);
  v13 = (char *)&v16 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_235947AC8();
  id v14 = a3;
  v15 = self;
  sub_23575D4F8(v14);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v13, v6);
}

@end