@interface NSObject_QSExtras
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)_accessibilityIsTextInput;
- (BOOL)_accessibilityIsTextInteraction;
- (BOOL)_accessibilityQScanPerformAction:(SEL)a3 withSender:(id)a4;
- (BOOL)_accessibilityQuickSpeakContentIsSpeakable;
- (BOOL)_accessibilityShouldShowPauseBubble;
- (BOOL)_accessibilityShouldShowSpeakBubble;
- (BOOL)_accessibilityShouldShowSpeakLanguageBubble;
- (BOOL)_accessibilityShouldUpdateQuickSpeakContent;
- (BOOL)_accessibilitySystemShouldShowPauseBubble;
- (BOOL)_accessibilitySystemShouldShowSpeakBubble;
- (BOOL)_accessibilitySystemShouldShowSpeakBubbleCommon;
- (BOOL)_accessibilitySystemShouldShowSpeakLanguageBubble;
- (BOOL)_accessibilitySystemShouldShowSpeakSentence;
- (BOOL)_accessibilitySystemShouldShowSpeakSpellOut;
- (id)_accessibilitySpeakSelectionTextInputResponder;
- (void)_accessibilityCacheContentIfNecessary;
- (void)_accessibilityPauseSpeaking:(id)a3;
- (void)_accessibilitySpeak:(id)a3;
- (void)_accessibilitySpeakLanguageSelection:(id)a3;
- (void)_accessibilitySpeakSentence:(id)a3;
- (void)_accessibilitySpeakSpellOut:(id)a3;
@end

@implementation NSObject_QSExtras

+ (id)safeCategoryTargetClassName
{
  return @"NSObject";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)_accessibilitySpeakSelectionTextInputResponder
{
  return 0;
}

- (BOOL)_accessibilityShouldShowSpeakBubble
{
  return 1;
}

- (BOOL)_accessibilityShouldShowSpeakLanguageBubble
{
  return 1;
}

- (BOOL)_accessibilityShouldShowPauseBubble
{
  return 1;
}

- (BOOL)_accessibilityIsTextInput
{
  if (objc_opt_respondsToSelector()) {
    char v2 = objc_opt_respondsToSelector();
  }
  else {
    char v2 = 0;
  }
  return v2 & 1;
}

- (BOOL)_accessibilityIsTextInteraction
{
  return objc_opt_isKindOfClass() & 1;
}

