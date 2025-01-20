@interface TKUtils
+ (BOOL)decompressFile:(id)a3 toDestinationPath:(id)a4 algorithm:(int)a5;
+ (id)URL:(id)a3 withQueryParameters:(id)a4 addKeys:(id)a5 removeKeys:(id)a6 escape:(BOOL)a7;
+ (id)applicationLibraryPath;
+ (id)decompressData:(id)a3 algorithm:(int)a4;
+ (id)decompressData:(id)a3 algorithm:(int)a4 operation:(int)a5;
+ (id)hexForColor:(id)a3 withAlpha:(BOOL)a4;
+ (id)httpDataURLEncoded:(id)a3;
+ (id)uniqueKeyForURL:(id)a3;
@end

@implementation TKUtils

+ (BOOL)decompressFile:(id)a3 toDestinationPath:(id)a4 algorithm:(int)a5
{
  id v14 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v12 = 0;
  objc_storeStrong(&v12, a4);
  unsigned int v11 = a5;
  id v10 = (id)[MEMORY[0x263EFF8F8] dataWithContentsOfFile:location[0]];
  if ([v10 length])
  {
    id v8 = (id)[v14 decompressData:v10 algorithm:v11];
    if ([v8 length]) {
      char v15 = [v8 writeToFile:v12 options:1073741825 error:0] & 1;
    }
    else {
      char v15 = 0;
    }
    int v9 = 1;
    objc_storeStrong(&v8, 0);
  }
  else
  {
    char v15 = 0;
    int v9 = 1;
  }
  objc_storeStrong(&v10, 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong(location, 0);
  return v15 & 1;
}

+ (id)decompressData:(id)a3 algorithm:(int)a4
{
  id v8 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v6 = (id)[v8 decompressData:location[0] algorithm:a4 operation:1];
  objc_storeStrong(location, 0);
  return v6;
}

+ (id)decompressData:(id)a3 algorithm:(int)a4 operation:(int)a5
{
  id location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  int v17 = a4;
  int v16 = a5;
  memset(&__b, 0, sizeof(__b));
  compression_status v14 = compression_stream_init(&__b, (compression_stream_operation)a5, (compression_algorithm)a4);
  if (v14)
  {
    uint64_t v19 = 0;
    int v13 = 1;
  }
  else
  {
    __b.src_ptr = (const uint8_t *)[location[0] bytes];
    __b.src_size_t size = [location[0] length];
    size_t size = 0x4000;
    unsigned int v11 = (uint8_t *)malloc_type_malloc(0x4000uLL, 0xA97C22B3uLL);
    __b.dst_ptr = v11;
    __b.dst_size_t size = 0x4000;
    id v10 = objc_alloc_init(MEMORY[0x263EFF990]);
    BOOL flags = v16 == 0;
    while (v14 == COMPRESSION_STATUS_OK)
    {
      compression_status v14 = compression_stream_process(&__b, flags);
      if (v14 == COMPRESSION_STATUS_ERROR)
      {
        compression_stream_destroy(&__b);
        uint64_t v19 = 0;
        int v13 = 1;
        goto LABEL_17;
      }
      if (v14)
      {
        if (v14 == COMPRESSION_STATUS_END && __b.dst_ptr > v11) {
          [v10 appendBytes:v11 length:__b.dst_ptr - v11];
        }
      }
      else if (!__b.dst_size)
      {
        [v10 appendBytes:v11 length:size];
        __b.dst_ptr = v11;
        __b.dst_size_t size = size;
      }
    }
    compression_stream_destroy(&__b);
    uint64_t v19 = [v10 copy];
    int v13 = 1;
LABEL_17:
    objc_storeStrong(&v10, 0);
  }
  objc_storeStrong(location, 0);
  v5 = (void *)v19;
  return v5;
}

+ (id)applicationLibraryPath
{
  v3 = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, 1uLL, 1);
  id v4 = [(NSArray *)v3 firstObject];

  return v4;
}

+ (id)uniqueKeyForURL:(id)a3
{
  id location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v4 = +[MCLURLDataLoader uniqueKeyForURL:location[0]];
  objc_storeStrong(location, 0);
  return v4;
}

