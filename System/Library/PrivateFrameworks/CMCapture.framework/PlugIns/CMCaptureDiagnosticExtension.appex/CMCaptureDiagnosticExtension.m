uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

uint64_t _os_feature_enabled_impl()
{
  return __os_feature_enabled_impl();
}

void objc_enumerationMutation(id obj)
{
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_pathExtension(void *a1, const char *a2, ...)
{
  return [a1 pathExtension];
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithFormat:");
}
28 v30;
  long long v31;
  long long v32;
  char v33;
  unsigned char v34[128];
  unsigned char v35[128];

  v33 = 0;
  v3 = +[NSMutableArray array];
  v4 = +[NSMutableArray array];
  if (_os_feature_enabled_impl()) {
    v5 = @"/private/var/mobile/tmp/com.apple.cameracaptured/CMCaptureTailspins";
  }
  else {
    v5 = @"/private/var/mobile/tmp/CMCaptureTailspins";
  }
  [v4 addObject:v5];
  [v4 addObject:@"/private/var/mobile/tmp/com.apple.deferredmediad/CMCaptureTailspins"];
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  obj = v4;
  v6 = [v4 countByEnumeratingWithState:&v29 objects:v35 count:16];
  if (v6)
  {
    v7 = v6;
    v8 = *(void *)v30;
    v9 = &NSExtensionMain_ptr;
    v20 = *(void *)v30;
    do
    {
      v10 = 0;
      v21 = v7;
      do
      {
        if (*(void *)v30 != v8) {
          objc_enumerationMutation(obj);
        }
        v11 = *(void *)(*((void *)&v29 + 1) + 8 * (void)v10);
        if (objc_msgSend(objc_msgSend(v9[6], "defaultManager"), "fileExistsAtPath:isDirectory:", v11, &v33))v12 = v33 == 0; {
        else
        }
          v12 = 1;
        if (!v12)
        {
          v23 = v10;
          v28 = 0;
          v13 = objc_msgSend(objc_msgSend(v9[6], "defaultManager"), "contentsOfDirectoryAtPath:error:", v11, &v28);
          v24 = 0u;
          v25 = 0u;
          v26 = 0u;
          v27 = 0u;
          v14 = [v13 countByEnumeratingWithState:&v24 objects:v34 count:16];
          if (v14)
          {
            v15 = v14;
            v16 = *(void *)v25;
            do
            {
              for (i = 0; i != v15; i = (char *)i + 1)
              {
                if (*(void *)v25 != v16) {
                  objc_enumerationMutation(v13);
                }
                v18 = *(void **)(*((void *)&v24 + 1) + 8 * i);
                if (objc_msgSend(objc_msgSend(v18, "pathExtension"), "isEqualToString:", @"tailspin"))objc_msgSend(v3, "addObject:", +[DEAttachmentItem attachmentWithPath:](DEAttachmentItem, "attachmentWithPath:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@/%@", v11, v18))); {
              }
                }
              v15 = [v13 countByEnumeratingWithState:&v24 objects:v34 count:16];
            }
            while (v15);
          }
          v8 = v20;
          v7 = v21;
          v9 = &NSExtensionMain_ptr;
          v10 = v23;
        }
        v10 = (char *)v10 + 1;
      }
      while (v10 != v7);
      v7 = [obj countByEnumeratingWithState:&v29 objects:v35 count:16];
    }
    while (v7);
  }
  return v3;
}

@end