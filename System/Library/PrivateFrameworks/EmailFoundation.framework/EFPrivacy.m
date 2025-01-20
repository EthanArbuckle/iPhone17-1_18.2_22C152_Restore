@interface EFPrivacy
+ (id)dateByRemovingTimeComponentsFromDate:(id)a3;
+ (id)fullyOrPartiallyRedactFields:(id)a3 inString:(id)a4;
+ (id)fullyOrPartiallyRedactedStringForString:(id)a3;
+ (id)fullyOrPartiallyRedactedStringForString:(id)a3 maximumUnredactedLength:(unint64_t)a4;
+ (id)fullyRedactedStringForString:(id)a3;
+ (id)partiallyRedactedDictionary:(id)a3;
+ (id)partiallyRedactedStringForString:(id)a3;
+ (id)partiallyRedactedStringForString:(id)a3 maximumUnredactedLength:(unint64_t)a4;
+ (id)partiallyRedactedStringFromArray:(id)a3;
+ (id)redactedQueryStringForQueryString:(id)a3;
+ (int64_t)bucketedMessageAgeSinceDate:(id)a3 leadingDigits:(int64_t)a4;
+ (int64_t)bucketedNumber:(int)a3 leadingDigits:(int64_t)a4;
+ (int64_t)numberOfDigits:(int64_t)a3;
+ (int64_t)roundedInteger:(int64_t)a3;
+ (int64_t)roundedInteger:(int64_t)a3 placeValueDigits:(int64_t)a4;
+ (int64_t)weeksSinceDate:(id)a3;
+ (unint64_t)_roundQueryLogCount:(unint64_t)a3 maxCount:(unint64_t)a4 queryCount:(unint64_t)a5;
+ (unint64_t)bucketValueForQueryLogCount:(id)a3 bucketValues:(id)a4;
+ (unsigned)bucketMessageCount:(unint64_t)a3;
@end

@implementation EFPrivacy

+ (id)partiallyRedactedStringForString:(id)a3
{
  v3 = [a1 partiallyRedactedStringForString:a3 maximumUnredactedLength:2];
  return v3;
}

+ (id)partiallyRedactedStringForString:(id)a3 maximumUnredactedLength:(unint64_t)a4
{
  id v5 = a3;
  unint64_t v6 = [v5 length];
  unint64_t v7 = v6;
  if (a4)
  {
    if (v6 <= a4
      || (uint64_t v8 = [v5 rangeOfComposedCharacterSequenceAtIndex:a4 - 1], v10 = v8 + v9, v7 <= v8 + v9))
    {
      id v15 = v5;
      goto LABEL_8;
    }
    v11 = [[EFStringHash alloc] initWithString:v5];
    v12 = NSString;
    v13 = [v5 substringToIndex:v10];
    v14 = [(EFStringHash *)v11 redactedStringValue];
    [v12 stringWithFormat:@"\"%@...\"<%lu chars, hash=%@>", v13, v7, v14];
    id v15 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = [[EFStringHash alloc] initWithString:v5];
    v16 = NSString;
    v13 = [(EFStringHash *)v11 redactedStringValue];
    [v16 stringWithFormat:@"<%lu chars, hash=%@>", v7, v13];
    id v15 = (id)objc_claimAutoreleasedReturnValue();
  }

LABEL_8:
  return v15;
}

+ (id)fullyRedactedStringForString:(id)a3
{
  id v3 = a3;
  if ([v3 length])
  {
    v4 = [[EFStringHash alloc] initWithString:v3];
    id v5 = [(EFStringHash *)v4 redactedStringValue];
  }
  else
  {
    id v5 = v3;
  }

  return v5;
}

+ (unsigned)bucketMessageCount:(unint64_t)a3
{
  unsigned int result = a3;
  if (a3 > 0xA)
  {
    if (a3 <= 0x63) {
      return (round((double)a3 / 10.0) * 10.0);
    }
    else {
      return 100;
    }
  }
  return result;
}

+ (id)partiallyRedactedDictionary:(id)a3
{
  id v4 = a3;
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__6;
  v12 = __Block_byref_object_dispose__6;
  id v13 = (id)0xAAAAAAAAAAAAAAAALL;
  id v13 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __41__EFPrivacy_partiallyRedactedDictionary___block_invoke;
  v7[3] = &unk_1E6122F28;
  v7[4] = &v8;
  v7[5] = a1;
  [v4 enumerateKeysAndObjectsUsingBlock:v7];
  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

+ (id)dateByRemovingTimeComponentsFromDate:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  id v5 = [v4 components:28 fromDate:v3];
  unint64_t v6 = [v4 dateFromComponents:v5];

  return v6;
}

