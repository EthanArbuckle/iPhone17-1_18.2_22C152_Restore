@interface CKChatController
@end

@implementation CKChatController

void __90__CKChatController_ClickyOrb_QSExtras__menuForChatItem_withParentChatItem_menuAppearance___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) collectionViewController];
  uint64_t v2 = [v5 balloonViewForChatItem:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void __66__CKChatController_ClickyOrb_QSExtras__axActionForSpeakSelection___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  v4 = [*(id *)(a1 + 32) safeValueForKey:@"textView"];
  id v5 = __UIAccessibilityCastAsClass();

  [v5 setSelectable:1];
  v6 = +[AXQuickSpeak sharedInstance];
  LODWORD(v4) = [v6 isSpeaking];

  if (v4)
  {
    if (objc_opt_respondsToSelector()) {
      [v5 _accessibilityPauseSpeaking:0];
    }
  }
  else if (objc_opt_respondsToSelector())
  {
    [v5 _accessibilitySpeak:0];
  }
}

@end