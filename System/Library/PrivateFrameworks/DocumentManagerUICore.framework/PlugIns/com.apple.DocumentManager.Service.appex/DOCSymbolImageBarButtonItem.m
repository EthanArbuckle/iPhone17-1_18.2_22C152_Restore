@interface DOCSymbolImageBarButtonItem
- (BOOL)isEqual:(id)a3;
- (_TtC33com_apple_DocumentManager_Service27DOCSymbolImageBarButtonItem)init;
- (_TtC33com_apple_DocumentManager_Service27DOCSymbolImageBarButtonItem)initWithCoder:(id)a3;
@end

@implementation DOCSymbolImageBarButtonItem

- (_TtC33com_apple_DocumentManager_Service27DOCSymbolImageBarButtonItem)initWithCoder:(id)a3
{
  result = (_TtC33com_apple_DocumentManager_Service27DOCSymbolImageBarButtonItem *)sub_1004CEE70();
  __break(1u);
  return result;
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_1004CEA50();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  char v6 = DOCSymbolImageBarButtonItem.isEqual(_:)((uint64_t)v8);

  sub_1000608B0((uint64_t)v8);
  return v6 & 1;
}

- (_TtC33com_apple_DocumentManager_Service27DOCSymbolImageBarButtonItem)init
{
  result = (_TtC33com_apple_DocumentManager_Service27DOCSymbolImageBarButtonItem *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end