@interface LNConfirmationSystemStyle
+ (BOOL)supportsSecureCoding;
+ (id)montaraEnablementWithBundleIdentifier:(id)a3 source:(int64_t)a4 isExplicitRequest:(BOOL)a5;
- (LNConfirmationSystemStyle)init;
- (LNConfirmationSystemStyle)initWithCoder:(id)a3;
@end

@implementation LNConfirmationSystemStyle

+ (id)montaraEnablementWithBundleIdentifier:(id)a3 source:(int64_t)a4 isExplicitRequest:(BOOL)a5
{
  uint64_t v7 = sub_1A44F94E0();
  id v9 = static LNConfirmationSystemStyle.montaraEnablement(bundleIdentifier:source:isExplicitRequest:)(v7, v8, a4, a5);
  swift_bridgeObjectRelease();
  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (LNConfirmationSystemStyle)initWithCoder:(id)a3
{
  return (LNConfirmationSystemStyle *)LNConfirmationSystemStyle.init(coder:)(a3);
}

- (LNConfirmationSystemStyle)init
{
  return (LNConfirmationSystemStyle *)LNConfirmationSystemStyle.init()();
}

@end