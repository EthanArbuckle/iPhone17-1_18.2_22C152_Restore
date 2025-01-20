@interface AccountPageViewController
- (_TtC18ASMessagesProvider25AccountPageViewController)initWithAccountURL:(id)a3;
- (_TtC18ASMessagesProvider25AccountPageViewController)initWithCoder:(id)a3;
- (_TtC18ASMessagesProvider25AccountPageViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation AccountPageViewController

- (void)viewWillAppear:(BOOL)a3
{
}

- (void)viewDidDisappear:(BOOL)a3
{
}

- (_TtC18ASMessagesProvider25AccountPageViewController)initWithAccountURL:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v6 = sub_FD50(&qword_9526C0);
  __chkstk_darwin(v6 - 8);
  v8 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  v11 = (char *)&v19 - v10;
  if (a3)
  {
    sub_76BBF0();
    uint64_t v12 = sub_76BC30();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v11, 0, 1, v12);
  }
  else
  {
    uint64_t v12 = sub_76BC30();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v11, 1, 1, v12);
  }
  sub_5A154((uint64_t)v11, (uint64_t)v8);
  sub_76BC30();
  uint64_t v13 = *(void *)(v12 - 8);
  v15 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v8, 1, v12) != 1)
  {
    sub_76BBE0(v14);
    v15 = v16;
    (*(void (**)(char *, uint64_t))(v13 + 8))(v8, v12);
  }
  v19.receiver = self;
  v19.super_class = ObjectType;
  v17 = [(AccountPageViewController *)&v19 initWithAccountURL:v15];

  sub_B499C((uint64_t)v11);
  return v17;
}

- (_TtC18ASMessagesProvider25AccountPageViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  ObjectType = (objc_class *)swift_getObjectType();
  if (a3)
  {
    sub_77D670();
    id v8 = a4;
    a3 = sub_77D640();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v9 = a4;
  }
  v12.receiver = self;
  v12.super_class = ObjectType;
  uint64_t v10 = [(AccountPageViewController *)&v12 initWithNibName:a3 bundle:a4];

  return v10;
}

- (_TtC18ASMessagesProvider25AccountPageViewController)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  return [(AccountPageViewController *)&v5 initWithCoder:a3];
}

@end