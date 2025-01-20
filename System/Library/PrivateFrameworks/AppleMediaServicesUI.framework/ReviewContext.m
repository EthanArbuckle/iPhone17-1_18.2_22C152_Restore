@interface ReviewContext
+ (BOOL)supportsSecureCoding;
+ (void)setSupportsSecureCoding:(BOOL)a3;
- (_TtC20AppleMediaServicesUI13ReviewContext)init;
- (_TtC20AppleMediaServicesUI13ReviewContext)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ReviewContext

+ (BOOL)supportsSecureCoding
{
  return static ReviewContext.supportsSecureCoding.getter() & 1;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_21C28F714(v4);
}

- (_TtC20AppleMediaServicesUI13ReviewContext)initWithCoder:(id)a3
{
  return (_TtC20AppleMediaServicesUI13ReviewContext *)ReviewContext.init(coder:)(a3);
}

- (_TtC20AppleMediaServicesUI13ReviewContext)init
{
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end