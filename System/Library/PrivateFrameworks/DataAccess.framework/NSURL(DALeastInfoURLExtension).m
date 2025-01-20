@interface NSURL(DALeastInfoURLExtension)
- (id)da_leastInfoStringRepresentationRelativeToParentURL:()DALeastInfoURLExtension;
@end

@implementation NSURL(DALeastInfoURLExtension)

- (id)da_leastInfoStringRepresentationRelativeToParentURL:()DALeastInfoURLExtension
{
  id v4 = a3;
  uint64_t v5 = [a1 scheme];
  uint64_t v6 = [v4 scheme];
  uint64_t v7 = [a1 host];
  uint64_t v8 = [v4 host];
  uint64_t v9 = [a1 user];
  uint64_t v10 = [v4 user];
  v11 = [a1 port];
  if (v11)
  {
    v12 = [a1 port];
    int v23 = [v12 intValue];
  }
  else
  {
    int v23 = objc_msgSend(MEMORY[0x1E4F1CB10], "da_classicPortForScheme:", v5);
  }

  v13 = [v4 port];
  if (v13)
  {
    [v4 port];
    v15 = uint64_t v14 = v5;
    int v22 = [v15 intValue];

    uint64_t v5 = v14;
  }
  else
  {
    int v22 = objc_msgSend(MEMORY[0x1E4F1CB10], "da_classicPortForScheme:", v6);
  }

  v16 = (void *)v7;
  if ((!(v5 | v6) || v6 && [(id)v5 isEqualToString:v6])
    && (!(v7 | v8) || v8 && [(id)v7 isEqualToString:v8]))
  {
    if (v9 | v10)
    {
      if (v10)
      {
        if (![(id)v9 isEqualToString:v10] || v23 != v22)
        {
LABEL_22:
          if ([(id)v9 isEqualToString:v10]) {
            goto LABEL_23;
          }
          goto LABEL_25;
        }
LABEL_19:
        [a1 absoluteURL];
        v18 = uint64_t v17 = v5;
        uint64_t v19 = [v18 CDVRawPath];
LABEL_24:
        v20 = (void *)v19;

        uint64_t v5 = v17;
        goto LABEL_26;
      }
    }
    else if (v23 == v22)
    {
      goto LABEL_19;
    }
  }
  if (!(v9 | v10))
  {
LABEL_23:
    objc_msgSend(a1, "da_urlByRemovingUsername");
    v18 = uint64_t v17 = v5;
    uint64_t v19 = [v18 absoluteString];
    goto LABEL_24;
  }
  if (v10) {
    goto LABEL_22;
  }
LABEL_25:
  v20 = [a1 absoluteString];
LABEL_26:

  return v20;
}

@end