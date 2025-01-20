@interface FBKBugFormAttachmentPreview
+ (BOOL)canPreviewItem:(id)a3;
+ (BOOL)extensionIsTextFile:(id)a3;
+ (BOOL)hasIps_dot_synced:(id)a3;
+ (BOOL)hasLog_dot_number:(id)a3;
+ (BOOL)urlPointsToTextFile:(id)a3;
+ (id)URLByRemovingInvalidExtensions:(id)a3;
+ (id)previewTypeURL:(id)a3;
+ (id)textFileForString:(id)a3 withFileName:(id)a4;
+ (id)textFileForURL:(id)a3;
@end

@implementation FBKBugFormAttachmentPreview

+ (id)textFileForString:(id)a3 withFileName:(id)a4
{
  id v5 = a3;
  v6 = [a4 stringByAppendingPathExtension:@"txt"];
  v7 = NSURL;
  v8 = NSTemporaryDirectory();
  v9 = [v8 stringByAppendingPathComponent:v6];
  v10 = [v7 fileURLWithPath:v9];

  v11 = [v10 path];
  [v5 writeToFile:v11 atomically:1 encoding:4 error:0];

  return v10;
}

+ (id)textFileForURL:(id)a3
{
  id v4 = a3;
  id v5 = [a1 URLByRemovingInvalidExtensions:v4];
  v6 = [v5 lastPathComponent];
  v7 = [v6 stringByDeletingPathExtension];

  v8 = [v7 stringByAppendingPathExtension:@"txt"];
  v9 = NSURL;
  v10 = NSTemporaryDirectory();
  v11 = [v10 stringByAppendingPathComponent:v8];
  v12 = [v9 fileURLWithPath:v11];

  v13 = [MEMORY[0x263F08850] defaultManager];
  [v13 removeItemAtURL:v12 error:0];

  v14 = [MEMORY[0x263F08850] defaultManager];
  id v20 = 0;
  [v14 copyItemAtURL:v4 toURL:v12 error:&v20];
  id v15 = v20;

  v16 = v12;
  if (v15)
  {
    v17 = +[FBKLog appHandle];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      +[FBKBugFormAttachmentPreview textFileForURL:]((uint64_t)v15, v17);
    }

    v16 = v4;
  }
  id v18 = v16;

  return v18;
}

+ (id)previewTypeURL:(id)a3
{
  id v3 = a3;
  id v4 = [v3 pathExtension];
  int v5 = [v4 isEqualToString:@"synced"];

  v6 = v3;
  if (v5)
  {
    v6 = [v3 URLByDeletingPathExtension];
  }

  return v6;
}

+ (BOOL)canPreviewItem:(id)a3
{
  id v4 = a3;
  int v5 = [a1 previewTypeURL:v4];
  v6 = [v5 pathExtension];
  char v7 = [v6 isEqualToString:@"zip"];

  if (v7)
  {
    char v8 = 0;
  }
  else if ([a1 urlPointsToTextFile:v5])
  {
    char v8 = 1;
  }
  else
  {
    char v8 = [MEMORY[0x263F16098] canPreviewItem:v4];
  }

  return v8;
}

+ (BOOL)urlPointsToTextFile:(id)a3
{
  id v3 = a1;
  id v4 = [a1 URLByRemovingInvalidExtensions:a3];
  int v5 = [v4 pathExtension];
  LOBYTE(v3) = [v3 extensionIsTextFile:v5];

  return (char)v3;
}

+ (BOOL)extensionIsTextFile:(id)a3
{
  return [&unk_26DE1EEC8 containsObject:a3];
}

+ (id)URLByRemovingInvalidExtensions:(id)a3
{
  id v4 = a3;
  if ((objc_msgSend(a1, "hasLog_dot_number:", v4) & 1) != 0 || objc_msgSend(a1, "hasIps_dot_synced:", v4))
  {
    id v5 = [v4 URLByDeletingPathExtension];
  }
  else
  {
    id v5 = v4;
  }
  v6 = v5;

  return v6;
}

+ (BOOL)hasIps_dot_synced:(id)a3
{
  id v3 = a3;
  id v4 = [v3 lastPathComponent];
  if ([v4 rangeOfString:@"ips"] == 0x7FFFFFFFFFFFFFFFLL)
  {
    char v5 = 0;
  }
  else
  {
    v6 = [v3 pathExtension];
    char v5 = [v6 isEqualToString:@"synced"];
  }
  return v5;
}

+ (BOOL)hasLog_dot_number:(id)a3
{
  id v3 = a3;
  id v4 = [v3 lastPathComponent];
  id v10 = 0;
  char v5 = [MEMORY[0x263F08AE8] regularExpressionWithPattern:@"\\.log\\.[0-9]+" options:0 error:&v10];
  id v6 = v10;
  if (v6)
  {
    char v7 = +[FBKLog appHandle];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      +[FBKBugFormAttachmentPreview hasLog_dot_number:v7];
    }

    BOOL v8 = 0;
  }
  else
  {
    BOOL v8 = objc_msgSend(v5, "numberOfMatchesInString:options:range:", v4, 0, 0, objc_msgSend(v4, "length")) != 0;
  }

  return v8;
}

+ (void)textFileForURL:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_22A36D000, a2, OS_LOG_TYPE_ERROR, "Error copying file: [%{public}@] ", (uint8_t *)&v2, 0xCu);
}

+ (void)hasLog_dot_number:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_22A36D000, log, OS_LOG_TYPE_ERROR, "error parsing url [%{public}@] with error [%{public}@]", (uint8_t *)&v3, 0x16u);
}

@end