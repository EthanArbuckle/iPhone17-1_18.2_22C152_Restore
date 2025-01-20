@interface AccountPageViewController
- (_TtC22SubscribePageExtension25AccountPageViewController)initWithAccountURL:(id)a3;
- (_TtC22SubscribePageExtension25AccountPageViewController)initWithCoder:(id)a3;
- (_TtC22SubscribePageExtension25AccountPageViewController)initWithNibName:(id)a3 bundle:(id)a4;
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

- (_TtC22SubscribePageExtension25AccountPageViewController)initWithAccountURL:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v6 = sub_10000FB44((uint64_t *)&unk_100938040);
  __chkstk_darwin(v6 - 8, v7);
  v9 = (char *)&v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10, v11);
  v13 = (char *)&v21 - v12;
  if (a3)
  {
    sub_100755E60();
    uint64_t v14 = sub_100755EA0();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v13, 0, 1, v14);
  }
  else
  {
    uint64_t v14 = sub_100755EA0();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v13, 1, 1, v14);
  }
  sub_10005B9E0((uint64_t)v13, (uint64_t)v9);
  sub_100755EA0();
  uint64_t v15 = *(void *)(v14 - 8);
  v17 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v9, 1, v14) != 1)
  {
    sub_100755E50(v16);
    v17 = v18;
    (*(void (**)(char *, uint64_t))(v15 + 8))(v9, v14);
  }
  v21.receiver = self;
  v21.super_class = ObjectType;
  v19 = [(AccountPageViewController *)&v21 initWithAccountURL:v17];

  sub_1001600AC((uint64_t)v13);
  return v19;
}

- (_TtC22SubscribePageExtension25AccountPageViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  ObjectType = (objc_class *)swift_getObjectType();
  if (a3)
  {
    sub_1007675F0();
    id v8 = a4;
    a3 = sub_1007675C0();
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

- (_TtC22SubscribePageExtension25AccountPageViewController)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  return [(AccountPageViewController *)&v5 initWithCoder:a3];
}

@end