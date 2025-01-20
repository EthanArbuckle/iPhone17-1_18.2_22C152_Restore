@interface ToolBoxIndexedSource
+ (BOOL)supportsSecureCoding;
+ (void)setSupportsSecureCoding:(BOOL)a3;
- (_TtC16IntelligenceFlow20ToolBoxIndexedSource)init;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ToolBoxIndexedSource

+ (BOOL)supportsSecureCoding
{
  return static ToolBoxIndexedSource.supportsSecureCoding.getter() & 1;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  ToolBoxIndexedSource.encode(with:)((NSCoder)v4);
}

- (_TtC16IntelligenceFlow20ToolBoxIndexedSource)init
{
}

@end