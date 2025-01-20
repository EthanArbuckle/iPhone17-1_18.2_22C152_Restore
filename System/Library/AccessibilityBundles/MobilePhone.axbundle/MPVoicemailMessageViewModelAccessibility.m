@interface MPVoicemailMessageViewModelAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (NSString)_axLocalizedSenderIdentityFullName;
- (void)_axSetLocalizedSenderIdentityFullName:(id)a3;
@end

@implementation MPVoicemailMessageViewModelAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MPVoicemailMessageViewModel";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (NSString)_axLocalizedSenderIdentityFullName
{
}

- (void)_axSetLocalizedSenderIdentityFullName:(id)a3
{
}

@end