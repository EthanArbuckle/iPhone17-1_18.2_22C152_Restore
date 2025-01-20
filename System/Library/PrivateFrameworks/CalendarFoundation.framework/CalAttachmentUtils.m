@interface CalAttachmentUtils
+ (BOOL)attachmentURL:(id)a3 matchesServerURL:(id)a4;
+ (id)_knownTLDForHostname:(id)a3;
+ (id)_stripSubdomain:(id)a3;
+ (id)attachmentContainerForSourceIdentifier:(id)a3 calendarDataContainer:(id)a4;
+ (id)attachmentContainerWithBaseURL:(id)a3;
+ (id)getFileSizeForPath:(id)a3 fileManager:(id)a4 error:(id *)a5;
+ (id)legacyAttachmentContainerWithBaseURL:(id)a3;
+ (id)legacyCalendarDataContainer;
+ (id)localRelativePathForLocalAbsoluteURL:(id)a3 localBaseURL:(id)a4;
+ (id)localURLForAttachmentWithRelativePath:(id)a3 baseURL:(id)a4;
+ (id)resolveSymlinksInURLThatMayNotFullyExist:(id)a3;
@end

@implementation CalAttachmentUtils

+ (id)localURLForAttachmentWithRelativePath:(id)a3 baseURL:(id)a4
{
  return (id)[a4 URLByAppendingPathComponent:a3];
}

+ (id)attachmentContainerWithBaseURL:(id)a3
{
  return (id)[a3 URLByAppendingPathComponent:@"Attachments"];
}

+ (id)attachmentContainerForSourceIdentifier:(id)a3 calendarDataContainer:(id)a4
{
  id v6 = a3;
  v7 = [a1 attachmentContainerWithBaseURL:a4];
  v8 = v7;
  if (v7)
  {
    v9 = [v7 URLByAppendingPathComponent:v6];
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (id)legacyAttachmentContainerWithBaseURL:(id)a3
{
  return (id)[a3 URLByAppendingPathComponent:@"Attachments"];
}

+ (id)legacyCalendarDataContainer
{
  CFStringRef v2 = (const __CFString *)CPSharedResourcesDirectory();
  if (v2 && (CFURLRef v3 = CFURLCreateWithFileSystemPath(0, v2, kCFURLPOSIXPathStyle, 1u)) != 0)
  {
    CFURLRef v4 = v3;
    CFURLRef v5 = CFURLCreateCopyAppendingPathComponent(0, v3, @"Library/Calendar/", 0);
    CFRelease(v4);
  }
  else
  {
    CFURLRef v5 = 0;
  }

  return v5;
}

+ (id)getFileSizeForPath:(id)a3 fileManager:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v13 = 0;
  v8 = [a4 attributesOfItemAtPath:v7 error:&v13];
  id v9 = v13;
  if (v8)
  {
    v10 = [v8 valueForKey:*MEMORY[0x1E4F28390]];
  }
  else
  {
    v11 = +[CalFoundationLogSubsystem defaultCategory];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      +[CalAttachmentUtils getFileSizeForPath:fileManager:error:]();
    }

    v10 = 0;
    if (a5) {
      *a5 = v9;
    }
  }

  return v10;
}

+ (id)localRelativePathForLocalAbsoluteURL:(id)a3 localBaseURL:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = [a1 resolveSymlinksInURLThatMayNotFullyExist:v6];
  id v9 = [v8 path];

  if (!v9)
  {
    v11 = +[CalFoundationLogSubsystem defaultCategory];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      +[CalAttachmentUtils localRelativePathForLocalAbsoluteURL:localBaseURL:]();
    }
    goto LABEL_11;
  }
  v10 = [a1 resolveSymlinksInURLThatMayNotFullyExist:v7];
  v11 = [v10 path];

  if (!v11)
  {
    v15 = +[CalFoundationLogSubsystem defaultCategory];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      +[CalAttachmentUtils localRelativePathForLocalAbsoluteURL:localBaseURL:]();
    }
    goto LABEL_10;
  }
  uint64_t v12 = [v9 rangeOfString:v11];
  if (v12)
  {
    uint64_t v14 = v12;
    v15 = +[CalFoundationLogSubsystem defaultCategory];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      int v19 = 134218498;
      uint64_t v20 = v14;
      __int16 v21 = 2112;
      v22 = v9;
      __int16 v23 = 2112;
      v24 = v11;
      _os_log_error_impl(&dword_190D88000, v15, OS_LOG_TYPE_ERROR, "Could not get location of base path substring at start of local absolute path. local base path range = %lu, local absolute path = %@, local base path = %@", (uint8_t *)&v19, 0x20u);
    }
