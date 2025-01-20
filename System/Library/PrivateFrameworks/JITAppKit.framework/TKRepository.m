@interface TKRepository
+ (BOOL)_hasEntitlement:(id)a3;
+ (BOOL)_isApprovedProcess;
+ (id)_processBundleIdentifier;
+ (id)bundlePathForURL:(id)a3;
+ (void)loadWithURL:(id)a3 completion:(id)a4;
+ (void)reset;
+ (void)unpackBundleWithURL:(id)a3 destinationPath:(id)a4 completion:(id)a5;
- (NSString)version;
- (NSURL)URL;
- (TKRepository)initWithURL:(id)a3 bundlePath:(id)a4;
- (id)tmlPathForName:(id)a3;
@end

@implementation TKRepository

+ (BOOL)_hasEntitlement:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  BOOL v11 = 0;
  CFAllocatorRef Default = CFAllocatorGetDefault();
  SecTaskRef task = SecTaskCreateFromSelf(Default);
  if (task)
  {
    CFErrorRef error = 0;
    CFTypeRef cf = SecTaskCopyValueForEntitlement(task, (CFStringRef)location[0], &error);
    if (cf)
    {
      CFTypeID v6 = CFGetTypeID(cf);
      BOOL v7 = 0;
      if (v6 == CFBooleanGetTypeID()) {
        BOOL v7 = CFBooleanGetValue((CFBooleanRef)cf) != 0;
      }
      BOOL v11 = v7;
      CFRelease(cf);
    }
    CFRelease(task);
  }
  BOOL v5 = v11;
  objc_storeStrong(location, 0);
  return v5;
}

+ (id)_processBundleIdentifier
{
  v8[2] = a1;
  v8[1] = (id)a2;
  v8[0] = 0;
  CFAllocatorRef Default = CFAllocatorGetDefault();
  SecTaskRef task = SecTaskCreateFromSelf(Default);
  if (task)
  {
    CFStringRef v3 = SecTaskCopySigningIdentifier(task, 0);
    id v4 = v8[0];
    v8[0] = (id)v3;

    CFRelease(task);
  }
  id v6 = v8[0];
  objc_storeStrong(v8, 0);
  return v6;
}

+ (BOOL)_isApprovedProcess
{
  v4[2] = a1;
  v4[1] = (id)a2;
  v4[0] = (id)[a1 _processBundleIdentifier];
  id location = &unk_26DD5EDD0;
  if (v4[0] && [v4[0] length]) {
    char v5 = [location containsObject:v4[0]] & 1;
  }
  else {
    char v5 = 0;
  }
  objc_storeStrong(&location, 0);
  objc_storeStrong(v4, 0);
  return v5 & 1;
}

