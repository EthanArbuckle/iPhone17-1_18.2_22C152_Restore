@interface NSMutableAttributedString(CNUI)
- (uint64_t)cnui_appendTaglineString:()CNUI withFont:;
- (void)cnui_appendTaglineString:()CNUI;
- (void)cnui_appendTaglineString:()CNUI uppercased:;
- (void)cnui_appendTaglineString:()CNUI withFont:uppercased:;
@end

@implementation NSMutableAttributedString(CNUI)

- (void)cnui_appendTaglineString:()CNUI withFont:uppercased:
{
  v25[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if (a5)
  {
    id v10 = [v8 localizedUppercaseString];
  }
  else
  {
    id v10 = v8;
  }
  v11 = v10;
  id v12 = objc_alloc(MEMORY[0x1E4F28B18]);
  uint64_t v24 = *MEMORY[0x1E4FB06F8];
  uint64_t v13 = v24;
  v25[0] = v9;
  v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:&v24 count:1];
  v15 = (void *)[v12 initWithString:v11 attributes:v14];

  id v16 = objc_alloc(MEMORY[0x1E4F28B18]);
  v17 = CNContactsUIBundle();
  v18 = [v17 localizedStringForKey:@"CARD_TAGLINE_SEPARATOR" value:&stru_1ED8AC728 table:@"Localized"];
  uint64_t v22 = v13;
  v19 = +[CNUIFontRepository contactCardStaticHeaderDefaultTaglineFont];
  v23 = v19;
  v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v23 forKeys:&v22 count:1];
  v21 = (void *)[v16 initWithString:v18 attributes:v20];

  if ([a1 length]) {
    [a1 appendAttributedString:v21];
  }
  [a1 appendAttributedString:v15];
}

- (uint64_t)cnui_appendTaglineString:()CNUI withFont:
{
  return objc_msgSend(a1, "cnui_appendTaglineString:withFont:uppercased:", a3, a4, 1);
}

- (void)cnui_appendTaglineString:()CNUI uppercased:
{
  id v6 = a3;
  id v7 = +[CNUIFontRepository contactCardStaticHeaderDefaultTaglineFont];
  objc_msgSend(a1, "cnui_appendTaglineString:withFont:uppercased:", v6, v7, a4);
}

- (void)cnui_appendTaglineString:()CNUI
{
  id v4 = a3;
  id v5 = +[CNUIFontRepository contactCardStaticHeaderDefaultTaglineFont];
  objc_msgSend(a1, "cnui_appendTaglineString:withFont:", v4, v5);
}

@end