void sub_100003AB4(id a1)
{
  qword_100008148 = (uint64_t)dlopen("/usr/lib/libMemoryResourceException.dylib", 1);
}

Class NSClassFromString(NSString *aClassName)
{
  return _NSClassFromString(aClassName);
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return _dlopen(__path, __mode);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_enumerationMutation(id obj)
{
}

id objc_msgSend_getLogPathsForSystemDiagnostic(void *a1, const char *a2, ...)
{
  return [a1 getLogPathsForSystemDiagnostic];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithFormat:");
}
  v10 = ardDiagnosticExtension *)self filesInDir:v8 matchingPattern:v7 excludingPattern:0];
  v11 = [v9 initWithArray:v10];

  if (qword_100008150 != -1) {
    dispatch_once(&qword_100008150, &stru_1000040D8);
  }
  if (qword_100008148)
  {
    v21 = v6;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v12 = [NSClassFromString(@"RMECacheEnumerator") getLogPathsForSystemDiagnostic];
    v13 = [v12 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v13)
    {
      v14 = v13;
      v15 = *(void *)v23;
      do
      {
        for (i = 0; i != v14; i = (char *)i + 1)
        {
          if (*(void *)v23 != v15) {
            objc_enumerationMutation(v12);
          }
          v17 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          v18 = objc_msgSend(v7, "firstMatchInString:options:range:", v17, 0, 0, objc_msgSend(v17, "length"));

          if (v18)
          {
            v19 = +[DEAttachmentItem attachmentWithPath:v17];
            [v11 addObject:v19];
          }
        }
        v14 = [v12 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v14);
    }

    v6 = v21;
  }

  return v11;
}

@end