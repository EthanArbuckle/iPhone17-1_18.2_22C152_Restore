@interface MUPlacePhotoHeaderAttributionFormatter
+ (id)formattedHeaderStringForPhotoAttributions:(id)a3;
- (id)formattedHeaderStringForAttributionItems:(id)a3;
@end

@implementation MUPlacePhotoHeaderAttributionFormatter

- (id)formattedHeaderStringForAttributionItems:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v6 = v3;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v23 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        uint64_t v12 = objc_msgSend(v11, "visibility", (void)v22);
        v13 = v4;
        if (v12)
        {
          if (v12 != 1) {
            continue;
          }
          v13 = v5;
        }
        [v13 addObject:v11];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v8);
  }

  v14 = MUMap(v4, &__block_literal_global_32);
  if ([v14 count])
  {
    v15 = [v14 sortedArrayUsingComparator:&__block_literal_global_23];
    v16 = (void *)[v15 mutableCopy];

    if ([v5 count])
    {
      v17 = _MULocalizedStringFromThisBundle(@"Others [Generic vendor attribution]");
      [v16 addObject:v17];
    }
    id v18 = objc_alloc_init(MEMORY[0x1E4F28DF8]);
    v19 = (void *)[v16 copy];
    v20 = [v18 stringFromItems:v19];
  }
  else
  {
    v20 = 0;
  }

  return v20;
}

id __83__MUPlacePhotoHeaderAttributionFormatter_formattedHeaderStringForAttributionItems___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [v2 displayName];
  uint64_t v4 = [v3 length];

  if (v4)
  {
    id v5 = [v2 displayName];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

uint64_t __83__MUPlacePhotoHeaderAttributionFormatter_formattedHeaderStringForAttributionItems___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "localizedCompare:");
}

+ (id)formattedHeaderStringForPhotoAttributions:(id)a3
{
  id v3 = a3;
  char BOOL = GEOConfigGetBOOL();
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __112__MUPlacePhotoHeaderAttributionFormatter_MKMapItemAttributionExtras__formattedHeaderStringForPhotoAttributions___block_invoke;
  v9[3] = &__block_descriptor_33_e40__24__0___MKMapItemPhotosAttribution_8Q16l;
  char v10 = BOOL;
  id v5 = MUMap(v3, v9);

  id v6 = objc_alloc_init(MUPlacePhotoHeaderAttributionFormatter);
  uint64_t v7 = [(MUPlacePhotoHeaderAttributionFormatter *)v6 formattedHeaderStringForAttributionItems:v5];

  return v7;
}

MUPlacePhotoHeaderAttributionItem *__112__MUPlacePhotoHeaderAttributionFormatter_MKMapItemAttributionExtras__formattedHeaderStringForPhotoAttributions___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = v3;
  if (*(unsigned char *)(a1 + 32)) {
    uint64_t v5 = [v3 requiresAttributionInPhotoViewerHeader] ^ 1;
  }
  else {
    uint64_t v5 = 0;
  }
  id v6 = [MUPlacePhotoHeaderAttributionItem alloc];
  uint64_t v7 = [v4 captionDisplayName];
  uint64_t v8 = [(MUPlacePhotoHeaderAttributionItem *)v6 initWithDisplayName:v7 visibility:v5];

  return v8;
}

@end