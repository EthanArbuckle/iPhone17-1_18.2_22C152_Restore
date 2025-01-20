@interface DTFileBrowserService
+ (void)registerCapabilities:(id)a3;
- (id)contentsOfDirectoryAtPath:(id)a3;
- (id)dataFromFileAtPath:(id)a3;
- (id)entriesAtPath:(id)a3;
- (id)entriesInPathsArray:(id)a3;
- (id)fileExistsAtPath:(id)a3;
- (id)updateAttributesForItem:(id)a3;
@end

@implementation DTFileBrowserService

+ (void)registerCapabilities:(id)a3
{
  id v4 = a3;
  if (+[DTInstrumentServer isAppleInternal]) {
    [v4 publishCapability:@"com.apple.instruments.server.services.filebrowser" withVersion:2 forClass:a1];
  }
}

- (id)entriesAtPath:(id)a3
{
  id v3 = a3;
  id v25 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v4 = [MEMORY[0x263F08850] defaultManager];
  v31[0] = 0;
  v5 = [v4 contentsOfDirectoryAtPath:v3 error:v31];
  id v6 = v31[0];
  if (!v6)
  {
    uint64_t v7 = [v5 count];
    if (v7)
    {
      uint64_t v8 = v7;
      id v6 = 0;
      uint64_t v9 = 0;
      v23 = v5;
      id v24 = v3;
      uint64_t v22 = v7;
      while (1)
      {
        v10 = [v5 objectAtIndex:v9];
        v11 = [v3 stringByAppendingPathComponent:v10];
        id v30 = v6;
        v12 = [v4 attributesOfItemAtPath:v11 error:&v30];
        id v13 = v30;

        if (!v13) {
          break;
        }
        id v6 = 0;
LABEL_12:

        if (v8 == ++v9) {
          goto LABEL_15;
        }
      }
      id v13 = [NSString stringWithFormat:@"%@/Info.plist", v11];
      uint64_t v29 = 0;
      uint64_t v14 = [MEMORY[0x263EFF8F8] dataWithContentsOfFile:v13];
      v26 = (void *)v14;
      if (v14)
      {
        id v28 = 0;
        v15 = [MEMORY[0x263F08AC0] propertyListWithData:v14 options:0 format:&v29 error:&v28];
        id v6 = v28;
        unint64_t v16 = 0x263EFF000;
        if (v15)
        {
LABEL_11:
          unsigned __int8 v27 = 0;
          [v4 fileExistsAtPath:v11 isDirectory:&v27];
          v17 = *(void **)(v16 + 2352);
          [NSNumber numberWithBool:v27];
          v19 = v18 = v4;
          v20 = [v17 dictionaryWithObjectsAndKeys:v11, @"DTFileBrowserEntryPath", v10, @"DTFileBrowserEntryName", v12, @"DTFileBrowserEntryAttributes", v15, @"DTFileBrowserEntryPList", v19, @"DTFileBrowserEntryIsDirectory", 0];

          id v4 = v18;
          [v25 addObject:v20];

          v5 = v23;
          id v3 = v24;
          uint64_t v8 = v22;
          goto LABEL_12;
        }
      }
      else
      {
        id v6 = 0;
        unint64_t v16 = 0x263EFF000uLL;
      }
      v15 = [*(id *)(v16 + 2352) dictionaryWithObjectsAndKeys:@"simple_executable" : @"DTFileBrowserEntryType" : v11 : @"CFBundleIdentifier" : 0];
      goto LABEL_11;
    }
    id v6 = 0;
  }
LABEL_15:

  return v25;
}