+ (int64_t)weeksSinceDate:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  id v5 = [MEMORY[0x1E4F1C9C8] date];
  if ([v5 compare:v3] == 1)
  {
    unint64_t v6 = [v4 components:0x2000 fromDate:v3 toDate:v5 options:0];
    int64_t v7 = [v6 weekOfYear];
  }
  else
  {
    int64_t v7 = 0;
  }

  return v7;
}

+ (int64_t)bucketedMessageAgeSinceDate:(id)a3 leadingDigits:(int64_t)a4
{
  [a3 timeIntervalSinceNow];
  if (!(int)(v4 / 86400.0)) {
    return 0;
  }
  return +[EFPrivacy bucketedNumber:leadingDigits:](EFPrivacy, "bucketedNumber:leadingDigits:");
}

+ (int64_t)bucketedNumber:(int)a3 leadingDigits:(int64_t)a4
{
  if (a3 >= 0) {
    int v6 = a3;
  }
  else {
    int v6 = -a3;
  }
  double v7 = log10((double)v6);
  double v8 = __exp10(floor(v7) + 1.0 - (double)a4);
  int v9 = (int)(v8 * round((double)a3 / v8));
  if (v9 >= 0) {
    return v9;
  }
  else {
    return -v9;
  }
}

+ (int64_t)roundedInteger:(int64_t)a3 placeValueDigits:(int64_t)a4
{
  double v5 = __exp10((double)a4);
  return (uint64_t)(v5 * round((double)a3 / v5));
}

+ (int64_t)roundedInteger:(int64_t)a3
{
  double v4 = objc_opt_class();
  uint64_t v5 = [(id)objc_opt_class() numberOfDigits:a3] - 1;
  return [v4 roundedInteger:a3 placeValueDigits:v5];
}

+ (int64_t)numberOfDigits:(int64_t)a3
{
  id v3 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", a3);
  int64_t v4 = [v3 length];

  return v4;
}

+ (id)partiallyRedactedStringFromArray:(id)a3
{
  id v4 = a3;
  uint64_t v8 = 0;
  int v9 = &v8;
  uint64_t v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__6;
  v12 = __Block_byref_object_dispose__6;
  id v13 = (id)0xAAAAAAAAAAAAAAAALL;
  id v13 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __46__EFPrivacy_partiallyRedactedStringFromArray___block_invoke;
  v7[3] = &unk_1E6122F00;
  v7[4] = &v8;
  v7[5] = a1;
  [v4 enumerateObjectsUsingBlock:v7];
  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

void __46__EFPrivacy_partiallyRedactedStringFromArray___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if ([*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) length]) {
      [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) appendString:@", "];
    }
    id v3 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    id v4 = [*(id *)(a1 + 40) partiallyRedactedStringForString:v5 maximumUnredactedLength:2];
    [v3 appendString:v4];
  }
}

void __41__EFPrivacy_partiallyRedactedDictionary___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  if ([*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) length]) {
    [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) appendString:@"\n"];
  }
  int v6 = [*(id *)(a1 + 40) partiallyRedactedStringFromArray:v5];
  double v7 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  uint64_t v8 = [NSString stringWithFormat:@"%@: %@", v9, v6];
  [v7 appendString:v8];
}

+ (id)fullyOrPartiallyRedactedStringForString:(id)a3
{
  id v3 = +[EFPrivacy fullyOrPartiallyRedactedStringForString:a3 maximumUnredactedLength:2];
  return v3;
}

+ (id)fullyOrPartiallyRedactedStringForString:(id)a3 maximumUnredactedLength:(unint64_t)a4
{
  id v5 = a3;
  int v6 = +[EFDevice currentDevice];
  int v7 = [v6 isInternal];

  if (v7) {
    +[EFPrivacy partiallyRedactedStringForString:v5 maximumUnredactedLength:a4];
  }
  else {
  uint64_t v8 = +[EFPrivacy fullyRedactedStringForString:v5];
  }

  return v8;
}

