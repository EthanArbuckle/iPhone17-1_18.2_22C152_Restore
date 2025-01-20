@interface DisplayLink
+ (void)asyncThreadWithArg:(id)a3;
- (_TtC7SwiftUI11DisplayLink)init;
- (void)displayLinkTimer:(id)a3;
@end

@implementation DisplayLink

- (void)displayLinkTimer:(id)a3
{
  id v4 = a3;
  v5 = self;
  DisplayLink.displayLinkTimer(_:)(v4);
}

+ (void)asyncThreadWithArg:(id)a3
{
  if (a3)
  {
    swift_unknownObjectRetain();
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v3, 0, sizeof(v3));
  }
  specialized static DisplayLink.asyncThread(arg:)();
  outlined destroy of Any?((uint64_t)v3);
}

- (_TtC7SwiftUI11DisplayLink)init
{
  result = (_TtC7SwiftUI11DisplayLink *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_weakDestroy();

  swift_bridgeObjectRelease();
}

@end