@interface LSBundleProxy(IntentsFoundation)
- (id)if_containingAppProxy;
- (uint64_t)if_isAppExtension;
- (uint64_t)if_isSystem;
- (uint64_t)if_isWatchKitAppExtension;
@end

@implementation LSBundleProxy(IntentsFoundation)

- (uint64_t)if_isSystem
{
  v2 = [a1 bundleType];
  if ([v2 isEqualToString:*MEMORY[0x1E4F22368]])
  {
    id v3 = a1;
    if (v3)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v4 = v3;
      }
      else {
        v4 = 0;
      }
    }
    else
    {
      v4 = 0;
    }
    id v8 = v4;

    v9 = [v8 containingBundle];

    LOBYTE(v8) = objc_msgSend(v9, "if_isSystem");
    if (v8) {
      goto LABEL_12;
    }
    v10 = objc_msgSend(v3, "if_containingAppProxy");
    if (v10)
    {

LABEL_22:
      uint64_t v15 = objc_msgSend(v3, "if_containingAppProxy");
      if (v15)
      {
        v5 = (void *)v15;
        uint64_t v7 = 0;
LABEL_26:

        goto LABEL_27;
      }
      v6 = [v3 bundleURL];
      v16 = [MEMORY[0x1E4F1CB10] fileURLWithPath:@"/AppleInternal/Library/" isDirectory:1];
      uint64_t v7 = objc_msgSend(v6, "if_isContainedByDirectoryAtURL:", v16);

      v5 = 0;
LABEL_25:

      goto LABEL_26;
    }
    id v11 = v3;
    if (v3)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v12 = v11;
      }
      else {
        v12 = 0;
      }
    }
    else
    {
      v12 = 0;
    }
    id v13 = v12;

    char v14 = [v13 isOnSystemPartition];
    if ((v14 & 1) == 0) {
      goto LABEL_22;
    }
  }
  else if (([v2 isEqualToString:*MEMORY[0x1E4F22350]] & 1) == 0 {
         && ([v2 isEqualToString:*MEMORY[0x1E4F22380]] & 1) == 0)
  }
  {
    if (![v2 isEqualToString:*MEMORY[0x1E4F22348]])
    {
      uint64_t v7 = 0;
      goto LABEL_27;
    }
    v5 = [a1 bundleURL];
    v6 = [MEMORY[0x1E4F1CB10] fileURLWithPath:@"/System/Library/" isDirectory:1];
    uint64_t v7 = objc_msgSend(v5, "if_isContainedByDirectoryAtURL:", v6);
    goto LABEL_25;
  }
LABEL_12:
  uint64_t v7 = 1;
LABEL_27:

  return v7;
}

- (uint64_t)if_isWatchKitAppExtension
{
  id v1 = a1;
  if (v1 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v2 = [v1 objectForInfoDictionaryKey:*MEMORY[0x1E4F914E8] ofClass:objc_opt_class() inScope:1];
    uint64_t v3 = [v2 isEqualToString:@"com.apple.watchkit"];
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

- (uint64_t)if_isAppExtension
{
  id v1 = a1;
  if (v1)
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  else
  {
    char isKindOfClass = 0;
  }

  return isKindOfClass & 1;
}

- (id)if_containingAppProxy
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v2 = a1;
    goto LABEL_7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v2 = [a1 containingBundle];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_7;
    }
  }
  id v2 = 0;
LABEL_7:
  return v2;
}

@end