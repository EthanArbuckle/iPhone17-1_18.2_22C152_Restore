@interface UIKitDocumentProperties
+ (BOOL)_isFromSwiftUI;
- (_TtC7SwiftUI23UIKitDocumentProperties)initWithTitle:(id)a3 iconProvider:(id)a4 imageProvider:(id)a5;
- (_TtC7SwiftUI23UIKitDocumentProperties)initWithURL:(id)a3;
@end

@implementation UIKitDocumentProperties

- (_TtC7SwiftUI23UIKitDocumentProperties)initWithTitle:(id)a3 iconProvider:(id)a4 imageProvider:(id)a5
{
  ObjectType = (objc_class *)swift_getObjectType();
  if (a3)
  {
    uint64_t v10 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v12 = v11;
    id v13 = a4;
    id v14 = a5;
    a3 = (id)MEMORY[0x18C115780](v10, v12);
    swift_bridgeObjectRelease();
  }
  else
  {
    id v15 = a4;
    id v16 = a5;
  }
  v19.receiver = self;
  v19.super_class = ObjectType;
  v17 = [(UIDocumentProperties *)&v19 initWithTitle:a3 iconProvider:a4 imageProvider:a5];

  return v17;
}

+ (BOOL)_isFromSwiftUI
{
  return 1;
}

- (_TtC7SwiftUI23UIKitDocumentProperties)initWithURL:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v5 = type metadata accessor for URL();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static URL._unconditionallyBridgeFromObjectiveC(_:)();
  URL._bridgeToObjectiveC()(v9);
  uint64_t v11 = v10;
  v14.receiver = self;
  v14.super_class = ObjectType;
  uint64_t v12 = [(UIKitDocumentProperties *)&v14 initWithURL:v10];

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  return v12;
}

@end