- (BOOL)_accessibilityShouldUpdateQuickSpeakContent
{
  v3 = +[AXQuickSpeak sharedInstance];
  v4 = [v3 content];
  v5 = objc_getAssociatedObject(self, &CachedSelectedTextRange);
  if ([(NSObject_QSExtras *)self _accessibilityIsTextInput]) {
    v6 = self;
  }
  else {
    v6 = 0;
  }
  if ([(NSObject_QSExtras *)self _accessibilityIsTextInteraction])
  {
    uint64_t v7 = [(NSObject_QSExtras *)self safeValueForKey:@"_textInput"];

    v6 = (NSObject_QSExtras *)v7;
  }
  if (v6 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    uint64_t v8 = [(NSObject_QSExtras *)v6 selectedTextRange];
    v9 = (void *)v8;
    BOOL v11 = 1;
    if (v5)
    {
      if (v8)
      {
        v10 = objc_opt_class();
        if ([v10 isEqual:objc_opt_class()])
        {
          if ([v5 isEqual:v9]
            && (![v4 length] || !objc_msgSend(v9, "isEmpty")))
          {
            BOOL v11 = 0;
          }
        }
      }
    }
    objc_setAssociatedObject(self, &CachedSelectedTextRange, v9, (void *)1);
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (void)_accessibilitySpeak:(id)a3
{
  id v8 = a3;
  [(NSObject_QSExtras *)self _accessibilityCacheContentIfNecessary];
  v4 = +[AXQuickSpeak sharedInstance];
  if (objc_opt_respondsToSelector())
  {
    v5 = [v8 safeValueForKey:@"dialect"];
  }
  else
  {
    v5 = 0;
  }
  v6 = +[AXQSMenuHelper sharedInstance];
  [v6 restoreMenu];

  uint64_t v7 = [v5 specificLanguageID];
  [v4 speakAction:self withPreferredLanguage:v7];
}

- (void)_accessibilitySpeakSpellOut:(id)a3
{
  id v10 = a3;
  [(NSObject_QSExtras *)self _accessibilityCacheContentIfNecessary];
  v4 = +[AXQuickSpeak sharedInstance];
  if (objc_opt_respondsToSelector())
  {
    v5 = [v10 safeValueForKey:@"dialect"];
  }
  else
  {
    v5 = 0;
  }
  v6 = [v5 specificLanguageID];
  if (!v6)
  {
    uint64_t v7 = [MEMORY[0x263F1C748] sharedInputModeController];
    id v8 = [v7 currentInputModeInPreference];
    v6 = [v8 primaryLanguage];
  }
  v9 = +[AXQSMenuHelper sharedInstance];
  [v9 restoreMenu];

  [v4 setSpellOutContent:1];
  [v4 speakAction:self withPreferredLanguage:v6];
}

- (void)_accessibilitySpeakSentence:(id)a3
{
  v4 = +[AXQuickSpeak sharedInstance];
  id v7 = 0;
  v5 = [(NSObject_QSExtras *)self _accessibilityQuickSpeakEnclosingSentence:&v7];
  id v6 = v7;
  [v4 setContent:v5];

  [v4 setSpeakingSentenceRange:v6];
  [v4 speakAction:self withPreferredLanguage:0];
}

- (void)_accessibilityPauseSpeaking:(id)a3
{
  id v3 = a3;
  v4 = +[AXQuickSpeak sharedInstance];
  int v5 = [v4 isSpeaking];

  id v6 = +[AXQuickSpeak sharedInstance];
  id v7 = v6;
  if (v5) {
    [v6 pauseAction:v3];
  }
  else {
    [v6 resumeAction:v3];
  }
}

- (void)_accessibilitySpeakLanguageSelection:(id)a3
{
  uint64_t v84 = *MEMORY[0x263EF8340];
  v62 = +[AXQuickSpeak sharedInstance];
  v52 = [v62 selectedContent];
  v53 = [v52 unpredictedAmbiguousLangMaps];
  uint64_t v3 = [v52 predictedSecondaryLangMaps];
  v4 = [v52 unambiguousLangMaps];
  v51 = v4;
  if ((unint64_t)[v4 count] >= 2)
  {
    int v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v6 = [v5 localizedStringForKey:@"quickspeak.many.languages" value:0 table:@"QuickSpeak"];

    v64 = objc_msgSend(NSString, "localizedStringWithFormat:", v6, objc_msgSend(v4, "count"));
    goto LABEL_5;
  }
  if ([v4 count] == 1)
  {
    id v7 = NSString;
    id v6 = [v4 firstObject];
    id v8 = [v6 defaultDialect];
    [v8 languageNameInNativeLocale];
    id v10 = v9 = v3;
    v64 = [v7 stringWithFormat:@"& %@", v10];

    uint64_t v3 = v9;
LABEL_5:

    v4 = v51;
    if (!v3) {
      goto LABEL_12;
    }
    goto LABEL_8;
  }
  v64 = 0;
  if (!v3) {
    goto LABEL_12;
  }
LABEL_8:
  if ([v4 intersectsOrderedSet:v3])
  {
    BOOL v11 = AXLogSpeakSelection();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v81 = v3;
      __int16 v82 = 2112;
      v83 = v4;
      _os_log_impl(&dword_240270000, v11, OS_LOG_TYPE_INFO, "Secondary maps contained langs in non ambiguous maps. Secondary Maps: %@ Non-ambiguous Maps: %@", buf, 0x16u);
    }
  }
LABEL_12:
  v61 = [MEMORY[0x263EFF980] array];
  v12 = [MEMORY[0x263EFF9B0] orderedSet];
  [v12 unionOrderedSet:v53];
  v50 = (void *)v3;
  if (!v3) {
    goto LABEL_19;
  }
  v13 = [v52 primaryUnambiguousDialect];

  if (v13)
  {
    v14 = [v52 primaryUnambiguousDialect];
LABEL_17:
    v16 = v14;
    v17 = [v14 langMap];
    [v12 addObject:v17];

    goto LABEL_18;
  }
  v15 = [v52 primaryAmbiguousDialect];

  if (v15)
  {
    v14 = [v52 primaryAmbiguousDialect];
    goto LABEL_17;
  }
LABEL_18:
  [v12 unionOrderedSet:v3];
LABEL_19:
  long long v75 = 0u;
  long long v76 = 0u;
  long long v74 = 0u;
  long long v73 = 0u;
  id obj = v12;
  uint64_t v18 = [obj countByEnumeratingWithState:&v73 objects:v79 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v74;
    unint64_t v21 = 0x263F22000uLL;
    uint64_t v54 = *(void *)v74;
    do
    {
      uint64_t v22 = 0;
      uint64_t v55 = v19;
      do
      {
        if (*(void *)v74 != v20) {
          objc_enumerationMutation(obj);
        }
        v23 = *(void **)(*((void *)&v73 + 1) + 8 * v22);
        v24 = [v23 associatedAmbiguousLanguages];
        v25 = [*(id *)(v21 + 2256) sharedInstance];
        v26 = [v25 systemLanguageID];
        char v27 = [v24 containsObject:v26];

        if ((v27 & 1) == 0)
        {
          uint64_t v57 = v22;
          v28 = [v23 defaultDialect];
          v78 = v28;
          v29 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v78 count:1];

          long long v71 = 0u;
          long long v72 = 0u;
          long long v69 = 0u;
          long long v70 = 0u;
          id v59 = v29;
          uint64_t v30 = [v59 countByEnumeratingWithState:&v69 objects:v77 count:16];
          unint64_t v31 = 0x263F22000uLL;
          if (!v30) {
            goto LABEL_40;
          }
          uint64_t v32 = v30;
          uint64_t v33 = *(void *)v70;
          while (1)
          {
            uint64_t v34 = 0;
            uint64_t v58 = v32;
            do
            {
              if (*(void *)v70 != v33) {
                objc_enumerationMutation(v59);
              }
              v35 = *(void **)(*((void *)&v69 + 1) + 8 * v34);
              v36 = [*(id *)(v31 + 2256) sharedInstance];
              v37 = [v36 dialectForCurrentLocale];
              v38 = [v37 langMap];
              if ([v23 isEqual:v38])
              {
                [*(id *)(v31 + 2256) sharedInstance];
                uint64_t v39 = v33;
                v41 = v40 = v23;
                v42 = [v41 dialectForCurrentLocale];
                int v63 = [v35 isEqual:v42];

                unint64_t v31 = 0x263F22000;
                v23 = v40;
                uint64_t v33 = v39;
                uint64_t v32 = v58;

                if (!v63) {
                  goto LABEL_38;
                }
              }
              else
              {
              }
              v43 = [v35 languageNameInNativeLocale];
              v44 = v43;
              if (v64)
              {
                id v45 = [NSString stringWithFormat:@"%@ %@", v43, v64];
              }
              else
              {
                id v45 = v43;
              }
              v46 = v45;
              v47 = (void *)MEMORY[0x263F1C3C0];
              v65[0] = MEMORY[0x263EF8330];
              v65[1] = 3221225472;
              v65[2] = __58__NSObject_QSExtras__accessibilitySpeakLanguageSelection___block_invoke;
              v65[3] = &unk_2650A9FE0;
              id v66 = v62;
              v67 = self;
              v68 = v35;
              v48 = [v47 actionWithTitle:v46 image:0 identifier:0 handler:v65];
              [v61 addObject:v48];

LABEL_38:
              ++v34;
            }
            while (v32 != v34);
            uint64_t v32 = [v59 countByEnumeratingWithState:&v69 objects:v77 count:16];
            if (!v32)
            {
LABEL_40:

              uint64_t v20 = v54;
              uint64_t v19 = v55;
              uint64_t v22 = v57;
              break;
            }
          }
        }
        ++v22;
        unint64_t v21 = 0x263F22000;
      }
      while (v22 != v19);
      uint64_t v19 = [obj countByEnumeratingWithState:&v73 objects:v79 count:16];
    }
    while (v19);
  }

  v49 = +[AXQSMenuHelper sharedInstance];
  [v49 setShowingLanguageChoices:1];
}