+ (id)httpDataURLEncoded:(id)a3
{
  id location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  int v17 = (dispatch_once_t *)&httpDataURLEncoded__onceToken;
  id v16 = 0;
  objc_storeStrong(&v16, &__block_literal_global_1);
  if (*v17 != -1) {
    dispatch_once(v17, v16);
  }
  objc_storeStrong(&v16, 0);
  id v14 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v4 = location[0];
  uint64_t v8 = MEMORY[0x263EF8330];
  int v9 = -1073741824;
  int v10 = 0;
  unsigned int v11 = __30__TKUtils_httpDataURLEncoded___block_invoke_2;
  id v12 = &unk_26485AA68;
  id v13 = v14;
  [v4 enumerateKeysAndObjectsUsingBlock:&v8];
  id v7 = objc_alloc_init(MEMORY[0x263F08BA0]);
  [v7 setQueryItems:v14];
  id v5 = (id)[v7 query];
  id v6 = (id)[v5 dataUsingEncoding:4];

  objc_storeStrong(&v7, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(location, 0);
  return v6;
}

void __30__TKUtils_httpDataURLEncoded___block_invoke(void *a1)
{
  v4[2] = a1;
  v4[1] = a1;
  id v3 = (id)[MEMORY[0x263F08708] URLQueryAllowedCharacterSet];
  v4[0] = (id)[v3 mutableCopy];

  [v4[0] removeCharactersInString:@"!*'();:@&=+$,/?%#[]"];
  uint64_t v1 = [v4[0] copy];
  v2 = (void *)httpDataURLEncoded__queryParameterCharacterSet;
  httpDataURLEncoded__queryParameterCharacterSet = v1;

  objc_storeStrong(v4, 0);
}

void __30__TKUtils_httpDataURLEncoded___block_invoke_2(void *a1, void *a2, void *a3, void *a4)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  id v14 = 0;
  objc_storeStrong(&v14, a3);
  v13[2] = a4;
  v13[1] = a1;
  v13[0] = (id)[location[0] stringByAddingPercentEncodingWithAllowedCharacters:httpDataURLEncoded__queryParameterCharacterSet];
  id v12 = (id)[v14 stringByAddingPercentEncodingWithAllowedCharacters:httpDataURLEncoded__queryParameterCharacterSet];
  int v10 = (void *)a1[4];
  id v11 = objc_alloc(MEMORY[0x263F08BD0]);
  if (v13[0]) {
    id v6 = v13[0];
  }
  else {
    id v6 = location[0];
  }
  if (v12) {
    uint64_t v4 = [v11 initWithName:v6 value:v12];
  }
  else {
    uint64_t v4 = [v11 initWithName:v6 value:v14];
  }
  id v5 = (id)v4;
  objc_msgSend(v10, "addObject:");

  objc_storeStrong(&v12, 0);
  objc_storeStrong(v13, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(location, 0);
}

+ (id)URL:(id)a3 withQueryParameters:(id)a4 addKeys:(id)a5 removeKeys:(id)a6 escape:(BOOL)a7
{
  id location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v53 = 0;
  objc_storeStrong(&v53, a4);
  id v52 = 0;
  objc_storeStrong(&v52, a5);
  id v51 = 0;
  objc_storeStrong(&v51, a6);
  BOOL v50 = a7;
  v56 = (dispatch_once_t *)&URL_withQueryParameters_addKeys_removeKeys_escape__onceToken;
  id v55 = 0;
  objc_storeStrong(&v55, &__block_literal_global_10);
  if (*v56 != -1) {
    dispatch_once(v56, v55);
  }
  objc_storeStrong(&v55, 0);
  id v7 = objc_alloc(MEMORY[0x263F08BA0]);
  id v49 = (id)[v7 initWithURL:location[0] resolvingAgainstBaseURL:0];
  id v20 = (id)[v49 percentEncodedQuery];
  objc_msgSend(v49, "setQuery:");

  id v21 = (id)[v49 queryItems];
  id v48 = (id)[v21 mutableCopy];

  if (v48)
  {
    id v16 = v48;
    char v15 = (void *)MEMORY[0x263F08A98];
    uint64_t v42 = MEMORY[0x263EF8330];
    int v43 = -1073741824;
    int v44 = 0;
    v45 = __61__TKUtils_URL_withQueryParameters_addKeys_removeKeys_escape___block_invoke_2;
    v46 = &unk_26485AA90;
    id v47 = v51;
    id v18 = (id)[v15 predicateWithBlock:&v42];
    id v17 = (id)objc_msgSend(v16, "filteredArrayUsingPredicate:");
    uint64_t v8 = (void *)[v17 mutableCopy];
    id v9 = v48;
    id v48 = v8;

    id v19 = v52;
    uint64_t v34 = MEMORY[0x263EF8330];
    int v35 = -1073741824;
    int v36 = 0;
    v37 = __61__TKUtils_URL_withQueryParameters_addKeys_removeKeys_escape___block_invoke_3;
    v38 = &unk_26485AAE0;
    id v39 = v53;
    BOOL v41 = v50;
    id v40 = v48;
    [v19 enumerateObjectsUsingBlock:&v34];
    if ([v48 count]) {
      [v49 setQueryItems:v48];
    }
    objc_storeStrong(&v40, 0);
    objc_storeStrong(&v39, 0);
    objc_storeStrong(&v47, 0);
  }
  else
  {
    id v13 = objc_alloc(MEMORY[0x263EFF980]);
    id v33 = (id)objc_msgSend(v13, "initWithCapacity:", objc_msgSend(v53, "count"));
    id v14 = v53;
    uint64_t v26 = MEMORY[0x263EF8330];
    int v27 = -1073741824;
    int v28 = 0;
    v29 = __61__TKUtils_URL_withQueryParameters_addKeys_removeKeys_escape___block_invoke_5;
    v30 = &unk_26485AB08;
    BOOL v32 = v50;
    id v31 = v33;
    [v14 enumerateKeysAndObjectsUsingBlock:&v26];
    if ([v33 count]) {
      [v49 setQueryItems:v33];
    }
    objc_storeStrong(&v31, 0);
    objc_storeStrong(&v33, 0);
  }
  id v12 = (id)[v49 query];
  objc_msgSend(v49, "setPercentEncodedQuery:");

  id v11 = (id)[v49 URL];
  objc_storeStrong(&v48, 0);
  objc_storeStrong(&v49, 0);
  objc_storeStrong(&v51, 0);
  objc_storeStrong(&v52, 0);
  objc_storeStrong(&v53, 0);
  objc_storeStrong(location, 0);
  return v11;
}

void __61__TKUtils_URL_withQueryParameters_addKeys_removeKeys_escape___block_invoke(void *a1)
{
  v4[2] = a1;
  v4[1] = a1;
  uint64_t v1 = (void *)MEMORY[0x263F089C0];
  id v3 = (id)[MEMORY[0x263F08708] URLQueryAllowedCharacterSet];
  id v2 = (id)[v3 bitmapRepresentation];
  v4[0] = (id)objc_msgSend(v1, "characterSetWithBitmapRepresentation:");

  [v4[0] removeCharactersInString:@"!*'();:@&=+$,/?%#[]"];
  objc_storeStrong((id *)&URL_withQueryParameters_addKeys_removeKeys_escape__queryParameterCharacterSet, v4[0]);
  objc_storeStrong(v4, 0);
}

uint64_t __61__TKUtils_URL_withQueryParameters_addKeys_removeKeys_escape___block_invoke_2(void *a1, void *a2, void *a3)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  id v9 = 0;
  objc_storeStrong(&v9, a3);
  id v6 = (void *)a1[4];
  id v7 = (id)[location[0] name];
  int v8 = objc_msgSend(v6, "containsObject:") ^ 1;

  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
  return v8 & 1;
}

