@interface TUIEmojiSearchResultsCollectionViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)setDisplayedEmojis:(id)a3 verbatimSkinTones:(BOOL)a4 animated:(BOOL)a5;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation TUIEmojiSearchResultsCollectionViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"TUIEmojiSearchResultsCollectionViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"TUIEmojiSearchResultsCollectionViewController", @"setDisplayedEmojis:verbatimSkinTones:animated:", "v", "@", "B", "B", 0);
  [v3 validateClass:@"TUIEmojiSearchResultsCollectionViewController" isKindOfClass:@"UIViewController"];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)TUIEmojiSearchResultsCollectionViewControllerAccessibility;
  [(TUIEmojiSearchResultsCollectionViewControllerAccessibility *)&v5 viewWillDisappear:a3];
  v4 = [(TUIEmojiSearchResultsCollectionViewControllerAccessibility *)self _accessibilityValueForKey:@"AXTimer"];
  [v4 cancel];
}

- (void)setDisplayedEmojis:(id)a3 verbatimSkinTones:(BOOL)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v8 = a3;
  v14.receiver = self;
  v14.super_class = (Class)TUIEmojiSearchResultsCollectionViewControllerAccessibility;
  [(TUIEmojiSearchResultsCollectionViewControllerAccessibility *)&v14 setDisplayedEmojis:v8 verbatimSkinTones:v6 animated:v5];
  v9 = [(TUIEmojiSearchResultsCollectionViewControllerAccessibility *)self _accessibilityValueForKey:@"AXTimer"];
  if (!v9)
  {
    id v10 = objc_alloc(MEMORY[0x263F22868]);
    v9 = (void *)[v10 initWithTargetSerialQueue:MEMORY[0x263EF83A0]];
    [v9 setAutomaticallyCancelPendingBlockUponSchedulingNewBlock:1];
    [(TUIEmojiSearchResultsCollectionViewControllerAccessibility *)self _accessibilitySetRetainedValue:v9 forKey:@"AXTimer"];
  }
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __108__TUIEmojiSearchResultsCollectionViewControllerAccessibility_setDisplayedEmojis_verbatimSkinTones_animated___block_invoke;
  v12[3] = &unk_26515FA30;
  id v13 = v8;
  id v11 = v8;
  [v9 afterDelay:v12 processBlock:0.5];
}

void __108__TUIEmojiSearchResultsCollectionViewControllerAccessibility_setDisplayedEmojis_verbatimSkinTones_animated___block_invoke(uint64_t a1)
{
  v2 = NSString;
  accessibilityLocalizedString(@"emojis.found");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  id v3 = objc_msgSend(v2, "localizedStringWithFormat:", v4, objc_msgSend(*(id *)(a1 + 32), "count"));
  UIAccessibilitySpeakOrQueueIfNeeded();
}

@end