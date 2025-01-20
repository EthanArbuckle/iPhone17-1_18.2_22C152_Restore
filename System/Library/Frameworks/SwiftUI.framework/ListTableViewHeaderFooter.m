@interface ListTableViewHeaderFooter
- (BOOL)isAccessibilityElement;
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC7SwiftUI25ListTableViewHeaderFooter)initWithCoder:(id)a3;
- (_TtC7SwiftUI25ListTableViewHeaderFooter)initWithReuseIdentifier:(id)a3;
- (void)_bridgedUpdateConfigurationUsingState:(id)a3;
- (void)prepareForReuse;
@end

@implementation ListTableViewHeaderFooter

- (void)prepareForReuse
{
  v2 = self;
  ListTableViewHeaderFooter.prepareForReuse()();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  if (*(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC7SwiftUI25ListTableViewHeaderFooter_host))
  {
    v3 = self;
    id v4 = [(ListTableViewHeaderFooter *)v3 contentView];
    objc_msgSend(v4, sel_bounds);

    double v5 = specialized PlatformListViewBase<>.hostSizeThatFits(width:)();
    double v7 = v6;
  }
  else
  {
    double height = a3.height;
    double width = a3.width;
    v14.receiver = self;
    v14.super_class = (Class)type metadata accessor for ListTableViewHeaderFooter();
    -[ListTableViewHeaderFooter sizeThatFits:](&v14, sel_sizeThatFits_, width, height);
    double v5 = v10;
    double v7 = v11;
  }
  double v12 = v5;
  double v13 = v7;
  result.double height = v13;
  result.double width = v12;
  return result;
}

- (void)_bridgedUpdateConfigurationUsingState:(id)a3
{
  uint64_t v4 = type metadata accessor for UIViewConfigurationState();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  double v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UIViewConfigurationState._unconditionallyBridgeFromObjectiveC(_:)();
  v8 = self;
  ListTableViewHeaderFooter.updateConfiguration(using:)();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (BOOL)isAccessibilityElement
{
  return 0;
}

- (_TtC7SwiftUI25ListTableViewHeaderFooter)initWithReuseIdentifier:(id)a3
{
  if (a3)
  {
    uint64_t v3 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  }
  else
  {
    uint64_t v3 = 0;
    uint64_t v4 = 0;
  }
  return (_TtC7SwiftUI25ListTableViewHeaderFooter *)ListTableViewHeaderFooter.init(reuseIdentifier:)(v3, v4);
}

- (_TtC7SwiftUI25ListTableViewHeaderFooter)initWithCoder:(id)a3
{
  return (_TtC7SwiftUI25ListTableViewHeaderFooter *)ListTableViewHeaderFooter.init(coder:)(a3);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  uint64_t v3 = *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC7SwiftUI25ListTableViewHeaderFooter_host);
}

@end