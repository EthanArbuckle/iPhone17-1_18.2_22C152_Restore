@interface NSDictionary(MobileContainerManagerAdditions)
+ (id)MCM_dictionaryWithContentsOfURL:()MobileContainerManagerAdditions options:fileManager:fsNode:error:;
+ (id)MCM_dictionaryWithContentsOfURL:()MobileContainerManagerAdditions options:fsNode:error:;
+ (uint64_t)MCM_dictionaryWithContentsOfURL:()MobileContainerManagerAdditions options:error:;
- (uint64_t)MCM_writeToURL:()MobileContainerManagerAdditions withOptions:error:;
- (uint64_t)MCM_writeToURL:()MobileContainerManagerAdditions withOptions:fileManager:error:;
@end

@implementation NSDictionary(MobileContainerManagerAdditions)

- (uint64_t)MCM_writeToURL:()MobileContainerManagerAdditions withOptions:fileManager:error:
{
  v20[1] = *(id *)MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a5;
  v20[0] = 0;
  v12 = [MEMORY[0x1E4F28F98] dataWithPropertyList:a1 format:200 options:0 error:v20];
  id v13 = v20[0];
  if (!v12) {
    goto LABEL_7;
  }
  if ([v12 length])
  {
    id v17 = v13;
    uint64_t v14 = [v11 writeData:v12 toURL:v10 options:a4 mode:438 error:&v17];
    id v15 = v17;
    goto LABEL_4;
  }
  if (v13)
  {
LABEL_7:
    uint64_t v14 = 0;
    if (!a6) {
      goto LABEL_10;
    }
    goto LABEL_8;
  }
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __94__NSDictionary_MobileContainerManagerAdditions__MCM_writeToURL_withOptions_fileManager_error___block_invoke;
  v18[3] = &unk_1E6A80A30;
  id v19 = v10;
  __94__NSDictionary_MobileContainerManagerAdditions__MCM_writeToURL_withOptions_fileManager_error___block_invoke((uint64_t)v18);
  id v15 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v14 = 0;
  id v13 = v19;
LABEL_4:

  id v13 = v15;
  if (!a6) {
    goto LABEL_10;
  }
LABEL_8:
  if ((v14 & 1) == 0) {
    *a6 = v13;
  }
LABEL_10:

  return v14;
}

- (uint64_t)MCM_writeToURL:()MobileContainerManagerAdditions withOptions:error:
{
  id v8 = a3;
  v9 = +[MCMFileManager defaultManager];
  uint64_t v10 = objc_msgSend(a1, "MCM_writeToURL:withOptions:fileManager:error:", v8, a4, v9, a5);

  return v10;
}

+ (id)MCM_dictionaryWithContentsOfURL:()MobileContainerManagerAdditions options:fileManager:fsNode:error:
{
  v18[1] = *(id *)MEMORY[0x1E4F143B8];
  v18[0] = 0;
  v9 = [a5 readDataFromURL:a3 options:2 fsNode:a6 error:v18];
  id v10 = v18[0];
  if (v9)
  {
    id v17 = 0;
    id v11 = [MEMORY[0x1E4F28F98] propertyListWithData:v9 options:a4 format:0 error:&v17];
    id v12 = v17;

    objc_opt_class();
    id v13 = v11;
    id v14 = 0;
    if (objc_opt_isKindOfClass()) {
      id v14 = v13;
    }

    if (v14)
    {
      id v15 = v13;
      id v10 = v12;
      id v13 = v15;
      if (!a7) {
        goto LABEL_12;
      }
    }
    else
    {
      id v10 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:2048 userInfo:0];

      id v15 = 0;
      if (!a7) {
        goto LABEL_12;
      }
    }
  }
  else
  {
    id v15 = 0;
    id v13 = 0;
    if (!a7) {
      goto LABEL_12;
    }
  }
  if (!v15) {
    *a7 = v10;
  }
LABEL_12:

  return v15;
}

+ (id)MCM_dictionaryWithContentsOfURL:()MobileContainerManagerAdditions options:fsNode:error:
{
  id v10 = a3;
  id v11 = +[MCMFileManager defaultManager];
  id v12 = objc_msgSend(a1, "MCM_dictionaryWithContentsOfURL:options:fileManager:fsNode:error:", v10, a4, v11, a5, a6);

  return v12;
}

+ (uint64_t)MCM_dictionaryWithContentsOfURL:()MobileContainerManagerAdditions options:error:
{
  return objc_msgSend(a1, "MCM_dictionaryWithContentsOfURL:options:fsNode:error:", a3, a4, 0, a5);
}

@end