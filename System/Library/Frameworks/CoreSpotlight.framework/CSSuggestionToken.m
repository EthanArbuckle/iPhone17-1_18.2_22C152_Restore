@interface CSSuggestionToken
@end

@implementation CSSuggestionToken

uint64_t __96___CSSuggestionToken_initWithUserString_displayString_attributeValues_attributeStrings_options___block_invoke()
{
  initWithUserString_displayString_attributeValues_attributeStrings_options__gPhoto = CSGetLocalizedString(@"PHOTO_TOKEN");

  return MEMORY[0x1F41817F8]();
}

uint64_t __52___CSSuggestionToken_initWithUserString_itemResult___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  if (!*(void *)(result + 32))
  {
    uint64_t v5 = result;
    result = [*(id *)(result + 40) rangeOfString:a2 options:1];
    if (result != 0x7FFFFFFFFFFFFFFFLL)
    {
      *(unsigned char *)(*(void *)(*(void *)(v5 + 48) + 8) + 24) = 1;
      *a4 = 1;
    }
  }
  return result;
}

void __63___CSSuggestionToken_initWithUserString_suggestionTokenResult___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v0 setObject:&unk_1EDBD6550 forKey:@"kQPTokenApplication"];
  [v0 setObject:&unk_1EDBD65C8 forKey:@"kQPTokenAttachmentAny"];
  [v0 setObject:&unk_1EDBD65C8 forKey:@"kQPTokenAttachment"];
  [v0 setObject:&unk_1EDBD65F8 forKey:@"kQPTokenBook"];
  [v0 setObject:&unk_1EDBD65E0 forKey:@"kQPTokenDate"];
  [v0 setObject:&unk_1EDBD6610 forKey:@"kQPTokenDocument"];
  [v0 setObject:&unk_1EDBD6580 forKey:@"kQPTokenEvent"];
  [v0 setObject:&unk_1EDBD6598 forKey:@"kQPTokenFolder"];
  [v0 setObject:&unk_1EDBD65B0 forKey:@"kQPTokenIgnoreStatus"];
  [v0 setObject:&unk_1EDBD66E8 forKey:@"kQPTokenImage"];
  [v0 setObject:&unk_1EDBD6700 forKey:@"kQPTokenMail"];
  [v0 setObject:&unk_1EDBD6718 forKey:@"kQPTokenMailbox"];
  [v0 setObject:&unk_1EDBD6670 forKey:@"kQPTokenMap"];
  [v0 setObject:&unk_1EDBD6730 forKey:@"kQPTokenMe"];
  [v0 setObject:&unk_1EDBD6748 forKey:@"kQPTokenMessage"];
  [v0 setObject:&unk_1EDBD6760 forKey:@"kQPTokenNote"];
  [v0 setObject:&unk_1EDBD6628 forKey:@"kQPTokenPhoto"];
  [v0 setObject:&unk_1EDBD6778 forKey:@"kQPTokenPresentation"];
  [v0 setObject:&unk_1EDBD6790 forKey:@"kQPTokenReadAction"];
  [v0 setObject:&unk_1EDBD67A8 forKey:@"kQPTokenRepliedAction"];
  [v0 setObject:&unk_1EDBD67C0 forKey:@"kQPTokenReminder"];
  [v0 setObject:&unk_1EDBD67D8 forKey:@"kQPTokenSource"];
  [v0 setObject:&unk_1EDBD67F0 forKey:@"kQPTokenSpreadsheet"];
  [v0 setObject:&unk_1EDBD6808 forKey:@"kQPTokenKeyword"];
  [v0 setObject:&unk_1EDBD6820 forKey:@"kQPTokenFlagColorAction"];
  [v0 setObject:&unk_1EDBD6838 forKey:@"kQPTokenFlaggedAction"];
  [v0 setObject:&unk_1EDBD6850 forKey:@"kQPTokenSubject"];
  [v0 setObject:&unk_1EDBD6850 forKey:@"kQPTokenTitle"];
  [v0 setObject:&unk_1EDBD6868 forKey:@"kQPTokenSubjectAction"];
  [v0 setObject:&unk_1EDBD6880 forKey:@"kQPTokenVideo"];
  [v0 setObject:&unk_1EDBD6898 forKey:@"kQPTokenWebsite"];
  [v0 setObject:&unk_1EDBD68B0 forKey:@"kQPTokenFieldAttribute"];
  v1 = (void *)initWithUserString_suggestionTokenResult__gSuggestionTypes;
  initWithUserString_suggestionTokenResult__gSuggestionTypes = (uint64_t)v0;
  id v4 = v0;

  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v2 setObject:&unk_1EDBD68C8 forKey:@"0"];
  [v2 setObject:&unk_1EDBD68E0 forKey:@"1"];
  [v2 setObject:&unk_1EDBD68F8 forKey:@"2"];
  [v2 setObject:&unk_1EDBD6910 forKey:@"3"];
  [v2 setObject:&unk_1EDBD6928 forKey:@"4"];
  [v2 setObject:&unk_1EDBD6940 forKey:@"5"];
  [v2 setObject:&unk_1EDBD6958 forKey:@"6"];
  v3 = (void *)initWithUserString_suggestionTokenResult__gSuggestionFlagColorTypes;
  initWithUserString_suggestionTokenResult__gSuggestionFlagColorTypes = (uint64_t)v2;
}

@end