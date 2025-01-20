@interface FBKFileManager
+ (BOOL)humansCanReadFile:(id)a3;
+ (BOOL)isDirectory:(id)a3;
+ (NSURL)cachedTemporaryDirectory;
+ (id)applicationSupportDirectory;
+ (id)containerURL;
+ (id)draftDirectoryForFilerForm:(id)a3;
+ (id)draftDirectoryForFilerForm:(id)a3 isTemporary:(BOOL)a4;
+ (id)draftDirectoryForFilerType:(int64_t)a3;
+ (id)draftDirectoryForFilerType:(int64_t)a3 isTemporary:(BOOL)a4;
+ (id)draftsDirectory;
+ (id)getUniqueDestinationURLForURL:(id)a3 alwaysIndex:(BOOL)a4;
+ (id)getUniqueDestinationURLForURL:(id)a3 alwaysIndex:(BOOL)a4 forSourceURL:(id)a5;
+ (id)libraryDirectory;
+ (id)temporaryDirectoryWithPathComponents:(id)a3;
+ (id)temporaryDraftDirectoryForFilerForm:(id)a3;
+ (void)applicationSupportDirectory;
+ (void)containerURL;
+ (void)deleteAllDraftDirectories;
+ (void)setCachedTemporaryDirectory:(id)a3;
@end

@implementation FBKFileManager

+ (void)deleteAllDraftDirectories
{
  id v6 = [a1 draftDirectoryForFilerType:0];
  v3 = [a1 draftDirectoryForFilerType:1];
  v4 = [MEMORY[0x263F08850] defaultManager];
  [v4 removeItemAtURL:v6 error:0];

  v5 = [MEMORY[0x263F08850] defaultManager];
  [v5 removeItemAtURL:v3 error:0];
}

+ (id)containerURL
{
  v2 = [MEMORY[0x263F08850] defaultManager];
  v3 = [v2 containerURLForSecurityApplicationGroupIdentifier:*MEMORY[0x263F3C608]];

  if (!v3)
  {
    v4 = +[FBKLog appHandle];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      +[FBKFileManager containerURL](v4);
    }
  }

  return v3;
}

+ (id)libraryDirectory
{
  v2 = [a1 containerURL];
  v3 = v2;
  if (v2)
  {
    v4 = [v2 URLByAppendingPathComponent:@"Library"];
  }
  else
  {
    v5 = +[FBKLog appHandle];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      +[FBKFileManager containerURL](v5);
    }

    id v6 = NSURL;
    v7 = NSTemporaryDirectory();
    v4 = [v6 fileURLWithPath:v7];
  }

  return v4;
}

+ (id)draftsDirectory
{
  v2 = [a1 libraryDirectory];
  v3 = [v2 URLByAppendingPathComponent:@"Drafts"];

  return v3;
}

+ (id)applicationSupportDirectory
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  if (!FBKIsInternalInstall(a1, a2))
  {
    v5 = 0;
LABEL_12:
    v15 = [a1 libraryDirectory];
    v8 = [v15 URLByAppendingPathComponent:@"Application Support"];

    goto LABEL_13;
  }
  v3 = [MEMORY[0x263F08AB0] processInfo];
  v4 = [v3 environment];
  v5 = [v4 objectForKeyedSubscript:@"FBK_ALT_APP_SUPPORT_DIR"];

  if (!v5) {
    goto LABEL_12;
  }
  id v6 = NSURL;
  v7 = [v5 stringByExpandingTildeInPath];
  v8 = [v6 fileURLWithPath:v7];

  if (!v8) {
    goto LABEL_12;
  }
  v9 = +[FBKLog appHandle];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v19 = v8;
    _os_log_impl(&dword_22A36D000, v9, OS_LOG_TYPE_DEFAULT, "INTERNAL, using alternate app support directory [%@]", buf, 0xCu);
  }

  v10 = [MEMORY[0x263F08850] defaultManager];
  char v11 = [v10 fileExistsAtPath:v5];

  if ((v11 & 1) == 0)
  {
    v12 = [MEMORY[0x263F08850] defaultManager];
    id v17 = 0;
    [v12 createDirectoryAtURL:v8 withIntermediateDirectories:1 attributes:0 error:&v17];
    id v13 = v17;

    if (v13)
    {

      v14 = +[FBKLog appHandle];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        +[FBKFileManager applicationSupportDirectory];
      }

      goto LABEL_12;
    }
  }
