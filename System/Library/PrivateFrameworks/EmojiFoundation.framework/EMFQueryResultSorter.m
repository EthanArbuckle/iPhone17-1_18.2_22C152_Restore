@interface EMFQueryResultSorter
+ (id)_sortResults_clusterGenderVariantsTogether:(id)a3 withLocaleData:(__EmojiLocaleDataWrapper *)a4;
+ (id)_sortResults_default:(id)a3 withLocaleData:(__EmojiLocaleDataWrapper *)a4;
+ (id)sortResults:(id)a3 withLocaleData:(__EmojiLocaleDataWrapper *)a4 sortType:(unint64_t)a5;
+ (int64_t)compareEmojiTokenGenderInclusiveFirst:(id)a3 withOtherToken:(id)a4;
@end

@implementation EMFQueryResultSorter

+ (id)sortResults:(id)a3 withLocaleData:(__EmojiLocaleDataWrapper *)a4 sortType:(unint64_t)a5
{
  id v7 = a3;
  v8 = v7;
  if (a5 == 1)
  {
    uint64_t v10 = objc_msgSend((id)objc_opt_class(), "_sortResults_clusterGenderVariantsTogether:withLocaleData:", v7, a4);
  }
  else
  {
    v9 = v7;
    if (a5) {
      goto LABEL_6;
    }
    uint64_t v10 = objc_msgSend((id)objc_opt_class(), "_sortResults_default:withLocaleData:", v7, a4);
  }
  v9 = (void *)v10;

LABEL_6:
  return v9;
}

+ (int64_t)compareEmojiTokenGenderInclusiveFirst:(id)a3 withOtherToken:(id)a4
{
  return _compareEmojiTokensUsingGenderInclusiveSortCollation(a3, a4);
}

+ (id)_sortResults_default:(id)a3 withLocaleData:(__EmojiLocaleDataWrapper *)a4
{
  return (id)[a3 sortedArrayUsingFunction:_compareEmojiStringsUsingDefaultSortCollation context:a4];
}

+ (id)_sortResults_clusterGenderVariantsTogether:(id)a3 withLocaleData:(__EmojiLocaleDataWrapper *)a4
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  obuint64_t j = v4;
  uint64_t v6 = [obj countByEnumeratingWithState:&v40 objects:v49 count:16];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(void *)v41;
    *(void *)&long long v7 = 138543618;
    long long v30 = v7;
    uint64_t v31 = *(void *)v41;
    do
    {
      uint64_t v10 = 0;
      uint64_t v32 = v8;
      do
      {
        if (*(void *)v41 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void *)(*((void *)&v40 + 1) + 8 * v10);
        if ((objc_msgSend(v5, "containsObject:", v11, v30) & 1) == 0)
        {
          v12 = (EMFEmojiStringGenderVariantFactory *)CEMEmojiTokenCreateWithString();
          int Gender = CEMEmojiTokenGetGender();
          if (Gender)
          {
            int v14 = Gender;
            uint64_t v33 = v10;
            v15 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:3];
            for (uint64_t i = 0; i != 4; ++i)
            {
              uint64_t v17 = kEMFEmojiGenderInclusiveSortCollation[i];
              if (v17 == v14)
              {
                [v15 addObject:v12];
                v18 = v12;
              }
              else
              {
                v18 = [[EMFEmojiStringGenderVariantFactory alloc] initWithSourceString:v11 gender:v17];
                v19 = [(EMFEmojiStringGenderVariantFactory *)v18 stringForGenderVariant:v17];
                if ([obj containsObject:v19])
                {
                  uint64_t v20 = CEMEmojiTokenCreateWithString();
                  if (v20)
                  {
                    v21 = v20;
                    [v15 addObject:v20];
                  }
                  else
                  {
                    v21 = emf_logging_get_default_log();
                    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)buf = v30;
                      uint64_t v46 = 0;
                      __int16 v47 = 1026;
                      int v48 = v17;
                      _os_log_error_impl(&dword_1B8C45000, v21, OS_LOG_TYPE_ERROR, "EMFQueryResultSorter: Failed to find a CoreEmoji entry for '%{public}@' (variantGender: %{public}d", buf, 0x12u);
                    }
                  }
                }
              }
            }
            [v15 sortUsingFunction:_compareEmojiTokensUsingDefaultSortCollation context:a4];
            long long v38 = 0u;
            long long v39 = 0u;
            long long v36 = 0u;
            long long v37 = 0u;
            id v22 = v15;
            uint64_t v23 = [v22 countByEnumeratingWithState:&v36 objects:v44 count:16];
            if (v23)
            {
              uint64_t v24 = v23;
              uint64_t v25 = *(void *)v37;
              do
              {
                for (uint64_t j = 0; j != v24; ++j)
                {
                  if (*(void *)v37 != v25) {
                    objc_enumerationMutation(v22);
                  }
                  v27 = CEMEmojiTokenGetString();
                  [v5 addObject:v27];
                }
                uint64_t v24 = [v22 countByEnumeratingWithState:&v36 objects:v44 count:16];
              }
              while (v24);
            }

            uint64_t v9 = v31;
            uint64_t v8 = v32;
            uint64_t v10 = v33;
          }
          else
          {
            [v5 addObject:v11];
            if (v12) {
              CFRelease(v12);
            }
          }
        }
        ++v10;
      }
      while (v10 != v8);
      uint64_t v8 = [obj countByEnumeratingWithState:&v40 objects:v49 count:16];
    }
    while (v8);
  }

  v28 = (void *)[v5 copy];
  return v28;
}

@end