- (BOOL)_accessibilitySystemShouldShowSpeakBubbleCommon
{
  int v3 = _AXSQuickSpeakEnabled();
  if (v3)
  {
    v4 = +[AXQSMenuHelper sharedInstance];
    char v5 = [v4 isShowingLanguageChoices];

    if ((v5 & 1) != 0
      || (+[AXQuickSpeak sharedInstance],
          id v6 = objc_claimAutoreleasedReturnValue(),
          char v7 = [v6 isSpeaking],
          v6,
          (v7 & 1) != 0))
    {
      LOBYTE(v3) = 0;
    }
    else
    {
      LOBYTE(v3) = !+[AXQuickSpeak quickSpeakClassIsDenied:self];
    }
  }
  return v3;
}

- (void)_accessibilityCacheContentIfNecessary
{
  id v11 = +[AXQuickSpeak sharedInstance];
  uint64_t v3 = [v11 content];
  if (!v3
    || (v4 = (void *)v3,
        BOOL v5 = [(NSObject_QSExtras *)self _accessibilityShouldUpdateQuickSpeakContent], v4, v5))
  {
    id v6 = self;
    char v7 = [(NSObject_QSExtras *)v6 _accessibilityUITextInput];
    id v8 = v7;
    uint64_t v9 = v6;
    if (v7)
    {
      uint64_t v9 = v7;
    }
    id v10 = [(NSObject_QSExtras *)v9 _accessibilityQuickSpeakContent];
    [v11 setContent:v10];
    [v11 setContentOwner:v6];
  }
}

