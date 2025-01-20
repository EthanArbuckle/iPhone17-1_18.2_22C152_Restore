@interface STKPreDeclare
+ (id)createEmojiStrikeWithImage:(CGImage *)a3 metadata:(id)a4;
+ (void)clearActiveKBForwardingInputDelegateAndResign:(BOOL)a3;
+ (void)setRestoresToEmojiInputMode;
@end

@implementation STKPreDeclare

+ (void)clearActiveKBForwardingInputDelegateAndResign:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [MEMORY[0x263F828B0] activeInstance];
  [v4 clearForwardingInputDelegateAndResign:v3];
}

+ (void)setRestoresToEmojiInputMode
{
  v2 = [MEMORY[0x263F828B0] activeInstance];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = [MEMORY[0x263F828B0] activeInstance];
    [v4 setRestoresToEmojiInputMode];
  }
}

+ (id)createEmojiStrikeWithImage:(CGImage *)a3 metadata:(id)a4
{
  id v5 = a4;
  int v6 = [(id)objc_opt_class() instancesRespondToSelector:sel_initWithImage_imageProperties_];
  id v7 = objc_alloc(MEMORY[0x263F03978]);
  if (v6) {
    uint64_t v8 = [v7 initWithImage:a3 imageProperties:v5];
  }
  else {
    uint64_t v8 = objc_msgSend(v7, "initWithImage:alignmentInset:", a3, *MEMORY[0x263F001B0], *(double *)(MEMORY[0x263F001B0] + 8));
  }
  v9 = (void *)v8;

  return v9;
}

@end