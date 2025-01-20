@interface SGStringSplitter
+ (id)splitString:(id)a3 withCharacterSet:(id)a4;
@end

@implementation SGStringSplitter

void __49__SGStringSplitter_splitString_withCharacterSet___block_invoke(uint64_t a1, UTF32Char a2, uint64_t a3, uint64_t a4)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = CFCharacterSetIsLongCharacterMember(*(CFCharacterSetRef *)(a1 + 32), a2) != 0;
  uint64_t v6 = *(void *)(a1 + 48);
  uint64_t v7 = *(void *)(*(void *)(a1 + 56) + 8);
  if (*(unsigned char *)(v7 + 24)
    || *(unsigned char *)(*(void *)(v6 + 8) + 24)
    && (*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = a4,
        uint64_t v6 = *(void *)(a1 + 48),
        uint64_t v7 = *(void *)(*(void *)(a1 + 56) + 8),
        *(unsigned char *)(v7 + 24)))
  {
    if (!*(unsigned char *)(*(void *)(v6 + 8) + 24))
    {
      uint64_t v8 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
      v9 = objc_msgSend(*(id *)(a1 + 40), "substringWithRange:", v8, a4 - v8);
      [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) addObject:v9];

      uint64_t v6 = *(void *)(a1 + 48);
      uint64_t v7 = *(void *)(*(void *)(a1 + 56) + 8);
    }
  }
  *(unsigned char *)(v7 + 24) = *(unsigned char *)(*(void *)(v6 + 8) + 24);
}

+ (id)splitString:(id)a3 withCharacterSet:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__231;
  v30 = __Block_byref_object_dispose__232;
  id v31 = 0;
  id v31 = (id)objc_opt_new();
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x2020000000;
  char v25 = 0;
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x2020000000;
  char v23 = 0;
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x2020000000;
  uint64_t v19 = 0;
  uint64_t v13 = MEMORY[0x263EF8330];
  id v7 = v6;
  v14 = v7;
  id v8 = v5;
  v15 = v8;
  _PASIterateLongChars();
  if (*((unsigned char *)v21 + 24))
  {
    uint64_t v9 = objc_msgSend(v8, "length", v13, 3221225472, __49__SGStringSplitter_splitString_withCharacterSet___block_invoke, &unk_2647EA408, v7, v8, &v20, v24, &v16, &v26);
    v10 = objc_msgSend(v8, "substringWithRange:", v17[3], v9 - v17[3]);
    [(id)v27[5] addObject:v10];
  }
  id v11 = (id)v27[5];

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(v24, 8);
  _Block_object_dispose(&v26, 8);

  return v11;
}

@end