@interface CKPhoneTranscriptMessageCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
@end

@implementation CKPhoneTranscriptMessageCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CKPhoneTranscriptMessageCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

@end