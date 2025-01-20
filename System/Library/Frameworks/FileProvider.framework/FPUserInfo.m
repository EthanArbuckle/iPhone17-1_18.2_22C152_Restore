@interface FPUserInfo
+ (id)mergeWithUserInfo:(id)a3 intoParentUserInfo:(id)a4;
+ (id)unzipKeysWithZippedArray:(id)a3;
+ (id)unzipValuesWithZippedArray:(id)a3;
+ (id)zipWithArray1:(id)a3 array2:(id)a4;
- (FPUserInfo)initWithKeys:(id)a3 values:(id)a4;
- (FPUserInfo)initWithUserInfo:(id)a3;
- (NSArray)keys;
- (NSArray)values;
- (NSDictionary)userInfo;
@end

@implementation FPUserInfo

+ (id)mergeWithUserInfo:(id)a3 intoParentUserInfo:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  if (v8)
  {
    v10 = (FPUserInfo *)v8;
    if (v7)
    {
LABEL_3:
      id v70 = a1;
      SEL v71 = a2;
      v76 = v9;
      v11 = [v7 keys];
      v12 = [v7 values];
      v13 = +[FPUserInfo zipWithArray1:v11 array2:v12];

      v14 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_40_0];
      v74 = v13;
      v15 = [v13 filteredArrayUsingPredicate:v14];

      v73 = v15;
      v16 = [v15 objectEnumerator];
      v17 = [(FPUserInfo *)v10 keys];
      v75 = v10;
      v18 = [(FPUserInfo *)v10 values];
      v19 = +[FPUserInfo zipWithArray1:v17 array2:v18];

      v72 = v19;
      v20 = [v19 objectEnumerator];
      id v21 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      id v22 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      uint64_t v23 = [v16 nextObject];
      uint64_t v24 = [v20 nextObject];
      BOOL v25 = v23 == 0;
      BOOL v26 = v24 == 0;
      if (!(v23 | v24))
      {
LABEL_4:
        v27 = [[FPUserInfo alloc] initWithKeys:v21 values:v22];

        v10 = v75;
        v9 = v76;
        goto LABEL_7;
      }
      v31 = (void *)v24;
      while (1)
      {
        if (v23 && v26)
        {
          v32 = [(id)v23 a];

          if (!v32)
          {
            v33 = [(id)v23 a];

            if (!v33)
            {
              v62 = [MEMORY[0x1E4F28B00] currentHandler];
              [v62 handleFailureInMethod:v71 object:v70 file:@"FPUserInfo.m" lineNumber:133 description:@"Expected non-nil nonUserInfoKey"];
            }
          }
          v34 = [(id)v23 b];

          if (!v34)
          {
            v35 = [(id)v23 b];

            if (!v35)
            {
              v63 = [MEMORY[0x1E4F28B00] currentHandler];
              [v63 handleFailureInMethod:v71 object:v70 file:@"FPUserInfo.m" lineNumber:134 description:@"Expected non-nil value"];
            }
          }
          v36 = [(id)v23 a];
          [v21 addObject:v36];

          v37 = [(id)v23 b];
          [v22 addObject:v37];

          uint64_t v38 = [v16 nextObject];
          uint64_t v39 = 0;
        }
        else
        {
          if (v25 && v31 != 0)
          {
            v40 = [v31 a];

            if (!v40)
            {
              v41 = [v31 a];

              if (!v41)
              {
                v64 = [MEMORY[0x1E4F28B00] currentHandler];
                [v64 handleFailureInMethod:v71 object:v70 file:@"FPUserInfo.m" lineNumber:139 description:@"Expected non-nil nextParentUserInfo.a"];
              }
            }
            v42 = [v31 b];

            if (!v42)
            {
              v43 = [v31 b];

              if (!v43)
              {
                v65 = [MEMORY[0x1E4F28B00] currentHandler];
                [v65 handleFailureInMethod:v71 object:v70 file:@"FPUserInfo.m" lineNumber:140 description:@"Expected non-nil nextParentUserInfo.b"];
              }
            }
            v44 = [v31 a];
            [v21 addObject:v44];

            v45 = [v31 b];
            [v22 addObject:v45];

            uint64_t v39 = [v20 nextObject];
            uint64_t v23 = 0;
            goto LABEL_39;
          }
          v46 = [(id)v23 a];
          v47 = [v31 a];
          uint64_t v48 = [v46 compare:v47];

          if ((unint64_t)(v48 + 1) > 1)
          {
            v56 = [v31 a];

            if (!v56)
            {
              v57 = [v31 a];

              if (!v57)
              {
                v68 = [MEMORY[0x1E4F28B00] currentHandler];
                [v68 handleFailureInMethod:v71 object:v70 file:@"FPUserInfo.m" lineNumber:157 description:@"Expected non-nil nextParentUserInfo.a"];
              }
            }
            v58 = [v31 b];

            if (!v58)
            {
              v59 = [v31 b];

              if (!v59)
              {
                v69 = [MEMORY[0x1E4F28B00] currentHandler];
                [v69 handleFailureInMethod:v71 object:v70 file:@"FPUserInfo.m" lineNumber:158 description:@"Expected non-nil nextParentUserInfo.b"];
              }
            }
            v60 = [v31 a];
            [v21 addObject:v60];

            v61 = [v31 b];
            [v22 addObject:v61];

            uint64_t v39 = [v20 nextObject];
            goto LABEL_39;
          }
          v49 = [(id)v23 a];

          if (!v49)
          {
            v50 = [(id)v23 a];

            if (!v50)
            {
              v66 = [MEMORY[0x1E4F28B00] currentHandler];
              [v66 handleFailureInMethod:v71 object:v70 file:@"FPUserInfo.m" lineNumber:147 description:@"Expected non-nil nonUserInfo.a"];
            }
          }
          v51 = [(id)v23 b];

          if (!v51)
          {
            v52 = [(id)v23 b];

            if (!v52)
            {
              v67 = [MEMORY[0x1E4F28B00] currentHandler];
              [v67 handleFailureInMethod:v71 object:v70 file:@"FPUserInfo.m" lineNumber:148 description:@"Expected non-nil nonUserInfo.b"];
            }
          }
          v53 = [(id)v23 a];
          [v21 addObject:v53];

          v54 = [(id)v23 b];
          [v22 addObject:v54];

          if (!v48)
          {
            uint64_t v55 = [v20 nextObject];

            v31 = (void *)v55;
          }
          uint64_t v39 = (uint64_t)v31;
          uint64_t v38 = [v16 nextObject];
        }
        v31 = (void *)v23;
        uint64_t v23 = v38;
LABEL_39:

        BOOL v25 = v23 == 0;
        BOOL v26 = v39 == 0;
        v31 = (void *)v39;
        if (!(v23 | v39)) {
          goto LABEL_4;
        }
      }
    }
  }
  else
  {
    v28 = [FPUserInfo alloc];
    id v29 = objc_alloc_init(MEMORY[0x1E4F1C9E8]);
    v10 = [(FPUserInfo *)v28 initWithUserInfo:v29];

    if (v7) {
      goto LABEL_3;
    }
  }
  v27 = v10;
