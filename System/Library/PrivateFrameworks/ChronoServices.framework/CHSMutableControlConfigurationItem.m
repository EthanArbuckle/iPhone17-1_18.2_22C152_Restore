@interface CHSMutableControlConfigurationItem
- (CHSMutableControlConfigurationItem)init;
- (CHSMutableControlConfigurationItem)initWithUniqueIdentifier:(id)a3 controlIdentity:(id)a4;
- (CHSMutableControlConfigurationItem)initWithUniqueIdentifier:(id)a3 controlIdentity:(id)a4 location:(int64_t)a5;
- (void)setCanAppearInSecureEnvironment:(BOOL)a3;
- (void)setPushPolicy:(unint64_t)a3;
- (void)setSupportedColorSchemes:(unint64_t)a3;
- (void)setSupportsLowLuminance:(BOOL)a3;
@end

@implementation CHSMutableControlConfigurationItem

- (void)setPushPolicy:(unint64_t)a3
{
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___CHSControlConfigurationItem__pushPolicy) = (Class)a3;
}

- (void)setCanAppearInSecureEnvironment:(BOOL)a3
{
  *((unsigned char *)&self->super.super.isa + OBJC_IVAR___CHSControlConfigurationItem__canAppearInSecureEnvironment) = a3;
}

- (void)setSupportsLowLuminance:(BOOL)a3
{
  *((unsigned char *)&self->super.super.isa + OBJC_IVAR___CHSControlConfigurationItem__supportsLowLuminance) = a3;
}

- (void)setSupportedColorSchemes:(unint64_t)a3
{
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___CHSControlConfigurationItem__supportedColorSchemes) = (Class)a3;
}

- (CHSMutableControlConfigurationItem)initWithUniqueIdentifier:(id)a3 controlIdentity:(id)a4 location:(int64_t)a5
{
  sub_190D41978();
  id v8 = a4;
  v9 = (void *)sub_190D41948();
  swift_bridgeObjectRelease();
  v12.receiver = self;
  v12.super_class = (Class)CHSMutableControlConfigurationItem;
  v10 = [(CHSControlConfigurationItem *)&v12 initWithUniqueIdentifier:v9 controlIdentity:v8 location:a5];

  return v10;
}

- (CHSMutableControlConfigurationItem)initWithUniqueIdentifier:(id)a3 controlIdentity:(id)a4
{
  sub_190D41978();
  id v6 = a4;
  v7 = (void *)sub_190D41948();
  swift_bridgeObjectRelease();
  v10.receiver = self;
  v10.super_class = (Class)CHSMutableControlConfigurationItem;
  id v8 = [(CHSControlConfigurationItem *)&v10 initWithUniqueIdentifier:v7 controlIdentity:v6];

  return v8;
}

- (CHSMutableControlConfigurationItem)init
{
  v3.receiver = self;
  v3.super_class = (Class)CHSMutableControlConfigurationItem;
  return [(CHSControlConfigurationItem *)&v3 init];
}

@end