@interface DOCSymbolImageBarButtonItem
- (BOOL)isEqual:(id)a3;
- (_TtC17RecentsAppPopover27DOCSymbolImageBarButtonItem)init;
- (_TtC17RecentsAppPopover27DOCSymbolImageBarButtonItem)initWithCoder:(id)a3;
@end

@implementation DOCSymbolImageBarButtonItem

- (_TtC17RecentsAppPopover27DOCSymbolImageBarButtonItem)initWithCoder:(id)a3
{
  result = (_TtC17RecentsAppPopover27DOCSymbolImageBarButtonItem *)sub_1004C0670();
  __break(1u);
  return result;
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_1004C0260();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  char v6 = DOCSymbolImageBarButtonItem.isEqual(_:)((uint64_t)v8);

  sub_10003A60C((uint64_t)v8);
  return v6 & 1;
}

- (_TtC17RecentsAppPopover27DOCSymbolImageBarButtonItem)init
{
  result = (_TtC17RecentsAppPopover27DOCSymbolImageBarButtonItem *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end