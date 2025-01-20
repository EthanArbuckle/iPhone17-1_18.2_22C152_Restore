@interface NSString(SCNExtensions)
- (uint64_t)SCN_safeHash;
- (uint64_t)scn_stringByReplacingCharactersInRanges:()SCNExtensions withStrings:;
@end

@implementation NSString(SCNExtensions)

- (uint64_t)scn_stringByReplacingCharactersInRanges:()SCNExtensions withStrings:
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  uint64_t v7 = [a3 count];
  if (v7 != [a4 count])
  {
    NSLog(&cfstr_ErrorRangesAnd.isa);
    return 0;
  }
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  uint64_t v8 = [a3 countByEnumeratingWithState:&v42 objects:v48 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    unint64_t v10 = 0;
    uint64_t v11 = 0;
    uint64_t v12 = *(void *)v43;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v43 != v12) {
          objc_enumerationMutation(a3);
        }
        unint64_t v14 = [*(id *)(*((void *)&v42 + 1) + 8 * i) rangeValue];
        if (v14 < v10)
        {
          NSLog(&cfstr_ErrorRangesMus.isa);
          return 0;
        }
        unint64_t v10 = v14 + v15;
        v11 += v15;
      }
      uint64_t v9 = [a3 countByEnumeratingWithState:&v42 objects:v48 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
  else
  {
    uint64_t v11 = 0;
  }
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  uint64_t v17 = [a4 countByEnumeratingWithState:&v38 objects:v47 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = 0;
    uint64_t v20 = *(void *)v39;
    do
    {
      for (uint64_t j = 0; j != v18; ++j)
      {
        if (*(void *)v39 != v20) {
          objc_enumerationMutation(a4);
        }
        v19 += [*(id *)(*((void *)&v38 + 1) + 8 * j) length];
      }
      uint64_t v18 = [a4 countByEnumeratingWithState:&v38 objects:v47 count:16];
    }
    while (v18);
  }
  else
  {
    uint64_t v19 = 0;
  }
  if (v19 - v11 + [a1 length] <= 0)
  {
    NSLog(&cfstr_ErrorIncorrect_0.isa);
    return 0;
  }
  v33 = a1;
  v22 = objc_msgSend(MEMORY[0x263F089D8], "stringWithCapacity:");
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  uint64_t v23 = [a3 countByEnumeratingWithState:&v34 objects:v46 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = 0;
    unint64_t v26 = 0;
    uint64_t v27 = *(void *)v35;
    do
    {
      for (uint64_t k = 0; k != v24; ++k)
      {
        if (*(void *)v35 != v27) {
          objc_enumerationMutation(a3);
        }
        unint64_t v29 = [*(id *)(*((void *)&v34 + 1) + 8 * k) rangeValue];
        uint64_t v31 = v30;
        unint64_t v32 = v29 - v26;
        if (v29 > v26) {
          objc_msgSend(v22, "appendString:", objc_msgSend(v33, "substringWithRange:", v26, v32));
        }
        objc_msgSend(v22, "appendString:", objc_msgSend(a4, "objectAtIndexedSubscript:", v25 + k, v32));
        unint64_t v26 = v29 + v31;
      }
      uint64_t v24 = [a3 countByEnumeratingWithState:&v34 objects:v46 count:16];
      v25 += k;
    }
    while (v24);
  }
  else
  {
    unint64_t v26 = 0;
  }
  if (v26 < [v33 length]) {
    objc_msgSend(v22, "appendString:", objc_msgSend(v33, "substringWithRange:", v26, objc_msgSend(v33, "length") - v26));
  }
  return [NSString stringWithString:v22];
}

- (uint64_t)SCN_safeHash
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  CC_SHA256_Init(&v3);
  CFStringUpdateHash(a1);
  CC_SHA256_Final(md, &v3);
  return *(void *)md;
}

@end