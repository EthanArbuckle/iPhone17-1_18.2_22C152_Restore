@interface UIKitBarButtonItem
+ (BOOL)_isFromSwiftUI;
- (NSArray)accessibilityCustomActions;
- (NSString)accessibilityHint;
- (NSString)accessibilityIdentifier;
- (NSString)accessibilityLabel;
- (NSString)accessibilityValue;
- (_TtC7SwiftUI18UIKitBarButtonItem)init;
- (_TtC7SwiftUI18UIKitBarButtonItem)initWithCoder:(id)a3;
- (unint64_t)accessibilityTraits;
- (void)performAction:(id)a3;
@end

@implementation UIKitBarButtonItem

+ (BOOL)_isFromSwiftUI
{
  return 1;
}

- (_TtC7SwiftUI18UIKitBarButtonItem)initWithCoder:(id)a3
{
  id v3 = a3;
  specialized UIKitBarButtonItem.init(coder:)();
}

- (void)performAction:(id)a3
{
  type metadata accessor for ToolbarStorage.Item?(0, (unint64_t *)&lazy cache variable for type metadata for PlatformItemList.Item?, (uint64_t (*)(uint64_t))type metadata accessor for PlatformItemList.Item, MEMORY[0x1E4FBB718]);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5 - 8);
  v8 = (char *)v15 - v7 + 16;
  if (a3)
  {
    v9 = self;
    swift_unknownObjectRetain();
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v15, 0, sizeof(v15));
    v10 = self;
  }
  v11 = (char *)self + OBJC_IVAR____TtC7SwiftUI18UIKitBarButtonItem_platformItem;
  swift_beginAccess();
  _s7SwiftUI16PlatformItemListV0D0VSgWOcTm_0((uint64_t)v11, (uint64_t)v8, (unint64_t *)&lazy cache variable for type metadata for PlatformItemList.Item?, (uint64_t (*)(uint64_t))type metadata accessor for PlatformItemList.Item);
  unint64_t v12 = (*(unsigned __int8 *)(v6 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  uint64_t v13 = swift_allocObject();
  outlined init with take of SharingActivityPickerPresentation?((uint64_t)v8, v13 + v12, (uint64_t)&lazy cache variable for type metadata for PlatformItemList.Item?, (uint64_t)type metadata accessor for PlatformItemList.Item, MEMORY[0x1E4FBB718], (uint64_t (*)(void, uint64_t, uint64_t, uint64_t))type metadata accessor for ToolbarStorage.Item?);
  static Update.enqueueAction(_:)();

  swift_release();
  _sypSgWOhTm_11((uint64_t)v15, (unint64_t *)&lazy cache variable for type metadata for Any?, MEMORY[0x1E4FBC840] + 8);
}

- (NSString)accessibilityIdentifier
{
  return (NSString *)@objc UIKitBarButtonItem.accessibilityIdentifier.getter(self, (uint64_t)a2, (SEL *)&selRef_accessibilityIdentifier);
}

- (NSString)accessibilityLabel
{
  return (NSString *)@objc UIKitBarButtonItem.accessibilityIdentifier.getter(self, (uint64_t)a2, (SEL *)&selRef_accessibilityLabel);
}

- (NSString)accessibilityHint
{
  return (NSString *)@objc UIKitBarButtonItem.accessibilityIdentifier.getter(self, (uint64_t)a2, (SEL *)&selRef_accessibilityHint);
}

- (NSString)accessibilityValue
{
  return (NSString *)@objc UIKitBarButtonItem.accessibilityIdentifier.getter(self, (uint64_t)a2, (SEL *)&selRef_accessibilityValue);
}

- (unint64_t)accessibilityTraits
{
  v2 = self;
  id v3 = UIKitBarButtonItem.accessibilityTraits.getter();

  return (unint64_t)v3;
}

- (NSArray)accessibilityCustomActions
{
  v2 = self;
  uint64_t v3 = UIKitBarButtonItem.accessibilityCustomActions.getter();

  if (v3)
  {
    type metadata accessor for NSObject(0, &lazy cache variable for type metadata for UIAccessibilityCustomAction);
    v4.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v4.super.isa = 0;
  }

  return (NSArray *)v4.super.isa;
}

- (_TtC7SwiftUI18UIKitBarButtonItem)init
{
  result = (_TtC7SwiftUI18UIKitBarButtonItem *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  outlined destroy of weak FallbackResponderProvider?((uint64_t)self + OBJC_IVAR____TtC7SwiftUI18UIKitBarButtonItem_menuDelegate);
  _s7SwiftUI16PlatformItemListV0D0VSgWOhTm_0((uint64_t)self + OBJC_IVAR____TtC7SwiftUI18UIKitBarButtonItem_platformItem, (unint64_t *)&lazy cache variable for type metadata for PlatformItemList.Item?, (uint64_t (*)(uint64_t))type metadata accessor for PlatformItemList.Item);
}

@end