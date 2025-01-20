@interface CKTranscriptCollectionViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)axBuddyWasTyping;
- (BOOL)axIsShowingChatController;
- (id)_accessibilitySpeakThisElementsAndStrings;
- (void)_accessibilityLoadMessagesIfNeeded;
- (void)chatItemsDidChange:(id)a3;
- (void)effectManager:(id)a3 didStartEffect:(id)a4;
- (void)setAxBuddyWasTyping:(BOOL)a3;
@end

@implementation CKTranscriptCollectionViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CKTranscriptCollectionViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKTranscriptCollectionViewController", @"collectionView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKTranscriptBalloonCell", @"balloonView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKTextBalloonView", @"textView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKTranscriptCollectionViewController", @"balloonViewForChatItem:", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKTranscriptCollectionViewController", @"effectManager:didStartEffect:", "v", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKTranscriptCollectionViewController", @"_loadMessagesIfNeededWithTargetContentOffset:forKeyboardNavigation:", "v", "{CGPoint=dd}", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKTranscriptCollectionViewController", @"collectionView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKTranscriptCollectionViewController", @"conversation", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKTranscriptCollectionViewController", @"chatItemsDidChange:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKConversation", @"chat", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"IMChat", @"lastIncomingMessage", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"IMMessage", @"isTypingMessage", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKBalloonView", @"delegate", "@", 0, 0, 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKMessagesController", @"isShowingChatController", "B", 0);
}

- (void)_accessibilityLoadMessagesIfNeeded
{
  objc_opt_class();
  id v3 = [(CKTranscriptCollectionViewControllerAccessibility *)self safeValueForKey:@"collectionView"];
  v4 = __UIAccessibilityCastAsClass();

  [v4 contentOffset];
  AXPerformSafeBlock();
}

uint64_t __87__CKTranscriptCollectionViewControllerAccessibility__accessibilityLoadMessagesIfNeeded__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_loadMessagesIfNeededWithTargetContentOffset:forKeyboardNavigation:", 0, *(double *)(a1 + 40), *(double *)(a1 + 48));
}

- (id)_accessibilitySpeakThisElementsAndStrings
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v17 = objc_alloc_init(MEMORY[0x263EFF980]);
  char v22 = 0;
  objc_opt_class();
  id v3 = [(CKTranscriptCollectionViewControllerAccessibility *)self safeValueForKey:@"collectionView"];
  v4 = __UIAccessibilityCastAsClass();

  if (v4)
  {
    v5 = [v4 indexPathsForVisibleItems];
    v6 = [v5 sortedArrayUsingComparator:&__block_literal_global_6];

    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v7 = v6;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v23 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v19 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = [v4 cellForItemAtIndexPath:*(void *)(*((void *)&v18 + 1) + 8 * i)];
          NSClassFromString(&cfstr_Cktranscriptba_0.isa);
          if (objc_opt_isKindOfClass())
          {
            v13 = [v12 safeValueForKey:@"balloonView"];
            if (v13)
            {
              [v17 addObject:v13];
              char v22 = 0;
              objc_opt_class();
              v14 = [v13 safeValueForKey:@"textView"];
              v15 = __UIAccessibilityCastAsClass();

              if (v22) {
                abort();
              }
              if (v15) {
                [v17 addObject:v15];
              }
            }
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v18 objects:v23 count:16];
      }
      while (v9);
    }
  }

  return v17;
}

uint64_t __94__CKTranscriptCollectionViewControllerAccessibility__accessibilitySpeakThisElementsAndStrings__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = [a2 item];
  uint64_t v6 = [v4 item];

  if (v6 <= v5) {
    uint64_t v7 = 0;
  }
  else {
    uint64_t v7 = -1;
  }
  if (v5 > v6) {
    return 1;
  }
  else {
    return v7;
  }
}

- (void)effectManager:(id)a3 didStartEffect:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  LOBYTE(v30) = 0;
  objc_opt_class();
  uint64_t v8 = __UIAccessibilityCastAsClass();
  char v36 = 0;
  objc_opt_class();
  uint64_t v30 = 0;
  v31 = &v30;
  uint64_t v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__12;
  v34 = __Block_byref_object_dispose__12;
  id v35 = 0;
  uint64_t v23 = MEMORY[0x263EF8330];
  uint64_t v24 = 3221225472;
  v25 = __82__CKTranscriptCollectionViewControllerAccessibility_effectManager_didStartEffect___block_invoke;
  v26 = &unk_265112F70;
  v29 = &v30;
  v27 = self;
  id v9 = v7;
  id v28 = v9;
  AXPerformSafeBlock();
  id v10 = (id)v31[5];

  _Block_object_dispose(&v30, 8);
  v11 = __UIAccessibilityCastAsSafeCategory();

  if (v36) {
    abort();
  }
  v22.receiver = self;
  v22.super_class = (Class)CKTranscriptCollectionViewControllerAccessibility;
  [(CKTranscriptCollectionViewControllerAccessibility *)&v22 effectManager:v6 didStartEffect:v9];
  if (v8 && v11)
  {
    v12 = [v9 identifier];
    v13 = _AXCKFullScreenEffectString(v12, 1);
    if ([v13 length])
    {
      v14 = NSString;
      v15 = accessibilityLocalizedString(@"impact.effect.full.description");
      v16 = accessibilityLocalizedString(v13);
      id v17 = objc_msgSend(v14, "stringWithFormat:", v15, v16);

      long long v18 = [v11 _axMessageSender];
      long long v19 = [v11 safeValueForKey:@"textView"];
      long long v20 = [v19 accessibilityValue];

      long long v21 = __UIAXStringForVariables();
      UIAccessibilitySpeakAndDoNotBeInterrupted();
    }
  }
}

