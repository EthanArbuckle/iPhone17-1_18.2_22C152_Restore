@interface AAUICustodianHelpCodeView
- (AAUICustodianHelpCodeView)initWithFrame:(CGRect)a3;
- (void)setText:(id)a3;
@end

@implementation AAUICustodianHelpCodeView

- (AAUICustodianHelpCodeView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)AAUICustodianHelpCodeView;
  v3 = -[AAUICustodianHelpCodeView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(AAUICustodianHelpCodeView *)v3 setTextAlignment:1];
    [(AAUICustodianHelpCodeView *)v4 setContentMode:4];
  }
  return v4;
}

- (void)setText:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc(MEMORY[0x263F089B8]) initWithString:v4];
  if ([v4 length] != 1)
  {
    unint64_t v6 = 0;
    uint64_t v7 = *MEMORY[0x263F81510];
    do
      objc_msgSend(v5, "addAttribute:value:range:", v7, &unk_26BD70CA0, v6++, 1);
    while ([v4 length] - 1 > v6);
  }
  v8 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F835A8]];
  objc_msgSend(v5, "addAttribute:value:range:", *MEMORY[0x263F814F0], v8, 0, 6);
  v9.receiver = self;
  v9.super_class = (Class)AAUICustodianHelpCodeView;
  [(AAUICustodianHelpCodeView *)&v9 setAttributedText:v5];
}

- (void).cxx_destruct
{
}

@end