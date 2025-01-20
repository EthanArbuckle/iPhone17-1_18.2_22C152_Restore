@interface MXExtensionServiceCenter
@end

@implementation MXExtensionServiceCenter

void __53___MXExtensionServiceCenter_setContainingAppProxies___block_invoke(uint64_t a1)
{
}

void __47___MXExtensionServiceCenter_setMapsExtensions___block_invoke(uint64_t a1)
{
}

void __43___MXExtensionServiceCenter_setExtensions___block_invoke(uint64_t a1)
{
}

void __43___MXExtensionServiceCenter_mapsExtensions__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 24) copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void __54___MXExtensionServiceCenter_receivedExtensions_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v9 = [v3 identifier];
  [*(id *)(a1 + 32) setObject:v3 forKeyedSubscript:v9];

  v4 = [*(id *)(a1 + 40) objectForKeyedSubscript:v9];
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    v7 = [_MXExtension alloc];
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 48) + 40));
    v6 = [(_MXExtension *)v7 initWithExtensionIdentifier:v9 extensionProvider:WeakRetained];
  }
  [*(id *)(a1 + 56) setObject:v6 forKeyedSubscript:v9];
}

void __74___MXExtensionServiceCenter__siblingExtensionsWithContainingAppIdentifer___block_invoke(uint64_t a1, void *a2)
{
  id v20 = a2;
  id v3 = [v20 _containingAppIdentifer];
  if (v3)
  {
    v4 = [*(id *)(a1 + 32) objectForKeyedSubscript:v3];
    v5 = v4;
    if (v4) {
      v6 = v4;
    }
    else {
      v6 = [[_MXExtensionContainingAppProxy alloc] initWithContainingAppIdentifer:v3];
    }
    v7 = v6;

    v8 = [v20 extensionPointIdentifier];
    int v9 = [v8 isEqualToString:@"com.apple.maps.services"];

    if (v9)
    {
      v10 = [(_MXExtensionContainingAppProxy *)v7 extensionNonUIIdentifiers];
    }
    else
    {
      v11 = [v20 extensionPointIdentifier];
      int v12 = [v11 isEqualToString:@"com.apple.maps.ui-services"];

      if (!v12) {
        goto LABEL_10;
      }
      v10 = [(_MXExtensionContainingAppProxy *)v7 extensionUIIdentifiers];
    }
    v13 = v10;
    [v10 addObject:v20];

LABEL_10:
    v14 = [v20 extensionPointIdentifier];
    int v15 = [v14 isEqualToString:*MEMORY[0x1E4F300E8]];

    if (v15)
    {
      v16 = [(_MXExtensionContainingAppProxy *)v7 extensionNonUIIdentifiers];
    }
    else
    {
      v17 = [v20 extensionPointIdentifier];
      int v18 = [v17 isEqualToString:*MEMORY[0x1E4F300F0]];

      if (!v18)
      {
LABEL_15:
        [*(id *)(a1 + 32) setObject:v7 forKeyedSubscript:v3];

        goto LABEL_16;
      }
      v16 = [(_MXExtensionContainingAppProxy *)v7 extensionUIIdentifiers];
    }
    v19 = v16;
    [v16 addObject:v20];

    goto LABEL_15;
  }
LABEL_16:
}

void __39___MXExtensionServiceCenter_extensions__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 16) copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void __49___MXExtensionServiceCenter_containingAppProxies__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 32) copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

@end