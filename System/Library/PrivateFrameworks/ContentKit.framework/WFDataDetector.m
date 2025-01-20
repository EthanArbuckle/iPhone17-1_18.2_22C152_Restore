@interface WFDataDetector
+ (BOOL)hasResultForString:(id)a3 ofTypes:(unint64_t)a4;
+ (id)resultsForString:(id)a3 ofTypes:(unint64_t)a4 error:(id *)a5;
@end

@implementation WFDataDetector

+ (BOOL)hasResultForString:(id)a3 ofTypes:(unint64_t)a4
{
  id v5 = a3;
  if (!v5) {
    goto LABEL_9;
  }
  if (a4)
  {
    v6 = [MEMORY[0x263F08770] dataDetectorWithTypes:a4 error:0];
    v7 = objc_msgSend(v6, "firstMatchInString:options:range:", v5, 0, 0, objc_msgSend(v5, "length"));

    if (v7) {
      goto LABEL_8;
    }
  }
  if ((a4 & 0x200000000) != 0
    && (WFNumberFromString(v5), v8 = objc_claimAutoreleasedReturnValue(), v8, v8)
    || (a4 & 0x400000000) != 0
    && (WFDictionariesFromString(v5, 0), v9 = objc_claimAutoreleasedReturnValue(), v9, v9))
  {
LABEL_8:
    BOOL v10 = 1;
  }
  else
  {
LABEL_9:
    BOOL v10 = 0;
  }

  return v10;
}

+ (id)resultsForString:(id)a3 ofTypes:(unint64_t)a4 error:(id *)a5
{
  id v9 = a3;
  if (!v9)
  {
    v20 = [MEMORY[0x263F08690] currentHandler];
    [v20 handleFailureInMethod:a2, a1, @"WFDataDetector.m", 176, @"Invalid parameter not satisfying: %@", @"string" object file lineNumber description];

    if (a4) {
      goto LABEL_3;
    }
LABEL_15:
    v12 = (void *)MEMORY[0x263EFFA68];
    if ((a4 & 0x200000000) == 0) {
      goto LABEL_12;
    }
LABEL_16:
    v17 = WFNumberFromString(v9);
    if ((a4 & 0x400000000) != 0) {
      goto LABEL_13;
    }
    goto LABEL_17;
  }
  if (!a4) {
    goto LABEL_15;
  }
LABEL_3:
  BOOL v10 = [MEMORY[0x263F08770] dataDetectorWithTypes:a4 error:a5];
  v11 = objc_msgSend(v10, "matchesInString:options:range:", v9, 0, 0, objc_msgSend(v9, "length"));
  v12 = v11;
  if ((a4 & 0x20) != 0
    && ![v11 count]
    && [v9 rangeOfString:@":"] != 0x7FFFFFFFFFFFFFFFLL)
  {
    v13 = [NSURL URLWithString:v9];
    if (v13)
    {
      v14 = objc_msgSend(MEMORY[0x263F08B70], "linkCheckingResultWithRange:URL:", 0, objc_msgSend(v9, "length"), v13);
      uint64_t v15 = [v12 arrayByAddingObject:v14];

      v12 = (void *)v15;
    }
  }
  if ((~(_BYTE)a4 & 0x30) == 0)
  {
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __49__WFDataDetector_resultsForString_ofTypes_error___block_invoke;
    v24[3] = &unk_264289CD8;
    id v25 = v9;
    uint64_t v16 = objc_msgSend(v12, "if_map:", v24);

    v12 = (void *)v16;
  }

  if ((a4 & 0x200000000) != 0) {
    goto LABEL_16;
  }
LABEL_12:
  v17 = 0;
  if ((a4 & 0x400000000) != 0)
  {
LABEL_13:
    id v23 = 0;
    v18 = WFDictionariesFromString(v9, &v23);
    id v19 = v23;
    goto LABEL_18;
  }
LABEL_17:
  id v19 = 0;
  v18 = 0;
LABEL_18:
  v21 = [[WFDataDetectorResults alloc] initWithTextCheckingResults:v12 number:v17 dictionaries:v18 dictionaryType:v19];

  return v21;
}

id __49__WFDataDetector_resultsForString_ofTypes_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 resultType] != 32) {
    goto LABEL_7;
  }
  v4 = [v3 URL];
  id v5 = [v4 host];
  if (([v5 isEqualToString:@"maps.apple.com"] & 1) == 0)
  {

LABEL_7:
    id v12 = v3;
    goto LABEL_8;
  }
  char v6 = [*(id *)(a1 + 32) containsString:@"maps.apple.com"];

  if (v6) {
    goto LABEL_7;
  }
  v7 = [MEMORY[0x263F08770] dataDetectorWithTypes:16 error:0];
  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v9 = [v3 range];
  v11 = objc_msgSend(v7, "matchesInString:options:range:", v8, 0, v9, v10);
  id v12 = [v11 firstObject];

  if (!v12) {
    goto LABEL_7;
  }
LABEL_8:

  return v12;
}

@end