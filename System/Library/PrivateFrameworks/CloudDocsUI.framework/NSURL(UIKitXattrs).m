@interface NSURL(UIKitXattrs)
- (id)_ui_extendedAttributeForKey:()UIKitXattrs;
- (uint64_t)_ui_setExtendedAttribute:()UIKitXattrs forKey:;
@end

@implementation NSURL(UIKitXattrs)

- (id)_ui_extendedAttributeForKey:()UIKitXattrs
{
  v4 = (const char *)[a3 fileSystemRepresentation];
  id v5 = [a1 path];
  v6 = (const char *)[v5 fileSystemRepresentation];

  ssize_t v7 = getxattr(v6, v4, 0, 0, 0, 1);
  if (v7 >= 1)
  {
    size_t v8 = v7;
    id v9 = [MEMORY[0x263EFF990] dataWithLength:v7];
    if (getxattr(v6, v4, (void *)[v9 mutableBytes], v8, 0, 1) == v8) {
      goto LABEL_5;
    }
  }
  id v9 = 0;
LABEL_5:

  return v9;
}

- (uint64_t)_ui_setExtendedAttribute:()UIKitXattrs forKey:
{
  id v6 = a4;
  id v7 = a3;
  size_t v8 = (const char *)[v6 fileSystemRepresentation];
  id v9 = [a1 path];
  v10 = (const char *)[v9 fileSystemRepresentation];

  id v11 = v7;
  v12 = (const void *)[v11 bytes];
  size_t v13 = [v11 length];

  return setxattr(v10, v8, v12, v13, 0, 1);
}

@end