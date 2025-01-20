@interface NSCoder(CACoderAdditions)
+ (uint64_t)CA_supportedClasses;
- (BOOL)CA_decodeCGFloatArray:()CACoderAdditions count:forKey:;
- (void)CA_decodeObjectForKey:()CACoderAdditions;
- (void)CA_encodeCGFloatArray:()CACoderAdditions count:forKey:;
- (void)CA_encodeObject:()CACoderAdditions forKey:conditional:;
@end

@implementation NSCoder(CACoderAdditions)

- (void)CA_decodeObjectForKey:()CACoderAdditions
{
  v4 = objc_msgSend(a1, "decodeObjectOfClasses:forKey:", objc_msgSend(MEMORY[0x1E4F28B90], "CA_supportedClasses"), a3);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v4 = (void *)[v4 decodedObject];
    if (v4)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v5 = (void *)[a1 delegate];
        if (objc_opt_respondsToSelector()) {
          [v5 unarchiver:a1 didDecodeObject:v4];
        }
      }
    }
  }
  return v4;
}

+ (uint64_t)CA_supportedClasses
{
  if (+[NSCoder(CACoderAdditions) CA_supportedClasses]::once != -1) {
    dispatch_once(&+[NSCoder(CACoderAdditions) CA_supportedClasses]::once, &__block_literal_global_424);
  }
  return +[NSCoder(CACoderAdditions) CA_supportedClasses]::set;
}

- (BOOL)CA_decodeCGFloatArray:()CACoderAdditions count:forKey:
{
  uint64_t v7 = [a1 decodeObjectOfClass:objc_opt_class() forKey:a5];
  if (v7)
  {
    for (i = (void *)[objc_alloc(MEMORY[0x1E4F28FE8]) initWithString:v7]; a4; --a4)
    {
      if (([i scanDouble:a3] & 1) == 0) {
        *a3 = 0;
      }
      ++a3;
    }
  }
  return v7 != 0;
}

- (void)CA_encodeCGFloatArray:()CACoderAdditions count:forKey:
{
  CFStringRef v7 = CACreateStringWithDoubleArray(a3, a4, 0.000001);
  if (v7)
  {
    CFStringRef v8 = v7;
    [a1 encodeObject:v7 forKey:a5];
    CFRelease(v8);
  }
}

- (void)CA_encodeObject:()CACoderAdditions forKey:conditional:
{
  CFStringRef v8 = (objc_object *)[a3 replacementObjectForCoder:a1];
  Proxy = CACodingCreateProxy(a1, v8);
  v13 = Proxy;
  if (Proxy) {
    CFStringRef v8 = (objc_object *)Proxy;
  }
  Superclass = (void *)[(objc_object *)v8 classForKeyedArchiver];
  if (!Superclass) {
    Superclass = objc_opt_class();
  }
  if ([Superclass conformsToProtocol:&unk_1ED05CDF8])
  {
    if (objc_opt_respondsToSelector())
    {
      int v11 = [Superclass supportsSecureCoding];
      if (Superclass)
      {
        if (v11)
        {
          while ((___ZL28class_supports_secure_codingP10objc_class_block_invoke((objc_class *)Superclass, sel_initWithCoder_) & 1) == 0)
          {
            Superclass = class_getSuperclass((Class)Superclass);
            if (!Superclass) {
              goto LABEL_16;
            }
          }
          Class = object_getClass(Superclass);
          if (___ZL28class_supports_secure_codingP10objc_class_block_invoke(Class, sel_supportsSecureCoding))
          {
            if (a5) {
              [(NSCoder *)a1 encodeConditionalObject:v8 forKey:a4];
            }
            else {
              [(NSCoder *)a1 encodeObject:v8 forKey:a4];
            }
          }
        }
      }
    }
  }
LABEL_16:
}

@end