+ (void)loadWithURL:(id)a3 completion:(id)a4
{
  id v59 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v57 = 0;
  objc_storeStrong(&v57, a4);
  char v56 = [v59 _hasEntitlement:@"com.apple.jitappkit.bundle.load"] & 1;
  char v55 = [v59 _isApprovedProcess] & 1;
  if (v56 & 1) != 0 || (v55)
  {
    char v52 = 0;
    BOOL v16 = 0;
    if ([location[0] isFileURL])
    {
      id v53 = (id)[location[0] absoluteString];
      char v52 = 1;
      uint64_t v50 = [v53 rangeOfString:@"cloudkit" options:1];
      uint64_t v51 = v4;
      BOOL v16 = v50 == 0x7FFFFFFFFFFFFFFFLL;
    }
    if (v52) {

    }
    if (v16)
    {
      queue = MEMORY[0x263EF83A0];
      uint64_t v43 = MEMORY[0x263EF8330];
      int v44 = -1073741824;
      int v45 = 0;
      v46 = __39__TKRepository_loadWithURL_completion___block_invoke;
      v47 = &unk_26485AB58;
      id v48 = location[0];
      id v49 = v57;
      dispatch_async(queue, &v43);

      int v54 = 1;
      objc_storeStrong(&v49, 0);
      objc_storeStrong(&v48, 0);
    }
    else
    {
      id v42 = (id)[v59 bundlePathForURL:location[0]];
      id v41 = (id)[v42 stringByAppendingPathExtension:@"unpacked"];
      id v40 = (id)[MEMORY[0x263F08850] defaultManager];
      char v38 = 0;
      BOOL v14 = 0;
      if ([location[0] isFileURL])
      {
        id v39 = (id)[location[0] absoluteString];
        char v38 = 1;
        uint64_t v36 = [v39 rangeOfString:@"cloudkit" options:1];
        uint64_t v37 = v5;
        BOOL v14 = v36 != 0x7FFFFFFFFFFFFFFFLL;
      }
      if (v38) {

      }
      if (v14)
      {
        id v13 = (id)[location[0] absoluteString];
        id v35 = (id)[v13 stringByReplacingOccurrencesOfString:@"file://" withString:&stru_26DD585A8];

        [v59 unpackBundleWithURL:location[0] destinationPath:v35 completion:v57];
        int v54 = 1;
        objc_storeStrong(&v35, 0);
      }
      else
      {
        char v34 = 0;
        if (([v40 fileExistsAtPath:v41] & 1) != 0
          && ([v40 fileExistsAtPath:v42 isDirectory:&v34] & 1) != 0
          && (v34 & 1) != 0)
        {
          v12 = MEMORY[0x263EF83A0];
          uint64_t v26 = MEMORY[0x263EF8330];
          int v27 = -1073741824;
          int v28 = 0;
          v29 = __39__TKRepository_loadWithURL_completion___block_invoke_2;
          v30 = &unk_26485AB80;
          id v31 = location[0];
          id v32 = v42;
          id v33 = v57;
          dispatch_async(v12, &v26);

          int v54 = 1;
          objc_storeStrong(&v33, 0);
          objc_storeStrong(&v32, 0);
          objc_storeStrong(&v31, 0);
        }
        else
        {
          id v7 = objc_alloc(MEMORY[0x263F08BD8]);
          id v8 = location[0];
          id v9 = +[TKNetwork shared];
          [v9 timeoutInterval];
          uint64_t v25 = objc_msgSend(v7, "initWithURL:cachePolicy:timeoutInterval:", v8);

          id v11 = +[TKNetwork shared];
          id v10 = (id)v25;
          uint64_t v18 = MEMORY[0x263EF8330];
          int v19 = -1073741824;
          int v20 = 0;
          v21 = __39__TKRepository_loadWithURL_completion___block_invoke_3;
          v22 = &unk_26485ABA8;
          v24[0] = v57;
          v24[1] = v59;
          id v23 = location[0];
          id v6 = (id)[v11 downloadRequest:v10 priority:1 completion:&v18];

          objc_storeStrong(&v23, 0);
          objc_storeStrong(v24, 0);
          objc_storeStrong((id *)&v25, 0);
          int v54 = 0;
        }
      }
      objc_storeStrong(&v40, 0);
      objc_storeStrong(&v41, 0);
      objc_storeStrong(&v42, 0);
    }
  }
  else
  {
    int v54 = 1;
  }
  objc_storeStrong(&v57, 0);
  objc_storeStrong(location, 0);
}

void __39__TKRepository_loadWithURL_completion___block_invoke(void *a1)
{
  v5[2] = a1;
  v5[1] = a1;
  v2 = [TKRepository alloc];
  v1 = (void *)a1[4];
  id v3 = (id)[v1 path];
  v5[0] = -[TKRepository initWithURL:bundlePath:](v2, "initWithURL:bundlePath:", v1);

  (*(void (**)(void))(a1[5] + 16))();
  objc_storeStrong(v5, 0);
}

void __39__TKRepository_loadWithURL_completion___block_invoke_2(void *a1)
{
  v2[2] = a1;
  v2[1] = a1;
  v2[0] = [[TKRepository alloc] initWithURL:a1[4] bundlePath:a1[5]];
  (*(void (**)(void))(a1[6] + 16))();
  objc_storeStrong(v2, 0);
}

