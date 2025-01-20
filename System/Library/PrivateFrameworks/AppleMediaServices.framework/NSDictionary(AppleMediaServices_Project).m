@interface NSDictionary(AppleMediaServices_Project)
- (id)ams_keysForChangedValuesComparedToDictionary:()AppleMediaServices_Project;
- (id)ams_valuesForKeys:()AppleMediaServices_Project;
@end

@implementation NSDictionary(AppleMediaServices_Project)

- (id)ams_valuesForKeys:()AppleMediaServices_Project
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __62__NSDictionary_AppleMediaServices_Project__ams_valuesForKeys___block_invoke;
  v8[3] = &unk_1E55A2388;
  id v9 = v4;
  id v5 = v4;
  v6 = objc_msgSend(a1, "ams_filterUsingTest:", v8);

  return v6;
}

- (id)ams_keysForChangedValuesComparedToDictionary:()AppleMediaServices_Project
{
  id v4 = a3;
  id v5 = v4;
  if (v4 && [v4 count])
  {
    uint64_t v6 = [a1 count];
    v7 = (void *)MEMORY[0x1E4F1CAD0];
    if (v6)
    {
      v8 = [a1 allKeys];
      id v9 = [v7 setWithArray:v8];
      v10 = [v5 allKeys];
      v11 = [v9 setByAddingObjectsFromArray:v10];

      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __89__NSDictionary_AppleMediaServices_Project__ams_keysForChangedValuesComparedToDictionary___block_invoke;
      v16[3] = &unk_1E55A8910;
      v16[4] = a1;
      id v17 = v5;
      v12 = objc_msgSend(v11, "ams_filterUsingTest:", v16);

      goto LABEL_8;
    }
    v13 = v5;
  }
  else
  {
    v7 = (void *)MEMORY[0x1E4F1CAD0];
    v13 = a1;
  }
  v14 = [v13 allKeys];
  v12 = [v7 setWithArray:v14];

LABEL_8:
  return v12;
}

@end