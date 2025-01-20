@interface IMDDeletePartsHelper
+ (BOOL)_convertDeletedPartsDict:(id)a3 toIndexSet:(id *)a4 toMap:(id *)a5;
+ (id)_makeDeletePartsDictFor:(id)a3 withIndexes:(id)a4 withIndexToRangeMap:(id)a5 deleteDate:(id)a6;
+ (unint64_t)_unsignedIntegerFromString:(id)a3;
@end

@implementation IMDDeletePartsHelper

+ (id)_makeDeletePartsDictFor:(id)a3 withIndexes:(id)a4 withIndexToRangeMap:(id)a5 deleteDate:(id)a6
{
  v38[4] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  uint64_t v30 = 0;
  v31 = &v30;
  uint64_t v32 = 0x2020000000;
  char v33 = 0;
  v13 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v10, "count"));
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = sub_1D97BB3F4;
  v27[3] = &unk_1E6B76728;
  v29 = &v30;
  id v14 = v13;
  id v28 = v14;
  [v10 enumerateIndexesUsingBlock:v27];
  v15 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v11, "count"));
  uint64_t v22 = MEMORY[0x1E4F143A8];
  uint64_t v23 = 3221225472;
  v24 = sub_1D97BB484;
  v25 = &unk_1E6B76750;
  id v16 = v15;
  id v26 = v16;
  [v11 enumerateKeysAndObjectsUsingBlock:&v22];
  v37[0] = @"messageGuid";
  v37[1] = @"indexes";
  v38[0] = v9;
  v38[1] = v14;
  v38[2] = v16;
  v37[2] = @"indexToRange";
  v37[3] = @"deleteSubject";
  v17 = objc_msgSend(NSNumber, "numberWithBool:", *((unsigned __int8 *)v31 + 24), v22, v23, v24, v25);
  v38[3] = v17;
  v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v38 forKeys:v37 count:4];

  v34 = v18;
  v35[0] = @"parts";
  v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v34 count:1];
  v36[0] = v19;
  v36[1] = MEMORY[0x1E4F1CC28];
  v35[1] = @"isPermanentDelete";
  v35[2] = @"recoverableDeleteDate";
  v36[2] = v12;
  v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v36 forKeys:v35 count:3];

  _Block_object_dispose(&v30, 8);

  return v20;
}

+ (unint64_t)_unsignedIntegerFromString:(id)a3
{
  v3 = [MEMORY[0x1E4F28FE8] scannerWithString:a3];
  unint64_t v6 = 0;
  [v3 scanUnsignedLongLong:&v6];
  unint64_t v4 = v6;

  return v4;
}

+ (BOOL)_convertDeletedPartsDict:(id)a3 toIndexSet:(id *)a4 toMap:(id *)a5
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = [v8 objectForKey:@"indexes"];
  uint64_t v10 = [v8 objectForKey:@"indexToRange"];
  id v11 = (void *)v10;
  uint64_t v33 = 0;
  v34 = &v33;
  uint64_t v35 = 0x2020000000;
  if (v9) {
    BOOL v12 = v10 == 0;
  }
  else {
    BOOL v12 = 1;
  }
  char v13 = !v12;
  char v36 = v13;
  if (v12)
  {
    BOOL v22 = 0;
  }
  else
  {
    if (a4)
    {
      id v14 = objc_alloc_init(MEMORY[0x1E4F28E60]);
      v24 = a5;
      long long v31 = 0u;
      long long v32 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      id v15 = v9;
      uint64_t v16 = [v15 countByEnumeratingWithState:&v29 objects:v37 count:16];
      if (v16)
      {
        uint64_t v17 = *(void *)v30;
        do
        {
          for (uint64_t i = 0; i != v16; ++i)
          {
            if (*(void *)v30 != v17) {
              objc_enumerationMutation(v15);
            }
            objc_msgSend(v14, "addIndex:", objc_msgSend(a1, "_unsignedIntegerFromString:", *(void *)(*((void *)&v29 + 1) + 8 * i), v24));
          }
          uint64_t v16 = [v15 countByEnumeratingWithState:&v29 objects:v37 count:16];
        }
        while (v16);
      }

      a5 = v24;
      id v19 = v14;
      *a4 = v19;
    }
    if (a5)
    {
      v20 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v11, "count"));
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = sub_1D97BB960;
      v25[3] = &unk_1E6B76778;
      v27 = &v33;
      id v28 = a1;
      id v21 = v20;
      id v26 = v21;
      [v11 enumerateKeysAndObjectsUsingBlock:v25];
      if (*((unsigned char *)v34 + 24)) {
        *a5 = v21;
      }
    }
    BOOL v22 = *((unsigned char *)v34 + 24) != 0;
  }
  _Block_object_dispose(&v33, 8);

  return v22;
}

@end