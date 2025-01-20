@interface MKVKImageSourceKeyImageBuilder
+ (id)calculateImagesForParameters:(id)a3;
+ (void)_recursivelyGetImages:(id)a3 accumulator:(id)a4;
@end

@implementation MKVKImageSourceKeyImageBuilder

+ (id)calculateImagesForParameters:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [[MKVKImageSourceKeyImageResult alloc] initWithParameters:v4];
  v6 = [v4 imageSourceKeys];

  id v7 = v6;
  v8 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v7, "count"));
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v9 = v7;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if ((containsKey(v8, v14) & 1) == 0) {
          objc_msgSend(v8, "addObject:", v14, (void)v16);
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v11);
  }

  [a1 _recursivelyGetImages:v8 accumulator:v5];

  return v5;
}

+ (void)_recursivelyGetImages:(id)a3 accumulator:(id)a4
{
  id v37 = a1;
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_opt_new();
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  obuint64_t j = v5;
  uint64_t v41 = [obj countByEnumeratingWithState:&v48 objects:v53 count:16];
  if (v41)
  {
    uint64_t v8 = *(void *)v49;
    id v9 = off_1E54B7000;
    uint64_t v38 = *(void *)v49;
    do
    {
      for (uint64_t i = 0; i != v41; ++i)
      {
        if (*(void *)v49 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void **)(*((void *)&v48 + 1) + 8 * i);
        uint64_t v12 = [(__objc2_class *)v9[162] sharedInstance];
        v13 = [v6 parameters];
        [v13 scale];
        id v47 = 0;
        objc_msgSend(v12, "transitArtworkImageWithDataSource:size:featureType:scale:nightMode:withWidthPaddingMultiple:fullBleedColor:", v11, 8, 2, 0, &v47);
        v14 = (UIImage *)objc_claimAutoreleasedReturnValue();
        id v15 = v47;

        if (!v14)
        {
          long long v16 = [(__objc2_class *)v9[162] sharedInstance];
          long long v17 = [v6 parameters];
          [v17 scale];
          id v46 = v15;
          objc_msgSend(v16, "transitArtworkImageWithDataSource:size:featureType:scale:nightMode:withWidthPaddingMultiple:fullBleedColor:", v11, 7, 2, 0, &v46);
          v14 = (UIImage *)objc_claimAutoreleasedReturnValue();
          id v18 = v46;
          long long v19 = v15;
          id v15 = v18;
        }
        v20 = [v6 triedKeys];
        [v20 addObject:v11];

        if (!v14)
        {
          long long v44 = 0u;
          long long v45 = 0u;
          long long v42 = 0u;
          long long v43 = 0u;
          uint64_t v21 = [v11 fallbackImageKeys];
          uint64_t v28 = [v21 countByEnumeratingWithState:&v42 objects:v52 count:16];
          if (v28)
          {
            uint64_t v29 = v28;
            id v39 = v15;
            uint64_t v30 = *(void *)v43;
            do
            {
              for (uint64_t j = 0; j != v29; ++j)
              {
                if (*(void *)v43 != v30) {
                  objc_enumerationMutation(v21);
                }
                v32 = *(void **)(*((void *)&v42 + 1) + 8 * j);
                v33 = [v6 triedKeys];
                if (containsKey(v33, v32))
                {
                }
                else
                {
                  char v34 = containsKey(v7, v32);

                  if ((v34 & 1) == 0) {
                    [v7 addObject:v32];
                  }
                }
              }
              uint64_t v29 = [v21 countByEnumeratingWithState:&v42 objects:v52 count:16];
            }
            while (v29);
            uint64_t v8 = v38;
            id v15 = v39;
            id v9 = off_1E54B7000;
          }
          v14 = 0;
LABEL_28:

          goto LABEL_29;
        }
        uint64_t v21 = UIImagePNGRepresentation(v14);
        if (!v21) {
          goto LABEL_28;
        }
        v22 = [v6 imageDatas];
        char v23 = [v22 containsObject:v21];

        if (v23) {
          goto LABEL_28;
        }
        if (!v15)
        {
          id v15 = [MEMORY[0x1E4F428B8] clearColor];
        }
        v24 = [v6 imageDatas];
        [v24 addObject:v21];

        v25 = [v6 mutableImages];
        [v25 addObject:v14];

        [v6 addFullBleedColor:v15];
        v26 = [v6 mutableImages];
        unint64_t v27 = [v26 count];

        if (v27 >= 5)
        {

          goto LABEL_31;
        }
LABEL_29:
      }
      uint64_t v41 = [obj countByEnumeratingWithState:&v48 objects:v53 count:16];
    }
    while (v41);
  }
LABEL_31:

  if ([v7 count])
  {
    v35 = [v6 mutableImages];
    unint64_t v36 = [v35 count];

    if (v36 <= 4)
    {
      [v7 sortUsingComparator:&__block_literal_global_99];
      [v37 _recursivelyGetImages:v7 accumulator:v6];
    }
  }
}

uint64_t __68__MKVKImageSourceKeyImageBuilder__recursivelyGetImages_accumulator___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  unsigned int v6 = [v4 keyType];
  if (v6 < [v5 keyType]) {
    goto LABEL_2;
  }
  unsigned int v8 = [v4 keyType];
  if (v8 > [v5 keyType])
  {
LABEL_4:
    uint64_t v7 = 1;
    goto LABEL_16;
  }
  int v9 = [v4 keyType];
  if ((v9 - 4) < 2)
  {
    uint64_t v12 = [v4 imageName];
    uint64_t v13 = [v5 imageName];
    goto LABEL_12;
  }
  if (v9 == 2)
  {
    unsigned int v15 = [v4 iconAttributeKey];
    if (v15 >= [v5 iconAttributeKey])
    {
      unsigned int v16 = [v4 iconAttributeKey];
      uint64_t v7 = v16 > [v5 iconAttributeKey];
      goto LABEL_16;
    }
    goto LABEL_2;
  }
  if (v9 != 1)
  {
    uint64_t v7 = 0;
    goto LABEL_16;
  }
  unsigned int v10 = [v4 shieldType];
  if (v10 >= [v5 shieldType])
  {
    unsigned int v11 = [v4 shieldType];
    if (v11 > [v5 shieldType]) {
      goto LABEL_4;
    }
    uint64_t v12 = [v4 shieldText];
    uint64_t v13 = [v5 shieldText];
LABEL_12:
    v14 = (void *)v13;
    uint64_t v7 = [v12 compare:v13];

    goto LABEL_16;
  }
LABEL_2:
  uint64_t v7 = -1;
LABEL_16:

  return v7;
}

@end