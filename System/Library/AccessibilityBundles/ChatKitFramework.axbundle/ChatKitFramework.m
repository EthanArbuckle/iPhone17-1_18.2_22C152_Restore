id AXCKLocalizedFromStringWithContact(void *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t vars8;

  if (a1)
  {
    v1 = AXCKFullNameForContact(a1);
    v2 = NSString;
    v3 = accessibilityLocalizedString(@"search.item.from.contact");
    v4 = objc_msgSend(v2, "localizedStringWithFormat:", v3, v1);
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

id AXCKFullNameForContact(void *a1)
{
  v14[1] = *MEMORY[0x263EF8340];
  id v1 = a1;
  v2 = [MEMORY[0x263EFEA20] descriptorForRequiredKeysForStyle:0];
  v14[0] = v2;
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:1];

  if (v1)
  {
    if ([v1 areKeysAvailable:v3]) {
      goto LABEL_5;
    }
    v4 = [v1 identifier];

    if (!v4) {
      goto LABEL_5;
    }
    v5 = accessibilityContactStore();
    v6 = [v1 identifier];
    uint64_t v7 = [v5 unifiedContactWithIdentifier:v6 keysToFetch:v3 error:0];

    id v1 = (id)v7;
    if (v7)
    {
LABEL_5:
      v8 = [MEMORY[0x263EFEA20] stringFromContact:v1 style:0];
      if (v8) {
        goto LABEL_12;
      }
    }
  }
  v9 = [v1 phoneNumbers];
  v10 = [v1 emailAddresses];
  if ([v9 count])
  {
    v11 = [v9 firstObject];
    v12 = [v11 value];
    v8 = [v12 stringValue];
  }
  else
  {
    if (![v10 count])
    {
      v8 = 0;
      goto LABEL_11;
    }
    v11 = [v10 firstObject];
    v8 = [v11 value];
  }

LABEL_11:
LABEL_12:

  return v8;
}

id accessibilityCameraKitLocalizedString(void *a1)
{
  id v1 = a1;
  v2 = (void *)accessibilityCameraKitLocalizedString_axBundle;
  if (accessibilityCameraKitLocalizedString_axBundle) {
    goto LABEL_4;
  }
  v3 = (void *)MEMORY[0x263F086E0];
  v4 = AXAccessibilityBundlesDirectory();
  v5 = [v4 stringByAppendingPathComponent:@"CameraKit.axbundle"];
  uint64_t v6 = [v3 bundleWithPath:v5];
  uint64_t v7 = (void *)accessibilityCameraKitLocalizedString_axBundle;
  accessibilityCameraKitLocalizedString_axBundle = v6;

  v2 = (void *)accessibilityCameraKitLocalizedString_axBundle;
  if (accessibilityCameraKitLocalizedString_axBundle
    || (_AXAssert(), (v2 = (void *)accessibilityCameraKitLocalizedString_axBundle) != 0))
  {
LABEL_4:
    v8 = [v2 localizedStringForKey:v1 value:&stru_26F654EE0 table:@"CameraKitStrings"];
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

void sub_241FFF5A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

id _AXCKStringForMediaType(int a1)
{
  switch(a1)
  {
    case 1:
      id v1 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.accessibility.AXMediaUtilities"];
      v2 = v1;
      v3 = @"filetype.audio";
      goto LABEL_9;
    case 2:
      id v1 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.accessibility.AXMediaUtilities"];
      v2 = v1;
      v3 = @"filetype.video";
      goto LABEL_9;
    case 3:
      id v1 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.accessibility.AXMediaUtilities"];
      v2 = v1;
      v3 = @"filetype.image";
      goto LABEL_9;
    case 4:
      id v1 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.accessibility.AXMediaUtilities"];
      v2 = v1;
      v3 = @"filetype.contact.card";
      goto LABEL_9;
    case 5:
      v5 = @"map.attachment";
      goto LABEL_11;
    case 6:
      id v1 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.accessibility.AXMediaUtilities"];
      v2 = v1;
      v3 = @"filetype.calendar.event";
LABEL_9:
      v4 = [v1 localizedStringForKey:v3 value:&stru_26F654EE0 table:@"Accessibility"];

      break;
    case 7:
      v5 = @"passkit.attachment";
LABEL_11:
      v4 = accessibilityLocalizedString(v5);
      break;
    default:
      v4 = 0;
      break;
  }

  return v4;
}

uint64_t _AXCKIsActionWindowShowing()
{
  v0 = AXApplicationGetMainBundleIdentifier();
  uint64_t v1 = [v0 isEqualToString:*MEMORY[0x263F21328]];

  if (v1)
  {
    objc_opt_class();
    v2 = [NSClassFromString(&cfstr_Ckactionmenuwi.isa) sharedInstance];
    v3 = __UIAccessibilityCastAsClass();

    if (v3)
    {
      uint64_t v1 = [v3 isHidden] ^ 1;
    }
    else
    {
      return 0;
    }
  }
  return v1;
}

id _AXCKFullScreenEffectString(void *a1, int a2)
{
  id v3 = a1;
  if ([v3 isEqualToString:@"com.apple.messages.effect.CKHappyBirthdayEffect"])
  {
    v4 = @"impact.effect.full.balloons";
  }
  else if ([v3 isEqualToString:@"com.apple.messages.effect.CKConfettiEffect"])
  {
    v4 = @"impact.effect.full.confetti";
  }
  else if ([v3 isEqualToString:@"com.apple.messages.effect.CKHeartEffect"])
  {
    v4 = @"impact.effect.full.love";
  }
  else if ([v3 isEqualToString:@"com.apple.messages.effect.CKLasersEffect"])
  {
    v4 = @"impact.effect.full.lasers";
  }
  else if ([v3 isEqualToString:@"com.apple.messages.effect.CKFireworksEffect"])
  {
    v4 = @"impact.effect.full.fireworks";
  }
  else if ([v3 isEqualToString:@"com.apple.messages.effect.CKShootingStarEffect"])
  {
    v4 = @"impact.effect.full.shootingstar";
  }
  else if ([v3 isEqualToString:@"com.apple.messages.effect.CKSparklesEffect"])
  {
    v4 = @"impact.effect.full.celebration";
  }
  else if ([v3 isEqualToString:@"com.apple.messages.effect.CKEchoEffect"])
  {
    v4 = @"impact.effect.full.echo";
  }
  else
  {
    if (![v3 isEqualToString:@"com.apple.messages.effect.CKSpotlightEffect"])
    {
      v5 = 0;
      v4 = 0;
      goto LABEL_22;
    }
    v4 = @"impact.effect.full.spotlight";
  }
  if (a2)
  {
    v4 = [NSString stringWithFormat:@"%@.description", v4];
  }
  v5 = accessibilityLocalizedString(v4);
LABEL_22:

  return v5;
}

id accessibilityContactStore()
{
  if (accessibilityContactStore_onceToken != -1) {
    dispatch_once(&accessibilityContactStore_onceToken, &__block_literal_global_1257);
  }
  v0 = (void *)accessibilityContactStore_store;

  return v0;
}

uint64_t __accessibilityContactStore_block_invoke()
{
  accessibilityContactStore_store = (uint64_t)objc_alloc_init(MEMORY[0x263EFEA58]);

  return MEMORY[0x270F9A758]();
}

id _AXCKConfirmedMentions(void *a1, void *a2)
{
  return _AXCKMentions(a1, a2, 0);
}

id _AXCKMentions(void *a1, void *a2, int a3)
{
  id v24 = a1;
  id v5 = a2;
  if ([v5 length])
  {
    uint64_t v6 = [MEMORY[0x263EFF980] array];
    unint64_t v26 = 0;
    uint64_t v27 = 0;
    uint64_t v7 = [v5 length];
    if (v7)
    {
      unint64_t v8 = v7;
      unint64_t v9 = 0;
      v10 = @"__kIMMentionConfirmedMention";
      if (a3) {
        v10 = @"__kIMMentionAttributeName";
      }
      v25 = v10;
      unsigned int v23 = a3 ^ 1;
      while (1)
      {
        v11 = [v5 attributesAtIndex:v9 effectiveRange:&v26];
        v12 = v11;
        if (v26 == 0x7FFFFFFFFFFFFFFFLL) {
          break;
        }
        v13 = v25;
        v14 = [v12 objectForKey:v13];
        if (![(__CFString *)v13 isEqualToString:@"__kIMMentionAttributeName"]
          || ([v12 objectForKey:@"__kIMMentionConfirmedMention"],
              v15 = objc_claimAutoreleasedReturnValue(),
              v15,
              !v15))
        {
          if (v14)
          {
            v16 = [[AXCKMentionSubelement alloc] initWithTextView:v24];
            -[AXCKMentionSubelement setRange:](v16, "setRange:", v26, v27);
            [(AXCKMentionSubelement *)v16 setType:v23];
            if ([(__CFString *)v13 isEqualToString:@"__kIMMentionAttributeName"])v17 = @"possible.mention.button.text"; {
            else
            }
              v17 = @"confirmed.mention.button.text";
            v18 = accessibilityLocalizedString(v17);
            [(AXCKMentionSubelement *)v16 setAccessibilityValue:v18];

            v19 = [v5 string];
            objc_msgSend(v19, "substringWithRange:", v26, v27);
            v21 = v20 = v6;
            [(AXCKMentionSubelement *)v16 setAccessibilityLabel:v21];

            uint64_t v6 = v20;
            [v20 axSafelyAddObject:v16];
          }
        }
        v26 += v27;
        uint64_t v27 = 0;

        unint64_t v9 = v26;
        if (v26 >= v8) {
          goto LABEL_18;
        }
      }
    }
  }
  else
  {
    uint64_t v6 = 0;
  }
LABEL_18:

  return v6;
}

id _AXCKPossibleMentions(void *a1)
{
  id v1 = a1;
  v2 = [v1 attributedText];
  id v3 = _AXCKMentions(v1, v2, 1);

  return v3;
}

id _AXCKTextEffectMentions(void *a1)
{
  id v1 = a1;
  v2 = [v1 attributedText];
  if ([v2 length])
  {
    id v3 = [MEMORY[0x263EFF980] array];
    uint64_t v4 = [v2 length];
    uint64_t v5 = *MEMORY[0x263F4AE78];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = ___AXCKTextEffectMentions_block_invoke;
    v15[3] = &unk_265112D60;
    id v6 = v1;
    id v16 = v6;
    id v17 = v2;
    id v18 = v3;
    id v7 = v3;
    objc_msgSend(v17, "enumerateAttribute:inRange:options:usingBlock:", v5, 0, v4, 0, v15);
    unint64_t v8 = _AXTextStyleMention(v6, (void *)*MEMORY[0x263F4AE70], @"texteffects.bold");
    [v7 axSafelyAddObject:v8];
    unint64_t v9 = _AXTextStyleMention(v6, (void *)*MEMORY[0x263F4AE80], @"texteffects.italic");
    [v7 axSafelyAddObject:v9];
    v10 = _AXTextStyleMention(v6, (void *)*MEMORY[0x263F4AE90], @"texteffects.underline");
    [v7 axSafelyAddObject:v10];
    v11 = _AXTextStyleMention(v6, (void *)*MEMORY[0x263F4AE88], @"texteffects.strikethrough");
    [v7 axSafelyAddObject:v11];
    if ([v7 count]) {
      v12 = v7;
    }
    else {
      v12 = 0;
    }
    id v13 = v12;
  }
  else
  {
    id v13 = 0;
  }

  return v13;
}

id _AXTextStyleMention(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a2;
  id v7 = a3;
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x3032000000;
  unsigned int v23 = __Block_byref_object_copy_;
  id v24 = __Block_byref_object_dispose_;
  id v25 = 0;
  unint64_t v8 = [v5 attributedText];
  uint64_t v9 = [v8 length];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = ___AXTextStyleMention_block_invoke;
  v15[3] = &unk_265112DB0;
  v19 = &v20;
  id v10 = v5;
  id v16 = v10;
  id v11 = v7;
  id v17 = v11;
  id v12 = v8;
  id v18 = v12;
  objc_msgSend(v12, "enumerateAttribute:inRange:options:usingBlock:", v6, 0, v9, 0, v15);
  id v13 = (id)v21[5];

  _Block_object_dispose(&v20, 8);

  return v13;
}

void sub_2420002AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id _AXCustomActionsForActions(void *a1)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v1 = a1;
  id v21 = [MEMORY[0x263EFF980] array];
  id v24 = accessibilityLocalizedString(@"unpin.action.label");
  uint64_t v22 = accessibilityLocalizedString(@"pin.action.label");
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id obj = v1;
  uint64_t v2 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v28;
    uint64_t v20 = v26;
    id v5 = @"\n";
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v28 != v4) {
          objc_enumerationMutation(obj);
        }
        id v7 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        unint64_t v8 = [v7 title];
        if (!v8)
        {
          uint64_t v9 = [v7 image];
          unint64_t v8 = [v9 accessibilityLabel];
        }
        if (objc_opt_respondsToSelector())
        {
          id v10 = v5;
          id v11 = [v7 safeValueForKey:@"state"];
          uint64_t v12 = [v11 integerValue];

          if (v12 == 1)
          {
            id v18 = accessibilityLocalizedString(@"switch.on");
            v19 = @"__AXStringForVariablesSentinel";
            uint64_t v13 = __UIAXStringForVariables();

            unint64_t v8 = (void *)v13;
          }
          id v5 = v10;
        }
        v14 = objc_msgSend(v8, "stringByReplacingOccurrencesOfString:withString:", v5, @" ", v18, v19, v20);

        if ([v14 length]
          && ([v14 containsString:v24] & 1) == 0
          && ([v14 containsString:v22] & 1) == 0)
        {
          id v15 = objc_alloc(MEMORY[0x263F1C390]);
          v25[0] = MEMORY[0x263EF8330];
          v25[1] = 3221225472;
          v26[0] = ___AXCustomActionsForActions_block_invoke;
          v26[1] = &unk_265112D88;
          v26[2] = v7;
          id v16 = (void *)[v15 initWithName:v14 actionHandler:v25];
          [v21 addObject:v16];
        }
      }
      uint64_t v3 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v3);
  }

  return v21;
}

