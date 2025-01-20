@interface NSKeyedUnarchiver(AXMExtras)
+ (id)axmSecurelyUnarchiveData:()AXMExtras withExpectedClass:otherAllowedClasses:error:;
@end

@implementation NSKeyedUnarchiver(AXMExtras)

+ (id)axmSecurelyUnarchiveData:()AXMExtras withExpectedClass:otherAllowedClasses:error:
{
  id v9 = a3;
  id v10 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v20 = 0;
    v17 = 0;
    v21 = 0;
    v22 = @"'data' was not of required type NSData";
LABEL_6:
    _AXMMakeError(0, v22, v11, v12, v13, v14, v15, v16, v29);
    id v23 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  id v31 = 0;
  v17 = (void *)[objc_alloc(MEMORY[0x1E4F28DC0]) initForReadingFromData:v9 error:&v31];
  id v18 = v31;
  if (v18)
  {
    v19 = v18;
    v20 = 0;
    v21 = 0;
    if (!a6) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  uint64_t v29 = 0;
  v26 = [MEMORY[0x1E4F1CAD0] setWithObjects:a4];
  v21 = v26;
  if (v10)
  {
    uint64_t v27 = [v26 setByAddingObjectsFromSet:v10];

    v21 = (void *)v27;
  }
  uint64_t v28 = *MEMORY[0x1E4F284E8];
  id v30 = 0;
  v20 = [v17 decodeTopLevelObjectOfClasses:v21 forKey:v28 error:&v30];
  id v23 = v30;
  if (!v23)
  {
    if (objc_opt_isKindOfClass())
    {
      v19 = 0;
      if (!a6) {
        goto LABEL_9;
      }
      goto LABEL_8;
    }
    v22 = @"'unarchivedResult' was not of type 'expectedClass'";
    goto LABEL_6;
  }
LABEL_7:
  v19 = v23;
  if (a6) {
LABEL_8:
  }
    *a6 = v19;
LABEL_9:
  id v24 = v20;

  return v24;
}

@end