void __61__TKUtils_URL_withQueryParameters_addKeys_removeKeys_escape___block_invoke_3(uint64_t a1, void *a2, void *a3, void *a4)
{
  location[1] = (id)a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v29[3] = a3;
  v29[2] = a4;
  v29[1] = (id)a1;
  v29[0] = (id)[*(id *)(a1 + 32) objectForKeyedSubscript:location[0]];
  if (v29[0])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v4 = (id)[v29[0] stringValue];
      id v5 = v29[0];
      v29[0] = v4;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if (*(unsigned char *)(a1 + 48))
      {
        id v6 = (id)[location[0] stringByAddingPercentEncodingWithAllowedCharacters:URL_withQueryParameters_addKeys_removeKeys_escape__queryParameterCharacterSet];
        id v7 = location[0];
        location[0] = v6;

        id v8 = (id)[v29[0] stringByAddingPercentEncodingWithAllowedCharacters:URL_withQueryParameters_addKeys_removeKeys_escape__queryParameterCharacterSet];
        id v9 = v29[0];
        v29[0] = v8;
      }
      id v27 = (id)[objc_alloc(MEMORY[0x263F08BD0]) initWithName:location[0] value:v29[0]];
      uint64_t v22 = 0;
      v23 = &v22;
      int v24 = 0x20000000;
      int v25 = 32;
      uint64_t v26 = 0;
      uint64_t v26 = [*(id *)(a1 + 40) count];
      id v11 = *(void **)(a1 + 40);
      uint64_t v15 = MEMORY[0x263EF8330];
      int v16 = -1073741824;
      int v17 = 0;
      id v18 = __61__TKUtils_URL_withQueryParameters_addKeys_removeKeys_escape___block_invoke_4;
      id v19 = &unk_26485AAB8;
      id v20 = location[0];
      v21[0] = *(id *)(a1 + 40);
      v21[1] = &v22;
      [v11 enumerateObjectsWithOptions:2 usingBlock:&v15];
      unint64_t v10 = v23[3];
      if (v10 >= [*(id *)(a1 + 40) count]) {
        [*(id *)(a1 + 40) addObject:v27];
      }
      else {
        [*(id *)(a1 + 40) insertObject:v27 atIndex:v23[3]];
      }
      objc_storeStrong(v21, 0);
      objc_storeStrong(&v20, 0);
      _Block_object_dispose(&v22, 8);
      objc_storeStrong(&v27, 0);
    }
    int v28 = 0;
  }
  else
  {
    int v28 = 1;
  }
  objc_storeStrong(v29, 0);
  if (!v28) {
    int v28 = 0;
  }
  objc_storeStrong(location, 0);
}

