@interface ToolboxIndexedTools
+ (BOOL)supportsSecureCoding;
+ (void)setSupportsSecureCoding:(BOOL)a3;
- (_TtC16IntelligenceFlow19ToolboxIndexedTools)init;
- (_TtC16IntelligenceFlow19ToolboxIndexedTools)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ToolboxIndexedTools

+ (BOOL)supportsSecureCoding
{
  return static ToolboxIndexedTools.supportsSecureCoding.getter() & 1;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  ToolboxIndexedTools.encode(with:)((NSCoder)v4);
}

- (_TtC16IntelligenceFlow19ToolboxIndexedTools)initWithCoder:(id)a3
{
  id v3 = a3;
  return (_TtC16IntelligenceFlow19ToolboxIndexedTools *)ToolboxIndexedTools.init(coder:)();
}

- (_TtC16IntelligenceFlow19ToolboxIndexedTools)init
{
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end