void __39__TKRepository_loadWithURL_completion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  location[1] = (id)a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  id v5 = 0;
  objc_storeStrong(&v5, a3);
  if (location[0]) {
    [*(id *)(a1 + 48) unpackBundleWithURL:*(void *)(a1 + 32) destinationPath:location[0] completion:*(void *)(a1 + 40)];
  }
  else {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  objc_storeStrong(&v5, 0);
  objc_storeStrong(location, 0);
}

+ (void)reset
{
  v4[2] = a1;
  v4[1] = (id)a2;
  id v2 = +[TKUtils applicationLibraryPath];
  v4[0] = (id)[v2 stringByAppendingPathComponent:@"JITAppKit"];

  id location = (id)[MEMORY[0x263F08850] defaultManager];
  if ([location fileExistsAtPath:v4[0]]) {
    [location removeItemAtPath:v4[0] error:0];
  }
  objc_storeStrong(&location, 0);
  objc_storeStrong(v4, 0);
}

- (TKRepository)initWithURL:(id)a3 bundlePath:(id)a4
{
  int v19 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v17 = 0;
  objc_storeStrong(&v17, a4);
  uint64_t v4 = v19;
  int v19 = 0;
  v16.receiver = v4;
  v16.super_class = (Class)TKRepository;
  int v19 = [(TKRepository *)&v16 init];
  objc_storeStrong((id *)&v19, v19);
  if (v19)
  {
    uint64_t v5 = [location[0] copy];
    URL = v19->_URL;
    v19->_URL = (NSURL *)v5;

    uint64_t v7 = [v17 copy];
    bundlePath = v19->_bundlePath;
    v19->_bundlePath = (NSString *)v7;

    id v13 = [NSString alloc];
    id v14 = (id)[v17 stringByAppendingPathComponent:@"version.txt"];
    uint64_t v9 = objc_msgSend(v13, "initWithContentsOfFile:encoding:error:");
    version = v19->_version;
    v19->_version = (NSString *)v9;
  }
  v12 = v19;
  objc_storeStrong(&v17, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v19, 0);
  return v12;
}

- (id)tmlPathForName:(id)a3
{
  id v10 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if ([location[0] length])
  {
    uint64_t v5 = [(NSString *)v10->_bundlePath stringByAppendingPathComponent:location[0]];
    id v7 = [(NSString *)v5 stringByAppendingPathExtension:@"tml"];

    id v6 = (id)[MEMORY[0x263F08850] defaultManager];
    if ([v6 fileExistsAtPath:v7]) {
      id v11 = v7;
    }
    else {
      id v11 = 0;
    }
    int v8 = 1;
    objc_storeStrong(&v6, 0);
    objc_storeStrong(&v7, 0);
  }
  else
  {
    id v11 = 0;
    int v8 = 1;
  }
  objc_storeStrong(location, 0);
  id v3 = v11;
  return v3;
}

+ (id)bundlePathForURL:(id)a3
{
  id location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v4 = +[TKUtils applicationLibraryPath];
  id v9 = (id)[v4 stringByAppendingPathComponent:@"JITAppKit"];

  id v5 = v9;
  id v6 = +[TKUtils uniqueKeyForURL:location[0]];
  id v8 = (id)objc_msgSend(v5, "stringByAppendingPathComponent:");

  id v7 = v8;
  objc_storeStrong(&v8, 0);
  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
  return v7;
}

