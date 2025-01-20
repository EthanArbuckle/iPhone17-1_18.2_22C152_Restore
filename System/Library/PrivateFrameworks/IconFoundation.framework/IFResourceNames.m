@interface IFResourceNames
- (IFResourceNames)initWithRootNames:(id)a3;
- (IFResourceNames)initWithRootNames:(id)a3 variants:(id)a4;
- (NSArray)variants;
- (NSSet)rootNames;
- (id)extrapolateFullNamesForIOS;
- (id)extrapolateFullNamesForMacOS;
@end

@implementation IFResourceNames

- (IFResourceNames)initWithRootNames:(id)a3
{
  return [(IFResourceNames *)self initWithRootNames:a3 variants:0];
}

- (IFResourceNames)initWithRootNames:(id)a3 variants:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)IFResourceNames;
  v8 = [(IFResourceNames *)&v15 init];
  v9 = v8;
  if (v6 && v8)
  {
    uint64_t v10 = [v6 copy];
    rootNames = v9->_rootNames;
    v9->_rootNames = (NSSet *)v10;

    uint64_t v12 = [v7 copy];
    variants = v9->_variants;
    v9->_variants = (NSArray *)v12;
  }
  return v9;
}

- (id)extrapolateFullNamesForIOS
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  v38 = self;
  obuint64_t j = [(IFResourceNames *)self rootNames];
  uint64_t v4 = [obj countByEnumeratingWithState:&v58 objects:v65 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    unint64_t v6 = 0x1E4F28000uLL;
    uint64_t v7 = *(void *)v59;
    uint64_t v36 = *(void *)v59;
    v37 = v3;
    do
    {
      uint64_t v8 = 0;
      uint64_t v39 = v5;
      do
      {
        if (*(void *)v59 != v7) {
          objc_enumerationMutation(obj);
        }
        v9 = *(void **)(*((void *)&v58 + 1) + 8 * v8);
        objc_msgSend(v9, "pathExtension", v36, v37);
        uint64_t v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v11 = [*(id *)(v6 + 2952) characterSetWithCharactersInString:@"0123456789"];
        uint64_t v12 = [v11 invertedSet];

        if ([(__CFString *)v10 length]
          && [(__CFString *)v10 rangeOfCharacterFromSet:v12] != 0x7FFFFFFFFFFFFFFFLL)
        {
          id v13 = [v9 stringByDeletingPathExtension];
        }
        else
        {

          id v13 = v9;
          uint64_t v10 = @"png";
        }
        if (v13) {
          BOOL v14 = v10 == 0;
        }
        else {
          BOOL v14 = 1;
        }
        if (!v14)
        {
          objc_super v15 = objc_opt_new();
          [v15 addObject:v13];
          if (([v13 hasSuffix:@"2x"] & 1) == 0)
          {
            v16 = [v13 stringByAppendingString:@"@2x"];
            [v15 addObject:v16];
          }
          v41 = v12;
          v42 = v10;
          uint64_t v43 = v8;
          if (([v13 hasSuffix:@"3x"] & 1) == 0)
          {
            v17 = [v13 stringByAppendingString:@"@3x"];
            [v15 addObject:v17];
          }
          long long v56 = 0u;
          long long v57 = 0u;
          long long v54 = 0u;
          long long v55 = 0u;
          id v45 = [(IFResourceNames *)v38 variants];
          uint64_t v18 = [v45 countByEnumeratingWithState:&v54 objects:v64 count:16];
          id v44 = v13;
          if (v18)
          {
            uint64_t v19 = v18;
            uint64_t v20 = *(void *)v55;
            do
            {
              for (uint64_t i = 0; i != v19; ++i)
              {
                if (*(void *)v55 != v20) {
                  objc_enumerationMutation(v45);
                }
                uint64_t v22 = *(void *)(*((void *)&v54 + 1) + 8 * i);
                if (([v13 hasSuffix:v22] & 1) == 0)
                {
                  long long v52 = 0u;
                  long long v53 = 0u;
                  long long v50 = 0u;
                  long long v51 = 0u;
                  v23 = (void *)[v15 copy];
                  uint64_t v24 = [v23 countByEnumeratingWithState:&v50 objects:v63 count:16];
                  if (v24)
                  {
                    uint64_t v25 = v24;
                    uint64_t v26 = *(void *)v51;
                    do
                    {
                      for (uint64_t j = 0; j != v25; ++j)
                      {
                        if (*(void *)v51 != v26) {
                          objc_enumerationMutation(v23);
                        }
                        v28 = [*(id *)(*((void *)&v50 + 1) + 8 * j) stringByAppendingString:v22];
                        [v15 addObject:v28];
                      }
                      uint64_t v25 = [v23 countByEnumeratingWithState:&v50 objects:v63 count:16];
                    }
                    while (v25);
                  }

                  id v13 = v44;
                }
              }
              uint64_t v19 = [v45 countByEnumeratingWithState:&v54 objects:v64 count:16];
            }
            while (v19);
          }

          long long v48 = 0u;
          long long v49 = 0u;
          long long v46 = 0u;
          long long v47 = 0u;
          id v29 = v15;
          uint64_t v30 = [v29 countByEnumeratingWithState:&v46 objects:v62 count:16];
          uint64_t v7 = v36;
          v3 = v37;
          uint64_t v10 = v42;
          uint64_t v8 = v43;
          uint64_t v12 = v41;
          if (v30)
          {
            uint64_t v31 = v30;
            uint64_t v32 = *(void *)v47;
            do
            {
              for (uint64_t k = 0; k != v31; ++k)
              {
                if (*(void *)v47 != v32) {
                  objc_enumerationMutation(v29);
                }
                v34 = [*(id *)(*((void *)&v46 + 1) + 8 * k) stringByAppendingPathExtension:v42];
                if (v34) {
                  [v37 addObject:v34];
                }
              }
              uint64_t v31 = [v29 countByEnumeratingWithState:&v46 objects:v62 count:16];
            }
            while (v31);
          }

          unint64_t v6 = 0x1E4F28000;
          uint64_t v5 = v39;
          id v13 = v44;
        }

        ++v8;
      }
      while (v8 != v5);
      uint64_t v5 = [obj countByEnumeratingWithState:&v58 objects:v65 count:16];
    }
    while (v5);
  }

  return v3;
}

- (id)extrapolateFullNamesForMacOS
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v4 = [(IFResourceNames *)self rootNames];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v10 = [v9 pathExtension];
        if ([(__CFString *)v10 length])
        {
          id v11 = [v9 stringByDeletingPathExtension];
        }
        else
        {

          id v11 = v9;
          uint64_t v10 = @"icns";
        }
        if (v10) {
          BOOL v12 = v11 == 0;
        }
        else {
          BOOL v12 = 1;
        }
        if (!v12)
        {
          id v13 = [v11 stringByAppendingPathExtension:v10];
          if (v13) {
            [v3 addObject:v13];
          }
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v6);
  }

  return v3;
}

- (NSSet)rootNames
{
  return (NSSet *)objc_getProperty(self, a2, 8, 1);
}

- (NSArray)variants
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_variants, 0);

  objc_storeStrong((id *)&self->_rootNames, 0);
}

@end