+ (id)fullyOrPartiallyRedactFields:(id)a3 inString:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v22 = a3;
  id v5 = (void *)[a4 mutableCopy];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id obj = v22;
  uint64_t v6 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v6)
  {
    uint64_t v24 = *(void *)v27;
    do
    {
      uint64_t v25 = v6;
      for (uint64_t i = 0; i != v25; ++i)
      {
        if (*(void *)v27 != v24) {
          objc_enumerationMutation(obj);
        }
        objc_msgSend(NSString, "stringWithFormat:", @"(?<=%@ = ['|\"|“])([^;]+)(?=['|\"|”];)",
        uint64_t v8 = *(void *)(*((void *)&v26 + 1) + 8 * i));
        id v9 = [MEMORY[0x1E4F28FD8] regularExpressionWithPattern:v8 options:1 error:0];
        if (v9)
        {
          uint64_t v10 = [v5 length];
          uint64_t v11 = v10;
          if (v10)
          {
            unint64_t v12 = 0;
            unint64_t v13 = v10;
            do
            {
              if (v12 + v11 > [v5 length]) {
                break;
              }
              uint64_t v15 = objc_msgSend(v9, "rangeOfFirstMatchInString:options:range:", v5, 0, v12, v11);
              if (v15 == 0x7FFFFFFFFFFFFFFFLL) {
                break;
              }
              uint64_t v16 = v14;
              v17 = objc_msgSend(v5, "substringWithRange:", v15, v14);
              v18 = +[EFPrivacy fullyOrPartiallyRedactedStringForString:v17 maximumUnredactedLength:1];

              objc_msgSend(v5, "replaceCharactersInRange:withString:", v15, v16, v18);
              if (v13 != [v5 length]) {
                unint64_t v13 = [v5 length];
              }
              uint64_t v19 = [v18 length];
              uint64_t v20 = [v5 length];

              unint64_t v12 = v19 + v15;
              uint64_t v11 = v20 - v12;
            }
            while (v12 < v13);
          }
        }
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v6);
  }

  return v5;
}

+ (id)redactedQueryStringForQueryString:(id)a3
{
  id v3 = (void *)[a3 mutableCopy];
  objc_msgSend(v3, "replaceOccurrencesOfString:withString:options:range:", @"'(.*?)'", @"?", 1024, 0, objc_msgSend(v3, "length"));
  objc_msgSend(v3, "replaceOccurrencesOfString:withString:options:range:", @"[0-9]+", @"?", 1024, 0, objc_msgSend(v3, "length"));
  objc_msgSend(v3, "replaceOccurrencesOfString:withString:options:range:", @"CAST\\(X\\? AS TEXT\\)", @"?", 1024, 0, objc_msgSend(v3, "length"));
  objc_msgSend(v3, "replaceOccurrencesOfString:withString:options:range:", @"\\(\\?+(,()*\\?+)*\\)", @"(?)", 1024, 0, objc_msgSend(v3, "length"));
  return v3;
}

+ (unint64_t)_roundQueryLogCount:(unint64_t)a3 maxCount:(unint64_t)a4 queryCount:(unint64_t)a5
{
  if (a5 >= (a4 + a3) >> 1) {
    return a4;
  }
  else {
    return a3;
  }
}

+ (unint64_t)bucketValueForQueryLogCount:(id)a3 bucketValues:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if ((unint64_t)[v8 count] <= 1)
  {
    v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2 object:a1 file:@"EFPrivacy.m" lineNumber:239 description:@"Invalid number of values in queryBucketValues"];
  }
  unint64_t v9 = [v7 integerValue];
  uint64_t v10 = [v8 firstObject];
  unint64_t v11 = [v10 unsignedIntegerValue];

  if (v9 >= v11)
  {
    unint64_t v12 = [v8 lastObject];
    unint64_t v13 = [v12 unsignedIntegerValue];

    if (v9 <= v13)
    {
      unint64_t v15 = 0;
      do
      {
        if (v15 >= [v8 count] - 1) {
          __assert_rtn("+[EFPrivacy bucketValueForQueryLogCount:bucketValues:]", "EFPrivacy.m", 259, "0 && \"Fail to bucket query count value\"");
        }
        uint64_t v16 = [v8 objectAtIndexedSubscript:v15];
        unint64_t v17 = [v16 unsignedIntegerValue];

        v18 = [v8 objectAtIndexedSubscript:v15 + 1];
        unint64_t v19 = [v18 unsignedIntegerValue];

        ++v15;
      }
      while (v9 < v17 || v9 > v19);
      unint64_t v9 = [a1 _roundQueryLogCount:v17 maxCount:v19 queryCount:v9];
    }
    else
    {
      uint64_t v14 = [v8 lastObject];
      unint64_t v9 = [v14 unsignedIntegerValue];
    }
  }

  return v9;
}

@end