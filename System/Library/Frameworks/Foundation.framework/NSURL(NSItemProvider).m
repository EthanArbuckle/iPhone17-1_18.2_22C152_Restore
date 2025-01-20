@interface NSURL(NSItemProvider)
+ (id)objectWithItemProviderData:()NSItemProvider typeIdentifier:error:;
+ (uint64_t)readableTypeIdentifiersForItemProvider;
+ (uint64_t)writableTypeIdentifiersForItemProvider;
- (NSData)_URLArchive;
- (uint64_t)loadDataWithTypeIdentifier:()NSItemProvider forItemProviderCompletionHandler:;
- (void)writableTypeIdentifiersForItemProvider;
@end

@implementation NSURL(NSItemProvider)

+ (uint64_t)readableTypeIdentifiersForItemProvider
{
  v1[1] = *MEMORY[0x1E4F143B8];
  v1[0] = _MergedGlobals_88();
  return [MEMORY[0x1E4F1C978] arrayWithObjects:v1 count:1];
}

- (NSData)_URLArchive
{
  v2 = (void *)[a1 baseURL];
  v3 = (void *)[MEMORY[0x1E4F1CA48] arrayWithCapacity:3];
  if (v2)
  {
    objc_msgSend(v3, "addObject:", objc_msgSend(a1, "relativeString"));
    v4 = (__CFString *)[v2 absoluteString];
  }
  else
  {
    objc_msgSend(v3, "addObject:", objc_msgSend(a1, "absoluteString"));
    v4 = &stru_1ECA5C228;
  }
  [v3 addObject:v4];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v5 = objc_msgSend(a1, "_NSItemProviderArchive_customArchiveDictionary");
    if (v5) {
      [v3 addObject:v5];
    }
  }

  return +[NSPropertyListSerialization dataWithPropertyList:v3 format:200 options:0 error:0];
}

+ (id)objectWithItemProviderData:()NSItemProvider typeIdentifier:error:
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  uint64_t v35 = 0;
  uint64_t v8 = _MergedGlobals_88();
  if (off_1EB1E8168(a4, v8))
  {
    uint64_t v36 = 0;
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v38 = ___URLFromURLArchive_block_invoke;
    v39 = &unk_1E51FACB0;
    uint64_t v40 = a4;
    v41 = &v35;
    id v13 = +[NSPropertyListSerialization propertyListWithData:a3 options:0 format:0 error:&v36];
    if (_NSIsNSArray())
    {
      if ((unint64_t)[v13 count] >= 2
        && ([v13 objectAtIndexedSubscript:0], _NSIsNSString())
        && ([v13 objectAtIndexedSubscript:1], _NSIsNSString()))
      {
        int v14 = objc_msgSend((id)objc_msgSend(v13, "objectAtIndexedSubscript:", 1), "isEqualToString:", &stru_1ECA5C228);
        id v15 = objc_alloc(MEMORY[0x1E4F1CB10]);
        uint64_t v16 = [v13 objectAtIndexedSubscript:0];
        if (v14) {
          uint64_t v17 = [v15 initWithString:v16];
        }
        else {
          uint64_t v17 = objc_msgSend(v15, "initWithString:relativeToURL:", v16, objc_msgSend(v13, "objectAtIndexedSubscript:", 1));
        }
        v18 = (void *)v17;
      }
      else
      {
        v18 = 0;
      }
      if ((unint64_t)[v13 count] >= 3)
      {
        uint64_t v19 = [v13 objectAtIndexedSubscript:2];
        if (_NSIsNSDictionary())
        {
          if (objc_opt_respondsToSelector()) {
            objc_msgSend(v18, "_NSItemProviderArchive_didUnarchiveCustomDictionary:", v19);
          }
        }
      }
    }
    else
    {
      v18 = 0;
    }
    ((void (*)(void *, void *, uint64_t))v38)(v37, v18, v36);
    uint64_t v20 = v18;
    if (v20)
    {
      v21 = (NSError *)v35;
      goto LABEL_31;
    }
  }
  else
  {
    uint64_t v35 = (uint64_t)_NSIPCocoaErrorWithCode(4864, 0, 0, @"A URL cannot be instantiated from a representation of type “%@”.", v9, v10, v11, v12, a4);
  }
  if ([a3 length])
  {
    v26 = [[NSString alloc] initWithData:a3 encoding:4];
    if (v26)
    {
      uint64_t v20 = [objc_alloc(MEMORY[0x1E4F1CB10]) initWithString:v26];
      v27 = (void *)[(id)v20 scheme];
      if (v20 && [v27 length] && (objc_msgSend((id)v20, "isFileURL") & 1) == 0)
      {
        v32 = 0;
      }
      else
      {

        v32 = _NSIPCocoaErrorWithCode(4864, v35, 0, @"A URL cannot be instantiated from a representation of type “%@” even after treating it as a string.", v28, v29, v30, v31, a4);
        uint64_t v20 = 0;
      }
      uint64_t v35 = (uint64_t)v32;
    }
    else
    {
      uint64_t v20 = 0;
    }
  }
  else
  {
    uint64_t v20 = 0;
  }
  v21 = (NSError *)v35;
  if (!(v20 | v35))
  {
    v21 = _NSIPCocoaErrorWithCode(4864, 0, 0, @"A URL could not be instantiated because of an unknown error.", v22, v23, v24, v25, v34);
    uint64_t v20 = 0;
    uint64_t v35 = (uint64_t)v21;
  }
LABEL_31:
  if (a5 && v21) {
    *a5 = v21;
  }
  return (id)v20;
}

+ (uint64_t)writableTypeIdentifiersForItemProvider
{
  v1[1] = *MEMORY[0x1E4F143B8];
  v1[0] = _MergedGlobals_88();
  return [MEMORY[0x1E4F1C978] arrayWithObjects:v1 count:1];
}

- (void)writableTypeIdentifiersForItemProvider
{
  v2 = (void *)[MEMORY[0x1E4F1CA48] array];
  if ([a1 isFileURL]) {
    [v2 addObject:off_1EB1E8160()];
  }
  [v2 addObject:_MergedGlobals_88()];
  return v2;
}

- (uint64_t)loadDataWithTypeIdentifier:()NSItemProvider forItemProviderCompletionHandler:
{
  if (([a3 isEqualToString:off_1EB1E8160()] & 1) != 0
    || [a3 isEqualToString:_MergedGlobals_88()])
  {
    uint64_t v7 = [a1 _URLArchive];
  }
  else
  {
    uint64_t v7 = 0;
  }
  (*(void (**)(uint64_t, uint64_t, void))(a4 + 16))(a4, v7, 0);
  return 0;
}

@end