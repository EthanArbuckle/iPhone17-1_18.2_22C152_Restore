@interface HKLineEnumerator
+ (BOOL)enumerateUTF8LinesWithError:(id *)a3 dataProvider:(id)a4 lineHandler:(id)a5;
- (HKLineEnumerator)init;
@end

@implementation HKLineEnumerator

- (HKLineEnumerator)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

+ (BOOL)enumerateUTF8LinesWithError:(id *)a3 dataProvider:(id)a4 lineHandler:(id)a5
{
  v34 = a3;
  v6 = (void (**)(id, id *))a4;
  id v36 = a5;
  id v37 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA58]);
  v8 = 0;
  uint64_t v62 = 0;
  v63 = &v62;
  uint64_t v64 = 0x2020000000;
  uint64_t v65 = 1;
  uint64_t v56 = 0;
  v57 = (id *)&v56;
  uint64_t v58 = 0x3032000000;
  v59 = __Block_byref_object_copy__9;
  v60 = __Block_byref_object_dispose__9;
  id v61 = 0;
  v35 = v43;
  do
  {
    if (v63[3] != 1)
    {
      v11 = v8;
      goto LABEL_38;
    }
    v9 = (void *)MEMORY[0x19F395970]();
    v10 = v57;
    id v55 = v57[5];
    v11 = v6[2](v6, &v55);
    objc_storeStrong(v10 + 5, v55);

    if (v11 && [v11 length])
    {
      if ([v7 length]) {
        [v7 appendData:v11];
      }
      if (objc_msgSend(v7, "length", v34, v35)) {
        uint64_t v12 = [v7 bytes];
      }
      else {
        uint64_t v12 = [v11 bytes];
      }
      uint64_t v14 = v12;
      if ([v7 length]) {
        uint64_t v15 = [v7 length];
      }
      else {
        uint64_t v15 = [v11 length];
      }
      uint64_t v16 = v15;
      uint64_t v17 = -1;
      uint64_t v18 = v15;
      do
      {
        uint64_t v19 = [[NSString alloc] initWithBytes:v14 length:v18 encoding:4];
        v20 = (void *)v19;
        unint64_t v21 = ++v17;
        --v18;
        if (v19) {
          BOOL v22 = 1;
        }
        else {
          BOOL v22 = v21 >= 3;
        }
      }
      while (!v22);
      if (v19)
      {
        if (v17) {
          objc_msgSend(v7, "replaceBytesInRange:withBytes:length:", 0, objc_msgSend(v7, "length"), v14 + v16 - v17, v17);
        }
        else {
          [v7 setLength:0];
        }
        [v37 appendString:v20];
        uint64_t v49 = 0;
        v50 = &v49;
        uint64_t v51 = 0x3010000000;
        v52 = "";
        uint64_t v53 = 0;
        uint64_t v54 = 0;
        uint64_t v25 = [v37 length];
        v42[0] = MEMORY[0x1E4F143A8];
        v42[1] = 3221225472;
        v43[0] = __73__HKLineEnumerator_enumerateUTF8LinesWithError_dataProvider_lineHandler___block_invoke;
        v43[1] = &unk_1E58BFC10;
        id v26 = v37;
        id v44 = v26;
        v46 = &v62;
        id v45 = v36;
        v47 = &v56;
        v48 = &v49;
        objc_msgSend(v26, "enumerateSubstringsInRange:options:usingBlock:", 0, v25, 0, v42);
        if (v63[3] == 1)
        {
          if (v50[5]) {
            [v26 deleteCharactersInRange:v50[4]];
          }
          int v13 = 0;
        }
        else
        {
          int v13 = 3;
        }

        _Block_object_dispose(&v49, 8);
      }
      else
      {
        uint64_t v23 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 3, @"Unable to create valid utf-8 string from data");
        id v24 = v57[5];
        v57[5] = (id)v23;

        v63[3] = 0;
        int v13 = 3;
      }
    }
    else
    {
      v63[3] = v11 != 0;
      int v13 = 3;
    }
    v8 = v11;
  }
  while (!v13);
  if (v63[3] == 1)
  {
    uint64_t v27 = [v37 length];
    v38[0] = MEMORY[0x1E4F143A8];
    v38[1] = 3221225472;
    v38[2] = __73__HKLineEnumerator_enumerateUTF8LinesWithError_dataProvider_lineHandler___block_invoke_2;
    v38[3] = &unk_1E58BFC38;
    v40 = &v62;
    id v39 = v36;
    v41 = &v56;
    objc_msgSend(v37, "enumerateSubstringsInRange:options:usingBlock:", 0, v27, 0, v38);
    id v28 = v57[5];
    v29 = v28;
    if (v28)
    {
      if (v34) {
        id *v34 = v28;
      }
      else {
        _HKLogDroppedError(v28);
      }
    }

    uint64_t v32 = v63[3];
    goto LABEL_45;
  }
LABEL_38:
  id v30 = v57[5];
  v31 = v30;
  if (v30)
  {
    if (v34) {
      id *v34 = v30;
    }
    else {
      _HKLogDroppedError(v30);
    }
  }

  uint64_t v32 = v63[3];
LABEL_45:

  _Block_object_dispose(&v56, 8);
  _Block_object_dispose(&v62, 8);

  return v32 != 0;
}

void __73__HKLineEnumerator_enumerateUTF8LinesWithError_dataProvider_lineHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, NSUInteger a5, NSUInteger a6, BOOL *a7)
{
  id v11 = a2;
  if (a5 + a6 >= [*(id *)(a1 + 32) length])
  {
    *a7 = 1;
  }
  else
  {
    uint64_t v12 = *(void *)(a1 + 40);
    uint64_t v13 = *(void *)(*(void *)(a1 + 56) + 8);
    id obj = *(id *)(v13 + 40);
    uint64_t v14 = (*(uint64_t (**)(void))(v12 + 16))();
    objc_storeStrong((id *)(v13 + 40), obj);
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v14;
    *a7 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) != 1;
    v16.location = a5;
    v16.length = a6;
    *(NSRange *)(*(void *)(*(void *)(a1 + 64) + 8) + 32) = NSUnionRange(*(NSRange *)(*(void *)(*(void *)(a1 + 64) + 8)+ 32), v16);
  }
}

void __73__HKLineEnumerator_enumerateUTF8LinesWithError_dataProvider_lineHandler___block_invoke_2(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, BOOL *a7)
{
  uint64_t v9 = a1[4];
  uint64_t v10 = *(void *)(a1[6] + 8);
  id obj = *(id *)(v10 + 40);
  uint64_t v11 = (*(uint64_t (**)(void))(v9 + 16))();
  objc_storeStrong((id *)(v10 + 40), obj);
  *(void *)(*(void *)(a1[5] + 8) + 24) = v11;
  *a7 = *(void *)(*(void *)(a1[5] + 8) + 24) != 1;
}

@end