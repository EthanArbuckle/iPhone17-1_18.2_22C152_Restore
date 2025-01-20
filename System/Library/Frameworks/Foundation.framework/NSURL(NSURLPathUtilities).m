@interface NSURL(NSURLPathUtilities)
+ (uint64_t)fileURLWithPathComponents:()NSURLPathUtilities;
- (CFURLRef)URLByAppendingPathComponent:()NSURLPathUtilities isDirectory:;
- (CFURLRef)URLByAppendingPathExtension:()NSURLPathUtilities;
- (CFURLRef)URLByDeletingLastPathComponent;
- (CFURLRef)URLByDeletingPathExtension;
- (id)URLByResolvingSymlinksInPath;
- (id)URLByStandardizingPath;
- (uint64_t)URLByAppendingPathComponent:()NSURLPathUtilities;
- (uint64_t)checkResourceIsReachableAndReturnError:()NSURLPathUtilities;
- (uint64_t)lastPathComponent;
- (uint64_t)pathComponents;
- (uint64_t)pathExtension;
@end

@implementation NSURL(NSURLPathUtilities)

- (uint64_t)URLByAppendingPathComponent:()NSURLPathUtilities
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    v8 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: component, components, or pathExtension cannot be nil.", _NSMethodExceptionProem(a1, a2)), 0 reason userInfo];
    objc_exception_throw(v8);
  }
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x3052000000;
  v14 = __Block_byref_object_copy__16;
  v15 = __Block_byref_object_dispose__16;
  uint64_t v16 = 0;
  if (([a3 hasSuffix:@"/"] & 1) != 0 || !-[objc_class isFileURL](a1, "isFileURL"))
  {
    uint64_t v6 = [(objc_class *)a1 URLByAppendingPathComponent:a3 isDirectory:0];
    v12[5] = v6;
  }
  else
  {
    v10[0] = 0;
    v10[1] = v10;
    v10[2] = 0x3052000000;
    v10[3] = __Block_byref_object_copy__16;
    v10[4] = __Block_byref_object_dispose__16;
    v10[5] = 0;
    uint64_t v5 = [(objc_class *)a1 URLByAppendingPathComponent:a3 isDirectory:0];
    v12[5] = v5;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __57__NSURL_NSURLPathUtilities__URLByAppendingPathComponent___block_invoke;
    v9[3] = &unk_1E51FA970;
    v9[6] = &v11;
    v9[7] = v10;
    v9[4] = a1;
    v9[5] = a3;
    +[NSURL setIOPolicy:type:scope:forBlock:](MEMORY[0x1E4F1CB10], (uint64_t)v9);
    _Block_object_dispose(v10, 8);
    uint64_t v6 = v12[5];
  }
  _Block_object_dispose(&v11, 8);
  return v6;
}

- (CFURLRef)URLByAppendingPathComponent:()NSURLPathUtilities isDirectory:
{
  if (!a3)
  {
    uint64_t v6 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: component, components, or pathExtension cannot be nil.", _NSMethodExceptionProem(url, a2)), 0 reason userInfo];
    objc_exception_throw(v6);
  }
  CFURLRef v4 = CFURLCreateCopyAppendingPathComponent((CFAllocatorRef)*MEMORY[0x1E4F1CFB0], url, a3, a4);

  return v4;
}

- (uint64_t)pathComponents
{
  v1 = (void *)[a1 path];

  return [v1 pathComponents];
}

- (uint64_t)lastPathComponent
{
  v1 = (void *)[a1 path];

  return [v1 lastPathComponent];
}

- (CFURLRef)URLByDeletingLastPathComponent
{
  CFURLRef PathComponent = CFURLCreateCopyDeletingLastPathComponent((CFAllocatorRef)*MEMORY[0x1E4F1CFB0], url);

  return PathComponent;
}

+ (uint64_t)fileURLWithPathComponents:()NSURLPathUtilities
{
  if (!a3)
  {
    v8 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: component, components, or pathExtension cannot be nil.", _NSMethodExceptionProem(a1, a2)), 0 reason userInfo];
    objc_exception_throw(v8);
  }
  CFURLRef v4 = +[NSString pathWithComponents:](NSString, "pathWithComponents:");
  int v5 = objc_msgSend((id)objc_msgSend(a3, "lastObject"), "isEqual:", @"/");
  uint64_t v6 = (void *)MEMORY[0x1E4F1CB10];
  if (v5)
  {
    return [v6 fileURLWithPath:v4 isDirectory:1];
  }
  else
  {
    return [v6 fileURLWithPath:v4];
  }
}

