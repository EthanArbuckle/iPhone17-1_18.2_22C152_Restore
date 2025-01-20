@interface UIKitBarButtonItemGroup
+ (BOOL)_isFromSwiftUI;
- (_TtC7SwiftUI23UIKitBarButtonItemGroup)initWithBarButtonItems:(id)a3 representativeItem:(id)a4;
- (_TtC7SwiftUI23UIKitBarButtonItemGroup)initWithCoder:(id)a3;
@end

@implementation UIKitBarButtonItemGroup

- (_TtC7SwiftUI23UIKitBarButtonItemGroup)initWithBarButtonItems:(id)a3 representativeItem:(id)a4
{
  ObjectType = (objc_class *)swift_getObjectType();
  type metadata accessor for NSObject(0, (unint64_t *)&lazy cache variable for type metadata for UIBarButtonItem);
  static Array._unconditionallyBridgeFromObjectiveC(_:)();
  v7 = (char *)self + OBJC_IVAR____TtC7SwiftUI23UIKitBarButtonItemGroup_groupItem;
  uint64_t v8 = type metadata accessor for ToolbarStorage.GroupItem(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v7, 1, 1, v8);
  *((unsigned char *)&self->super.super.isa + OBJC_IVAR____TtC7SwiftUI23UIKitBarButtonItemGroup_edge) = 2;
  swift_unknownObjectWeakInit();
  id v9 = a4;
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  v13.receiver = self;
  v13.super_class = ObjectType;
  v11 = [(UIBarButtonItemGroup *)&v13 initWithBarButtonItems:isa representativeItem:v9];

  return v11;
}

+ (BOOL)_isFromSwiftUI
{
  return 1;
}

- (_TtC7SwiftUI23UIKitBarButtonItemGroup)initWithCoder:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  v6 = (char *)self + OBJC_IVAR____TtC7SwiftUI23UIKitBarButtonItemGroup_groupItem;
  uint64_t v7 = type metadata accessor for ToolbarStorage.GroupItem(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v6, 1, 1, v7);
  *((unsigned char *)&self->super.super.isa + OBJC_IVAR____TtC7SwiftUI23UIKitBarButtonItemGroup_edge) = 2;
  swift_unknownObjectWeakInit();
  v9.receiver = self;
  v9.super_class = ObjectType;
  return [(UIBarButtonItemGroup *)&v9 initWithCoder:a3];
}

- (void).cxx_destruct
{
  _s7SwiftUI16PlatformItemListV0D0VSgWOhTm_0((uint64_t)self + OBJC_IVAR____TtC7SwiftUI23UIKitBarButtonItemGroup_groupItem, &lazy cache variable for type metadata for ToolbarStorage.GroupItem?, type metadata accessor for ToolbarStorage.GroupItem);

  swift_unknownObjectWeakDestroy();
}

@end