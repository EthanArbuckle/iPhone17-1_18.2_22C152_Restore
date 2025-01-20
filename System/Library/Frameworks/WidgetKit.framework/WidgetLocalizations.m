@interface WidgetLocalizations
+ (BOOL)supportsSecureCoding;
- (_TtC9WidgetKit19WidgetLocalizations)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WidgetLocalizations

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v3 = a3;
  swift_retain();
  sub_191C099E0(v3);

  swift_release();
}

- (_TtC9WidgetKit19WidgetLocalizations)initWithCoder:(id)a3
{
  return 0;
}

@end