void sub_242000FE0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2420019FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_242002DA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,char a41)
{
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
}

void sub_24200321C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2420039A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1(uint64_t a1)
{
}

void sub_242003C6C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_24200570C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_242005B3C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_242006B78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  _Block_object_dispose(&a67, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2(uint64_t a1)
{
}

void sub_2420074F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__3(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__3(uint64_t a1)
{
}

void sub_242008AFC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_242008D44(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_242008FC4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_242009F28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,char a49)
{
}

uint64_t __Block_byref_object_copy__4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__4(uint64_t a1)
{
}

void sub_24200A2A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_24200A410(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_24200AA80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_24200ACA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_24200C704(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_24200DCE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_24200FF14(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2420120F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_242012B2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__5(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__5(uint64_t a1)
{
}

void sub_24201385C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
}

void sub_242013A24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id _axLocalizedStringForLayoutIntent(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 9)
  {
    uint64_t v2 = 0;
  }
  else
  {
    uint64_t v2 = accessibilityLocalizedString(off_265113290[a1 - 1]);
  }
  return v2;
}

void sub_242013CB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_242014968(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_242015AF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__6(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__6(uint64_t a1)
{
}

void sub_242016814(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2420168C4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_242017710(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_242018268(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void voiceOverDidEnableHandwriting()
{
  objc_opt_class();
  v0 = __UIAccessibilityCastAsSafeCategory();
  [v0 _axSetIsHandwritingEnabled:1];
}

void voiceOverDidDisableHandwriting()
{
  objc_opt_class();
  v0 = __UIAccessibilityCastAsSafeCategory();
  [v0 _axSetIsHandwritingEnabled:0];
}

void sub_242019FE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__7(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__7(uint64_t a1)
{
}

void sub_24201A524(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__8(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__8(uint64_t a1)
{
}

void sub_24201C3C4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 72));
  _Unwind_Resume(a1);
}

void sub_24201E7C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__9(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__9(uint64_t a1)
{
}

void sub_24201FE04(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2420201A4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_242021264(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location, id a16)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a16);
  _Unwind_Resume(a1);
}

void sub_242021340(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_2420222DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__10(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__10(uint64_t a1)
{
}

void sub_242022B1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,char a53)
{
}

uint64_t __Block_byref_object_copy__11(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__11(uint64_t a1)
{
}

void sub_242024544(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_242025B38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_242026498(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__12(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__12(uint64_t a1)
{
}

void sub_2420270DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id accessibilityLocalizedString(void *a1)
{
  id v1 = a1;
  uint64_t v2 = (void *)accessibilityLocalizedString_axBundle;
  if (accessibilityLocalizedString_axBundle
    || ([MEMORY[0x263F086E0] bundleForClass:objc_opt_class()],
        uint64_t v3 = objc_claimAutoreleasedReturnValue(),
        uint64_t v4 = (void *)accessibilityLocalizedString_axBundle,
        accessibilityLocalizedString_axBundle = v3,
        v4,
        (uint64_t v2 = (void *)accessibilityLocalizedString_axBundle) != 0))
  {
    id v5 = [v2 localizedStringForKey:v1 value:&stru_26F654EE0 table:@"Accessibility"];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

id addFirstResponderRotorsToRotorArray(void *a1)
{
  id v1 = (void *)[a1 mutableCopy];
  if (!v1)
  {
    id v1 = [MEMORY[0x263EFF980] array];
  }
  uint64_t v2 = [(id)*MEMORY[0x263F1D020] _accessibilityMainWindow];
  uint64_t v3 = [v2 firstResponder];

  uint64_t v4 = [v3 accessibilityCustomRotors];
  if (v4) {
    [v1 addObjectsFromArray:v4];
  }

  return v1;
}

uint64_t AXAccessibilityBundlesDirectory()
{
  return MEMORY[0x270F09138]();
}

uint64_t AXApplicationGetMainBundleIdentifier()
{
  return MEMORY[0x270F09150]();
}

uint64_t AXAttributedStringForBetterPronuciation()
{
  return MEMORY[0x270F80888]();
}

uint64_t AXCFormattedString()
{
  return MEMORY[0x270F09160]();
}

uint64_t AXDateStringForFormat()
{
  return MEMORY[0x270F09F50]();
}

uint64_t AXDeviceIsPad()
{
  return MEMORY[0x270F091E0]();
}

uint64_t AXDeviceIsPhoneIdiom()
{
  return MEMORY[0x270F091F0]();
}

uint64_t AXDoesRequestingClientDeserveAutomation()
{
  return MEMORY[0x270F09808]();
}

uint64_t AXDurationForDurationString()
{
  return MEMORY[0x270F0A0A0]();
}

uint64_t AXDurationStringForDuration()
{
  return MEMORY[0x270F0A0A8]();
}

uint64_t AXForceTouchAvailableAndEnabled()
{
  return MEMORY[0x270F0A0D0]();
}

uint64_t AXFormatInteger()
{
  return MEMORY[0x270F09248]();
}

uint64_t AXLocalizeDurationTime()
{
  return MEMORY[0x270F0A198]();
}

uint64_t AXLogCommon()
{
  return MEMORY[0x270F092D8]();
}

uint64_t AXPerformBlockOnMainThread()
{
  return MEMORY[0x270F09430]();
}

uint64_t AXPerformBlockOnMainThreadAfterDelay()
{
  return MEMORY[0x270F09440]();
}

uint64_t AXPerformSafeBlock()
{
  return MEMORY[0x270F09460]();
}

uint64_t AXProcessGetName()
{
  return MEMORY[0x270F09478]();
}

uint64_t AXRequestingClient()
{
  return MEMORY[0x270F09860]();
}

uint64_t AXSafeClassFromString()
{
  return MEMORY[0x270F09540]();
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x270EE4B88]();
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
}

CGFloat CGRectGetHeight(CGRect rect)
{
  MEMORY[0x270EE71A8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  MEMORY[0x270EE7218]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGRect CGRectUnion(CGRect r1, CGRect r2)
{
  MEMORY[0x270EE7290]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x270EF2A50](aClassName);
}

Protocol *__cdecl NSProtocolFromString(NSString *namestr)
{
  return (Protocol *)MEMORY[0x270EF2B98](namestr);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

uint64_t UIAXApplyPhoneContextTokenToString()
{
  return MEMORY[0x270F808C8]();
}

uint64_t UIAXArrayForString()
{
  return MEMORY[0x270F808D0]();
}

uint64_t UIAXLabelForElements()
{
  return MEMORY[0x270F808F8]();
}

uint64_t UIAccessibilityConvertAttachmentsInAttributedStringToAX()
{
  return MEMORY[0x270F80970]();
}

CGRect UIAccessibilityConvertFrameToScreenCoordinates(CGRect rect, UIView *view)
{
  MEMORY[0x270F05ED8](view, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

uint64_t UIAccessibilityEmojiDescription()
{
  return MEMORY[0x270F097D0]();
}

id UIAccessibilityFocusedElement(UIAccessibilityAssistiveTechnologyIdentifier assistiveTechnologyIdentifier)
{
  return (id)MEMORY[0x270F05EF0](assistiveTechnologyIdentifier);
}

uint64_t UIAccessibilityIsImageScreenshot()
{
  return MEMORY[0x270F097D8]();
}

BOOL UIAccessibilityIsSwitchControlRunning(void)
{
  return MEMORY[0x270F05F48]();
}

BOOL UIAccessibilityIsVoiceOverRunning(void)
{
  return MEMORY[0x270F05F58]();
}

uint64_t UIAccessibilityMetadataDescriptionForImage()
{
  return MEMORY[0x270F097E0]();
}

uint64_t UIAccessibilityMetadataDescriptionForVideo()
{
  return MEMORY[0x270F097E8]();
}

uint64_t UIAccessibilityPhotoCreationDate()
{
  return MEMORY[0x270F097F0]();
}

void UIAccessibilityPostNotification(UIAccessibilityNotifications notification, id argument)
{
}

uint64_t UIAccessibilityRelateElements()
{
  return MEMORY[0x270F809E8]();
}

uint64_t UIAccessibilitySpeak()
{
  return MEMORY[0x270F80A08]();
}

uint64_t UIAccessibilitySpeakAndDoNotBeInterrupted()
{
  return MEMORY[0x270F80A10]();
}

uint64_t UIAccessibilitySpeakIfNotSpeaking()
{
  return MEMORY[0x270F80A18]();
}

uint64_t UIAccessibilityUnrelateAllElements()
{
  return MEMORY[0x270F80A28]();
}

uint64_t UIRectGetCenter()
{
  return MEMORY[0x270F06240]();
}

uint64_t UISystemRootDirectory()
{
  return MEMORY[0x270F062A8]();
}

uint64_t VOTLogHandwriting()
{
  return MEMORY[0x270F095C0]();
}

uint64_t _AXAssert()
{
  return MEMORY[0x270F095D8]();
}

uint64_t _AXLogWithFacility()
{
  return MEMORY[0x270F095E8]();
}

uint64_t _AXSAutomationEnabled()
{
  return MEMORY[0x270F90600]();
}

uint64_t _AXSCommandAndControlEnabled()
{
  return MEMORY[0x270F906C0]();
}

uint64_t _AXSFullKeyboardAccessEnabled()
{
  return MEMORY[0x270F90758]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _UIAccessibilityIgnoreNextNotification()
{
  return MEMORY[0x270F80AC8]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t __AXStringForVariables()
{
  return MEMORY[0x270F099D8]();
}

uint64_t __UIAXStringForVariables()
{
  return MEMORY[0x270F80AF8]();
}

uint64_t __UIAccessibilityCastAsClass()
{
  return MEMORY[0x270F09600]();
}

uint64_t __UIAccessibilityCastAsSafeCategory()
{
  return MEMORY[0x270F09610]();
}

uint64_t __UIAccessibilityGetAssociatedObject()
{
  return MEMORY[0x270F09658]();
}

uint64_t __UIAccessibilitySafeClass()
{
  return MEMORY[0x270F09670]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void abort(void)
{
}

uint64_t accessibilityUIKitLocalizedString()
{
  return MEMORY[0x270F80B08]();
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x270F9A688](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x270F9A6B0](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x270F9A700]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x270F9A710]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x270F9A728]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x270F9A9F8](location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}