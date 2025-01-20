@interface CKGroupCollectionViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)accessibilityPerformEscape;
@end

@implementation CKGroupCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CKGroupCollectionViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"UILayoutContainerView"];
  [v3 validateClass:@"CKTranscriptCollectionView" isKindOfClass:@"UICollectionView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKTranscriptCollectionViewController", @"delegate", "@", 0);
  [v3 validateClass:@"CKInlineReplyChatController" isKindOfClass:@"CKCoreChatController"];
  [v3 validateClass:@"CKChatController" isKindOfClass:@"CKCoreChatController"];
  [v3 validateClass:@"CKDetailsController" isKindOfClass:@"UIViewController"];
}

- (BOOL)accessibilityPerformEscape
{
  id v3 = [(CKGroupCollectionViewCellAccessibility *)self _accessibilityAncestorIsKindOf:NSClassFromString(&cfstr_Uilayoutcontai.isa)];
  v4 = [v3 _accessibilityDescendantOfType:NSClassFromString(&cfstr_Cktranscriptco_2.isa)];
  v5 = [v4 safeValueForKey:@"delegate"];
  v6 = [v5 safeValueForKey:@"delegate"];
  v7 = v6;
  if (v6)
  {
    unsigned __int8 v8 = [v6 accessibilityPerformEscape];
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)CKGroupCollectionViewCellAccessibility;
    unsigned __int8 v8 = [(CKGroupCollectionViewCellAccessibility *)&v11 accessibilityPerformEscape];
  }
  BOOL v9 = v8;

  return v9;
}

@end