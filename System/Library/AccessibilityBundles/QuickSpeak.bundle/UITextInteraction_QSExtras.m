@interface UITextInteraction_QSExtras
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (id)_updatedAccessibilityTextMenuWithMenuElements:(id)a3;
- (id)_updatedAccessibilityTextSpeechMenuWithMenu:(id)a3;
@end

@implementation UITextInteraction_QSExtras

+ (id)safeCategoryTargetClassName
{
  return @"UITextInteraction";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)_updatedAccessibilityTextSpeechMenuWithMenu:(id)a3
{
  v39[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [v4 identifier];
  int v6 = [v5 isEqualToString:*MEMORY[0x263F1D4D0]];

  if (v6)
  {
    v7 = AXLogSpeakSelection();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_240270000, v7, OS_LOG_TYPE_INFO, "Will update AX speech items for UIMenu", buf, 2u);
    }

    v8 = [MEMORY[0x263EFF980] array];
    if ([(UITextInteraction_QSExtras *)self _accessibilityQScanPerformAction:sel__accessibilitySpeak_ withSender:0])
    {
      v9 = (void *)MEMORY[0x263F1C560];
      v10 = accessibilityQuickSpeakLocalizedString(@"quickspeak.speak");
      v11 = [MEMORY[0x263F1C6B0] systemImageNamed:@"play"];
      v12 = [v9 commandWithTitle:v10 image:v11 action:sel__accessibilitySpeak_ propertyList:0];

      [v8 addObject:v12];
    }
    else if ([(UITextInteraction_QSExtras *)self _accessibilityQScanPerformAction:sel__accessibilityPauseSpeaking_ withSender:0])
    {
      v14 = (void *)MEMORY[0x263F1C560];
      v15 = accessibilityQuickSpeakLocalizedString(@"quickspeak.pause");
      v16 = [MEMORY[0x263F1C6B0] systemImageNamed:@"pause"];
      v17 = [v14 commandWithTitle:v15 image:v16 action:sel__accessibilityPauseSpeaking_ propertyList:0];

      [v8 addObject:v17];
    }
    else if ([(UITextInteraction_QSExtras *)self _accessibilityShouldShowSpeakLanguageBubble]&& [(UITextInteraction_QSExtras *)self _accessibilitySystemShouldShowSpeakLanguageBubble])
    {
      objc_initWeak((id *)buf, self);
      v18 = (void *)MEMORY[0x263F1C5B8];
      v35[0] = MEMORY[0x263EF8330];
      v35[1] = 3221225472;
      v35[2] = __74__UITextInteraction_QSExtras__updatedAccessibilityTextSpeechMenuWithMenu___block_invoke;
      v35[3] = &unk_2650AA058;
      objc_copyWeak(&v36, (id *)buf);
      v19 = [v18 elementWithProvider:v35];
      v20 = (void *)MEMORY[0x263F1C7A8];
      v21 = accessibilityQuickSpeakLocalizedString(@"quickspeak.speak.languages");
      v22 = [MEMORY[0x263F1C6B0] systemImageNamed:@"play"];
      v39[0] = v19;
      v23 = [MEMORY[0x263EFF8C0] arrayWithObjects:v39 count:1];
      v24 = [v20 menuWithTitle:v21 image:v22 identifier:0 options:0 children:v23];

      [v8 addObject:v24];
      objc_destroyWeak(&v36);
      objc_destroyWeak((id *)buf);
    }
    if ([(UITextInteraction_QSExtras *)self _accessibilityQScanPerformAction:sel__accessibilitySpeakSentence_ withSender:0])
    {
      v25 = (void *)MEMORY[0x263F1C560];
      v26 = accessibilityQuickSpeakLocalizedString(@"quickspeak.sentence");
      v27 = [MEMORY[0x263F1C6B0] systemImageNamed:@"play"];
      v28 = [v25 commandWithTitle:v26 image:v27 action:sel__accessibilitySpeakSentence_ propertyList:0];

      [v8 addObject:v28];
    }
    if ([(UITextInteraction_QSExtras *)self _accessibilityQScanPerformAction:sel__accessibilitySpeakSpellOut_ withSender:0])
    {
      v29 = (void *)MEMORY[0x263F1C560];
      v30 = accessibilityQuickSpeakLocalizedString(@"quickspeak.spell.out");
      v31 = [MEMORY[0x263F1C6B0] systemImageNamed:@"play"];
      v32 = [v29 commandWithTitle:v30 image:v31 action:sel__accessibilitySpeakSpellOut_ propertyList:0];

      [v8 addObject:v32];
    }
    v33 = AXLogSpeakSelection();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v38 = v8;
      _os_log_impl(&dword_240270000, v33, OS_LOG_TYPE_INFO, "Did update AX speech items for UIMenu: %@", buf, 0xCu);
    }

    v13 = [v4 menuByReplacingChildren:v8];
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)_updatedAccessibilityTextMenuWithMenuElements:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)UITextInteraction_QSExtras;
  v5 = [(UITextInteraction_QSExtras *)&v21 _updatedAccessibilityTextMenuWithMenuElements:v4];
  int v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else if (_AXSQuickSpeakEnabled() {
         && (+[AXQuickSpeak sharedInstance],
  }
             v8 = objc_claimAutoreleasedReturnValue(),
             char v9 = [v8 isSpeaking],
             v8,
             (v9 & 1) == 0))
  {
    id v7 = (id)[v4 mutableCopy];
    if ([v7 count])
    {
      unint64_t v10 = 0;
      uint64_t v11 = *MEMORY[0x263F1D4D0];
      do
      {
        objc_opt_class();
        v12 = [v7 objectAtIndex:v10];
        v13 = __UIAccessibilityCastAsClass();

        v14 = [v13 identifier];
        int v15 = [v14 isEqualToString:v11];

        if (v15)
        {
          v16 = [(UITextInteraction_QSExtras *)self _updatedAccessibilityTextSpeechMenuWithMenu:v13];
          if (v16)
          {
            [v7 setObject:v16 atIndexedSubscript:v10];
          }
          else
          {
            v17 = [v13 children];
            v18 = [(UITextInteraction_QSExtras *)self _updatedAccessibilityTextMenuWithMenuElements:v17];

            if ([v18 count])
            {
              v19 = [v13 menuByReplacingChildren:v18];
              [v7 setObject:v19 atIndexedSubscript:v10];
            }
          }
        }
        ++v10;
      }
      while (v10 < [v7 count]);
    }
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

@end