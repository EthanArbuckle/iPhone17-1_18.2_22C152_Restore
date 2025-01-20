@interface CAMIrisDiskUtilities
+ (BOOL)hasPendingWork;
+ (BOOL)isValidVideoDestinationPath:(id)a3;
+ (BOOL)parseVideoDestinationPath:(id)a3 forStillImagePersistenceUUID:(id *)a4 videoPersistenceUUID:(id *)a5 captureDevice:(int64_t *)a6 captureOrientation:(int64_t *)a7 captureTime:(double *)a8 persistenceOptions:(int64_t *)a9 temporaryPersistenceOptions:(int64_t *)a10 bundleIdentifier:(id *)a11 filterName:(id *)a12;
+ (id)_delimiterForFilenames;
+ (id)_substituteForDotInBundleIdentifier;
+ (id)irisVideoDirectoryPath;
+ (id)irisVideoDirectoryPathCreateIfNeeded:(BOOL)a3;
+ (id)videoDestinationPathForStillImageRequest:(id)a3 captureTime:(double)a4 isEV0ForHDR:(BOOL)a5 bundleIdentifier:(id)a6;
+ (id)videoPathExtension;
@end

@implementation CAMIrisDiskUtilities

+ (BOOL)hasPendingWork
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v2 = [a1 irisVideoDirectoryPathCreateIfNeeded:0];
  v3 = [MEMORY[0x263F08850] defaultManager];
  int v4 = [v3 fileExistsAtPath:v2];

  BOOL v5 = 0;
  if (v4)
  {
    v6 = [MEMORY[0x263F08850] defaultManager];
    id v11 = 0;
    v7 = [v6 contentsOfDirectoryAtPath:v2 error:&v11];
    id v8 = v11;

    if (v8)
    {
      v9 = os_log_create("com.apple.camera", "Nebula");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v13 = v2;
        __int16 v14 = 2114;
        id v15 = v8;
        _os_log_impl(&dword_2099F8000, v9, OS_LOG_TYPE_DEFAULT, "Failed to get contents of %{public}@: %{public}@", buf, 0x16u);
      }
    }
    BOOL v5 = [v7 count] != 0;
  }
  return v5;
}

+ (id)irisVideoDirectoryPathCreateIfNeeded:(BOOL)a3
{
  BOOL v3 = a3;
  int v4 = [MEMORY[0x263F5DB20] photoDCIMDirectory];
  BOOL v5 = [v4 stringByAppendingPathComponent:@".MISC/Iris"];

  if (v3)
  {
    v6 = [MEMORY[0x263F08850] defaultManager];
    [v6 createDirectoryAtPath:v5 withIntermediateDirectories:1 attributes:0 error:0];
  }
  return v5;
}

+ (id)irisVideoDirectoryPath
{
  return (id)[a1 irisVideoDirectoryPathCreateIfNeeded:1];
}

+ (id)videoPathExtension
{
  return @"MOV";
}

+ (id)videoDestinationPathForStillImageRequest:(id)a3 captureTime:(double)a4 isEV0ForHDR:(BOOL)a5 bundleIdentifier:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a6;
  v29 = [v10 irisStillImagePersistenceUUIDForEV0:v7];
  if ([v10 isCTMVideo]) {
    [v10 persistenceUUID];
  }
  else {
  uint64_t v12 = [v10 irisVideoPersistenceUUIDForEV0:v7];
  }
  uint64_t v27 = [v10 captureDevice];
  uint64_t v13 = [v10 captureOrientation];
  uint64_t v14 = [v10 persistenceOptions];
  uint64_t v15 = [v10 temporaryPersistenceOptions];
  uint64_t v16 = +[CAMEffectFilterManager ciFilterNameForFilterType:](CAMEffectFilterManager, "ciFilterNameForFilterType:", [v10 effectFilterType]);
  v17 = [a1 _substituteForDotInBundleIdentifier];
  v18 = [v11 stringByReplacingOccurrencesOfString:@"." withString:v17];

  v19 = [a1 _delimiterForFilenames];
  v20 = [NSString stringWithFormat:@"%@%@%@%@%ld%@%ld%@%.f%@%ld%@%ld%@%@", v29, v19, v12, v19, v27, v19, v13, v19, a4 * 100.0, v19, v14, v19, v15, v19, v18];
  v28 = (void *)v12;
  if (v16)
  {
    uint64_t v21 = [NSString stringWithFormat:@"%@%@%@", v20, v19, v16];

    v20 = (void *)v21;
  }
  v22 = [a1 irisVideoDirectoryPath];
  v23 = [v22 stringByAppendingPathComponent:v20];
  v24 = [a1 videoPathExtension];
  v25 = [v23 stringByAppendingPathExtension:v24];

  return v25;
}

