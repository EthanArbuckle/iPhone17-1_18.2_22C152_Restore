@interface NSExtension(ContactsDonation)
- (id)_cnd_requestWithInputItems:()ContactsDonation;
@end

@implementation NSExtension(ContactsDonation)

- (id)_cnd_requestWithInputItems:()ContactsDonation
{
  v4 = (objc_class *)MEMORY[0x263F33630];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  v7 = [v6 completionHandlerAdapter];
  [a1 beginExtensionRequestWithInputItems:v5 completion:v7];

  v8 = [v6 future];
  [v8 addFailureBlock:&__block_literal_global_3];

  return v8;
}

@end