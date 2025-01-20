@interface ExtensionViewController
- (ExtensionViewController)initWithCoder:(id)a3;
- (ExtensionViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)setupWithParameters:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation ExtensionViewController

- (ExtensionViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    uint64_t v5 = sub_1007675F0();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  return (ExtensionViewController *)sub_1004C57B0(v5, v7, a4);
}

- (ExtensionViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1004C6114();
}

- (void)viewDidLoad
{
  v6.receiver = self;
  v6.super_class = (Class)swift_getObjectType();
  id v2 = v6.receiver;
  [(ExtensionViewController *)&v6 viewDidLoad];
  id v3 = objc_msgSend(v2, "view", v6.receiver, v6.super_class);
  if (v3)
  {
    v4 = v3;
    id v5 = [self clearColor];
    [v4 setBackgroundColor:v5];
  }
  else
  {
    __break(1u);
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  id v4 = v5.receiver;
  [(ExtensionViewController *)&v5 viewDidAppear:v3];
  sub_100763200();
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  id v4 = v5.receiver;
  [(ExtensionViewController *)&v5 viewWillAppear:v3];
  sub_1004C5D40();
}

- (void)setupWithParameters:(id)a3
{
  uint64_t v4 = sub_100767480();
  objc_super v5 = self;
  sub_1004C5EBC(v4);

  swift_bridgeObjectRelease();
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  BOOL v3 = *(void **)&self->SKStoreExtension_opaque[OBJC_IVAR___ExtensionViewController_rootViewController];
}

@end