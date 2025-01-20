@interface ToolboxIndexedMetadata
+ (BOOL)supportsSecureCoding;
+ (void)setSupportsSecureCoding:(BOOL)a3;
- (_TtC16IntelligenceFlow22ToolboxIndexedMetadata)init;
- (_TtC16IntelligenceFlow22ToolboxIndexedMetadata)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ToolboxIndexedMetadata

+ (BOOL)supportsSecureCoding
{
  return static ToolboxIndexedMetadata.supportsSecureCoding.getter() & 1;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  ToolboxIndexedMetadata.encode(with:)((NSCoder)v4);
}

- (_TtC16IntelligenceFlow22ToolboxIndexedMetadata)initWithCoder:(id)a3
{
  id v3 = a3;
  return (_TtC16IntelligenceFlow22ToolboxIndexedMetadata *)ToolboxIndexedMetadata.init(coder:)();
}

- (_TtC16IntelligenceFlow22ToolboxIndexedMetadata)init
{
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end