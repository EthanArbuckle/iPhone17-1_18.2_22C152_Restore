@interface UIImage(PDFMarkupMenuUtilities)
+ (id)_largePotWithSystemImageNamed:()PDFMarkupMenuUtilities;
+ (id)largeColorPotForColor:()PDFMarkupMenuUtilities;
+ (id)smallColorPotForColor:()PDFMarkupMenuUtilities withAccessibilityLabel:;
+ (id)smallStrikeOutPot;
+ (id)smallUnderlinePot;
+ (uint64_t)largeStrikeOutPot;
+ (uint64_t)largeUnderlinePot;
@end

@implementation UIImage(PDFMarkupMenuUtilities)

+ (id)smallColorPotForColor:()PDFMarkupMenuUtilities withAccessibilityLabel:
{
  id v5 = a3;
  id v6 = a4;
  v7 = [MEMORY[0x263F827E8] systemImageNamed:@"circle.fill"];
  if (v7)
  {
    v8 = v7;
    v9 = [v7 imageWithTintColor:v5 renderingMode:1];

    [v9 setAccessibilityLabel:v6];
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (id)smallUnderlinePot
{
  v0 = [MEMORY[0x263F827E8] systemImageNamed:@"underline"];
  if (v0)
  {
    v1 = v0;
    v2 = [v0 imageWithRenderingMode:1];

    v3 = PDFKitLocalizedString(@"Underline");
    [v2 setAccessibilityLabel:v3];
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

+ (id)smallStrikeOutPot
{
  v0 = [MEMORY[0x263F827E8] systemImageNamed:@"strikethrough"];
  if (v0)
  {
    v1 = v0;
    v2 = [v0 imageWithRenderingMode:1];

    v3 = PDFKitLocalizedString(@"Strikethrough");
    [v2 setAccessibilityLabel:v3];
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

+ (id)largeColorPotForColor:()PDFMarkupMenuUtilities
{
  id v3 = a3;
  v4 = objc_msgSend(objc_alloc(MEMORY[0x263F827A0]), "initWithSize:", 28.0, 28.0);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __57__UIImage_PDFMarkupMenuUtilities__largeColorPotForColor___block_invoke;
  v8[3] = &unk_264204668;
  id v9 = v3;
  id v5 = v3;
  id v6 = [v4 imageWithActions:v8];

  return v6;
}

+ (id)_largePotWithSystemImageNamed:()PDFMarkupMenuUtilities
{
  id v3 = (void *)MEMORY[0x263F82818];
  id v4 = a3;
  id v5 = [v3 configurationWithScale:-1];
  id v6 = [MEMORY[0x263F827E8] systemImageNamed:v4 withConfiguration:v5];

  v7 = [v6 imageWithRenderingMode:1];

  v8 = objc_msgSend(objc_alloc(MEMORY[0x263F827A0]), "initWithSize:", 28.0, 28.0);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __65__UIImage_PDFMarkupMenuUtilities___largePotWithSystemImageNamed___block_invoke;
  v12[3] = &unk_264204668;
  id v13 = v7;
  id v9 = v7;
  v10 = [v8 imageWithActions:v12];

  return v10;
}

+ (uint64_t)largeUnderlinePot
{
  return [a1 _largePotWithSystemImageNamed:@"underline"];
}

+ (uint64_t)largeStrikeOutPot
{
  return [a1 _largePotWithSystemImageNamed:@"strikethrough"];
}

@end