@interface NSString(HomeKit)
- (id)hm_generateSHA1;
- (id)hm_truncatedDisplayableVersionString;
- (id)hm_truncatedNameString;
- (id)stringByTransformingFirstWordUsingBlock:()HomeKit;
- (uint64_t)hm_containsAnyTextCheckingTypeInTypes:()HomeKit;
- (uint64_t)stringByCapitalizingFirstWord;
@end

@implementation NSString(HomeKit)

- (uint64_t)hm_containsAnyTextCheckingTypeInTypes:()HomeKit
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v45 = 0;
  v5 = [MEMORY[0x1E4F28BE8] dataDetectorWithTypes:a3 error:&v45];
  id v6 = v45;
  objc_msgSend(v5, "matchesInString:options:range:", a1, 0, 0, objc_msgSend(a1, "length"));
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = [v7 countByEnumeratingWithState:&v41 objects:v48 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v42;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v42 != v10) {
          objc_enumerationMutation(v7);
        }
        if (([*(id *)(*((void *)&v41 + 1) + 8 * i) resultType] & a3) != 0)
        {
          uint64_t v12 = 1;
          id v13 = v7;
          goto LABEL_33;
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v41 objects:v48 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }

  if ((a3 & 0x800) != 0)
  {
    v30 = v6;
    v31 = v5;
    id v14 = &unk_1EEF089E8;
    v15 = (void *)[a1 copy];
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    v16 = [&unk_1EEF089E8 allKeys];
    uint64_t v17 = [v16 countByEnumeratingWithState:&v37 objects:v47 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v38;
      do
      {
        uint64_t v20 = 0;
        v21 = v15;
        do
        {
          if (*(void *)v38 != v19) {
            objc_enumerationMutation(v16);
          }
          uint64_t v22 = *(void *)(*((void *)&v37 + 1) + 8 * v20);
          v23 = objc_msgSend(&unk_1EEF089E8, "objectForKeyedSubscript:", v22, v30);
          v15 = [v21 stringByReplacingOccurrencesOfString:v22 withString:v23];

          ++v20;
          v21 = v15;
        }
        while (v18 != v20);
        uint64_t v18 = [v16 countByEnumeratingWithState:&v37 objects:v47 count:16];
      }
      while (v18);
    }

    if ([a1 isEqualToString:v15])
    {
      uint64_t v12 = 0;
      id v6 = v30;
      v5 = v31;
    }
    else
    {
      id v36 = v30;
      v5 = [MEMORY[0x1E4F28BE8] dataDetectorWithTypes:2048 error:&v36];
      id v6 = v36;

      v24 = objc_msgSend(v5, "matchesInString:options:range:", v15, 0, 0, objc_msgSend(v15, "length"));

      long long v34 = 0u;
      long long v35 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      id v7 = v24;
      uint64_t v25 = [v7 countByEnumeratingWithState:&v32 objects:v46 count:16];
      if (v25)
      {
        uint64_t v26 = v25;
        uint64_t v27 = *(void *)v33;
        while (2)
        {
          for (uint64_t j = 0; j != v26; ++j)
          {
            if (*(void *)v33 != v27) {
              objc_enumerationMutation(v7);
            }
            if ((objc_msgSend(*(id *)(*((void *)&v32 + 1) + 8 * j), "resultType", v30) & 0x800) != 0)
            {
              uint64_t v12 = 1;
              goto LABEL_31;
            }
          }
          uint64_t v26 = [v7 countByEnumeratingWithState:&v32 objects:v46 count:16];
          if (v26) {
            continue;
          }
          break;
        }
      }
      uint64_t v12 = 0;
LABEL_31:
    }
    id v13 = v7;

    id v7 = &unk_1EEF089E8;
LABEL_33:

    id v7 = v13;
  }
  else
  {
    uint64_t v12 = 0;
  }

  return v12;
}

- (id)hm_truncatedNameString
{
  if (HMMaxLengthForNaming__hmf_once_t7 != -1) {
    dispatch_once(&HMMaxLengthForNaming__hmf_once_t7, &__block_literal_global_55_24575);
  }
  unint64_t v2 = HMMaxLengthForNaming__hmf_once_v8;
  if (HMMaxLengthForNaming__hmf_once_v8 && [a1 length] > v2)
  {
    uint64_t v3 = objc_msgSend(a1, "rangeOfComposedCharacterSequencesForRange:", 0, v2);
    v5 = objc_msgSend(a1, "substringWithRange:", v3, v4);
    if ([v5 length] <= v2)
    {
      id v6 = v5;
    }
    else
    {
      id v6 = [v5 substringToIndex:v2 - 1];
    }
    id v7 = v6;
  }
  else
  {
    id v7 = a1;
  }

  return v7;
}

- (id)hm_truncatedDisplayableVersionString
{
  if ((unint64_t)[a1 length] > 0x40)
  {
    uint64_t v3 = objc_msgSend(a1, "rangeOfComposedCharacterSequencesForRange:", 0, 64);
    v5 = objc_msgSend(a1, "substringWithRange:", v3, v4);
    if ((unint64_t)[v5 length] <= 0x40)
    {
      id v6 = v5;
    }
    else
    {
      id v6 = [v5 substringToIndex:63];
    }
    id v2 = v6;
  }
  else
  {
    id v2 = a1;
  }

  return v2;
}

- (uint64_t)stringByCapitalizingFirstWord
{
  return [a1 stringByTransformingFirstWordUsingBlock:&__block_literal_global_63113];
}

- (id)stringByTransformingFirstWordUsingBlock:()HomeKit
{
  id v4 = a3;
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x3010000000;
  v24 = "";
  long long v25 = xmmword_19D47B920;
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x3032000000;
  uint64_t v18 = __Block_byref_object_copy__63115;
  uint64_t v19 = __Block_byref_object_dispose__63116;
  id v20 = 0;
  uint64_t v5 = [a1 length];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __61__NSString_HomeKit__stringByTransformingFirstWordUsingBlock___block_invoke;
  v11[3] = &unk_1E5945568;
  id v13 = &v21;
  id v14 = &v15;
  id v6 = v4;
  id v12 = v6;
  objc_msgSend(a1, "enumerateSubstringsInRange:options:usingBlock:", 0, v5, 3, v11);
  uint64_t v7 = v22[4];
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v8 = a1;
  }
  else
  {
    objc_msgSend(a1, "stringByReplacingCharactersInRange:withString:", v7, v22[5], v16[5]);
    id v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  uint64_t v9 = v8;

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v21, 8);

  return v9;
}

- (id)hm_generateSHA1
{
  v1 = [a1 dataUsingEncoding:4];
  id v2 = objc_msgSend(v1, "hm_generateSHA1");

  return v2;
}

@end