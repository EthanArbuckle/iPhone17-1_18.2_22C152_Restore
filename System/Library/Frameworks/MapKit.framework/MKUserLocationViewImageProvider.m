@interface MKUserLocationViewImageProvider
@end

@implementation MKUserLocationViewImageProvider

uint64_t __61___MKUserLocationViewImageProvider_initWithUserLocationView___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateImage];
}

void __55___MKUserLocationViewImageProvider__updateContactImage__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  [WeakRetained _setBalloonImage:*(void *)(a1 + 40)];

  id v3 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  id v5 = v3;
  if (*(unsigned char *)(a1 + 48))
  {
    [v3 _setBalloonImageTintColor:0];
  }
  else
  {
    v4 = [MEMORY[0x1E4F428B8] systemGray3Color];
    [v5 _setBalloonImageTintColor:v4];
  }
}

uint64_t __53___MKUserLocationViewImageProvider__contactsChanged___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateImage];
}

void __55___MKUserLocationViewImageProvider__updateDefaultImage__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  [WeakRetained _setBalloonImage:*(void *)(a1 + 40)];

  id v4 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  id v3 = [MEMORY[0x1E4F428B8] systemGray3Color];
  [v4 _setBalloonImageTintColor:v3];
}

@end