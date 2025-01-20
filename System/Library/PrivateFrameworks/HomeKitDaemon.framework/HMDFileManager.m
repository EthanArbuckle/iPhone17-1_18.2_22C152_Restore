@interface HMDFileManager
- (BOOL)copyItemAtURL:(id)a3 toURL:(id)a4 error:(id *)a5;
- (BOOL)createDirectoryAtURL:(id)a3 withIntermediateDirectories:(BOOL)a4 attributes:(id)a5 error:(id *)a6;
- (BOOL)createFileAtPath:(id)a3 contents:(id)a4 attributes:(id)a5;
- (BOOL)fileExistsAtPath:(id)a3;
- (BOOL)fileExistsAtPath:(id)a3 isDirectory:(BOOL *)a4;
- (BOOL)fileExistsAtURL:(id)a3;
- (BOOL)isDeletableFileAtPath:(id)a3;
- (BOOL)linkItemAtURL:(id)a3 toURL:(id)a4 error:(id *)a5;
- (BOOL)moveItemAtURL:(id)a3 toURL:(id)a4 error:(id *)a5;
- (BOOL)removeItemAtURL:(id)a3 error:(id *)a4;
- (BOOL)unzipItemAtURL:(id)a3 toURL:(id)a4 error:(id *)a5;
- (BOOL)writeData:(id)a3 toURL:(id)a4 options:(unint64_t)a5 error:(id *)a6;
- (BOOL)writeDictionary:(id)a3 toURL:(id)a4 error:(id *)a5;
- (BOOL)writeJSONObject:(id)a3 toURL:(id)a4 error:(id *)a5;
- (BOOL)zipItemAtURL:(id)a3 toURL:(id)a4 error:(id *)a5;
- (NSURL)heroFrameStoreDirectoryURL;
- (NSURL)legacyHeroFrameStoreDirectoryURL;
- (id)JSONObjectWithURL:(id)a3 error:(id *)a4;
- (id)attributesOfItemAtPath:(id)a3 error:(id *)a4;
- (id)contentsOfDirectoryAtURL:(id)a3 includingPropertiesForKeys:(id)a4 options:(unint64_t)a5 error:(id *)a6;
- (id)dataWithContentsOfURL:(id)a3 options:(unint64_t)a4 error:(id *)a5;
- (id)fileHandleForReadingFromURL:(id)a3 error:(id *)a4;
- (void)enumerateItemsAtURL:(id)a3 includingPropertiesForKeys:(id)a4 usingBlock:(id)a5;
@end

@implementation HMDFileManager

- (BOOL)createFileAtPath:(id)a3 contents:(id)a4 attributes:(id)a5
{
  v7 = (void *)MEMORY[0x263F08850];
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = [v7 defaultManager];
  char v12 = [v11 createFileAtPath:v10 contents:v9 attributes:v8];

  return v12;
}

- (id)attributesOfItemAtPath:(id)a3 error:(id *)a4
{
  v5 = (void *)MEMORY[0x263F08850];
  id v6 = a3;
  v7 = [v5 defaultManager];
  id v8 = [v7 attributesOfItemAtPath:v6 error:a4];

  return v8;
}

- (BOOL)moveItemAtURL:(id)a3 toURL:(id)a4 error:(id *)a5
{
  v7 = (void *)MEMORY[0x263F08850];
  id v8 = a4;
  id v9 = a3;
  id v10 = [v7 defaultManager];
  LOBYTE(a5) = [v10 moveItemAtURL:v9 toURL:v8 error:a5];

  return (char)a5;
}

- (id)contentsOfDirectoryAtURL:(id)a3 includingPropertiesForKeys:(id)a4 options:(unint64_t)a5 error:(id *)a6
{
  id v9 = (void *)MEMORY[0x263F08850];
  id v10 = a4;
  id v11 = a3;
  char v12 = [v9 defaultManager];
  v13 = [v12 contentsOfDirectoryAtURL:v11 includingPropertiesForKeys:v10 options:a5 error:a6];

  return v13;
}