LABEL_13:

  return v8;
}

+ (id)draftDirectoryForFilerForm:(id)a3 isTemporary:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  id v6 = [v5 filerFormID];
  v7 = [v6 stringValue];

  uint64_t v8 = [v5 filerFormType];
  v9 = +[FBKFileManager draftDirectoryForFilerType:v8 isTemporary:v4];
  v10 = [v9 URLByAppendingPathComponent:v7];

  return v10;
}

+ (id)draftDirectoryForFilerForm:(id)a3
{
  return (id)[a1 draftDirectoryForFilerForm:a3 isTemporary:0];
}

+ (id)temporaryDraftDirectoryForFilerForm:(id)a3
{
  return (id)[a1 draftDirectoryForFilerForm:a3 isTemporary:1];
}

+ (id)draftDirectoryForFilerType:(int64_t)a3
{
  return (id)[a1 draftDirectoryForFilerType:a3 isTemporary:0];
}

+ (id)draftDirectoryForFilerType:(int64_t)a3 isTemporary:(BOOL)a4
{
  v11[2] = *MEMORY[0x263EF8340];
  BOOL v4 = @"TEST";
  if (!a3) {
    BOOL v4 = @"FB";
  }
  if (a3 == 1) {
    id v5 = @"FFU";
  }
  else {
    id v5 = v4;
  }
  if (a4)
  {
    v11[0] = @"Drafts";
    v11[1] = v5;
    v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:2];
    uint64_t v8 = [a1 temporaryDirectoryWithPathComponents:v7];
  }
  else
  {
    v9 = +[FBKFileManager draftsDirectory];
    uint64_t v8 = [v9 URLByAppendingPathComponent:v5];
  }

  return v8;
}

+ (id)getUniqueDestinationURLForURL:(id)a3 alwaysIndex:(BOOL)a4 forSourceURL:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  uint64_t v18 = MEMORY[0x263EF8330];
  uint64_t v19 = 3221225472;
  uint64_t v20 = __73__FBKFileManager_getUniqueDestinationURLForURL_alwaysIndex_forSourceURL___block_invoke;
  v21 = &unk_264876170;
  id v9 = v8;
  id v22 = v9;
  id v10 = v7;
  id v23 = v10;
  char v11 = (void (**)(void *, void))_Block_copy(&v18);
  v12 = v11[2](v11, 0);
  id v13 = v12;
  if (a4 || objc_msgSend(v12, "checkResourceIsReachableAndReturnError:", 0, v18, v19, v20, v21, v22))
  {
    uint64_t v14 = 1;
    do
    {
      v15 = v11[2](v11, v14);

      uint64_t v14 = (v14 + 1);
      id v13 = v15;
    }
    while (([v15 checkResourceIsReachableAndReturnError:0] & 1) != 0);
  }
  else
  {
    v15 = v13;
  }
  id v16 = v15;

  return v16;
}

id __73__FBKFileManager_getUniqueDestinationURLForURL_alwaysIndex_forSourceURL___block_invoke(uint64_t a1, uint64_t a2)
{
  BOOL v4 = [*(id *)(a1 + 32) lastPathComponent];
  id v5 = v4;
  if (a2)
  {
    uint64_t v6 = objc_msgSend(v4, "stringByAppendingFormat:", @"_%.2d", a2);

    id v5 = (void *)v6;
  }
  id v7 = [*(id *)(a1 + 40) URLByAppendingPathComponent:v5];

  return v7;
}