LABEL_7:

  return v27;
}

+ (id)zipWithArray1:(id)a3 array2:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = [v7 count];
  if (v9 != [v8 count])
  {
    uint64_t v10 = [v7 count];
    if (v10 != [v8 count])
    {
      v18 = [MEMORY[0x1E4F28B00] currentHandler];
      [v18 handleFailureInMethod:a2 object:a1 file:@"FPUserInfo.m" lineNumber:62 description:@"Expected balancing arrays when zipping arrays"];
    }
  }
  id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if ([v7 count])
  {
    unint64_t v12 = 0;
    do
    {
      v13 = [FPUserInfoPair alloc];
      v14 = [v7 objectAtIndex:v12];
      v15 = [v8 objectAtIndex:v12];
      v16 = [(FPUserInfoPair *)v13 initWithA:v14 b:v15];

      [v11 addObject:v16];
      ++v12;
    }
    while (v12 < [v7 count]);
  }

  return v11;
}

- (FPUserInfo)initWithKeys:(id)a3 values:(id)a4
{
  id v7 = (NSArray *)a3;
  id v8 = (NSArray *)a4;
  uint64_t v9 = [(NSArray *)v7 count];
  if (v9 != [(NSArray *)v8 count])
  {
    uint64_t v10 = [(NSArray *)v7 count];
    if (v10 != [(NSArray *)v8 count])
    {
      v15 = [MEMORY[0x1E4F28B00] currentHandler];
      [v15 handleFailureInMethod:a2 object:self file:@"FPUserInfo.m" lineNumber:53 description:@"Expected balancing keys and values when initing UserInfo"];
    }
  }
  keys = self->_keys;
  self->_keys = v7;
  unint64_t v12 = v7;

  values = self->_values;
  self->_values = v8;

  return self;
}

