@interface NSURL(UTAdditions)
- (id)URLByAppendingPathComponent:()UTAdditions conformingToType:;
- (id)URLByAppendingPathExtensionForType:()UTAdditions;
@end

@implementation NSURL(UTAdditions)

- (id)URLByAppendingPathComponent:()UTAdditions conformingToType:
{
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, a1, @"UTAdditions.mm", 151, @"Invalid parameter not satisfying: %@", @"partialName != nil" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  v14 = [MEMORY[0x1E4F28B00] currentHandler];
  [v14 handleFailureInMethod:a2, a1, @"UTAdditions.mm", 152, @"Invalid parameter not satisfying: %@", @"contentType != nil" object file lineNumber description];

LABEL_3:
  v10 = [v7 stringByAppendingPathExtensionForType:v9];
  v11 = objc_msgSend(a1, "URLByAppendingPathComponent:isDirectory:", v10, objc_msgSend(v9, "conformsToType:", &off_1EB2090F0));

  return v11;
}

- (id)URLByAppendingPathExtensionForType:()UTAdditions
{
  id v5 = a3;
  if (!v5)
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, a1, @"UTAdditions.mm", 164, @"Invalid parameter not satisfying: %@", @"contentType != nil" object file lineNumber description];
  }
  v6 = [a1 lastPathComponent];
  id v7 = v6;
  if (v6)
  {
    id v8 = [v6 stringByAppendingPathExtensionForType:v5];

    uint64_t v9 = [v5 conformsToType:&off_1EB2090F0];
    v10 = [a1 URLByDeletingLastPathComponent];
    id v7 = [v10 URLByAppendingPathComponent:v8 isDirectory:v9];
  }
  if (v7) {
    v11 = v7;
  }
  else {
    v11 = a1;
  }
  id v12 = v11;

  return v12;
}

@end