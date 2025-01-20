@interface NSDictionary(InstallCoordinationAdditions)
+ (id)IX_dictionaryWithContentsOfURL:()InstallCoordinationAdditions options:error:;
- (uint64_t)IX_writeToURL:()InstallCoordinationAdditions format:options:error:;
@end

@implementation NSDictionary(InstallCoordinationAdditions)

+ (id)IX_dictionaryWithContentsOfURL:()InstallCoordinationAdditions options:error:
{
  id v14 = 0;
  v7 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:a3 options:2 error:&v14];
  id v8 = v14;
  if (v7)
  {
    id v13 = 0;
    v9 = [MEMORY[0x1E4F28F98] propertyListWithData:v7 options:a4 format:0 error:&v13];
    id v10 = v13;

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v11 = v9;
      id v8 = v10;
      v9 = v11;
      if (!a5) {
        goto LABEL_10;
      }
    }
    else
    {
      id v8 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:2048 userInfo:0];

      id v11 = 0;
      if (!a5) {
        goto LABEL_10;
      }
    }
  }
  else
  {
    id v11 = 0;
    v9 = 0;
    if (!a5) {
      goto LABEL_10;
    }
  }
  if (!v11) {
    *a5 = v8;
  }
LABEL_10:

  return v11;
}

- (uint64_t)IX_writeToURL:()InstallCoordinationAdditions format:options:error:
{
  id v10 = a3;
  id v18 = 0;
  id v11 = [MEMORY[0x1E4F28F98] dataWithPropertyList:a1 format:a4 options:0 error:&v18];
  id v12 = v18;
  id v13 = v12;
  if (v11)
  {
    id v17 = v12;
    uint64_t v14 = [v11 writeToURL:v10 options:a5 error:&v17];
    id v15 = v17;

    id v13 = v15;
    if (!a6) {
      goto LABEL_7;
    }
  }
  else
  {
    uint64_t v14 = 0;
    if (!a6) {
      goto LABEL_7;
    }
  }
  if ((v14 & 1) == 0) {
    *a6 = v13;
  }
LABEL_7:

  return v14;
}

@end