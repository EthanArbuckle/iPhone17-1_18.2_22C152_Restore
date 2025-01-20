@interface NSFileManager
+ (id)lib_applicationsDirectory;
- (BOOL)isSignedByAppleFileAtPath:(id)a3 basicCheck:(BOOL)a4;
- (NSURL)sk_cachedDataURL;
- (NSURL)sk_downloadURL;
- (NSURL)sk_iTunesStoreLibraryDataURL;
- (NSURL)sk_octanePersistedDataURL;
- (NSURL)sk_persistedDataURL;
- (NSURL)sk_userDatabaseURL;
- (id)_lib_deleteLastValidComponentOfPath:(id)a3;
- (id)lib_ensureDirectoryExistsAtPath:(id)a3;
@end

@implementation NSFileManager

+ (id)lib_applicationsDirectory
{
  v2 = NSSearchPathForDirectoriesInDomains(NSApplicationDirectory, 2uLL, 0);
  v3 = [v2 firstObject];

  return v3;
}

- (id)lib_ensureDirectoryExistsAtPath:(id)a3
{
  id v4 = a3;
  char v13 = 0;
  if ([(NSFileManager *)self fileExistsAtPath:v4 isDirectory:&v13] && v13)
  {
    v5 = 0;
LABEL_9:
    id v9 = 0;
    goto LABEL_10;
  }
  id v12 = 0;
  [(NSFileManager *)self createDirectoryAtPath:v4 withIntermediateDirectories:1 attributes:0 error:&v12];
  id v6 = v12;
  v5 = v6;
  if (!v6 || [v6 code] != (id)516) {
    goto LABEL_9;
  }
  v7 = [(NSFileManager *)self _lib_deleteLastValidComponentOfPath:v4];
  v8 = v7;
  if (!v7)
  {
    v11 = 0;
    [(NSFileManager *)self createDirectoryAtPath:v4 withIntermediateDirectories:1 attributes:0 error:&v11];
    v8 = v11;
  }
  id v9 = v8;

LABEL_10:

  return v9;
}

- (id)_lib_deleteLastValidComponentOfPath:(id)a3
{
  id v4 = a3;
  char v10 = 0;
  if ([(NSFileManager *)self fileExistsAtPath:v4 isDirectory:&v10])
  {
    if (!v10)
    {
      id v9 = 0;
      [(NSFileManager *)self removeItemAtPath:v4 error:&v9];
      id v5 = v9;
      goto LABEL_8;
    }
  }
  else
  {
    id v6 = [v4 stringByDeletingLastPathComponent];
    if ((unint64_t)[v6 length] >= 2) {
      id v7 = [(NSFileManager *)self _lib_deleteLastValidComponentOfPath:v6];
    }
  }
  id v5 = 0;
LABEL_8:

  return v5;
}

- (NSURL)sk_downloadURL
{
  return (NSURL *)sub_1000F1C04();
}

- (NSURL)sk_persistedDataURL
{
  return (NSURL *)sub_1000F0838((uint64_t)self, (uint64_t)a2, sub_1000F0904);
}

- (NSURL)sk_octanePersistedDataURL
{
  return (NSURL *)sub_1000F1C04();
}

- (NSURL)sk_cachedDataURL
{
  return (NSURL *)sub_1000F1F78(self, a2, sub_1000F0D44, 0x2F7972617262694CLL, 0xEE00736568636143, "Unable to determine path for StoreKit caches directory");
}

- (NSURL)sk_userDatabaseURL
{
  return (NSURL *)sub_1000F0838((uint64_t)self, (uint64_t)a2, sub_1000F20BC);
}

- (NSURL)sk_iTunesStoreLibraryDataURL
{
  return (NSURL *)sub_1000F1F78(self, a2, sub_1000F261C, 0xD00000000000001ELL, 0x8000000100309920, "Unable to determine path for iTunesStore library directory");
}

- (BOOL)isSignedByAppleFileAtPath:(id)a3 basicCheck:(BOOL)a4
{
  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v8 = v7;
  id v9 = self;
  char v10 = sub_10010966C(v6, v8, a4);

  swift_bridgeObjectRelease();
  return v10 & 1;
}

@end