- (NSDictionary)userInfo
{
  v3 = [(FPUserInfo *)self keys];
  v4 = [(FPUserInfo *)self values];
  v5 = FPDecodeUserInfo(v3, v4);

  return (NSDictionary *)v5;
}

- (NSArray)values
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (NSArray)keys
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (FPUserInfo)initWithUserInfo:(id)a3
{
  id v16 = 0;
  id v17 = 0;
  char v5 = FPEncodeUserInfo(a3, &v17, &v16);
  id v6 = v17;
  id v7 = v16;
  if ((v5 & 1) == 0)
  {
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"FPUserInfo.m" lineNumber:37 description:@"cannot pack user info"];
  }
  uint64_t v9 = +[FPUserInfo zipWithArray1:v6 array2:v7];
  uint64_t v10 = [v9 sortedArrayUsingComparator:&__block_literal_global_50];
  id v11 = +[FPUserInfo unzipKeysWithZippedArray:v10];
  keys = self->_keys;
  self->_keys = v11;

  v13 = +[FPUserInfo unzipValuesWithZippedArray:v10];
  values = self->_values;
  self->_values = v13;

  return self;
}

+ (id)unzipValuesWithZippedArray:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(v7);
        }
        unint64_t v12 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        v13 = objc_msgSend(v12, "b", (void)v18);

        if (!v13)
        {
          v14 = [v12 b];

          if (!v14)
          {
            id v16 = [MEMORY[0x1E4F28B00] currentHandler];
            [v16 handleFailureInMethod:a2 object:a1 file:@"FPUserInfo.m" lineNumber:85 description:@"Expected non-nil pair.b"];
          }
        }
        v15 = [v12 b];
        [v6 addObject:v15];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v9);
  }

  return v6;
}

+ (id)unzipKeysWithZippedArray:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(v7);
        }
        unint64_t v12 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        v13 = objc_msgSend(v12, "a", (void)v18);

        if (!v13)
        {
          v14 = [v12 a];

          if (!v14)
          {
            id v16 = [MEMORY[0x1E4F28B00] currentHandler];
            [v16 handleFailureInMethod:a2 object:a1 file:@"FPUserInfo.m" lineNumber:75 description:@"Expected non-nil pair.a"];
          }
        }
        v15 = [v12 a];
        [v6 addObject:v15];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v9);
  }

  return v6;
}

uint64_t __51__FPUserInfo_mergeWithUserInfo_intoParentUserInfo___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 a];
  v3 = FPDecodeUserInfoItem((uint64_t)v2);

  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    uint64_t v4 = [v3 hasSuffix:@".inherited"];
  }
  else {
    uint64_t v4 = 0;
  }

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_values, 0);

  objc_storeStrong((id *)&self->_keys, 0);
}

uint64_t __31__FPUserInfo_initWithUserInfo___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 a];
  id v6 = [v4 a];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

@end