+ (void)unpackBundleWithURL:(id)a3 destinationPath:(id)a4 completion:(id)a5
{
  id v25 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v23 = 0;
  objc_storeStrong(&v23, a4);
  id v22 = 0;
  objc_storeStrong(&v22, a5);
  id v21 = (id)[MEMORY[0x263F08850] defaultManager];
  id v20 = (id)[v25 bundlePathForURL:location[0]];
  id v19 = (id)[v20 stringByAppendingPathExtension:@"unpacked"];
  queue = dispatch_get_global_queue(2, 0);
  uint64_t v8 = MEMORY[0x263EF8330];
  int v9 = -1073741824;
  int v10 = 0;
  id v11 = __63__TKRepository_unpackBundleWithURL_destinationPath_completion___block_invoke;
  v12 = &unk_26485ABF8;
  id v13 = v23;
  id v14 = v20;
  id v15 = v21;
  id v16 = v19;
  id v17 = location[0];
  id v18 = v22;
  dispatch_async(queue, &v8);

  objc_storeStrong(&v18, 0);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(&v16, 0);
  objc_storeStrong(&v15, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(&v19, 0);
  objc_storeStrong(&v20, 0);
  objc_storeStrong(&v21, 0);
  objc_storeStrong(&v22, 0);
  objc_storeStrong(&v23, 0);
  objc_storeStrong(location, 0);
}

void __63__TKRepository_unpackBundleWithURL_destinationPath_completion___block_invoke(uint64_t a1)
{
  v26[2] = (id)a1;
  v26[1] = (id)a1;
  id v8 = (id)[MEMORY[0x263F08AB0] processInfo];
  v26[0] = (id)[v8 globallyUniqueString];

  int v9 = NSTemporaryDirectory();
  id v25 = [(NSString *)v9 stringByAppendingPathComponent:v26[0]];

  char v24 = 0;
  char v24 = +[TKUtils decompressFile:*(void *)(a1 + 32) toDestinationPath:v25 algorithm:774];
  id v23 = 0;
  uint64_t v1 = *(void *)(a1 + 40);
  if (v24)
  {
    id v22 = v23;
    uint64_t v7 = +[Main unzipFileAtPath:toDestination:overwrite:password:error:](Main, "unzipFileAtPath:toDestination:overwrite:password:error:", v25, v1, 1);
    objc_storeStrong(&v23, v22);
    char v24 = v7 & 1;
    [*(id *)(a1 + 48) removeItemAtPath:v25 error:HIDWORD(v7)];
  }
  else
  {
    id v21 = v23;
    BOOL v6 = +[Main unzipFileAtPath:v25 toDestination:v1 overwrite:1 password:0 error:&v21];
    objc_storeStrong(&v23, v21);
    char v24 = v6;
  }
  if (v24)
  {
    id v3 = *(void **)(a1 + 48);
    uint64_t v2 = *(void *)(a1 + 56);
    id v4 = (id)[@"OK" dataUsingEncoding:4];
    char v24 = objc_msgSend(v3, "createFileAtPath:contents:attributes:", v2) & 1;

    queue = MEMORY[0x263EF83A0];
    uint64_t v11 = MEMORY[0x263EF8330];
    int v12 = -1073741824;
    int v13 = 0;
    id v14 = __63__TKRepository_unpackBundleWithURL_destinationPath_completion___block_invoke_2;
    id v15 = &unk_26485ABD0;
    char v20 = v24 & 1;
    id v16 = *(id *)(a1 + 64);
    id v17 = *(id *)(a1 + 40);
    id v19 = *(id *)(a1 + 72);
    id v18 = v23;
    dispatch_async(queue, &v11);

    objc_storeStrong(&v18, 0);
    objc_storeStrong(&v19, 0);
    objc_storeStrong(&v17, 0);
    objc_storeStrong(&v16, 0);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
  }
  objc_storeStrong(&v23, 0);
  objc_storeStrong(&v25, 0);
  objc_storeStrong(v26, 0);
}

void __63__TKRepository_unpackBundleWithURL_destinationPath_completion___block_invoke_2(uint64_t a1)
{
  v2[2] = (id)a1;
  v2[1] = (id)a1;
  if (*(unsigned char *)(a1 + 64))
  {
    v2[0] = [[TKRepository alloc] initWithURL:*(void *)(a1 + 32) bundlePath:*(void *)(a1 + 40)];
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    objc_storeStrong(v2, 0);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

- (NSString)version
{
  return self->_version;
}

- (NSURL)URL
{
  return self->_URL;
}

- (void).cxx_destruct
{
}

@end