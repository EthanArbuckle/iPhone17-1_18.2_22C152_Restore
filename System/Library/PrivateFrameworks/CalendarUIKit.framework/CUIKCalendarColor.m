@interface CUIKCalendarColor
+ (NSString)providerIdentifier;
+ (id)deserializeColor:(id)a3;
- (CUIKCalendarColor)init;
@end

@implementation CUIKCalendarColor

+ (NSString)providerIdentifier
{
  v2 = (void *)sub_1BE0704C0();

  return (NSString *)v2;
}

+ (id)deserializeColor:(id)a3
{
  id v3 = a3;
  uint64_t v4 = sub_1BE06EE50();
  unint64_t v6 = v5;

  id v7 = _s13CalendarUIKit17CUIKCalendarColorC011deserializeD0ySo7UIColorCSg10Foundation4DataVFZ_0(v4, v6);
  sub_1BDF841A4(v4, v6);

  return v7;
}

- (CUIKCalendarColor)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CUIKCalendarColor();
  return [(CUIKCalendarColor *)&v3 init];
}

@end