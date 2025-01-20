@interface ReviewLockupStyle
+ (BOOL)supportsSecureCoding;
+ (void)setSupportsSecureCoding:(BOOL)a3;
- (_TtC20AppleMediaServicesUI17ReviewLockupStyle)init;
- (_TtC20AppleMediaServicesUI17ReviewLockupStyle)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ReviewLockupStyle

+ (BOOL)supportsSecureCoding
{
  return static ReviewLockupStyle.supportsSecureCoding.getter() & 1;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_21C2A3140(v4);
}

- (_TtC20AppleMediaServicesUI17ReviewLockupStyle)initWithCoder:(id)a3
{
  return (_TtC20AppleMediaServicesUI17ReviewLockupStyle *)ReviewLockupStyle.init(coder:)(a3);
}

- (_TtC20AppleMediaServicesUI17ReviewLockupStyle)init
{
}

@end