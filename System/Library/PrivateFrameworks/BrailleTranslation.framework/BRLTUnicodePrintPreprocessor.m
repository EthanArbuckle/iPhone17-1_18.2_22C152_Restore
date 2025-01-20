@interface BRLTUnicodePrintPreprocessor
- (id)preprocessPrintString:(id)a3 withLocationMap:(id *)a4 isEightDot:(BOOL)a5 textFormattingRanges:(id)a6;
@end

@implementation BRLTUnicodePrintPreprocessor

- (id)preprocessPrintString:(id)a3 withLocationMap:(id *)a4 isEightDot:(BOOL)a5 textFormattingRanges:(id)a6
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  id v7 = a3;
  v8 = v7;
  if (v7)
  {
    uint64_t v9 = [v7 length];
    id v46 = [MEMORY[0x263F089D8] string];
    if (a4)
    {
      v10 = [MEMORY[0x263EFF990] dataWithLength:0];
    }
    else
    {
      v10 = 0;
    }
    long long v49 = 0u;
    long long v50 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    v11 = [&unk_26CCC2A70 allKeys];
    uint64_t v12 = [v11 countByEnumeratingWithState:&v47 objects:v52 count:16];
    v41 = a4;
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v48;
      v15 = &stru_26CCBD108;
      do
      {
        uint64_t v16 = 0;
        v17 = v15;
        do
        {
          if (*(void *)v48 != v14) {
            objc_enumerationMutation(v11);
          }
          v15 = [(__CFString *)v17 stringByAppendingString:*(void *)(*((void *)&v47 + 1) + 8 * v16)];

          ++v16;
          v17 = v15;
        }
        while (v13 != v16);
        uint64_t v13 = [v11 countByEnumeratingWithState:&v47 objects:v52 count:16];
      }
      while (v13);
    }
    else
    {
      v15 = &stru_26CCBD108;
    }
    unint64_t v40 = v9;

    uint64_t v18 = [MEMORY[0x263F08708] characterSetWithCharactersInString:v15];
    v44 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v42 = v8;
    id v19 = v8;
    v45 = (void *)v18;
    v43 = v19;
    unint64_t v20 = 0;
    if ([v19 rangeOfCharacterFromSet:v18] != 0x7FFFFFFFFFFFFFFFLL)
    {
      v21 = v19;
      do
      {
        uint64_t v22 = [v21 rangeOfCharacterFromSet:v45];
        uint64_t v23 = v22;
        uint64_t v25 = v24;
        if (v22)
        {
          if (v22 == 0x7FFFFFFFFFFFFFFFLL)
          {
            id v19 = v21;
            break;
          }
          id v26 = v46;
          id v27 = v10;
          v28 = objc_msgSend(v43, "substringWithRange:", v20, v23);
          [v26 appendString:v28];

          unint64_t v29 = v20;
          uint64_t v30 = v23;
          do
          {
            unint64_t v51 = v29;
            [v27 appendBytes:&v51 length:8];
            ++v29;
            --v30;
          }
          while (v30);
        }
        v31 = objc_msgSend(v21, "substringWithRange:", v23, v25);
        v32 = [&unk_26CCC2A70 objectForKey:v31];
        v33 = [v44 localizedStringForKey:v32 value:&stru_26CCBD108 table:@"CharacterReplacements"];

        if ([v33 length])
        {
          unint64_t v34 = 0;
          do
          {
            unint64_t v51 = v23 + v20;
            [v10 appendBytes:&v51 length:8];
            ++v34;
          }
          while (v34 < [v33 length]);
        }
        [v46 appendString:v33];
        uint64_t v35 = v23 + v25;
        id v19 = [v21 substringFromIndex:v23 + v25];

        v20 += v35;
        v21 = v19;
      }
      while (v23 != 0x7FFFFFFFFFFFFFFFLL);
    }
    if (v40 > v20)
    {
      id v36 = v46;
      id v37 = v10;
      v38 = objc_msgSend(v43, "substringWithRange:", v20, v40 - v20);
      [v36 appendString:v38];

      do
      {
        unint64_t v51 = v20;
        [v37 appendBytes:&v51 length:8];
        ++v20;
      }
      while (v40 != v20);
    }
    if (v41) {
      id *v41 = v10;
    }

    v8 = v42;
  }
  else
  {
    id v46 = 0;
  }

  return v46;
}

@end