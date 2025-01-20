@interface _UIPreferredContentSizeRelayingNavigationController
- (CGSize)preferredContentSize;
- (_TtC37com_apple_CloudSharingUI_CloudSharing51_UIPreferredContentSizeRelayingNavigationController)initWithCoder:(id)a3;
- (_TtC37com_apple_CloudSharingUI_CloudSharing51_UIPreferredContentSizeRelayingNavigationController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4;
- (_TtC37com_apple_CloudSharingUI_CloudSharing51_UIPreferredContentSizeRelayingNavigationController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtC37com_apple_CloudSharingUI_CloudSharing51_UIPreferredContentSizeRelayingNavigationController)initWithRootViewController:(id)a3;
- (void)preferredContentSizeDidChangeForChildContentContainer:(void *)a3;
- (void)setPreferredContentSize:(CGSize)a3;
@end

@implementation _UIPreferredContentSizeRelayingNavigationController

- (CGSize)preferredContentSize
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for _UIPreferredContentSizeRelayingNavigationController();
  [(_UIPreferredContentSizeRelayingNavigationController *)&v4 preferredContentSize];
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setPreferredContentSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v5 = self;
  sub_100009810(width, height);
}

- (_TtC37com_apple_CloudSharingUI_CloudSharing51_UIPreferredContentSizeRelayingNavigationController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4
{
  v7 = (Class *)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR____TtC37com_apple_CloudSharingUI_CloudSharing51_UIPreferredContentSizeRelayingNavigationController_preferredContentSizeDidChangeHandler);
  v8 = (objc_class *)type metadata accessor for _UIPreferredContentSizeRelayingNavigationController();
  void *v7 = 0;
  v7[1] = 0;
  v10.receiver = self;
  v10.super_class = v8;
  return [(_UIPreferredContentSizeRelayingNavigationController *)&v10 initWithNavigationBarClass:a3 toolbarClass:a4];
}

- (_TtC37com_apple_CloudSharingUI_CloudSharing51_UIPreferredContentSizeRelayingNavigationController)initWithRootViewController:(id)a3
{
  v5 = (Class *)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR____TtC37com_apple_CloudSharingUI_CloudSharing51_UIPreferredContentSizeRelayingNavigationController_preferredContentSizeDidChangeHandler);
  v6 = (objc_class *)type metadata accessor for _UIPreferredContentSizeRelayingNavigationController();
  void *v5 = 0;
  v5[1] = 0;
  v8.receiver = self;
  v8.super_class = v6;
  return [(_UIPreferredContentSizeRelayingNavigationController *)&v8 initWithRootViewController:a3];
}

- (_TtC37com_apple_CloudSharingUI_CloudSharing51_UIPreferredContentSizeRelayingNavigationController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    sub_1000C7440();
    v6 = (Class *)((char *)&self->super.super.super.super.isa
                 + OBJC_IVAR____TtC37com_apple_CloudSharingUI_CloudSharing51_UIPreferredContentSizeRelayingNavigationController_preferredContentSizeDidChangeHandler);
    void *v6 = 0;
    v6[1] = 0;
    id v7 = a4;
    NSString v8 = sub_1000C7400();
    swift_bridgeObjectRelease();
  }
  else
  {
    v9 = (Class *)((char *)&self->super.super.super.super.isa
                 + OBJC_IVAR____TtC37com_apple_CloudSharingUI_CloudSharing51_UIPreferredContentSizeRelayingNavigationController_preferredContentSizeDidChangeHandler);
    void *v9 = 0;
    v9[1] = 0;
    id v10 = a4;
    NSString v8 = 0;
  }
  v13.receiver = self;
  v13.super_class = (Class)type metadata accessor for _UIPreferredContentSizeRelayingNavigationController();
  v11 = [(_UIPreferredContentSizeRelayingNavigationController *)&v13 initWithNibName:v8 bundle:a4];

  return v11;
}

- (_TtC37com_apple_CloudSharingUI_CloudSharing51_UIPreferredContentSizeRelayingNavigationController)initWithCoder:(id)a3
{
  v5 = (Class *)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR____TtC37com_apple_CloudSharingUI_CloudSharing51_UIPreferredContentSizeRelayingNavigationController_preferredContentSizeDidChangeHandler);
  v6 = (objc_class *)type metadata accessor for _UIPreferredContentSizeRelayingNavigationController();
  void *v5 = 0;
  v5[1] = 0;
  v8.receiver = self;
  v8.super_class = v6;
  return [(_UIPreferredContentSizeRelayingNavigationController *)&v8 initWithCoder:a3];
}

- (void).cxx_destruct
{
  sub_100013344(*(uint64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR____TtC37com_apple_CloudSharingUI_CloudSharing51_UIPreferredContentSizeRelayingNavigationController_preferredContentSizeDidChangeHandler));
}

- (void)preferredContentSizeDidChangeForChildContentContainer:(void *)a3
{
  swift_unknownObjectRetain();
  id v5 = a1;
  [a3 preferredContentSize];
  objc_msgSend(v5, "setPreferredContentSize:");
  swift_unknownObjectRelease();
}

@end