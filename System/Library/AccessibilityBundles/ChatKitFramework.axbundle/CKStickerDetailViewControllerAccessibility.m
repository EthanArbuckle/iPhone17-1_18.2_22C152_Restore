@interface CKStickerDetailViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)_axChatItemForIndex:(int64_t)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
@end

@implementation CKStickerDetailViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CKStickerDetailViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"CKStickerDetailViewController" isKindOfClass:@"UIViewController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKStickerDetailViewController", @"stickerDetailsItems", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKStickerDetailViewController", @"tableView:cellForRowAtIndexPath:", "@", "@", "@", 0);
  [v3 validateClass:@"CKAssociatedStickerChatItem"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKAssociatedStickerChatItem", @"mediaObject", "@", 0);
  [v3 validateClass:@"CKMediaObject"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKMediaObject", @"transfer", "@", 0);
  [v3 validateProtocol:@"CKFileTransfer" hasRequiredInstanceMethod:@"attributionInfo"];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)CKStickerDetailViewControllerAccessibility;
  v8 = [(CKStickerDetailViewControllerAccessibility *)&v16 tableView:v6 cellForRowAtIndexPath:v7];
  NSClassFromString(&cfstr_Ckstickerdetai_1.isa);
  if (objc_opt_isKindOfClass())
  {
    v9 = -[CKStickerDetailViewControllerAccessibility _axChatItemForIndex:](self, "_axChatItemForIndex:", [v7 item]);
    v10 = [v9 safeValueForKey:@"mediaObject"];
    v11 = [v10 safeValueForKey:@"transfer"];
    v12 = [v11 safeDictionaryForKey:@"attributionInfo"];
    v13 = [v12 objectForKey:@"accessl"];
    objc_opt_class();
    v14 = __UIAccessibilityCastAsSafeCategory();
    [v14 _axSetStickerDescription:v13];
  }

  return v8;
}

- (id)_axChatItemForIndex:(int64_t)a3
{
  v4 = [(CKStickerDetailViewControllerAccessibility *)self safeArrayForKey:@"stickerDetailsItems"];
  v5 = [v4 objectAtIndex:a3];

  return v5;
}

@end