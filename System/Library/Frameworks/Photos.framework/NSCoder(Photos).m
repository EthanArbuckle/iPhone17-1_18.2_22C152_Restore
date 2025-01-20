@interface NSCoder(Photos)
- (id)ph_decodeSandboxedURLForKey:()Photos sandboxExtensionWrapper:;
- (uint64_t)_ph_sandboxExtensionTokenKeyForURLKey:()Photos;
- (void)ph_encodeSandboxedURL:()Photos forKey:;
@end

@implementation NSCoder(Photos)

- (uint64_t)_ph_sandboxExtensionTokenKeyForURLKey:()Photos
{
  return [a3 stringByAppendingString:@"##__sandbox-extension-token__"];
}

- (id)ph_decodeSandboxedURLForKey:()Photos sandboxExtensionWrapper:
{
  id v6 = a3;
  v7 = [a1 decodeObjectOfClass:objc_opt_class() forKey:v6];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v10 = 0;
    if (!a4) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  v8 = objc_msgSend(a1, "_ph_sandboxExtensionTokenKeyForURLKey:", v6);
  v9 = [a1 decodeObjectOfClass:objc_opt_class() forKey:v8];
  v10 = +[PHSandboxExtensionWrapper wrapperWithToken:v9];

  if (a4) {
LABEL_5:
  }
    *a4 = v10;
LABEL_6:

  return v7;
}

- (void)ph_encodeSandboxedURL:()Photos forKey:
{
  id v10 = a3;
  id v6 = a4;
  [a1 encodeObject:v10 forKey:v6];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if ([v10 isFileURL])
    {
      v7 = [v10 path];
      v8 = PLGetSandboxExtensionToken();
    }
    else
    {
      v8 = 0;
    }
    v9 = objc_msgSend(a1, "_ph_sandboxExtensionTokenKeyForURLKey:", v6);
    [a1 encodeObject:v8 forKey:v9];
  }
}

@end