- (BOOL)_accessibilitySystemShouldShowSpeakSpellOut
{
  v19[1] = *MEMORY[0x263EF8340];
  if ([(NSObject_QSExtras *)self _accessibilitySystemShouldShowSpeakBubbleCommon])
  {
    [(NSObject_QSExtras *)self _accessibilityCacheContentIfNecessary];
    uint64_t v3 = +[AXQuickSpeak sharedInstance];
    v4 = [v3 content];

    id v5 = objc_alloc(MEMORY[0x263F08948]);
    v19[0] = *MEMORY[0x263F082D8];
    uint64_t v6 = v19[0];
    char v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v19 count:1];
    id v8 = (void *)[v5 initWithTagSchemes:v7 options:0];

    [v8 setString:v4];
    uint64_t v15 = 0;
    v16 = &v15;
    uint64_t v17 = 0x2020000000;
    uint64_t v18 = 0;
    uint64_t v9 = [v4 length];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __64__NSObject_QSExtras__accessibilitySystemShouldShowSpeakSpellOut__block_invoke;
    v14[3] = &unk_2650AA008;
    v14[4] = &v15;
    objc_msgSend(v8, "enumerateTagsInRange:scheme:options:usingBlock:", 0, v9, v6, 0, v14);
    uint64_t v10 = v16[3];
    if (v10 == 1)
    {
      [v4 rangeOfComposedCharacterSequenceAtIndex:0];
      if (v11 == [v4 length])
      {
        BOOL v12 = 0;
LABEL_8:
        _Block_object_dispose(&v15, 8);

        return v12;
      }
      uint64_t v10 = v16[3];
    }
    BOOL v12 = v10 == 1;
    goto LABEL_8;
  }
  return 0;
}

- (BOOL)_accessibilitySystemShouldShowSpeakSentence
{
  if (![(NSObject_QSExtras *)self _accessibilitySystemShouldShowSpeakBubbleCommon])return 0; {
  [(NSObject_QSExtras *)self _accessibilityCacheContentIfNecessary];
  }
  uint64_t v3 = +[AXQuickSpeak sharedInstance];
  v4 = [v3 content];

  BOOL v5 = 0;
  if (![v4 length])
  {
    uint64_t v6 = [(NSObject_QSExtras *)self _accessibilityQuickSpeakEnclosingSentence:0];
    uint64_t v7 = [v6 length];

    if (v7) {
      BOOL v5 = 1;
    }
  }

  return v5;
}

- (BOOL)_accessibilitySystemShouldShowSpeakBubble
{
  if ([(NSObject_QSExtras *)self _accessibilitySystemShouldShowSpeakBubbleCommon])
  {
    uint64_t v3 = +[AXQuickSpeak sharedInstance];
    if ([v3 isPaused])
    {
      LOBYTE(v4) = 1;
    }
    else
    {
      [(NSObject_QSExtras *)self _accessibilityCacheContentIfNecessary];
      if ([v3 selectedContentIsSpeakable]) {
        int v4 = [v3 selectedContentRequiresUserChoice] ^ 1;
      }
      else {
        LOBYTE(v4) = 0;
      }
    }
  }
  else
  {
    LOBYTE(v4) = 0;
  }
  return v4;
}

