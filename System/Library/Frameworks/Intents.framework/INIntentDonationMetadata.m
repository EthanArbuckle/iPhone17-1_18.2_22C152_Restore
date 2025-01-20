@interface INIntentDonationMetadata
+ (BOOL)supportsSecureCoding;
+ (Class)_intentClass;
- (INIntentDonationMetadata)initWithCoder:(id)a3;
- (id)_init;
- (id)copyWithZone:(_NSZone *)a3;
@end

@implementation INIntentDonationMetadata

- (INIntentDonationMetadata)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)INIntentDonationMetadata;
  return [(INIntentDonationMetadata *)&v4 init];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v3 = (void *)[(id)objc_opt_class() allocWithZone:a3];

  return (id)[v3 _init];
}

- (id)_init
{
  v3.receiver = self;
  v3.super_class = (Class)INIntentDonationMetadata;
  return [(INIntentDonationMetadata *)&v3 init];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (Class)_intentClass
{
  Class result = (Class)[MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"+[INIntentDonationMetadata _intentClass] must be overridden"];
  __break(1u);
  return result;
}

@end