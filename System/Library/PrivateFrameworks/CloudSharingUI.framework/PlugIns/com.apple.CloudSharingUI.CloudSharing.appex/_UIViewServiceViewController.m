@interface _UIViewServiceViewController
- (_TtC37com_apple_CloudSharingUI_CloudSharing28_UIViewServiceViewController)initWithCoder:(id)a3;
- (_TtC37com_apple_CloudSharingUI_CloudSharing28_UIViewServiceViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5;
- (void)viewDidLayoutSubviews;
@end

@implementation _UIViewServiceViewController

- (_TtC37com_apple_CloudSharingUI_CloudSharing28_UIViewServiceViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  return (_TtC37com_apple_CloudSharingUI_CloudSharing28_UIViewServiceViewController *)sub_10000A0D8((uint64_t)self, (uint64_t)a2, (uint64_t)a3, a4, (uint64_t (*)(uint64_t, uint64_t, void *))sub_100009B2C);
}

- (_TtC37com_apple_CloudSharingUI_CloudSharing28_UIViewServiceViewController)initWithCoder:(id)a3
{
  result = (_TtC37com_apple_CloudSharingUI_CloudSharing28_UIViewServiceViewController *)sub_1000C7980();
  __break(1u);
  return result;
}

- (void)viewDidLayoutSubviews
{
  v2.receiver = self;
  v2.super_class = (Class)type metadata accessor for _UIViewServiceViewController();
  [(_UIViewServiceViewController *)&v2 viewDidLayoutSubviews];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC37com_apple_CloudSharingUI_CloudSharing28_UIViewServiceViewController_containedNavController));
}

- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5
{
  id v7 = a3;
  id v8 = a4;
  v9 = self;
  [v8 preferredContentSize];
  objc_msgSend(v7, "setPreferredContentSize:");
}

@end