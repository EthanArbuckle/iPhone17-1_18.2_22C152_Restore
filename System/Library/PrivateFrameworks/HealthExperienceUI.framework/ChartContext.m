@interface ChartContext
+ (BOOL)supportsSecureCoding;
- (NSString)description;
- (_TtC18HealthExperienceUI12ChartContext)init;
- (_TtC18HealthExperienceUI12ChartContext)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ChartContext

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)description
{
  v2 = self;
  sub_1AD3A8454();

  v3 = (void *)sub_1AD73F180();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1AD3A8770(v4);
}

- (_TtC18HealthExperienceUI12ChartContext)initWithCoder:(id)a3
{
  id v3 = a3;
  id v4 = (_TtC18HealthExperienceUI12ChartContext *)sub_1AD3A9C18();

  return v4;
}

- (_TtC18HealthExperienceUI12ChartContext)init
{
  result = (_TtC18HealthExperienceUI12ChartContext *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end