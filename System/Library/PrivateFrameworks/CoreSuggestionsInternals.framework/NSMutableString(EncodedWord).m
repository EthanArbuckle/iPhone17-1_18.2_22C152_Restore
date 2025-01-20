@interface NSMutableString(EncodedWord)
- (void)sg_decodeEncodedWords;
@end

@implementation NSMutableString(EncodedWord)

- (void)sg_decodeEncodedWords
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  v4 = (void *)MEMORY[0x1CB79B230]();
  if ((unint64_t)[a1 length] >= 9)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __53__NSMutableString_EncodedWord__sg_decodeEncodedWords__block_invoke;
    block[3] = &unk_1E65BF9C0;
    block[4] = a1;
    block[5] = a2;
    v31 = a1;
    v27 = v4;
    if (sg_decodeEncodedWords__pasOnceToken8 != -1) {
      dispatch_once(&sg_decodeEncodedWords__pasOnceToken8, block);
    }
    v5 = a1;
    id v26 = (id)sg_decodeEncodedWords__pasExprOnceResult;
    objc_msgSend(v26, "matchesInString:options:range:", a1, 0, 0, objc_msgSend(a1, "length"));
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    v25 = long long v35 = 0u;
    v6 = [v25 reverseObjectEnumerator];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v32 objects:v37 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v33;
      v28 = v6;
      uint64_t v29 = 0x7FFFFFFFFFFFFFFFLL;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v33 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = [*(id *)(*((void *)&v32 + 1) + 8 * v10) range];
          uint64_t v13 = v12;
          v14 = objc_msgSend(v5, "substringWithRange:", v11, v12);
          v15 = [v14 dataUsingEncoding:1];

          v16 = (void *)[objc_alloc(MEMORY[0x1E4F60820]) initWithHeaderData:v15];
          if ([v16 identifyRangeOfEncodedWordAtIndex:0] != 0x7FFFFFFFFFFFFFFFLL)
          {
            v17 = [v16 stringEncoding];

            if (v17)
            {
              v18 = objc_opt_new();
              if ([v16 decodeEncodedTextToData:v18] && objc_msgSend(v18, "length"))
              {
                id v19 = [NSString alloc];
                v20 = [v16 stringEncoding];
                v21 = objc_msgSend(v19, "initWithData:encoding:", v18, objc_msgSend(v20, "unsignedIntValue"));

                if (v21)
                {
                  uint64_t v22 = v29;
                  v5 = v31;
                  if (v29 != 0x7FFFFFFFFFFFFFFFLL)
                  {
                    if (sg_decodeEncodedWords__pasOnceToken9 != -1)
                    {
                      dispatch_once(&sg_decodeEncodedWords__pasOnceToken9, &__block_literal_global_11643);
                      uint64_t v22 = v29;
                    }
                    uint64_t v30 = v22 - (v11 + v13);
                    v5 = v31;
                    uint64_t v23 = objc_msgSend(v31, "rangeOfCharacterFromSet:options:range:", sg_decodeEncodedWords__pasExprOnceResult_12, 2);
                    uint64_t v24 = v30;
                    if (v23 != 0x7FFFFFFFFFFFFFFFLL) {
                      uint64_t v24 = 0;
                    }
                    v13 += v24;
                  }
                  objc_msgSend(v5, "replaceCharactersInRange:withString:", v11, v13, v21);
                  uint64_t v29 = v11;
                }
                else
                {
                  v5 = v31;
                }

                v6 = v28;
              }
            }
          }

          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v32 objects:v37 count:16];
      }
      while (v8);
    }

    v4 = v27;
  }
}

@end