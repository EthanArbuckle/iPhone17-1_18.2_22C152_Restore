@interface NSAttributedString(FUUppercase)
- (id)FU_uppercaseAttributedStringCurrentLocale:()FUUppercase;
@end

@implementation NSAttributedString(FUUppercase)

- (id)FU_uppercaseAttributedStringCurrentLocale:()FUUppercase
{
  v5 = [a1 string];
  unint64_t v6 = [v5 length];
  v7 = objc_msgSend(v5, "FU_uppercaseStringUsingCurrentLocale:", a3);
  unint64_t v8 = [v7 length];
  v9 = (void *)[objc_alloc(MEMORY[0x263F089B8]) initWithString:v7];
  if (v8 < v6) {
    unint64_t v6 = v8;
  }
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __77__NSAttributedString_FUUppercase__FU_uppercaseAttributedStringCurrentLocale___block_invoke;
  v12[3] = &unk_264BDD670;
  id v10 = v9;
  id v13 = v10;
  objc_msgSend(a1, "enumerateAttributesInRange:options:usingBlock:", 0, v6, 0, v12);

  return v10;
}

@end