void __61__TKUtils_URL_withQueryParameters_addKeys_removeKeys_escape___block_invoke_4(uint64_t a1, void *a2, uint64_t a3)
{
  location[1] = (id)a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  id v5 = (id)[location[0] name];
  char v6 = [v5 isEqualToString:*(void *)(a1 + 32)];

  if (v6)
  {
    [*(id *)(a1 + 40) removeObjectAtIndex:a3];
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = a3;
  }
  objc_storeStrong(location, 0);
}

void __61__TKUtils_URL_withQueryParameters_addKeys_removeKeys_escape___block_invoke_5(uint64_t a1, void *a2, void *a3, void *a4)
{
  location[1] = (id)a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  id v15 = 0;
  objc_storeStrong(&v15, a3);
  v14[2] = a4;
  v14[1] = (id)a1;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = (id)[v15 stringValue];
    id v5 = v15;
    id v15 = v4;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (*(unsigned char *)(a1 + 40))
    {
      id v6 = (id)[location[0] stringByAddingPercentEncodingWithAllowedCharacters:URL_withQueryParameters_addKeys_removeKeys_escape__queryParameterCharacterSet];
      id v7 = location[0];
      location[0] = v6;

      id v8 = (id)[v15 stringByAddingPercentEncodingWithAllowedCharacters:URL_withQueryParameters_addKeys_removeKeys_escape__queryParameterCharacterSet];
      id v9 = v15;
      id v15 = v8;
    }
    id v10 = objc_alloc(MEMORY[0x263F08BD0]);
    v14[0] = (id)[v10 initWithName:location[0] value:v15];
    [*(id *)(a1 + 32) addObject:v14[0]];
    objc_storeStrong(v14, 0);
  }
  objc_storeStrong(&v15, 0);
  objc_storeStrong(location, 0);
}

+ (id)hexForColor:(id)a3 withAlpha:(BOOL)a4
{
  id location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  BOOL v14 = a4;
  double v13 = 0.0;
  double v12 = 0.0;
  double v11 = 0.0;
  double v10 = 0.0;
  [location[0] getRed:&v13 green:&v12 blue:&v11 alpha:&v10];
  unsigned int v9 = (int)(v13 * 255.0);
  unsigned int v8 = (int)(v12 * 255.0);
  unsigned int v7 = (int)(v11 * 255.0);
  if (v14) {
    id v16 = (id)objc_msgSend(NSString, "stringWithFormat:", @"%02X%02X%02X%02X", v9, v8, v7, (int)(v10 * 255.0));
  }
  else {
    id v16 = (id)objc_msgSend(NSString, "stringWithFormat:", @"%02X%02X%02X", v9, v8, v7);
  }
  objc_storeStrong(location, 0);
  id v4 = v16;
  return v4;
}

@end