void __82__CKTranscriptCollectionViewControllerAccessibility_effectManager_didStartEffect___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  id v6 = [*(id *)(a1 + 40) triggeringChatItem];
  uint64_t v3 = [v2 balloonViewForChatItem:v6];
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (BOOL)axIsShowingChatController
{
  v2 = [(CKTranscriptCollectionViewControllerAccessibility *)self safeValueForKeyPath:@"delegate.delegate"];
  NSClassFromString(&cfstr_Ckmessagescont_0.isa);
  if (objc_opt_isKindOfClass())
  {
    uint64_t v3 = __UIAccessibilitySafeClass();
    char v4 = [v3 safeBoolForKey:@"isShowingChatController"];
  }
  else
  {
    char v4 = 0;
  }

  return v4;
}

- (void)chatItemsDidChange:(id)a3
{
  v25[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(CKTranscriptCollectionViewControllerAccessibility *)self safeValueForKey:@"conversation"];
  id v6 = [v5 safeValueForKey:@"chat"];

  id v7 = [v4 object];
  BOOL v8 = [(CKTranscriptCollectionViewControllerAccessibility *)self axIsShowingChatController];
  if ([v6 isEqual:v7] && v8)
  {
    char v23 = 0;
    id v9 = [v6 safeValueForKey:@"lastIncomingMessage"];
    id v10 = __UIAccessibilitySafeClass();

    v11 = [v10 sender];
    v12 = [v11 firstName];
    if (v12)
    {
      v13 = [v10 sender];
      v14 = [v13 firstName];
    }
    else
    {
      v14 = [v10 senderName];
    }

    if ([v10 safeBoolForKey:@"isTypingMessage"])
    {
      [(CKTranscriptCollectionViewControllerAccessibility *)self setAxBuddyWasTyping:1];
      if (![v14 length])
      {
        id v17 = accessibilityLocalizedString(@"contact.typing.message");
        if (!v17) {
          goto LABEL_18;
        }
        goto LABEL_17;
      }
      v15 = NSString;
      v16 = accessibilityLocalizedString(@"contact.typing.message.with.name");
      id v17 = objc_msgSend(v15, "stringWithFormat:", v16, v14);
    }
    else
    {
      if (![(CKTranscriptCollectionViewControllerAccessibility *)self axBuddyWasTyping]) {
        goto LABEL_18;
      }
      [(CKTranscriptCollectionViewControllerAccessibility *)self setAxBuddyWasTyping:0];
      if ([v14 length])
      {
        long long v18 = NSString;
        long long v19 = accessibilityLocalizedString(@"contact.stopped.typing.message.with.name");
        v16 = objc_msgSend(v18, "stringWithFormat:", v19, v14);
      }
      else
      {
        v16 = accessibilityLocalizedString(@"contact.stopped.typing.message");
      }
      id v17 = [MEMORY[0x263F21660] axAttributedStringWithString:v16];
      [v17 setAttribute:*MEMORY[0x263EFFB40] forKey:*MEMORY[0x263F21828]];
    }

    if (v17)
    {
LABEL_17:
      long long v20 = [MEMORY[0x263F21660] axAttributedStringWithString:v17];
      uint64_t v24 = *MEMORY[0x263F218C8];
      v25[0] = MEMORY[0x263EFFA88];
      long long v21 = [NSDictionary dictionaryWithObjects:v25 forKeys:&v24 count:1];
      [v20 setAttributes:v21];

      UIAccessibilityPostNotification(*MEMORY[0x263F1CDC8], v20);
    }
LABEL_18:
  }
  v22.receiver = self;
  v22.super_class = (Class)CKTranscriptCollectionViewControllerAccessibility;
  [(CKTranscriptCollectionViewControllerAccessibility *)&v22 chatItemsDidChange:v4];
}

- (BOOL)axBuddyWasTyping
{
  return self->_axBuddyWasTyping;
}

- (void)setAxBuddyWasTyping:(BOOL)a3
{
  self->_axBuddyWasTyping = a3;
}

@end