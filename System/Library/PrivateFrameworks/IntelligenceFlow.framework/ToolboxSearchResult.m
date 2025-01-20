@interface ToolboxSearchResult
+ (BOOL)supportsSecureCoding;
+ (void)setSupportsSecureCoding:(BOOL)a3;
- (_TtC16IntelligenceFlow19ToolboxSearchResult)init;
- (_TtC16IntelligenceFlow19ToolboxSearchResult)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ToolboxSearchResult

+ (BOOL)supportsSecureCoding
{
  return static ToolboxSearchResult.supportsSecureCoding.getter() & 1;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  ToolboxSearchResult.encode(with:)((NSCoder)v4);
}

- (_TtC16IntelligenceFlow19ToolboxSearchResult)initWithCoder:(id)a3
{
  id v3 = a3;
  return (_TtC16IntelligenceFlow19ToolboxSearchResult *)ToolboxSearchResult.init(coder:)();
}

- (_TtC16IntelligenceFlow19ToolboxSearchResult)init
{
}

- (void).cxx_destruct
{
}

@end