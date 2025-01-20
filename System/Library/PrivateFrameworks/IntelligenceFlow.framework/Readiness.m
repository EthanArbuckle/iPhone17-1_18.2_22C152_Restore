@interface Readiness
+ (BOOL)supportsSecureCoding;
+ (void)setSupportsSecureCoding:(BOOL)a3;
- (_TtC16IntelligenceFlow9Readiness)init;
- (void)encodeWithCoder:(id)a3;
@end

@implementation Readiness

+ (BOOL)supportsSecureCoding
{
  return static Readiness.supportsSecureCoding.getter() & 1;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  Readiness.encode(with:)((NSCoder)v4);
}

- (_TtC16IntelligenceFlow9Readiness)init
{
}

- (void).cxx_destruct
{
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC16IntelligenceFlow9Readiness_assistantSchemas);
}

@end