+ (id)getUniqueDestinationURLForURL:(id)a3 alwaysIndex:(BOOL)a4
{
  id v5 = a3;
  uint64_t v6 = v5;
  if (a4 || [v5 checkResourceIsReachableAndReturnError:0])
  {
    id v7 = 0;
    uint64_t v8 = 1;
    do
    {
      id v9 = NSString;
      id v10 = [v6 URLByDeletingPathExtension];
      char v11 = [v10 path];
      v12 = [v9 stringWithFormat:@"%@_%.2d", v11, v8];
      id v13 = [v6 pathExtension];
      uint64_t v14 = [v12 stringByAppendingPathExtension:v13];

      id v15 = [NSURL fileURLWithPath:v14 isDirectory:0];

      uint64_t v8 = (v8 + 1);
      id v7 = v15;
    }
    while (([v15 checkResourceIsReachableAndReturnError:0] & 1) != 0);
  }
  else
  {
    id v15 = v6;
  }

  return v15;
}

+ (BOOL)isDirectory:(id)a3
{
  id v5 = 0;
  int v3 = [a3 getResourceValue:&v5 forKey:*MEMORY[0x263EFF6A8] error:0];
  if (v3) {
    LOBYTE(v3) = [v5 BOOLValue];
  }
  return v3;
}

+ (BOOL)humansCanReadFile:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if (humansCanReadFile__onceToken != -1) {
    dispatch_once(&humansCanReadFile__onceToken, &__block_literal_global_35);
  }
  BOOL v4 = [v3 lastPathComponent];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = (id)humansCanReadFile___notInspectableFileExtensions;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        if (objc_msgSend(v4, "hasSuffix:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12))
        {
          BOOL v10 = 0;
          goto LABEL_13;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  BOOL v10 = 1;
LABEL_13:

  return v10;
}

void __36__FBKFileManager_humansCanReadFile___block_invoke()
{
  v0 = (void *)humansCanReadFile___notInspectableFileExtensions;
  humansCanReadFile___notInspectableFileExtensions = (uint64_t)&unk_26DE1EEE0;
}

+ (NSURL)cachedTemporaryDirectory
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2683766E0);
  MEMORY[0x270FA5388](v2);
  BOOL v4 = (char *)&v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_268375C48 != -1) {
    swift_once();
  }
  uint64_t v5 = __swift_project_value_buffer(v2, (uint64_t)qword_268379EA0);
  swift_beginAccess();
  sub_22A434164(v5, (uint64_t)v4);
  uint64_t v6 = sub_22A4B24C8();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v4, 1, v6) != 1)
  {
    uint64_t v8 = (void *)sub_22A4B2458();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v4, v6);
  }

  return (NSURL *)v8;
}

+ (void)setCachedTemporaryDirectory:(id)a3
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2683766E0);
  MEMORY[0x270FA5388](v4);
  uint64_t v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    sub_22A4B2488();
    uint64_t v7 = sub_22A4B24C8();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v6, 0, 1, v7);
  }
  else
  {
    uint64_t v8 = sub_22A4B24C8();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v6, 1, 1, v8);
  }
  if (qword_268375C48 != -1) {
    swift_once();
  }
  uint64_t v9 = __swift_project_value_buffer(v4, (uint64_t)qword_268379EA0);
  swift_beginAccess();
  sub_22A43441C((uint64_t)v6, v9);
  swift_endAccess();
  sub_22A4341CC((uint64_t)v6);
}

+ (id)temporaryDirectoryWithPathComponents:(id)a3
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2683766E0);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_22A4B3628();
  static FBKFileManager.temporaryDirectory(pathComponents:)(v6, (uint64_t)v5);
  swift_bridgeObjectRelease();
  uint64_t v7 = sub_22A4B24C8();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v5, 1, v7) != 1)
  {
    uint64_t v9 = (void *)sub_22A4B2458();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v5, v7);
  }

  return v9;
}

+ (void)containerURL
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_22A36D000, log, OS_LOG_TYPE_ERROR, "Could not find group container.", v1, 2u);
}

+ (void)applicationSupportDirectory
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = 138412546;
  uint64_t v3 = 0;
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_error_impl(&dword_22A36D000, a2, OS_LOG_TYPE_ERROR, "INTERNAL, failed to create alternate app support dir [%@] with error %@", (uint8_t *)&v2, 0x16u);
}

@end