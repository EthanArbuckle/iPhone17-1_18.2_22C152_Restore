@interface AKFontListController
+ (id)attributedStringForFont:(id)a3;
- (AKFontListController)initWithController:(id)a3;
- (NSArray)fonts;
- (UIFont)defaultFont;
- (id)_createFontsList;
- (void)setDefaultFont:(id)a3;
- (void)setFonts:(id)a3;
@end

@implementation AKFontListController

- (AKFontListController)initWithController:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)AKFontListController;
  v3 = [(AKFontListController *)&v8 init];
  v4 = v3;
  if (v3)
  {
    uint64_t v5 = [(AKFontListController *)v3 _createFontsList];
    fonts = v4->_fonts;
    v4->_fonts = (NSArray *)v5;
  }
  return v4;
}

- (id)_createFontsList
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  v2 = +[AKController akBundle];
  v3 = [v2 URLForResource:@"FontPresets" withExtension:@"plist"];

  v16 = [NSDictionary dictionaryWithContentsOfURL:v3];
  v4 = [v16 objectForKey:@"fonts"];
  uint64_t v5 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id obj = v4;
  uint64_t v6 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(obj);
        }
        v10 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        v11 = [v10 valueForKey:@"fontFamily"];
        v12 = [v10 valueForKey:@"default"];
        int v13 = [v12 BOOLValue];

        v14 = [MEMORY[0x263F1C658] fontWithName:v11 size:18.0];
        if (v14)
        {
          [v5 addObject:v14];
          if (v13) {
            [(AKFontListController *)self setDefaultFont:v14];
          }
        }
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v7);
  }

  [(AKFontListController *)self setFonts:v5];

  return v5;
}

+ (id)attributedStringForFont:(id)a3
{
  id v3 = a3;
  v4 = [v3 familyName];
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x263F089B8]) initWithString:v4];
  objc_msgSend(v5, "addAttribute:value:range:", *MEMORY[0x263F1C238], v3, 0, objc_msgSend(v4, "length"));

  return v5;
}

- (NSArray)fonts
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (void)setFonts:(id)a3
{
}

- (UIFont)defaultFont
{
  return (UIFont *)objc_getProperty(self, a2, 16, 1);
}

- (void)setDefaultFont:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultFont, 0);

  objc_storeStrong((id *)&self->_fonts, 0);
}

@end