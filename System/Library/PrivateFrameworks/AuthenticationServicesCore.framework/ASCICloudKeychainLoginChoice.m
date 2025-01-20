@interface ASCICloudKeychainLoginChoice
+ (BOOL)supportsSecureCoding;
- (ASCICloudKeychainLoginChoice)initWithCoder:(id)a3;
- (BOOL)isEqual:(id)a3;
- (unint64_t)loginChoiceKind;
@end

@implementation ASCICloudKeychainLoginChoice

- (unint64_t)loginChoiceKind
{
  return 5;
}

- (BOOL)isEqual:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASCICloudKeychainLoginChoice)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)ASCICloudKeychainLoginChoice;
  return [(ASCICloudKeychainLoginChoice *)&v4 init];
}

@end