- (void)enumerateItemsAtURL:(id)a3 includingPropertiesForKeys:(id)a4 usingBlock:(id)a5
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = (void (**)(id, void))a5;
  id v10 = [MEMORY[0x263F08850] defaultManager];
  id v11 = [v10 enumeratorAtURL:v7 includingPropertiesForKeys:v8 options:0 errorHandler:0];

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v12 = v11;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v18;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v18 != v15) {
          objc_enumerationMutation(v12);
        }
        v9[2](v9, *(void *)(*((void *)&v17 + 1) + 8 * v16++));
      }
      while (v14 != v16);
      uint64_t v14 = [v12 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v14);
  }
}

- (BOOL)isDeletableFileAtPath:(id)a3
{
  v3 = (void *)MEMORY[0x263F08850];
  id v4 = a3;
  v5 = [v3 defaultManager];
  char v6 = [v5 isDeletableFileAtPath:v4];

  return v6;
}

- (id)fileHandleForReadingFromURL:(id)a3 error:(id *)a4
{
  return (id)[MEMORY[0x263F08840] fileHandleForReadingFromURL:a3 error:a4];
}

- (BOOL)linkItemAtURL:(id)a3 toURL:(id)a4 error:(id *)a5
{
  id v7 = (void *)MEMORY[0x263F08850];
  id v8 = a4;
  id v9 = a3;
  id v10 = [v7 defaultManager];
  LOBYTE(a5) = [v10 linkItemAtURL:v9 toURL:v8 error:a5];

  return (char)a5;
}