- (id)entriesInPathsArray:(id)a3
{
  id v3 = a3;
  id v22 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v4 = [MEMORY[0x263F08850] defaultManager];
  uint64_t v5 = [v3 count];
  if (v5)
  {
    uint64_t v6 = v5;
    id v7 = 0;
    uint64_t v8 = 0;
    unint64_t v9 = 0x263EFF000uLL;
    uint64_t v20 = v5;
    id v21 = v3;
    while (1)
    {
      v10 = [v3 objectAtIndex:v8];
      v27[0] = v7;
      v11 = [v4 attributesOfItemAtPath:v10 error:v27];
      id v12 = v27[0];

      if (!v12) {
        break;
      }
      id v7 = 0;
LABEL_11:

      if (v6 == ++v8)
      {

        goto LABEL_13;
      }
    }
    id v12 = [NSString stringWithFormat:@"%@/Info.plist", v10];
    uint64_t v26 = 0;
    uint64_t v13 = [MEMORY[0x263EFF8F8] dataWithContentsOfFile:v12];
    v23 = (void *)v13;
    if (v13)
    {
      id v25 = 0;
      uint64_t v14 = [MEMORY[0x263F08AC0] propertyListWithData:v13 options:0 format:&v26 error:&v25];
      id v7 = v25;
      if (v14)
      {
LABEL_10:
        unsigned __int8 v24 = 0;
        [v4 fileExistsAtPath:v10 isDirectory:&v24];
        v15 = *(void **)(v9 + 2352);
        unint64_t v16 = [v10 lastPathComponent];
        v17 = [NSNumber numberWithBool:v24];
        v18 = [v15 dictionaryWithObjectsAndKeys:v10, @"DTFileBrowserEntryPath", v16, @"DTFileBrowserEntryName", v11, @"DTFileBrowserEntryAttributes", v14, @"DTFileBrowserEntryPList", v17, @"DTFileBrowserEntryIsDirectory", 0];

        unint64_t v9 = 0x263EFF000;
        [v22 addObject:v18];

        uint64_t v6 = v20;
        id v3 = v21;
        goto LABEL_11;
      }
    }
    else
    {
      id v7 = 0;
    }
    uint64_t v14 = [*(id *)(v9 + 2352) dictionaryWithObjectsAndKeys:@"simple_executable" : @"DTFileBrowserEntryType" : v10 : @"CFBundleIdentifier" : 0];
    goto LABEL_10;
  }
LABEL_13:

  return v22;
}

- (id)dataFromFileAtPath:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x263F08850] defaultManager];
  if ([v4 fileExistsAtPath:v3])
  {
    id v7 = 0;
    uint64_t v5 = [MEMORY[0x263EFF8F8] dataWithContentsOfFile:v3 options:2 error:&v7];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (id)contentsOfDirectoryAtPath:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x263F08850] defaultManager];
  id v16 = 0;
  uint64_t v5 = [v4 contentsOfDirectoryAtPath:v3 error:&v16];
  id v6 = v16;
  if (v6)
  {
    char v15 = 0;
    if ([v4 fileExistsAtPath:v3 isDirectory:&v15]) {
      BOOL v7 = v15 == 0;
    }
    else {
      BOOL v7 = 1;
    }
    if (v7)
    {
      id v8 = [MEMORY[0x263EFF8C0] array];
      goto LABEL_9;
    }
    id v9 = objc_alloc(MEMORY[0x263EFF940]);
    v10 = [v6 description];
    v11 = [v6 userInfo];
    id v12 = (void *)[v9 initWithName:@"XRFileSystemException" reason:v10 userInfo:v11];

    [v12 raise];
  }
  id v8 = v5;
LABEL_9:
  uint64_t v13 = v8;

  return v13;
}

- (id)updateAttributesForItem:(id)a3
{
  id v3 = a3;
  id v4 = [v3 valueForKey:@"DTFileBrowserEntryPath"];
  uint64_t v5 = [MEMORY[0x263F08850] defaultManager];
  uint64_t v10 = 0;
  id v6 = [v5 attributesOfItemAtPath:v4 error:&v10];
  if (!v10)
  {
    unsigned __int8 v9 = 0;
    [v5 fileExistsAtPath:v4 isDirectory:&v9];
    [v3 setObject:v6 forKey:@"DTFileBrowserEntryAttributes"];
    BOOL v7 = [NSNumber numberWithBool:v9];
    [v3 setObject:v7 forKey:@"DTFileBrowserEntryIsDirectory"];
  }
  return v3;
}

- (id)fileExistsAtPath:(id)a3
{
  v13[2] = *MEMORY[0x263EF8340];
  unsigned __int8 v11 = 0;
  id v3 = (void *)MEMORY[0x263F08850];
  id v4 = a3;
  uint64_t v5 = [v3 defaultManager];
  uint64_t v6 = [v5 fileExistsAtPath:v4 isDirectory:&v11];

  v12[0] = @"fileExists";
  BOOL v7 = [NSNumber numberWithBool:v6];
  v12[1] = @"isDirectory";
  v13[0] = v7;
  id v8 = [NSNumber numberWithBool:v11];
  v13[1] = v8;
  unsigned __int8 v9 = [NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:2];

  return v9;
}

@end