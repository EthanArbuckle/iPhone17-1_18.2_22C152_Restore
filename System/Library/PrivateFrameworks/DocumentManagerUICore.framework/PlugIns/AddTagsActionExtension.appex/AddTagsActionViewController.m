@interface AddTagsActionViewController
- (_TtC22AddTagsActionExtension27AddTagsActionViewController)initWithCoder:(id)a3;
- (_TtC22AddTagsActionExtension27AddTagsActionViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation AddTagsActionViewController

- (void)viewDidLoad
{
  v2 = self;
  sub_100005144();
}

- (void)viewWillAppear:(BOOL)a3
{
  v4 = self;
  sub_100005A04(a3);
}

- (void)dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4
{
  v6 = _Block_copy(a4);
  if (v6)
  {
    uint64_t v7 = swift_allocObject();
    *(void *)(v7 + 16) = v6;
    v6 = sub_100005FC0;
  }
  else
  {
    uint64_t v7 = 0;
  }
  v8 = self;
  sub_100005B94(a3, v6, v7);
  sub_100005F78((uint64_t)v6);
}

- (_TtC22AddTagsActionExtension27AddTagsActionViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    sub_100006EE8();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v7 = 0;
  }
  uint64_t v8 = OBJC_IVAR____TtC22AddTagsActionExtension27AddTagsActionViewController_actionExtensionController;
  id v9 = objc_allocWithZone((Class)type metadata accessor for AddTagsActionExtensionController());
  v10 = self;
  id v11 = a4;
  *(void *)&self->DOCTagEditorViewController_opaque[v8] = [v9 init];

  if (v7)
  {
    NSString v12 = sub_100006ED8();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v12 = 0;
  }
  v15.receiver = v10;
  v15.super_class = (Class)type metadata accessor for AddTagsActionViewController();
  v13 = [(AddTagsActionViewController *)&v15 initWithNibName:v12 bundle:v11];

  return v13;
}

- (_TtC22AddTagsActionExtension27AddTagsActionViewController)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC22AddTagsActionExtension27AddTagsActionViewController_actionExtensionController;
  id v6 = objc_allocWithZone((Class)type metadata accessor for AddTagsActionExtensionController());
  id v7 = a3;
  uint64_t v8 = self;
  *(void *)&self->DOCTagEditorViewController_opaque[v5] = [v6 init];

  v11.receiver = v8;
  v11.super_class = (Class)type metadata accessor for AddTagsActionViewController();
  id v9 = [(AddTagsActionViewController *)&v11 initWithCoder:v7];

  return v9;
}

- (void).cxx_destruct
{
}

@end