LABEL_10:

LABEL_11:
    v16 = 0;
    goto LABEL_12;
  }
  unint64_t v18 = v13 + ([v11 hasSuffix:@"/"] ^ 1);
  if (v18 >= [v9 length])
  {
    v16 = &stru_1EE0C39E0;
  }
  else
  {
    v16 = [v9 substringFromIndex:v18];
  }
LABEL_12:

  return v16;
}

+ (id)resolveSymlinksInURLThatMayNotFullyExist:(id)a3
{
  id v3 = a3;
  CFURLRef v4 = [MEMORY[0x1E4F28CB8] defaultManager];
  CFURLRef v5 = [v3 path];
  char v6 = [v4 fileExistsAtPath:v5];

  id v7 = 0;
  if ((v6 & 1) == 0)
  {
    v8 = v3;
    do
    {
      id v9 = [v8 lastPathComponent];
      v10 = v9;
      if (v7)
      {
        uint64_t v11 = [v9 stringByAppendingPathComponent:v7];

        id v7 = (id)v11;
      }
      else
      {
        id v7 = v9;
      }
      id v3 = [v8 URLByDeletingLastPathComponent];

      uint64_t v12 = [v3 path];
      int v13 = [v4 fileExistsAtPath:v12];

      v8 = v3;
    }
    while (!v13);
  }
  uint64_t v14 = [v3 URLByResolvingSymlinksInPath];
  v15 = v14;
  if (v7)
  {
    id v16 = [v14 URLByAppendingPathComponent:v7];
  }
  else
  {
    id v16 = v14;
  }
  v17 = v16;

  return v17;
}

+ (BOOL)attachmentURL:(id)a3 matchesServerURL:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v7 scheme];
  id v9 = [v6 scheme];
  uint64_t v10 = [v8 compare:v9 options:1];

  if (v10)
  {
    BOOL v11 = 0;
  }
  else
  {
    uint64_t v12 = [v6 host];
    int v13 = [v7 host];
    BOOL v11 = 1;
    if ([v13 compare:v12 options:1])
    {
      uint64_t v14 = [a1 _stripSubdomain:v13];
      v15 = [a1 _stripSubdomain:v12];
      BOOL v11 = [v14 compare:v15 options:1] == 0;
    }
  }

  return v11;
}

+ (id)_stripSubdomain:(id)a3
{
  id v4 = a3;
  CFURLRef v5 = [a1 _knownTLDForHostname:v4];
  if (v5
    && (uint64_t v6 = objc_msgSend(v4, "rangeOfString:options:range:", @".", 4, 0, objc_msgSend(v4, "length") - objc_msgSend(v5, "length")), v6 != 0x7FFFFFFFFFFFFFFFLL))
  {
    id v7 = [v4 substringFromIndex:v6 + 1];
  }
  else
  {
    id v7 = v4;
  }
  v8 = v7;

  return v8;
}

+ (id)_knownTLDForHostname:(id)a3
{
  id v3 = a3;
  unint64_t v4 = [v3 length];
  uint64_t v5 = 0;
  uint64_t v6 = @".com";
  while (1)
  {
    id v7 = v6;
    unint64_t v8 = [(__CFString *)v7 length];
    if (v4 > v8 && !objc_msgSend(v3, "compare:options:range:", v7, 1, v4 - v8, v8)) {
      break;
    }

    uint64_t v6 = _knownTLDForHostname__knownTLDs[++v5];
    if (v5 == 8)
    {
      id v7 = 0;
      break;
    }
  }

  return v7;
}

+ (void)getFileSizeForPath:fileManager:error:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0_3();
  _os_log_debug_impl(&dword_190D88000, v0, OS_LOG_TYPE_DEBUG, "Could not read attributes of file. error = %@, path = %@", v1, 0x16u);
}

+ (void)localRelativePathForLocalAbsoluteURL:localBaseURL:.cold.1()
{
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_1(&dword_190D88000, v0, v1, "Could not get local absolute path. local absolute url = %@, local base url = %@");
}

+ (void)localRelativePathForLocalAbsoluteURL:localBaseURL:.cold.2()
{
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_1(&dword_190D88000, v0, v1, "Could not get local base path. local absolute url = %@, local base url = %@");
}

@end