- (BOOL)writeJSONObject:(id)a3 toURL:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = (objc_class *)MEMORY[0x263EFF9E0];
  id v9 = a4;
  id v10 = (void *)[[v8 alloc] initWithURL:v9 append:0];

  if (v10)
  {
    [v10 open];
    BOOL v11 = [MEMORY[0x263F08900] writeJSONObject:v7 toStream:v10 options:1 error:a5] != 0;
  }
  else if (a5)
  {
    [MEMORY[0x263F087E8] hmfErrorWithCode:2];
    BOOL v11 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (id)JSONObjectWithURL:(id)a3 error:(id *)a4
{
  v5 = (objc_class *)MEMORY[0x263EFF950];
  id v6 = a3;
  id v7 = (void *)[[v5 alloc] initWithURL:v6];

  if (v7)
  {
    [v7 open];
    id v8 = [MEMORY[0x263F08900] JSONObjectWithStream:v7 options:0 error:a4];
  }
  else if (a4)
  {
    [MEMORY[0x263F087E8] hmfErrorWithCode:2];
    id v8 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (BOOL)zipItemAtURL:(id)a3 toURL:(id)a4 error:(id *)a5
{
  v15[1] = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = [a4 path];
  id v9 = fopen((const char *)[v8 fileSystemRepresentation], "w+");

  if (v9)
  {
    uint64_t v14 = *MEMORY[0x263F7BE10];
    v15[0] = *MEMORY[0x263F7BE00];
    id v10 = objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", v15, &v14, 1, 0, 0, 0, 0, 0, v9, 0, 0, 0, 0, 0, 0, 0);
    id v11 = [v7 path];
    [v11 fileSystemRepresentation];
    char StreamableZip = SZArchiverCreateStreamableZip();

    fclose(v9);
  }
  else if (a5)
  {
    [MEMORY[0x263F087E8] hmfErrorWithCode:2];
    char StreamableZip = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char StreamableZip = 0;
  }

  return StreamableZip;
}

- (BOOL)unzipItemAtURL:(id)a3 toURL:(id)a4 error:(id *)a5
{
  v24[3] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  v23[0] = @"extractPKZip";
  v23[1] = @"sequesterResources";
  v24[0] = MEMORY[0x263EFFA88];
  v24[1] = MEMORY[0x263EFFA88];
  v23[2] = @"copyResources";
  v24[2] = MEMORY[0x263EFFA88];
  id v10 = [NSDictionary dictionaryWithObjects:v24 forKeys:v23 count:3];
  id v11 = [v8 URLByDeletingLastPathComponent];
  id v12 = [v11 URLByAppendingPathComponent:@"temp"];

  BOMCopierNew();
  id v13 = v8;
  [v13 fileSystemRepresentation];
  id v14 = v12;
  [v14 fileSystemRepresentation];
  int v15 = BOMCopierCopyWithOptions();
  BOMCopierFree();
  if (v15)
  {
    id v16 = [MEMORY[0x263F087E8] hmErrorWithCode:52];
    if (!a5) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  id v22 = 0;
  [(HMDFileManager *)self removeItemAtURL:v13 error:&v22];
  id v20 = v22;
  id v21 = v20;
  [(HMDFileManager *)self moveItemAtURL:v14 toURL:v9 error:&v21];
  id v16 = v21;

  if (a5) {
LABEL_3:
  }
    *a5 = v16;
LABEL_4:
  if (v15) {
    BOOL v17 = 0;
  }
  else {
    BOOL v17 = v16 == 0;
  }
  BOOL v18 = v17;

  return v18;
}

- (BOOL)removeItemAtURL:(id)a3 error:(id *)a4
{
  v5 = (void *)MEMORY[0x263F08850];
  id v6 = a3;
  id v7 = [v5 defaultManager];
  LOBYTE(a4) = [v7 removeItemAtURL:v6 error:a4];

  return (char)a4;
}

- (BOOL)writeDictionary:(id)a3 toURL:(id)a4 error:(id *)a5
{
  return [a3 writeToURL:a4 error:a5];
}

- (BOOL)writeData:(id)a3 toURL:(id)a4 options:(unint64_t)a5 error:(id *)a6
{
  return [a3 writeToURL:a4 options:a5 error:a6];
}

- (id)dataWithContentsOfURL:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  return (id)[MEMORY[0x263EFF8F8] dataWithContentsOfURL:a3 options:a4 error:a5];
}

- (BOOL)fileExistsAtURL:(id)a3
{
  v3 = (void *)MEMORY[0x263F08850];
  id v4 = a3;
  v5 = [v3 defaultManager];
  id v6 = [v4 path];

  LOBYTE(v4) = [v5 fileExistsAtPath:v6];
  return (char)v4;
}

- (BOOL)fileExistsAtPath:(id)a3 isDirectory:(BOOL *)a4
{
  v5 = (void *)MEMORY[0x263F08850];
  id v6 = a3;
  id v7 = [v5 defaultManager];
  LOBYTE(a4) = [v7 fileExistsAtPath:v6 isDirectory:a4];

  return (char)a4;
}

- (BOOL)fileExistsAtPath:(id)a3
{
  v3 = (void *)MEMORY[0x263F08850];
  id v4 = a3;
  v5 = [v3 defaultManager];
  char v6 = [v5 fileExistsAtPath:v4];

  return v6;
}

- (BOOL)copyItemAtURL:(id)a3 toURL:(id)a4 error:(id *)a5
{
  id v7 = (void *)MEMORY[0x263F08850];
  id v8 = a4;
  id v9 = a3;
  id v10 = [v7 defaultManager];
  LOBYTE(a5) = [v10 copyItemAtURL:v9 toURL:v8 error:a5];

  return (char)a5;
}

- (BOOL)createDirectoryAtURL:(id)a3 withIntermediateDirectories:(BOOL)a4 attributes:(id)a5 error:(id *)a6
{
  BOOL v7 = a4;
  id v9 = (void *)MEMORY[0x263F08850];
  id v10 = a5;
  id v11 = a3;
  id v12 = [v9 defaultManager];
  LOBYTE(a6) = [v12 createDirectoryAtURL:v11 withIntermediateDirectories:v7 attributes:v10 error:a6];

  return (char)a6;
}

- (NSURL)legacyHeroFrameStoreDirectoryURL
{
  v2 = NSURL;
  id v3 = (id)storeDirectoryPath;
  id v4 = [v3 stringByAppendingPathComponent:@"HeroFrame"];
  v5 = [v2 fileURLWithPath:v4];

  return (NSURL *)v5;
}

- (NSURL)heroFrameStoreDirectoryURL
{
  v2 = NSURL;
  id v3 = getBulletinImagesPath();
  id v4 = [v3 stringByAppendingPathComponent:@"HeroFrame"];
  v5 = [v2 fileURLWithPath:v4];

  return (NSURL *)v5;
}

@end