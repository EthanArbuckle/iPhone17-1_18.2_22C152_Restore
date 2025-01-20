@interface INStringLocalizer
+ (id)alternativeLocales;
+ (id)localizerForLanguage:(id)a3;
+ (id)siriLocalizer;
- (BOOL)matchesBundleLocalizations:(__CFBundle *)a3;
- (INStringLocalizer)init;
- (INStringLocalizer)initWithLanguageCode:(id)a3;
- (NSArray)preferredLanguages;
- (NSLocale)locale;
- (NSMapTable)bundleLocalizations;
- (NSMapTable)bundlesByIdentifier;
- (NSMapTable)bundlesByURL;
- (NSMapTable)preferredBundleLocalizations;
- (NSString)languageCode;
- (__CFBundle)bundleWithIdentifier:(id)a3 fileURL:(id)a4;
- (id)localizationsForBundle:(__CFBundle *)a3;
- (id)preferredLocalizationsForBundle:(__CFBundle *)a3;
- (os_unfair_lock_s)lock;
@end

@implementation INStringLocalizer

- (INStringLocalizer)initWithLanguageCode:(id)a3
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)INStringLocalizer;
  v5 = [(INStringLocalizer *)&v22 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    languageCode = v5->_languageCode;
    v5->_languageCode = (NSString *)v6;

    v5->_lock._os_unfair_lock_opaque = 0;
    uint64_t v8 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    bundlesByIdentifier = v5->_bundlesByIdentifier;
    v5->_bundlesByIdentifier = (NSMapTable *)v8;

    uint64_t v10 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    bundlesByURL = v5->_bundlesByURL;
    v5->_bundlesByURL = (NSMapTable *)v10;

    uint64_t v12 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    bundleLocalizations = v5->_bundleLocalizations;
    v5->_bundleLocalizations = (NSMapTable *)v12;

    uint64_t v14 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    preferredBundleLocalizations = v5->_preferredBundleLocalizations;
    v5->_preferredBundleLocalizations = (NSMapTable *)v14;

    if (v4)
    {
      v23[0] = v4;
      v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:1];
      v17 = [MEMORY[0x1E4F1CA20] preferredLanguages];
      uint64_t v18 = [v16 arrayByAddingObjectsFromArray:v17];
      preferredLanguages = v5->_preferredLanguages;
      v5->_preferredLanguages = (NSArray *)v18;
    }
    v20 = v5;
  }

  return v5;
}

+ (id)localizerForLanguage:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithLanguageCode:v4];

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferredLanguages, 0);
  objc_storeStrong((id *)&self->_preferredBundleLocalizations, 0);
  objc_storeStrong((id *)&self->_bundleLocalizations, 0);
  objc_storeStrong((id *)&self->_bundlesByURL, 0);
  objc_storeStrong((id *)&self->_bundlesByIdentifier, 0);

  objc_storeStrong((id *)&self->_languageCode, 0);
}

- (NSArray)preferredLanguages
{
  return self->_preferredLanguages;
}

- (NSMapTable)preferredBundleLocalizations
{
  return self->_preferredBundleLocalizations;
}

- (NSMapTable)bundleLocalizations
{
  return self->_bundleLocalizations;
}

- (NSMapTable)bundlesByURL
{
  return self->_bundlesByURL;
}

- (NSMapTable)bundlesByIdentifier
{
  return self->_bundlesByIdentifier;
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (NSString)languageCode
{
  return self->_languageCode;
}

- (BOOL)matchesBundleLocalizations:(__CFBundle *)a3
{
  v5 = self->_languageCode;
  if (v5)
  {
    os_unfair_lock_lock(&self->_lock);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __48__INStringLocalizer_matchesBundleLocalizations___block_invoke;
    v14[3] = &unk_1E55208F8;
    v14[4] = self;
    uint64_t v6 = (void (**)(void))MEMORY[0x192F984C0](v14);
    v7 = [(INStringLocalizer *)self localizationsForBundle:a3];
    if ([v7 containsObject:v5])
    {
      char v8 = 1;
    }
    else
    {
      v9 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:v5];
      uint64_t v10 = [v9 languageCode];
      if ([v7 containsObject:v10])
      {
        char v8 = 1;
      }
      else
      {
        v11 = +[INStringLocalizer alternativeLocales];
        uint64_t v12 = [v11 objectForKey:v5];
        char v8 = [v7 containsObject:v12];
      }
    }

    v6[2](v6);
  }
  else
  {
    char v8 = 1;
  }

  return v8;
}

void __48__INStringLocalizer_matchesBundleLocalizations___block_invoke(uint64_t a1)
{
}

- (id)preferredLocalizationsForBundle:(__CFBundle *)a3
{
  v18[1] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    os_unfair_lock_lock(&self->_lock);
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __53__INStringLocalizer_preferredLocalizationsForBundle___block_invoke;
    v17[3] = &unk_1E55208F8;
    v17[4] = self;
    v5 = (void (**)(void))MEMORY[0x192F984C0](v17);
    uint64_t v6 = [(NSMapTable *)self->_preferredBundleLocalizations objectForKey:a3];
    if (v6)
    {
      CFArrayRef v7 = v6;
    }
    else
    {
      char v8 = [(INStringLocalizer *)self localizationsForBundle:a3];
      v9 = self->_preferredLanguages;
      if (self->_languageCode && (objc_msgSend(v8, "containsObject:") & 1) == 0)
      {
        uint64_t v10 = +[INStringLocalizer alternativeLocales];
        v11 = [v10 objectForKey:self->_languageCode];

        if (v11)
        {
          v18[0] = v11;
          uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
          v13 = [MEMORY[0x1E4F1CA20] preferredLanguages];
          uint64_t v14 = [v12 arrayByAddingObjectsFromArray:v13];

          v9 = (NSArray *)v14;
        }
      }
      CFArrayRef v15 = CFBundleCopyLocalizationsForPreferences((CFArrayRef)v8, (CFArrayRef)v9);
      [(NSMapTable *)self->_preferredBundleLocalizations setObject:v15 forKey:a3];
      CFArrayRef v7 = v15;
    }
    v5[2](v5);
  }
  else
  {
    CFArrayRef v7 = (const __CFArray *)MEMORY[0x1E4F1CBF0];
  }

  return v7;
}