- (id)URLByStandardizingPath
{
  if (![a1 isFileURL]) {
    goto LABEL_11;
  }
  if ([a1 isFileReferenceURL])
  {
    v2 = (void *)[a1 filePathURL];
    return (id)[v2 URLByStandardizingPath];
  }
  uint64_t v4 = objc_msgSend((id)objc_msgSend(a1, "path"), "stringByStandardizingPath");
  if (v4)
  {
    uint64_t v5 = v4;
    int v6 = [a1 checkResourceIsReachableAndReturnError:0];
    v7 = (void *)MEMORY[0x1E4F1CB10];
    if (v6)
    {
      v8 = (void *)MEMORY[0x1E4F1CB10];
      return (id)[v8 fileURLWithPath:v5];
    }
    else
    {
      BOOL v10 = CFURLHasDirectoryPath((CFURLRef)a1) != 0;
      return (id)[v7 fileURLWithPath:v5 isDirectory:v10];
    }
  }
  else
  {
LABEL_11:
    id v9 = a1;
    return v9;
  }
}

- (uint64_t)checkResourceIsReachableAndReturnError:()NSURLPathUtilities
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  uint64_t v5 = (objc_class *)[a1 _cfurl];
  if (qword_1EB1ED840 != -1) {
    dispatch_once(&qword_1EB1ED840, &__block_literal_global_51);
  }
  if (v5 == (objc_class *)qword_1EB1ED838)
  {
    v8 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: object was not initialized", _NSMethodExceptionProem(v5, a2)), 0 reason userInfo];
    objc_exception_throw(v8);
  }
  if (v5)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __68__NSURL_NSURLPathUtilities__checkResourceIsReachableAndReturnError___block_invoke;
    v9[3] = &unk_1E51FA998;
    v9[4] = &v10;
    v9[5] = v5;
    v9[6] = a3;
    +[NSURL setIOPolicy:type:scope:forBlock:](MEMORY[0x1E4F1CB10], (uint64_t)v9);
    if (a3)
    {
      if (!*((unsigned char *)v11 + 24)) {
        *a3 = *a3;
      }
    }
  }
  uint64_t v6 = *((unsigned __int8 *)v11 + 24);
  _Block_object_dispose(&v10, 8);
  return v6;
}

- (id)URLByResolvingSymlinksInPath
{
  if (![a1 isFileURL]) {
    goto LABEL_10;
  }
  if ([a1 isFileReferenceURL])
  {
    v2 = (void *)[a1 filePathURL];
    return (id)[v2 URLByResolvingSymlinksInPath];
  }
  uint64_t v4 = (void *)[a1 path];
  if (v4)
  {
    uint64_t v5 = [v4 stringByResolvingSymlinksInPath];
    uint64_t v6 = (void *)MEMORY[0x1E4F1CB10];
    return (id)[v6 fileURLWithPath:v5];
  }
  else
  {
LABEL_10:
    id v7 = a1;
    return v7;
  }
}

- (CFURLRef)URLByDeletingPathExtension
{
  CFURLRef v1 = CFURLCreateCopyDeletingPathExtension((CFAllocatorRef)*MEMORY[0x1E4F1CFB0], url);

  return v1;
}

- (uint64_t)pathExtension
{
  CFURLRef v1 = (void *)[a1 path];

  return [v1 pathExtension];
}

- (CFURLRef)URLByAppendingPathExtension:()NSURLPathUtilities
{
  if (!a3)
  {
    uint64_t v5 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: component, components, or pathExtension cannot be nil.", _NSMethodExceptionProem(url, a2)), 0 reason userInfo];
    objc_exception_throw(v5);
  }
  CFURLRef v3 = CFURLCreateCopyAppendingPathExtension((CFAllocatorRef)*MEMORY[0x1E4F1CFB0], url, a3);

  return v3;
}

@end