@interface DOCServiceViewController
- (BOOL)isBrowserViewController;
- (BOOL)shouldOverrideWindowAppearance;
- (DOCConfiguration)configuration;
- (NSArray)preferredFocusEnvironments;
- (UIViewController)childViewControllerForScreenEdgesDeferringSystemGestures;
- (_TtC33com_apple_DocumentManager_Service24DOCServiceViewController)initWithCoder:(id)a3;
- (_TtC33com_apple_DocumentManager_Service24DOCServiceViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)embedViewController:(id)a3;
- (void)loadView;
- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3;
- (void)setIsBrowserViewController:(BOOL)a3;
- (void)setShouldOverrideWindowAppearance:(BOOL)a3;
- (void)updateAppearance:(id)a3 completionBlock:(id)a4;
- (void)updateAppearance:(id)a3 shouldFlushCA:(BOOL)a4 completionBlock:(id)a5;
- (void)updateEditingTo:(BOOL)a3 animated:(BOOL)a4;
- (void)viewDidLoad;
- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4;
@end

@implementation DOCServiceViewController

- (DOCConfiguration)configuration
{
  result = *(Class *)((char *)&self->super.super.super.isa
                    + OBJC_IVAR____TtC33com_apple_DocumentManager_Service24DOCServiceViewController__configuration);
  if (result) {
    return result;
  }
  __break(1u);
  return result;
}

- (BOOL)isBrowserViewController
{
  return *((unsigned char *)&self->super.super.super.isa
         + OBJC_IVAR____TtC33com_apple_DocumentManager_Service24DOCServiceViewController_isBrowserViewController);
}

- (void)setIsBrowserViewController:(BOOL)a3
{
  *((unsigned char *)&self->super.super.super.isa
  + OBJC_IVAR____TtC33com_apple_DocumentManager_Service24DOCServiceViewController_isBrowserViewController) = a3;
}

- (BOOL)shouldOverrideWindowAppearance
{
  return *((unsigned char *)&self->super.super.super.isa
         + OBJC_IVAR____TtC33com_apple_DocumentManager_Service24DOCServiceViewController_shouldOverrideWindowAppearance);
}

- (void)setShouldOverrideWindowAppearance:(BOOL)a3
{
  *((unsigned char *)&self->super.super.super.isa
  + OBJC_IVAR____TtC33com_apple_DocumentManager_Service24DOCServiceViewController_shouldOverrideWindowAppearance) = a3;
}

- (_TtC33com_apple_DocumentManager_Service24DOCServiceViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    uint64_t v5 = sub_1004CD2F0();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  return (_TtC33com_apple_DocumentManager_Service24DOCServiceViewController *)sub_1004C4F98(v5, v7, a4);
}

- (_TtC33com_apple_DocumentManager_Service24DOCServiceViewController)initWithCoder:(id)a3
{
  return (_TtC33com_apple_DocumentManager_Service24DOCServiceViewController *)sub_1004C5144(a3);
}

- (void)loadView
{
  type metadata accessor for DOCServiceView();
  id v3 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  v4 = self;
  id v5 = [v3 init];
  [(DOCServiceViewController *)v4 setView:v5];
}

- (void)viewDidLoad
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for DOCServiceViewController();
  id v2 = v6.receiver;
  [(DOCServiceViewController *)&v6 viewDidLoad];
  id v3 = objc_msgSend(v2, "view", v6.receiver, v6.super_class);
  if (v3)
  {
    v4 = v3;
    id v5 = [v3 layer];

    [v5 setHitTestsAsOpaque:1];
  }
  else
  {
    __break(1u);
  }
}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  BOOL v4 = a4;
  if (a3)
  {
    if ((*((unsigned char *)&self->super.super.super.isa
          + OBJC_IVAR____TtC33com_apple_DocumentManager_Service24DOCServiceViewController_shouldOverrideWindowAppearance) & 1) != 0)
    {
      uint64_t v7 = *(uint64_t *)((char *)&self->super.super.super.isa
                      + OBJC_IVAR____TtC33com_apple_DocumentManager_Service24DOCServiceViewController_lastAppearance);
      id v8 = self;
      [a3 setAppearance:v7];
    }
    else
    {
      v10 = self;
      id v11 = a3;
    }
  }
  else
  {
    v9 = self;
  }
  v12.receiver = self;
  v12.super_class = (Class)type metadata accessor for DOCServiceViewController();
  [(DOCServiceViewController *)&v12 viewDidMoveToWindow:a3 shouldAppearOrDisappear:v4];
}

- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for DOCServiceViewController();
  swift_unknownObjectRetain();
  id v4 = v5.receiver;
  [(DOCServiceViewController *)&v5 preferredContentSizeDidChangeForChildContentContainer:a3];
  objc_msgSend(a3, "preferredContentSize", v5.receiver, v5.super_class);
  objc_msgSend(v4, "setPreferredContentSize:");
  swift_unknownObjectRelease();
}

- (UIViewController)childViewControllerForScreenEdgesDeferringSystemGestures
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();
  return (UIViewController *)Strong;
}

- (void)updateAppearance:(id)a3 completionBlock:(id)a4
{
  objc_super v6 = _Block_copy(a4);
  if (v6)
  {
    uint64_t v7 = swift_allocObject();
    *(void *)(v7 + 16) = v6;
    objc_super v6 = sub_1004BF478;
  }
  else
  {
    uint64_t v7 = 0;
  }
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = self;
  *(void *)(v8 + 24) = a3;
  *(void *)(v8 + 32) = v6;
  *(void *)(v8 + 40) = v7;
  *(unsigned char *)(v8 + 48) = 0;
  v13[4] = sub_1004C612C;
  v13[5] = v8;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 1107296256;
  v13[2] = sub_100041BA4;
  v13[3] = &unk_1005DF210;
  v9 = _Block_copy(v13);
  id v10 = a3;
  id v11 = self;
  id v12 = v10;
  sub_100042900((uint64_t)v6);
  swift_release();
  DOCRunInMainThread();
  _Block_release(v9);
  sub_10003B0A8((uint64_t)v6);
}

- (void)updateAppearance:(id)a3 shouldFlushCA:(BOOL)a4 completionBlock:(id)a5
{
  uint64_t v8 = _Block_copy(a5);
  if (v8)
  {
    uint64_t v9 = swift_allocObject();
    *(void *)(v9 + 16) = v8;
    uint64_t v8 = sub_1004BF490;
  }
  else
  {
    uint64_t v9 = 0;
  }
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = self;
  *(void *)(v10 + 24) = a3;
  *(void *)(v10 + 32) = v8;
  *(void *)(v10 + 40) = v9;
  *(unsigned char *)(v10 + 48) = a4;
  v15[4] = sub_1004C612C;
  v15[5] = v10;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 1107296256;
  v15[2] = sub_100041BA4;
  v15[3] = &unk_1005DF148;
  id v11 = _Block_copy(v15);
  id v12 = a3;
  v13 = self;
  id v14 = v12;
  sub_100042900((uint64_t)v8);
  swift_release();
  DOCRunInMainThread();
  _Block_release(v11);
  sub_10003B0A8((uint64_t)v8);
}

- (void)updateEditingTo:(BOOL)a3 animated:(BOOL)a4
{
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = self;
  *(unsigned char *)(v7 + 24) = a3;
  *(unsigned char *)(v7 + 25) = a4;
  v10[4] = sub_1004C610C;
  v10[5] = v7;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 1107296256;
  v10[2] = sub_100041BA4;
  v10[3] = &unk_1005DF0F8;
  uint64_t v8 = _Block_copy(v10);
  uint64_t v9 = self;
  swift_release();
  DOCRunInMainThread();
  _Block_release(v8);
}

- (NSArray)preferredFocusEnvironments
{
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v4 = Strong;
    sub_100027178((uint64_t *)&unk_10062C9C0);
    uint64_t v5 = swift_allocObject();
    *(_OWORD *)(v5 + 16) = xmmword_1004E5180;
    *(void *)(v5 + 32) = v4;
    sub_1004CD5E0();
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)type metadata accessor for DOCServiceViewController();
    objc_super v6 = self;
    uint64_t v7 = [(DOCServiceViewController *)&v10 preferredFocusEnvironments];
    sub_100027178((uint64_t *)&unk_10062BE70);
    sub_1004CD5C0();
  }
  sub_100027178((uint64_t *)&unk_10062BE70);
  v8.super.isa = sub_1004CD5A0().super.isa;
  swift_bridgeObjectRelease();
  return (NSArray *)v8.super.isa;
}

- (void)embedViewController:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_1004C5DC0(v4);
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC33com_apple_DocumentManager_Service24DOCServiceViewController__configuration));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC33com_apple_DocumentManager_Service24DOCServiceViewController_lastAppearance);
}

@end