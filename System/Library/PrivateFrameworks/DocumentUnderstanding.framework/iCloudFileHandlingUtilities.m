@interface iCloudFileHandlingUtilities
+ (unint64_t)isURLDatalessFault:(id)a3;
@end

@implementation iCloudFileHandlingUtilities

+ (unint64_t)isURLDatalessFault:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  CFTypeRef cf = 0;
  CFBooleanRef propertyValueTypeRefPtr = 0;
  CFURLRef v3 = (const __CFURL *)a3;
  if (CFURLCopyResourcePropertyForKey(v3, (CFStringRef)*MEMORY[0x263EFFAE8], &propertyValueTypeRefPtr, (CFErrorRef *)&cf))
  {
    BOOL v4 = propertyValueTypeRefPtr == 0;
  }
  else
  {
    BOOL v4 = 1;
  }
  if (v4)
  {
    v5 = du_file_notification_log_handle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      CFTypeRef v11 = cf;
      _os_log_error_impl(&dword_2367AD000, v5, OS_LOG_TYPE_ERROR, "Could not determine if the document is a dataless fault: %@", buf, 0xCu);
    }

    if (cf) {
      CFRelease(cf);
    }
    unint64_t v6 = 2;
  }
  else
  {
    unint64_t v6 = CFBooleanGetValue(propertyValueTypeRefPtr) != 0;
    CFRelease(propertyValueTypeRefPtr);
  }

  return v6;
}

@end