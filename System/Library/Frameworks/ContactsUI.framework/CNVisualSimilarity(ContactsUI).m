@interface CNVisualSimilarity(ContactsUI)
+ (id)fingerprintForUIImage:()ContactsUI;
@end

@implementation CNVisualSimilarity(ContactsUI)

+ (id)fingerprintForUIImage:()ContactsUI
{
  v4 = (objc_class *)MEMORY[0x1E4F45890];
  id v5 = a3;
  id v6 = [v4 alloc];
  id v7 = v5;
  uint64_t v8 = [v7 CGImage];

  v9 = (void *)[v6 initWithCGImage:v8 options:MEMORY[0x1E4F1CC08]];
  v10 = [a1 fingerprintForImageRequestHandler:v9];

  return v10;
}

@end