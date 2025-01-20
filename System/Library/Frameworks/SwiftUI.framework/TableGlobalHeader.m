@interface TableGlobalHeader
- (_TtC7SwiftUI17TableGlobalHeader)initWithCoder:(id)a3;
- (_TtC7SwiftUI17TableGlobalHeader)initWithFrame:(CGRect)a3;
- (void)_bridgedUpdateConfigurationUsingState:(id)a3;
@end

@implementation TableGlobalHeader

- (void)_bridgedUpdateConfigurationUsingState:(id)a3
{
  uint64_t v4 = type metadata accessor for UICellConfigurationState();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UICellConfigurationState._unconditionallyBridgeFromObjectiveC(_:)();
  v8 = self;
  TableGlobalHeader.updateConfiguration(using:)((uint64_t)v7);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (_TtC7SwiftUI17TableGlobalHeader)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v9 = (char *)self + OBJC_IVAR____TtC7SwiftUI17TableGlobalHeader_globalHeader;
  *(_OWORD *)uint64_t v9 = xmmword_18834BB90;
  *((_OWORD *)v9 + 1) = 0u;
  *((_OWORD *)v9 + 2) = 0u;
  *((_OWORD *)v9 + 3) = 0u;
  *(_DWORD *)(v9 + 63) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC7SwiftUI17TableGlobalHeader_headerLeadingMargin) = 0;
  v11.receiver = self;
  v11.super_class = ObjectType;
  return -[TableGlobalHeader initWithFrame:](&v11, sel_initWithFrame_, x, y, width, height);
}

- (_TtC7SwiftUI17TableGlobalHeader)initWithCoder:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v6 = (char *)self + OBJC_IVAR____TtC7SwiftUI17TableGlobalHeader_globalHeader;
  *(_OWORD *)uint64_t v6 = xmmword_18834BB90;
  *((_OWORD *)v6 + 1) = 0u;
  *((_OWORD *)v6 + 2) = 0u;
  *((_OWORD *)v6 + 3) = 0u;
  *(_DWORD *)(v6 + 63) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC7SwiftUI17TableGlobalHeader_headerLeadingMargin) = 0;
  v8.receiver = self;
  v8.super_class = ObjectType;
  return [(TableGlobalHeader *)&v8 initWithCoder:a3];
}

- (void).cxx_destruct
{
}

@end