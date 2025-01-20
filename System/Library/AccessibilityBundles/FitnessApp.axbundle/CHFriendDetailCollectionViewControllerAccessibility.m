@interface CHFriendDetailCollectionViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)viewDidLoad;
@end

@implementation CHFriendDetailCollectionViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CHFriendDetailCollectionViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"CHFriendDetailCollectionViewController" hasInstanceVariable:@"_isMe" withType:"B"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CHFriendDetailCollectionViewController", @"_sendMessageButtonTapped:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CHFriendDetailCollectionViewController", @"viewDidLoad", "v", 0);
  [v3 validateClass:@"CHFriendDetailCollectionViewController" isKindOfClass:@"UIViewController"];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v19.receiver = self;
  v19.super_class = (Class)CHFriendDetailCollectionViewControllerAccessibility;
  [(CHFriendDetailCollectionViewControllerAccessibility *)&v19 _accessibilityLoadAccessibilityInformation];
  if (([(CHFriendDetailCollectionViewControllerAccessibility *)self safeBoolForKey:@"_isMe"] & 1) == 0)
  {
    char v18 = 0;
    objc_opt_class();
    id v3 = __UIAccessibilityCastAsClass();
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    v4 = objc_msgSend(v3, "navigationItem", 0);
    v5 = [v4 rightBarButtonItems];

    id v6 = [v5 countByEnumeratingWithState:&v14 objects:v20 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v15;
      while (2)
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v15 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          v11 = (const char *)[v10 action];
          if (v11 == NSSelectorFromString(@"_sendMessageButtonTapped:"))
          {
            v12 = accessibilityLocalizedString(@"messages");
            [v10 setAccessibilityLabel:v12];

            v13 = accessibilityLocalizedString(@"messages.hint");
            [v10 setAccessibilityHint:v13];

            goto LABEL_12;
          }
        }
        id v7 = [v5 countByEnumeratingWithState:&v14 objects:v20 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)CHFriendDetailCollectionViewControllerAccessibility;
  [(CHFriendDetailCollectionViewControllerAccessibility *)&v3 viewDidLoad];
  [(CHFriendDetailCollectionViewControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

@end