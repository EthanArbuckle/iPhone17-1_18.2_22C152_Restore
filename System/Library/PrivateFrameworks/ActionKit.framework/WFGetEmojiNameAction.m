@interface WFGetEmojiNameAction
- (void)runAsynchronouslyWithInput:(id)a3;
@end

@implementation WFGetEmojiNameAction

- (void)runAsynchronouslyWithInput:(id)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __51__WFGetEmojiNameAction_runAsynchronouslyWithInput___block_invoke;
  v3[3] = &unk_264E5EF80;
  v3[4] = self;
  [a3 getStringRepresentation:v3];
}

void __51__WFGetEmojiNameAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v18[1] = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if ([v5 length])
  {
    CTFontRef v7 = CTFontCreateWithName(@"AppleColorEmoji", 0.0, 0);
    if (!v7)
    {
      v10 = *(void **)(a1 + 32);
      v11 = (void *)MEMORY[0x263F087E8];
      uint64_t v12 = *MEMORY[0x263F07F70];
      uint64_t v17 = *MEMORY[0x263F08320];
      v13 = WFLocalizedString(@"Failed to find the emoji font.");
      v18[0] = v13;
      v14 = [NSDictionary dictionaryWithObjects:v18 forKeys:&v17 count:1];
      v15 = [v11 errorWithDomain:v12 code:4 userInfo:v14];
      [v10 finishRunningWithError:v15];

      goto LABEL_6;
    }
    CTFontRef v8 = v7;
    uint64_t v9 = [v5 length];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __51__WFGetEmojiNameAction_runAsynchronouslyWithInput___block_invoke_2;
    v16[3] = &unk_264E5B2B0;
    v16[4] = *(void *)(a1 + 32);
    v16[5] = v8;
    objc_msgSend(v5, "enumerateSubstringsInRange:options:usingBlock:", 0, v9, 2, v16);
    CFRelease(v8);
  }
  [*(id *)(a1 + 32) finishRunningWithError:v6];
LABEL_6:
}

void __51__WFGetEmojiNameAction_runAsynchronouslyWithInput___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unint64_t a4)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v6 = a2;
  if (([v6 isEqualToString:@" "] & 1) == 0)
  {
    if (a4 >= 4) {
      a4 = 4;
    }
    objc_msgSend(v6, "getCharacters:range:", &characters, 0, a4);
    if (CTFontGetGlyphsForCharacters(*(CTFontRef *)(a1 + 40), &characters, &glyphs, a4))
    {
      Class EMFEmojiLocaleDataClass = getEMFEmojiLocaleDataClass();
      CTFontRef v8 = [MEMORY[0x263EFF960] currentLocale];
      uint64_t v9 = [v8 localeIdentifier];
      v10 = [(objc_class *)EMFEmojiLocaleDataClass emojiLocaleDataWithLocaleIdentifier:v9];

      v11 = [(objc_class *)getEMFEmojiTokenClass() emojiTokenWithString:v6 localeData:v10];
      uint64_t v12 = [v11 nameForType:2];
      if (v12 || ([v11 nameForType:1], (uint64_t v12 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        v13 = [*(id *)(a1 + 32) output];
        [v13 addObject:v12];
      }
    }
  }
}

@end