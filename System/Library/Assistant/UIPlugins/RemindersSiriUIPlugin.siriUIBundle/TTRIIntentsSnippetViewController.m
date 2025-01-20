@interface TTRIIntentsSnippetViewController
- (UITableView)tableView;
- (_TtC21RemindersSiriUIPlugin32TTRIIntentsSnippetViewController)initWithCoder:(id)a3;
- (_TtC21RemindersSiriUIPlugin32TTRIIntentsSnippetViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (double)desiredHeightForWidth:(double)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)configureViewForParameters:(id)a3 ofInteraction:(id)a4 context:(unint64_t)a5 completion:(id)a6;
- (void)desiresInteractivity:(id)a3;
- (void)setTableView:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
@end

@implementation TTRIIntentsSnippetViewController

- (UITableView)tableView
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (UITableView *)Strong;
}

- (void)setTableView:(id)a3
{
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return *(void *)(*(void *)&self->SiriUISnippetViewController_opaque[OBJC_IVAR____TtC21RemindersSiriUIPlugin32TTRIIntentsSnippetViewController_viewModel]
                   + 16);
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v6 = sub_25050();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25010();
  id v10 = a3;
  v11 = self;
  id v12 = sub_12B9C((uint64_t)v9);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);

  return v12;
}

- (void)viewDidLoad
{
  v2 = self;
  sub_D4B0();
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v6 = sub_25050();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25010();
  id v10 = a3;
  v11 = self;
  sub_12FE8();

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (_TtC21RemindersSiriUIPlugin32TTRIIntentsSnippetViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    uint64_t v5 = sub_25330();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  return (_TtC21RemindersSiriUIPlugin32TTRIIntentsSnippetViewController *)sub_E930(v5, v7, a4);
}

- (_TtC21RemindersSiriUIPlugin32TTRIIntentsSnippetViewController)initWithCoder:(id)a3
{
  return (_TtC21RemindersSiriUIPlugin32TTRIIntentsSnippetViewController *)sub_EB54(a3);
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_unknownObjectWeakDestroy();

  swift_bridgeObjectRelease();
}

- (double)desiredHeightForWidth:(double)a3
{
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (!Strong) {
    return 0.0;
  }
  uint64_t v5 = (void *)Strong;
  uint64_t v6 = self;
  [v5 contentSize];
  sub_F7FC(0, v7, v8, v7, v8);
  double v10 = v9;

  return v10;
}

- (void)desiresInteractivity:(id)a3
{
  v4 = (void (**)(const void *, uint64_t))_Block_copy(a3);
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = v4[2];
    double v7 = self;
    v6(v5, 1);
    _Block_release(v5);
  }
  else
  {
    __break(1u);
  }
}

- (void)configureViewForParameters:(id)a3 ofInteraction:(id)a4 context:(unint64_t)a5 completion:(id)a6
{
  double v9 = (void (*)(uint64_t, uint64_t, __n128, __n128))_Block_copy(a6);
  if (a3)
  {
    sub_5DA0(0, &qword_32848);
    sub_141DC(&qword_32850, &qword_32848);
    a3 = (id)sub_25420();
  }
  if (v9)
  {
    *(void *)(swift_allocObject() + 16) = v9;
    double v9 = (void (*)(uint64_t, uint64_t, __n128, __n128))sub_13FB0;
  }
  id v10 = a4;
  v11 = self;
  sub_13CE0((uint64_t)a3, a4, v9, v12, v13);
  sub_13F68((uint64_t)v9);

  swift_bridgeObjectRelease();
}

@end