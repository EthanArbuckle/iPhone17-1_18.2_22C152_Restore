@interface UIKitFocusableViewResponderItem
- (BOOL)canBecomeFocused;
- (BOOL)shouldUpdateFocusInContext:(id)a3;
- (CGRect)frame;
- (NSArray)preferredFocusEnvironments;
- (NSString)swiftui_focusGroupIdentifier;
- (UIFocusEffect)focusEffect;
- (UIFocusEnvironment)parentFocusEnvironment;
- (UIFocusItemContainer)focusItemContainer;
- (UIResponder)nextResponder;
- (_TtC7SwiftUIP33_B6A2D4E72E5722B5103497ADB7778B5F31UIKitFocusableViewResponderItem)init;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)setFrame:(CGRect)a3;
- (void)setNeedsFocusUpdate;
- (void)updateFocusIfNeeded;
@end

@implementation UIKitFocusableViewResponderItem

- (CGRect)frame
{
  double v2 = *(double *)((char *)&self->super.super.super.isa
                 + OBJC_IVAR____TtC7SwiftUIP33_B6A2D4E72E5722B5103497ADB7778B5F31UIKitFocusableViewResponderItem_frame);
  double v3 = *(double *)((char *)&self->super.super._responderFlags
                 + OBJC_IVAR____TtC7SwiftUIP33_B6A2D4E72E5722B5103497ADB7778B5F31UIKitFocusableViewResponderItem_frame);
  double v4 = *(double *)((char *)&self->super.super.__layeringSceneIdentity
                 + OBJC_IVAR____TtC7SwiftUIP33_B6A2D4E72E5722B5103497ADB7778B5F31UIKitFocusableViewResponderItem_frame);
  double v5 = *(double *)&self->base[OBJC_IVAR____TtC7SwiftUIP33_B6A2D4E72E5722B5103497ADB7778B5F31UIKitFocusableViewResponderItem_frame];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setFrame:(CGRect)a3
{
  *(CGRect *)((char *)&self->super.super.super.isa
            + OBJC_IVAR____TtC7SwiftUIP33_B6A2D4E72E5722B5103497ADB7778B5F31UIKitFocusableViewResponderItem_frame) = a3;
}

- (BOOL)canBecomeFocused
{
  uint64_t Strong = swift_weakLoadStrong();
  if (Strong)
  {
    if (!*(void *)(Strong + 248))
    {
      __break(1u);
      return Strong;
    }
    char v3 = *(unsigned char *)(Strong + 236);
    swift_release();
  }
  else
  {
    char v3 = 0;
  }
  LOBYTE(Strong) = v3;
  return Strong;
}

- (UIResponder)nextResponder
{
  double v2 = self;
  char v3 = (void *)UIKitFocusableViewResponderItem.next.getter();

  return (UIResponder *)v3;
}

- (NSString)swiftui_focusGroupIdentifier
{
  double v2 = self;
  unint64_t v3 = UIKitFocusableViewResponderItem.swiftui_focusGroupIdentifier.getter();
  uint64_t v5 = v4;

  if (v5)
  {
    v6 = (void *)MEMORY[0x18C115780](v3, v5);
    swift_bridgeObjectRelease();
  }
  else
  {
    v6 = 0;
  }

  return (NSString *)v6;
}

- (UIFocusEnvironment)parentFocusEnvironment
{
  double v2 = (void *)MEMORY[0x18C119DF0]((char *)self+ OBJC_IVAR____TtC7SwiftUIP33_B6A2D4E72E5722B5103497ADB7778B5F31UIKitFocusableViewResponderItem_host, a2);

  return (UIFocusEnvironment *)v2;
}

- (NSArray)preferredFocusEnvironments
{
  type metadata accessor for _UISceneBSActionHandler(0, (unint64_t *)&lazy cache variable for type metadata for UIFocusEnvironment);
  v2.super.isa = Array._bridgeToObjectiveC()().super.isa;

  return (NSArray *)v2.super.isa;
}

- (UIFocusItemContainer)focusItemContainer
{
  return (UIFocusItemContainer *)0;
}

- (void)setNeedsFocusUpdate
{
  type metadata accessor for NSObject(0, (unint64_t *)&lazy cache variable for type metadata for UIFocusSystem);
  v6 = self;
  unint64_t v3 = (_TtC7SwiftUIP33_B6A2D4E72E5722B5103497ADB7778B5F31UIKitFocusableViewResponderItem *)static UIFocusSystem.focusSystem(for:)();
  if (v3)
  {
    uint64_t v4 = v3;
    [(UIKitFocusableViewResponderItem *)v3 requestFocusUpdateToEnvironment:v6];

    uint64_t v5 = v4;
  }
  else
  {
    uint64_t v5 = v6;
  }
}

- (void)updateFocusIfNeeded
{
  type metadata accessor for NSObject(0, (unint64_t *)&lazy cache variable for type metadata for UIFocusSystem);
  unint64_t v3 = self;
  id v4 = (id)static UIFocusSystem.focusSystem(for:)();
  objc_msgSend(v4, sel_updateFocusIfNeeded);
}

- (BOOL)shouldUpdateFocusInContext:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  LOBYTE(self) = UIKitFocusableViewResponderItem.shouldUpdateFocus(in:)(v4);

  return self & 1;
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  specialized UIKitFocusableViewResponderItem.didUpdateFocus(in:with:)(v6);
}

- (UIFocusEffect)focusEffect
{
  NSArray v2 = self;
  unint64_t v3 = (void *)UIKitFocusableViewResponderItem.focusEffect.getter();

  return (UIFocusEffect *)v3;
}

- (_TtC7SwiftUIP33_B6A2D4E72E5722B5103497ADB7778B5F31UIKitFocusableViewResponderItem)init
{
  CGRect result = (_TtC7SwiftUIP33_B6A2D4E72E5722B5103497ADB7778B5F31UIKitFocusableViewResponderItem *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_weakDestroy();
  swift_unknownObjectWeakDestroy();
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC7SwiftUIP33_B6A2D4E72E5722B5103497ADB7778B5F31UIKitFocusableViewResponderItem_contentPath);
  uint64_t v4 = *(void *)((char *)&self->super.super._responderFlags
                 + OBJC_IVAR____TtC7SwiftUIP33_B6A2D4E72E5722B5103497ADB7778B5F31UIKitFocusableViewResponderItem_contentPath);
  uint64_t v5 = *(uint64_t *)((char *)&self->super.super.__layeringSceneIdentity
                  + OBJC_IVAR____TtC7SwiftUIP33_B6A2D4E72E5722B5103497ADB7778B5F31UIKitFocusableViewResponderItem_contentPath);
  uint64_t v6 = *(void *)&self->base[OBJC_IVAR____TtC7SwiftUIP33_B6A2D4E72E5722B5103497ADB7778B5F31UIKitFocusableViewResponderItem_contentPath];
  unsigned __int8 v7 = self->host[OBJC_IVAR____TtC7SwiftUIP33_B6A2D4E72E5722B5103497ADB7778B5F31UIKitFocusableViewResponderItem_contentPath];

  outlined consume of Path?(v3, v4, v5, v6, v7);
}

@end