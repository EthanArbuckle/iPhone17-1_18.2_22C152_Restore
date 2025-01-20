@interface BSCFBundle
- (BSCFBundle)initWithPath:(id)a3;
- (BSCFBundle)initWithURL:(id)a3;
- (__CFBundle)cfBundle;
- (id)bundleIdentifier;
- (id)bundlePath;
- (id)description;
- (id)executablePath;
- (id)infoDictionary;
- (id)localizedInfoDictionary;
- (id)localizedStringForKey:(id)a3 value:(id)a4 table:(id)a5;
- (id)pathForResource:(id)a3 ofType:(id)a4;
- (id)pathForResource:(id)a3 ofType:(id)a4 inDirectory:(id)a5;
- (void)dealloc;
@end

@implementation BSCFBundle

- (id)localizedInfoDictionary
{
  return CFBundleGetLocalInfoDictionary(self->_cfBundle);
}

- (BSCFBundle)initWithPath:(id)a3
{
  v4 = [MEMORY[0x1E4F1CB10] fileURLWithPath:a3];
  v5 = [(BSCFBundle *)self initWithURL:v4];

  return v5;
}

- (BSCFBundle)initWithURL:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"BSCFBundle.m", 39, @"Invalid parameter not satisfying: %@", @"url != nil" object file lineNumber description];
  }
  Unique = (void *)_CFBundleCreateUnique();
  if (Unique)
  {
    if (self)
    {
      v9.receiver = self;
      v9.super_class = (Class)BSCFBundle;
      self = [(BSCFBundle *)&v9 init];
      if (self)
      {
        CFRetain(Unique);
        self->_cfBundle = (__CFBundle *)Unique;
      }
    }
    CFRelease(Unique);
  }
  else
  {

    self = 0;
  }

  return self;
}

- (void)dealloc
{
  cfBundle = self->_cfBundle;
  if (cfBundle) {
    CFRelease(cfBundle);
  }
  v4.receiver = self;
  v4.super_class = (Class)BSCFBundle;
  [(BSCFBundle *)&v4 dealloc];
}

- (id)bundleIdentifier
{
  return (id)CFBundleGetIdentifier(self->_cfBundle);
}

- (id)infoDictionary
{
  return CFBundleGetInfoDictionary(self->_cfBundle);
}

- (__CFBundle)cfBundle
{
  return self->_cfBundle;
}

- (id)description
{
  v3 = +[BSDescriptionBuilder builderWithObject:self];
  objc_super v4 = [(BSCFBundle *)self bundleIdentifier];
  id v5 = (id)[v3 appendObject:v4 withName:0];

  v6 = [(BSCFBundle *)self bundlePath];
  id v7 = (id)[v3 appendObject:v6 withName:@"path" skipIfNil:1];

  id v8 = (id)[v3 appendBool:CFBundleIsExecutableLoaded(self->_cfBundle) != 0 withName:@"loaded"];
  objc_super v9 = [v3 build];

  return v9;
}

- (id)executablePath
{
  CFURLRef v2 = CFBundleCopyExecutableURL(self->_cfBundle);
  if (v2)
  {
    CFURLRef v3 = v2;
    objc_super v4 = [(__CFURL *)v2 path];
    CFRelease(v3);
    if (v4 && [v4 hasPrefix:@"/private/var/"])
    {
      uint64_t v5 = [v4 stringByReplacingCharactersInRange:0, objc_msgSend(@"/private/var/", "length"), @"/var/" withString];

      objc_super v4 = (void *)v5;
    }
  }
  else
  {
    objc_super v4 = 0;
  }
  return v4;
}

- (id)bundlePath
{
  CFURLRef v2 = CFBundleCopyBundleURL(self->_cfBundle);
  if (v2)
  {
    CFURLRef v3 = v2;
    objc_super v4 = [(__CFURL *)v2 path];
    CFRelease(v3);
  }
  else
  {
    objc_super v4 = 0;
  }
  return v4;
}

- (id)pathForResource:(id)a3 ofType:(id)a4
{
  CFURLRef v4 = CFBundleCopyResourceURL(self->_cfBundle, (CFStringRef)a3, (CFStringRef)a4, 0);
  if (v4)
  {
    CFURLRef v5 = v4;
    v6 = [(__CFURL *)v4 path];
    CFRelease(v5);
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)pathForResource:(id)a3 ofType:(id)a4 inDirectory:(id)a5
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = v8;
  CFStringRef v11 = (const __CFString *)v9;
  CFStringRef v12 = (const __CFString *)a5;
  v29 = (__CFString *)v11;
  v27 = (__CFString *)v12;
  if (self)
  {
    CFArrayRef v13 = CFBundleCopyResourceURLsOfType(self->_cfBundle, v11, v12);
    CFArrayRef v28 = v13;
    if (v13)
    {
      objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[__CFArray count](v13, "count"));
      self = (BSCFBundle *)objc_claimAutoreleasedReturnValue();
      v14 = [v10 stringByAppendingPathExtension:v11];
      long long v32 = 0u;
      long long v33 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      CFArrayRef v15 = v28;
      uint64_t v16 = [(__CFArray *)v15 countByEnumeratingWithState:&v30 objects:buf count:16];
      if (v16)
      {
        uint64_t v17 = *(void *)v31;
        do
        {
          for (uint64_t i = 0; i != v16; ++i)
          {
            if (*(void *)v31 != v17) {
              objc_enumerationMutation(v15);
            }
            v19 = *(void **)(*((void *)&v30 + 1) + 8 * i);
            v20 = [v19 path];
            if (!v10
              || ([v19 relativePath],
                  v21 = objc_claimAutoreleasedReturnValue(),
                  int v22 = [v21 isEqualToString:v14],
                  v21,
                  v22))
            {
              [(BSCFBundle *)self addObject:v20];
            }
          }
          uint64_t v16 = [(__CFArray *)v15 countByEnumeratingWithState:&v30 objects:buf count:16];
        }
        while (v16);
      }
    }
    else
    {
      self = 0;
    }
  }
  if ((unint64_t)[(BSCFBundle *)self count] >= 2)
  {
    v23 = BSLogCommon();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      v26 = [v10 stringByAppendingPathExtension:v29];
      *(_DWORD *)buf = 138543362;
      v35 = v26;
      _os_log_error_impl(&dword_18AAA8000, v23, OS_LOG_TYPE_ERROR, "More than one resource matches the given filename %{public}@", buf, 0xCu);
    }
  }
  v24 = [(BSCFBundle *)self firstObject];

  return v24;
}

- (id)localizedStringForKey:(id)a3 value:(id)a4 table:(id)a5
{
  CFURLRef v5 = (__CFString *)CFBundleCopyLocalizedString(self->_cfBundle, (CFStringRef)a3, (CFStringRef)a4, (CFStringRef)a5);
  return v5;
}

@end