@interface iWorkImportCompatibility
+ (__CFDictionary)htmlForFileData:(__CFData *)a3 referringURLPrefix:(__CFString *)a4 uti:(__CFString *)a5;
+ (__CFDictionary)htmlForFileURL:(__CFURL *)a3 referringURLPrefix:(__CFString *)a4 uti:(__CFString *)a5;
@end

@implementation iWorkImportCompatibility

+ (__CFDictionary)htmlForFileURL:(__CFURL *)a3 referringURLPrefix:(__CFString *)a4 uti:(__CFString *)a5
{
  if (!sub_23696D288() || !sub_23696D358()) {
    return 0;
  }
  v8 = (uint64_t (*)(__CFURL *, __CFString *, __CFString *))sub_23696D358();
  if (v8)
  {
    return (__CFDictionary *)v8(a3, a4, a5);
  }
  else
  {
    v14 = objc_msgSend_currentHandler(MEMORY[0x263F08690], v9, v10, v11, v12);
    v18 = objc_msgSend_stringWithUTF8String_(NSString, v15, (uint64_t)"CFDictionaryRef du_CopyHTMLForIWorkFileAtURL(CFURLRef, CFStringRef, CFStringRef)", v16, v17);
    v19 = dlerror();
    objc_msgSend_handleFailureInFunction_file_lineNumber_description_(v14, v20, (uint64_t)v18, @"iWorkImportCompatibility.m", 15, @"%s", v19);

    __break(1u);
  }
  return result;
}

+ (__CFDictionary)htmlForFileData:(__CFData *)a3 referringURLPrefix:(__CFString *)a4 uti:(__CFString *)a5
{
  if (!sub_23696D288() || !sub_23696D6AC()) {
    return 0;
  }
  v8 = (uint64_t (*)(__CFData *, __CFString *, __CFString *))sub_23696D6AC();
  if (v8)
  {
    return (__CFDictionary *)v8(a3, a4, a5);
  }
  else
  {
    v14 = objc_msgSend_currentHandler(MEMORY[0x263F08690], v9, v10, v11, v12);
    v18 = objc_msgSend_stringWithUTF8String_(NSString, v15, (uint64_t)"CFDictionaryRef du_CopyHTMLForIWorkDataWithUTI(CFDataRef, CFStringRef, CFStringRef)", v16, v17);
    v19 = dlerror();
    objc_msgSend_handleFailureInFunction_file_lineNumber_description_(v14, v20, (uint64_t)v18, @"iWorkImportCompatibility.m", 14, @"%s", v19);

    __break(1u);
  }
  return result;
}

@end