+ (BOOL)parseVideoDestinationPath:(id)a3 forStillImagePersistenceUUID:(id *)a4 videoPersistenceUUID:(id *)a5 captureDevice:(int64_t *)a6 captureOrientation:(int64_t *)a7 captureTime:(double *)a8 persistenceOptions:(int64_t *)a9 temporaryPersistenceOptions:(int64_t *)a10 bundleIdentifier:(id *)a11 filterName:(id *)a12
{
  id v13 = a3;
  int64_t v56 = 0;
  int64_t v57 = 0;
  int64_t v54 = 0;
  int64_t v55 = 0;
  uint64_t v14 = [v13 lastPathComponent];
  uint64_t v15 = [v13 pathExtension];
  id v16 = v14;
  v17 = 0;
  v18 = v16;
  do
  {
    v19 = v17;
    v20 = v18;
    v18 = [v18 stringByDeletingPathExtension];

    v17 = [v18 pathExtension];
  }
  while ([v17 length]);
  uint64_t v21 = [MEMORY[0x263F08B08] scannerWithString:v18];
  v22 = [a1 _delimiterForFilenames];
  v23 = [a1 videoPathExtension];
  int v24 = [v15 isEqualToString:v23];

  v47 = v16;
  v48 = v15;
  if (v24)
  {
    id v53 = 0;
    int v25 = [v21 scanUpToString:v22 intoString:&v53];
    id v26 = v53;
    if (v25 && [v21 scanString:v22 intoString:0])
    {
      id v52 = 0;
      int v27 = [v21 scanUpToString:v22 intoString:&v52];
      id v41 = v52;
      if (!v27
        || ![v21 scanString:v22 intoString:0]
        || ![v21 scanInteger:&v57]
        || ![v21 scanString:v22 intoString:0]
        || ![v21 scanInteger:&v56]
        || ![v21 scanString:v22 intoString:0]
        || (uint64_t v51 = 0, ![v21 scanLongLong:&v51])
        || (uint64_t v28 = v51, ![v21 scanString:v22 intoString:0])
        || ![v21 scanInteger:&v55]
        || ![v21 scanString:v22 intoString:0])
      {
        BOOL v35 = 0;
        id v31 = 0;
        id v30 = 0;
LABEL_44:
        v36 = v41;
        goto LABEL_45;
      }
      id v40 = v26;
      if (![v21 scanInteger:&v54]
        || ![v21 scanString:v22 intoString:0])
      {
        BOOL v35 = 0;
        id v31 = 0;
        id v30 = 0;
LABEL_47:
        id v26 = v40;
        goto LABEL_44;
      }
      id v50 = 0;
      int v29 = [v21 scanUpToString:v22 intoString:&v50];
      id v30 = v50;
      if (v29)
      {
        if ([v21 isAtEnd])
        {
          id v31 = 0;
          goto LABEL_21;
        }
        if ([v21 scanString:v22 intoString:0])
        {
          v38 = [MEMORY[0x263F08708] alphanumericCharacterSet];
          id v49 = 0;
          int v39 = [v21 scanCharactersFromSet:v38 intoString:&v49];
          id v31 = v49;

          if (!v39)
          {
LABEL_50:
            BOOL v35 = 0;
            goto LABEL_47;
          }
LABEL_21:
          if ([v21 isAtEnd])
          {
            if (a4) {
              *a4 = v40;
            }
            if (a5) {
              *a5 = v41;
            }
            if (a6) {
              *a6 = v57;
            }
            if (a7) {
              *a7 = v56;
            }
            if (a8) {
              *a8 = (double)v28 / 100.0;
            }
            if (a9) {
              *a9 = v55;
            }
            if (a10) {
              *a10 = v54;
            }
            if (a11)
            {
              v32 = [a1 _substituteForDotInBundleIdentifier];
              v33 = [v30 stringByReplacingOccurrencesOfString:v32 withString:@"."];

              id v34 = v33;
              *a11 = v34;
            }
            if (a12)
            {
              id v31 = v31;
              *a12 = v31;
            }
            BOOL v35 = 1;
            goto LABEL_47;
          }
          goto LABEL_50;
        }
      }
      BOOL v35 = 0;
      id v31 = 0;
      goto LABEL_47;
    }
    BOOL v35 = 0;
    id v31 = 0;
    id v30 = 0;
    v36 = 0;
  }
  else
  {
    BOOL v35 = 0;
    id v31 = 0;
    id v30 = 0;
    v36 = 0;
    id v26 = 0;
  }
LABEL_45:

  return v35;
}

+ (BOOL)isValidVideoDestinationPath:(id)a3
{
  return [a1 parseVideoDestinationPath:a3 forStillImagePersistenceUUID:0 videoPersistenceUUID:0 captureDevice:0 captureOrientation:0 captureTime:0 persistenceOptions:0 temporaryPersistenceOptions:0 bundleIdentifier:0 filterName:0];
}

+ (id)_delimiterForFilenames
{
  return @"__";
}

+ (id)_substituteForDotInBundleIdentifier
{
  return @",";
}

@end