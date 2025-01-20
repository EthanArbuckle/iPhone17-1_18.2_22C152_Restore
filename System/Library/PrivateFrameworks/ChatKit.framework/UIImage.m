@interface UIImage
@end

@implementation UIImage

void __42__UIImage_ChatKitAdditions__abImageNamed___block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AddressBookUI"];
  v1 = (void *)abImageNamed__sABBundle;
  abImageNamed__sABBundle = v0;
}

uint64_t __52__UIImage_ChatKitAdditions____ck_ASTCRepresentation__block_invoke()
{
  v3[3] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = *MEMORY[0x1E4F2F4E0];
  v2[0] = *MEMORY[0x1E4F2F6C8];
  v2[1] = v0;
  v3[0] = *MEMORY[0x1E4F2F4F0];
  v3[1] = &unk_1EDF16208;
  v2[2] = *MEMORY[0x1E4F2F500];
  v3[2] = MEMORY[0x1E4F1CC38];
  uint64_t result = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:3];
  __ck_ASTCRepresentation_imageProperties = result;
  return result;
}

void __73__UIImage_ChatKitAdditions__ckImageWithTintColor_insets_traitCollection___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  double v4 = *(double *)(a1 + 48);
  double v3 = *(double *)(a1 + 56);
  [v2 size];
  double v6 = v5;
  [*(id *)(a1 + 32) size];
  objc_msgSend(v2, "drawInRect:", v3, v4, v6, v7);
  v8 = *(void **)(a1 + 40);
  if (v8)
  {
    [v8 set];
    v9 = (void *)MEMORY[0x1E4F427D0];
    double v11 = *(double *)(a1 + 48);
    double v10 = *(double *)(a1 + 56);
    [*(id *)(a1 + 32) size];
    double v13 = v12 + *(double *)(a1 + 72);
    [*(id *)(a1 + 32) size];
    objc_msgSend(v9, "bezierPathWithRect:", v10, v11, v13, v14 + *(double *)(a1 + 64));
    id v15 = (id)objc_claimAutoreleasedReturnValue();
    [v15 fillWithBlendMode:18 alpha:1.0];
  }
}

void __38__UIImage_ChatKit__ck_imageWithEmoji___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v5 = [v2 layer];
  uint64_t v4 = [v3 CGContext];

  [v5 renderInContext:v4];
}

uint64_t __48__UIImage_CAHelper____ck_imageScaledToFillSize___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "drawInRect:", 0.0, 0.0, *(double *)(a1 + 40), *(double *)(a1 + 48));
}

@end