void __53__INStringLocalizer_preferredLocalizationsForBundle___block_invoke(uint64_t a1)
{
}

- (id)localizationsForBundle:(__CFBundle *)a3
{
  os_unfair_lock_assert_owner(&self->_lock);
  if (a3)
  {
    v5 = [(NSMapTable *)self->_bundleLocalizations objectForKey:a3];
    if (!v5)
    {
      v5 = CFBundleCopyBundleLocalizations(a3);
      [(NSMapTable *)self->_bundleLocalizations setObject:v5 forKey:a3];
    }
    id v6 = v5;
  }
  else
  {
    id v6 = (id)MEMORY[0x1E4F1CBF0];
  }

  return v6;
}

- (__CFBundle)bundleWithIdentifier:(id)a3 fileURL:(id)a4
{
  id v6 = (__CFString *)a3;
  CFURLRef v7 = (CFURLRef)a4;
  os_unfair_lock_lock(&self->_lock);
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __50__INStringLocalizer_bundleWithIdentifier_fileURL___block_invoke;
  v19[3] = &unk_1E55208F8;
  v19[4] = self;
  char v8 = (void (**)(void))MEMORY[0x192F984C0](v19);
  id v9 = [(NSMapTable *)self->_bundlesByIdentifier objectForKey:v6];
  if (v9) {
    goto LABEL_21;
  }
  id v9 = [(NSMapTable *)self->_bundlesByURL objectForKey:v7];
  if (v9) {
    goto LABEL_21;
  }
  int v10 = [(__CFURL *)v7 isFileURL] ^ 1;
  if (!v6) {
    LOBYTE(v10) = 1;
  }
  if ((v10 & 1) == 0)
  {
    Unique = (__CFBundle *)_CFBundleCreateUnique();
    id v9 = Unique;
    if (Unique)
    {
      if ([(__CFString *)(id)CFBundleGetIdentifier(Unique) isEqualToString:v6])
      {
LABEL_20:
        [(NSMapTable *)self->_bundlesByIdentifier setObject:v9 forKey:v6];
        [(NSMapTable *)self->_bundlesByURL setObject:v9 forKey:v7];
        CFAutorelease(v9);
        goto LABEL_21;
      }
      CFRelease(v9);
    }
LABEL_10:
    CFBundleRef BundleWithIdentifier = CFBundleGetBundleWithIdentifier(v6);
    id v9 = BundleWithIdentifier;
    if (BundleWithIdentifier)
    {
      CFRetain(BundleWithIdentifier);
      v13 = v7;
      CFURLRef v7 = CFBundleCopyBundleURL((CFBundleRef)v9);
LABEL_19:

      goto LABEL_20;
    }
    goto LABEL_12;
  }
  if (v6) {
    goto LABEL_10;
  }
LABEL_12:
  if ([(__CFURL *)v7 isFileURL])
  {
    uint64_t v14 = (__CFBundle *)_CFBundleCreateUnique();
    id v9 = v14;
    if (v14) {
      goto LABEL_14;
    }
  }
  if (!v6) {
    goto LABEL_28;
  }
  v13 = [MEMORY[0x1E4F223F0] bundleProxyForIdentifier:v6];
  CFURLRef v15 = [v13 bundleURL];
  if ([(__CFURL *)v15 isFileURL])
  {
    id v9 = (id)_CFBundleCreateUnique();
    if (v9)
    {

      CFURLRef v7 = v15;
      goto LABEL_19;
    }
  }

  id v17 = _INVCIntentDefinitionManagerClass();
  if (objc_opt_respondsToSelector())
  {
    uint64_t v18 = [v17 intentDefinitionBundleURLForBundleID:v6];

    CFURLRef v7 = (CFURLRef)v18;
  }
  if (!v7)
  {
LABEL_28:
    id v9 = 0;
    goto LABEL_21;
  }
  id v9 = [(NSMapTable *)self->_bundlesByURL objectForKey:v7];
  if (!v9)
  {
    uint64_t v14 = (__CFBundle *)_CFBundleCreateUnique();
    id v9 = v14;
    if (v14)
    {
LABEL_14:
      CFBundleGetIdentifier(v14);
      v13 = v6;
      id v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      goto LABEL_19;
    }
  }
LABEL_21:
  v8[2](v8);

  return (__CFBundle *)v9;
}

void __50__INStringLocalizer_bundleWithIdentifier_fileURL___block_invoke(uint64_t a1)
{
}

- (NSLocale)locale
{
  if (self->_languageCode) {
    objc_msgSend(MEMORY[0x1E4F1CA20], "localeWithLocaleIdentifier:");
  }
  else {
  v2 = [MEMORY[0x1E4F1CA20] currentLocale];
  }

  return (NSLocale *)v2;
}

- (INStringLocalizer)init
{
  return [(INStringLocalizer *)self initWithLanguageCode:0];
}

+ (id)siriLocalizer
{
  v3 = +[INPreferences siriLanguageCode];
  id v4 = [a1 localizerForLanguage:v3];

  return v4;
}

+ (id)alternativeLocales
{
  return &unk_1EDBAC778;
}

@end