- (BOOL)_accessibilitySystemShouldShowSpeakLanguageBubble
{
  if (![(NSObject_QSExtras *)self _accessibilitySystemShouldShowSpeakBubbleCommon])return 0; {
  [(NSObject_QSExtras *)self _accessibilityCacheContentIfNecessary];
  }
  uint64_t v3 = +[AXQuickSpeak sharedInstance];
  if ([v3 isPaused]) {
    char v4 = 0;
  }
  else {
    char v4 = [v3 selectedContentRequiresUserChoice];
  }

  return v4;
}

- (BOOL)_accessibilitySystemShouldShowPauseBubble
{
  char v2 = +[AXQSMenuHelper sharedInstance];
  if ([v2 isShowingLanguageChoices])
  {
    char v3 = 0;
  }
  else
  {
    char v4 = +[AXQuickSpeak sharedInstance];
    char v3 = [v4 isSpeaking];
  }
  return v3;
}

- (BOOL)_accessibilityQScanPerformAction:(SEL)a3 withSender:(id)a4
{
  id v6 = a4;
  if (sel__accessibilitySpeak_ == a3)
  {
    if ([(NSObject_QSExtras *)self _accessibilitySystemShouldShowSpeakBubble])
    {
      BOOL v7 = [(NSObject_QSExtras *)self _accessibilityShouldShowSpeakBubble];
      goto LABEL_13;
    }
LABEL_17:
    char v8 = 0;
    goto LABEL_18;
  }
  if (sel__accessibilitySpeakSentence_ == a3)
  {
    BOOL v7 = [(NSObject_QSExtras *)self _accessibilitySystemShouldShowSpeakSentence];
    goto LABEL_13;
  }
  if (sel__accessibilitySpeakSpellOut_ == a3)
  {
    BOOL v7 = [(NSObject_QSExtras *)self _accessibilityShouldShowSpeakSpellOut];
    goto LABEL_13;
  }
  if (sel__accessibilitySpeakWithLanguage_ == a3)
  {
    uint64_t v9 = +[AXQSMenuHelper sharedInstance];
    char v8 = [v9 isShowingLanguageChoices];

    goto LABEL_18;
  }
  if (sel__accessibilitySpeakLanguageSelection_ == a3)
  {
    if ([(NSObject_QSExtras *)self _accessibilityShouldShowSpeakLanguageBubble])
    {
      BOOL v7 = [(NSObject_QSExtras *)self _accessibilitySystemShouldShowSpeakLanguageBubble];
      goto LABEL_13;
    }
    goto LABEL_17;
  }
  if (sel__accessibilityPauseSpeaking_ != a3
    || ![(NSObject_QSExtras *)self _accessibilitySystemShouldShowPauseBubble])
  {
    goto LABEL_17;
  }
  BOOL v7 = [(NSObject_QSExtras *)self _accessibilityShouldShowPauseBubble];
LABEL_13:
  char v8 = v7;
LABEL_18:

  return v8;
}

- (BOOL)_accessibilityQuickSpeakContentIsSpeakable
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  char v2 = [MEMORY[0x263F213D8] sharedInstance];
  char v3 = [v2 ignoreLogging];

  if ((v3 & 1) == 0)
  {
    char v4 = [MEMORY[0x263F213D8] identifier];
    BOOL v5 = AXLoggerForFacility();

    os_log_type_t v6 = AXOSLogLevelFromAXLogLevel();
    if (os_log_type_enabled(v5, v6))
    {
      BOOL v7 = AXColorizeFormatLog();
      BOOL v12 = [MEMORY[0x263F08B88] callStackSymbols];
      char v8 = _AXStringForArgs();

      if (os_log_type_enabled(v5, v6))
      {
        *(_DWORD *)buf = 138543362;
        v14 = v8;
        _os_log_impl(&dword_240270000, v5, v6, "%{public}@", buf, 0xCu);
      }
    }
  }
  uint64_t v9 = +[AXQuickSpeak sharedInstance];
  char v10 = [v9 selectedContentIsSpeakable];

  return v10;
}

@end