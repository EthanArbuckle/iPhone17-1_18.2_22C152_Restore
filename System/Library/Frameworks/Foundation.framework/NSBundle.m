@interface NSBundle
+ (NSArray)URLsForResourcesWithExtension:(NSString *)ext subdirectory:(NSString *)subpath inBundleWithURL:(NSURL *)bundleURL;
+ (NSArray)allBundles;
+ (NSArray)allFrameworks;
+ (NSArray)pathsForResourcesOfType:(NSString *)ext inDirectory:(NSString *)bundlePath;
+ (NSArray)preferredLocalizationsFromArray:(NSArray *)localizationsArray;
+ (NSArray)preferredLocalizationsFromArray:(NSArray *)localizationsArray forPreferences:(NSArray *)preferencesArray;
+ (NSBundle)bundleForClass:(Class)aClass;
+ (NSBundle)bundleWithIdentifier:(NSString *)identifier;
+ (NSBundle)bundleWithPath:(NSString *)path;
+ (NSBundle)bundleWithURL:(NSURL *)url;
+ (NSBundle)mainBundle;
+ (NSString)pathForResource:(NSString *)name ofType:(NSString *)ext inDirectory:(NSString *)bundlePath;
+ (NSURL)URLForResource:(NSString *)name withExtension:(NSString *)ext subdirectory:(NSString *)subpath inBundleWithURL:(NSURL *)bundleURL;
+ (id)_bundleWithIdentifier:(id)a3 andLibraryName:(id)a4;
+ (id)_localizedStringsForKeys:(id)a3 forAllLocalizationsOfTable:(id)a4 inBundleWithURL:(id)a5;
+ (id)debugDescription;
+ (id)findBundleResourceURLsCallingMethod:(SEL)a3 baseURL:(id)a4 passingTest:(id)a5;
+ (id)findBundleResources:(id)a3 callingMethod:(SEL)a4 directory:(id)a5 languages:(id)a6 name:(id)a7 types:(id)a8 limit:(unint64_t)a9;
+ (id)loadedBundles;
- (BOOL)_searchForLocalizedString:(id)a3 foundKey:(id *)a4 foundTable:(id *)a5;
- (BOOL)isLoaded;
- (BOOL)load;
- (BOOL)loadAndReturnError:(NSError *)error;
- (BOOL)preflightAndReturnError:(NSError *)error;
- (BOOL)unload;
- (Class)classNamed:(NSString *)className;
- (Class)principalClass;
- (NSArray)URLsForResourcesWithExtension:(NSString *)ext subdirectory:(NSString *)subpath;
- (NSArray)URLsForResourcesWithExtension:(NSString *)ext subdirectory:(NSString *)subpath localization:(NSString *)localizationName;
- (NSArray)executableArchitectures;
- (NSArray)localizations;
- (NSArray)pathsForResourcesOfType:(NSString *)ext inDirectory:(NSString *)subpath;
- (NSArray)pathsForResourcesOfType:(NSString *)ext inDirectory:(NSString *)subpath forLocalization:(NSString *)localizationName;
- (NSArray)preferredLocalizations;
- (NSAttributedString)localizedAttributedStringForKey:(NSString *)key value:(NSString *)value table:(NSString *)tableName;
- (NSBundle)initWithPath:(NSString *)path;
- (NSBundle)initWithURL:(NSURL *)url;
- (NSDictionary)infoDictionary;
- (NSDictionary)localizedInfoDictionary;
- (NSString)builtInPlugInsPath;
- (NSString)bundleIdentifier;
- (NSString)bundlePath;
- (NSString)developmentLocalization;
- (NSString)executablePath;
- (NSString)localizedStringForKey:(NSString *)key value:(NSString *)value table:(NSString *)tableName;
- (NSString)pathForAuxiliaryExecutable:(NSString *)executableName;
- (NSString)pathForResource:(NSString *)name ofType:(NSString *)ext;
- (NSString)pathForResource:(NSString *)name ofType:(NSString *)ext inDirectory:(NSString *)subpath;
- (NSString)pathForResource:(NSString *)name ofType:(NSString *)ext inDirectory:(NSString *)subpath forLocalization:(NSString *)localizationName;
- (NSString)privateFrameworksPath;
- (NSString)resourcePath;
- (NSString)sharedFrameworksPath;
- (NSString)sharedSupportPath;
- (NSURL)URLForAuxiliaryExecutable:(NSString *)executableName;
- (NSURL)URLForResource:(NSString *)name withExtension:(NSString *)ext;
- (NSURL)URLForResource:(NSString *)name withExtension:(NSString *)ext subdirectory:(NSString *)subpath;
- (NSURL)URLForResource:(NSString *)name withExtension:(NSString *)ext subdirectory:(NSString *)subpath localization:(NSString *)localizationName;
- (NSURL)appStoreReceiptURL;
- (NSURL)builtInPlugInsURL;
- (NSURL)bundleURL;
- (NSURL)executableURL;
- (NSURL)privateFrameworksURL;
- (NSURL)resourceURL;
- (NSURL)sharedFrameworksURL;
- (NSURL)sharedSupportURL;
- (__CFBundle)_cfBundle;
- (__CFBundle)_cfBundleIfPresent;
- (double)preservationPriorityForTag:(NSString *)tag;
- (id)_initUniqueWithPath:(id)a3;
- (id)_initUniqueWithURL:(id)a3;
- (id)_localizedStringNoCacheNoMarkdownParsingForKey:(id)a3 value:(id)a4 table:(id)a5 localizations:(id)a6 actualTableURL:(id *)a7 formatSpecifierConfiguration:(id *)a8;
- (id)_localizedStringsForKeys:(id)a3 forAllLocalizationsOfTable:(id)a4;
- (id)_objectForUnlocalizedInfoDictionaryKey:(id)a3;
- (id)_wrappedBundleURL;
- (id)_wrapperContainerURL;
- (id)bundleLanguages;
- (id)description;
- (id)findBundleResourceURLsCallingMethod:(SEL)a3 passingTest:(id)a4;
- (id)localizedAttributedStringForKey:(id)a3 value:(id)a4 table:(id)a5 localization:(id)a6;
- (id)localizedStringForKey:(id)a3 value:(id)a4 table:(id)a5 localization:(id)a6;
- (id)localizedStringForKey:(id)a3 value:(id)a4 table:(id)a5 localizations:(id)a6;
- (id)localizedStringsForTable:(id)a3 localization:(id)a4;
- (id)objectForInfoDictionaryKey:(NSString *)key;
- (unint64_t)versionNumber;
- (void)__static;
- (void)dealloc;
- (void)invalidateResourceCache;
- (void)setPreservationPriority:(double)a3 forTag:(id)a4;
- (void)setPreservationPriority:(double)priority forTags:(NSSet *)tags;
@end

@implementation NSBundle

- (NSBundle)initWithPath:(NSString *)path
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  v5 = (void *)normalizedPath(path);
  int v6 = atomic_load(&self->_flags);
  if ((v6 & 0x10000000) != 0
    || (v7 = (id *)+[__NSBundleTables bundleTables](), (v8 = -[__NSBundleTables bundleForPath:](v7, (uint64_t)v5)) == 0))
  {
    v10 = (void *)[v5 _stringByResolvingSymlinksInPathUsingCache:1];
    if (!v10 || (v11 = v10, [v10 isEqual:&stru_1ECA5C228]))
    {
      v12 = _NSOSLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v29 = path;
        _os_log_error_impl(&dword_181795000, v12, OS_LOG_TYPE_ERROR, "NSBundle %@ initWithPath failed because the resolved path is empty or nil", buf, 0xCu);
      }

      return 0;
    }
    p_flags = &self->_flags;
    int v14 = atomic_load(&self->_flags);
    if ((v14 & 0x10000000) == 0)
    {
      v15 = (id *)+[__NSBundleTables bundleTables]();
      v16 = -[__NSBundleTables bundleForPath:](v15, (uint64_t)v11);
      if (v16) {
        goto LABEL_23;
      }
      memset(&v27, 0, sizeof(v27));
      if (![v11 getFileSystemRepresentation:buf maxLength:1024]
        || stat((const char *)buf, &v27))
      {
        goto LABEL_23;
      }
      if (access((const char *)buf, 4))
      {
        getpid();
        sandbox_check();
LABEL_23:

        return (NSBundle *)v16;
      }
      if ((v27.st_mode & 0xF000) != 0x4000) {
        goto LABEL_23;
      }
    }
    int v17 = [v11 hasSuffix:@".framework"];
    unint64_t v18 = 0x20000;
    if (v17) {
      unint64_t v18 = 0x40000;
    }
    atomic_fetch_or((atomic_ullong *volatile)p_flags, v18);
    self->_initialPath = (id)[v5 copy];
    self->_resolvedPath = (id)[v11 copy];
    self->_lock._os_unfair_lock_opaque = 0;
    int v19 = atomic_load(p_flags);
    if ((v19 & 0x10000000) != 0)
    {
      CFURLRef v25 = CFURLCreateWithFileSystemPath(0, (CFStringRef)self->_resolvedPath, kCFURLPOSIXPathStyle, 1u);
      atomic_store(_CFBundleCreateUnique(), (unint64_t *)&self->_cfBundle);
      CFRelease(v25);
      return self;
    }
    v20 = (id *)+[__NSBundleTables bundleTables]();
    unint64_t v21 = atomic_load(&self->_flags);
    v22 = -[__NSBundleTables addBundleIfNeeded:forPath:withType:isImmortal:](v20, self, (uint64_t)v11, v21 & 0xF0000, 1);
    if (!v22)
    {
      atomic_fetch_or((atomic_ullong *volatile)&self->_flags, 8uLL);
      return self;
    }
    v23 = v22;

    return (NSBundle *)v23;
  }
  v26 = v8;

  return (NSBundle *)v26;
}

+ (NSBundle)bundleForClass:(Class)aClass
{
  if (aClass)
  {
    Class = object_getClass(aClass);
    if (class_respondsToSelector(Class, sel_bundleForClass))
    {
      v5 = (NSBundle *)[(objc_class *)aClass bundleForClass];
      if (objc_opt_isKindOfClass())
      {
        if (v5) {
          return v5;
        }
      }
    }
    int v6 = (id *)+[__NSBundleTables bundleTables]();
    v5 = (NSBundle *)-[__NSBundleTables bundleForClass:](v6, (uint64_t)aClass);
    if (v5) {
      return v5;
    }
    ImageName = class_getImageName(aClass);
    if (ImageName)
    {
      uint64_t v9 = (uint64_t)ImageName;
      size_t v10 = strnlen(ImageName, 0x402uLL);
      id v11 = _NSFileSystemRepresentationString(v9, v10);
      v12 = (void *)normalizedPath(v11);
      if (v12)
      {
        v13 = v12;
        int v14 = _NSFrameworkPathFromLibraryPath(v12);
        if (v14 || (int v14 = _NSBundlePathFromExecutablePath(v13)) != 0)
        {
          v15 = [[NSBundle alloc] initWithPath:v14];
          if (v15)
          {
            v5 = v15;
            atomic_fetch_or((atomic_ullong *volatile)&v15->_flags, 0x4000000uLL);
            atomic_fetch_or((atomic_ullong *volatile)&v15->_flags, 0x30000uLL);
            atomic_fetch_or((atomic_ullong *volatile)&v15->_flags, 8uLL);
            v16 = (id *)+[__NSBundleTables bundleTables]();
            -[__NSBundleTables addBundle:forPath:withType:forClass:isImmortal:](v16, v5, 0, 196608, (uint64_t)aClass, 1);
            return v5;
          }
        }
      }
    }
  }

  return +[NSBundle mainBundle];
}

- (void)dealloc
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  p_flags = &self->_flags;
  int v5 = atomic_load(&self->_flags);
  if ((v5 & 0x4000000) != 0) {
    [(NSBundle *)self unload];
  }
  unint64_t v6 = atomic_load(p_flags);
  if ((v6 & 0xD0000) == 0x10000)
  {
    v7 = _NSOSLog();
    BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_ERROR);
    if (v8)
    {
      *(_DWORD *)buf = 138413058;
      int v19 = _NSMethodExceptionProem((objc_class *)self, a2);
      __int16 v20 = 2048;
      unint64_t v21 = self;
      __int16 v22 = 2112;
      v23 = [(NSBundle *)self bundleIdentifier];
      __int16 v24 = 2112;
      CFURLRef v25 = [(NSBundle *)self bundleURL];
      _os_log_error_impl(&dword_181795000, v7, OS_LOG_TYPE_ERROR, "%@: attempt to deallocate static bundle - break on _NSBundleDeallocatingStaticBundle to debug. This bundle %p would have been overreleased, but will instead be preserved.\n\tBundle Identifier: %@\n\tBundle URL: %@", buf, 0x2Au);
    }
    destructiveProjectEnumData for PredicateCodableError(v8, v9);
    if (NSZombieEnabled) {
LABEL_18:
    }
      __break(1u);
  }
  else
  {
    char v10 = atomic_load(&self->_flags);
    if ((v10 & 8) != 0)
    {
      id v11 = _NSOSLog();
      BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_ERROR);
      if (v12)
      {
        *(_DWORD *)buf = 138413058;
        int v19 = _NSMethodExceptionProem((objc_class *)self, a2);
        __int16 v20 = 2048;
        unint64_t v21 = self;
        __int16 v22 = 2112;
        v23 = [(NSBundle *)self bundleIdentifier];
        __int16 v24 = 2112;
        CFURLRef v25 = [(NSBundle *)self bundleURL];
        _os_log_error_impl(&dword_181795000, v11, OS_LOG_TYPE_ERROR, "%@: attempting to deallocate an immortal bundle - break on _NSBundleDeallocatingImmortalBundle to debug. This bundle %p has been overreleased.\n\tBundle Identifier: %@\n\tBundle URL: %@", buf, 0x2Au);
      }
      destructiveProjectEnumData for PredicateCodableError(v12, v13);
      if (NSZombieEnabled) {
        goto LABEL_18;
      }
    }
    if (atomic_load((unint64_t *)&self->_cfBundle))
    {
      v15 = (void *)atomic_load((unint64_t *)&self->_cfBundle);
    }
    attributedStringTable = self->_attributedStringTable;
    if (attributedStringTable) {

    }
    v17.receiver = self;
    v17.super_class = (Class)NSBundle;
    [(NSBundle *)&v17 dealloc];
  }
}

- (Class)classNamed:(NSString *)className
{
  [(NSBundle *)self load];
  int v5 = NSClassFromString(className);
  if ((NSBundle *)[(id)objc_opt_class() bundleForClass:v5] == self) {
    return v5;
  }
  else {
    return 0;
  }
}

- (Class)principalClass
{
  if (self->_principalClass)
  {
    os_unfair_lock_unlock(&self->_lock);
  }
  else
  {
    self->_principalClass = _NSBundleGetPrincipalClassFromInfoDict((unint64_t *)self);
    os_unfair_lock_unlock(&self->_lock);
    _NSBundleInitializePrincipalClass((uint64_t)self->_principalClass);
  }
  return self->_principalClass;
}

- (BOOL)load
{
  return [(NSBundle *)self loadAndReturnError:0];
}

- (NSArray)preferredLocalizations
{
  v2 = [(NSBundle *)self localizations];

  return +[NSBundle preferredLocalizationsFromArray:v2];
}

- (NSArray)localizations
{
  v2 = [(NSBundle *)self _cfBundle];
  if (v2) {
    v2 = CFBundleCopyBundleLocalizations(v2);
  }

  return (NSArray *)v2;
}

- (BOOL)loadAndReturnError:(NSError *)error
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  int v5 = atomic_load(&self->_flags);
  if ((v5 & 0x4000000) != 0)
  {
    os_unfair_lock_unlock(p_lock);
    return 1;
  }
  unint64_t v6 = (void *)[MEMORY[0x1E4F1CA48] array];
  context = (void *)MEMORY[0x185308110]();
  atomic_load(&self->_flags);
  v7 = [(NSBundle *)self _cfBundle];
  if (!v7)
  {
    __int16 v22 = _NSOSLog();
    BOOL v8 = (id *)error;
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v44 = [(NSBundle *)self bundleURL];
      _os_log_error_impl(&dword_181795000, v22, OS_LOG_TYPE_ERROR, "NSBundle %@ loading failed because the file does not exist", buf, 0xCu);
      if (!error)
      {
LABEL_28:
        if ((_MergedGlobals_92 & 1) == 0) {
          goto LABEL_50;
        }
LABEL_29:
        v23 = _NSOSLog();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          v31 = [(NSBundle *)self bundleURL];
          *(_DWORD *)buf = 138412290;
          v44 = v31;
          _os_log_error_impl(&dword_181795000, v23, OS_LOG_TYPE_ERROR, "NSBundle %@ loading failed because bundle loading is disabled", buf, 0xCu);
          if (!v8) {
            goto LABEL_50;
          }
        }
        else if (!v8)
        {
          goto LABEL_50;
        }
        CFGetAllocator(v7);
        id *v8 = (id)_CFBundleCreateError();
        goto LABEL_50;
      }
    }
    else if (!error)
    {
      goto LABEL_28;
    }
    *error = [[NSError alloc] initWithDomain:@"NSCocoaErrorDomain" code:4 userInfo:0];
    goto LABEL_28;
  }
  BOOL v8 = (id *)error;
  if (_MergedGlobals_92 == 1) {
    goto LABEL_29;
  }
  if (qword_1EB1ED188 != -1) {
    dispatch_once(&qword_1EB1ED188, &__block_literal_global_224);
  }
  _CFSetTSD();
  if (_CFBundleLoadExecutableAndReturnError())
  {
    uint64_t v9 = (void *)_CFGetTSD();
    if ((unint64_t)v9 >= 2 && *v9)
    {
      do
      {
        char v10 = (const char *)dyld_image_path_containing_address();
        id v11 = objc_copyClassNamesForImageHeader();
        if (v11)
        {
          uint64_t v12 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:0];
          size_t v13 = strlen(v10);
          id v14 = _NSFileSystemRepresentationString((uint64_t)v10, v13);
          v15 = _NSFrameworkPathFromLibraryPath(v14);
          if (v15 || (v15 = _NSBundlePathFromExecutablePath(v14)) != 0)
          {
            v16 = [[NSBundle alloc] initWithPath:v15];
            objc_super v17 = v16;
            if (v16)
            {
              unint64_t v18 = atomic_load(&v16->_flags);
              if ((v18 & 0xF0000) == 0x40000) {
                atomic_fetch_or((atomic_ullong *volatile)&v16->_flags, 0x4000000uLL);
              }
              if (v16 != self) {
                os_unfair_lock_lock(&v16->_lock);
              }
              if (v17 != self) {
                os_unfair_lock_unlock(&v17->_lock);
              }
              BOOL v8 = (id *)error;
              objc_msgSend(v6, "addObject:", +[NSNotification notificationWithName:object:userInfo:](NSNotification, "notificationWithName:object:userInfo:", @"NSBundleDidLoadNotification", v17, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", v12, @"NSLoadedClasses", 0)));
            }
          }
          free(v11);
        }
        uint64_t v19 = v9[1];
        ++v9;
      }
      while (v19);
    }
    int v20 = 1;
  }
  else
  {
    if (error)
    {
      *error = 0;
      __int16 v24 = _NSOSLog();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        v34 = [(NSBundle *)self bundleURL];
        v35 = *error;
        *(_DWORD *)buf = 138412546;
        v44 = v34;
        __int16 v45 = 2112;
        v46 = v35;
        _os_log_error_impl(&dword_181795000, v24, OS_LOG_TYPE_ERROR, "NSBundle %@ loading failed because of an error %@", buf, 0x16u);
      }
    }
    int v20 = 0;
  }
  CFURLRef v25 = (void *)_CFGetTSD();
  _CFSetTSD();
  if ((unint64_t)v25 >= 2)
  {
    free(v25);
    if (v20) {
      goto LABEL_40;
    }
LABEL_50:
    if (v8) {
      id v32 = *v8;
    }
    Class PrincipalClassFromInfoDict = _NSBundleGetPrincipalClassFromInfoDict((unint64_t *)self);
    os_unfair_lock_unlock(p_lock);
    _NSBundleInitializePrincipalClass((uint64_t)PrincipalClassFromInfoDict);
    return 0;
  }
  if (!v20) {
    goto LABEL_50;
  }
LABEL_40:
  atomic_fetch_or((atomic_ullong *volatile)&self->_flags, 0x4000000uLL);
  Class v26 = _NSBundleGetPrincipalClassFromInfoDict((unint64_t *)self);
  os_unfair_lock_unlock(p_lock);
  _NSBundleInitializePrincipalClass((uint64_t)v26);
  if (![v6 count]) {
    return 1;
  }
  stat v27 = +[NSNotificationCenter defaultCenter];
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  uint64_t v28 = [v6 countByEnumeratingWithState:&v39 objects:v38 count:16];
  if (!v28) {
    return 1;
  }
  uint64_t v29 = *(void *)v40;
  do
  {
    for (uint64_t i = 0; i != v28; ++i)
    {
      if (*(void *)v40 != v29) {
        objc_enumerationMutation(v6);
      }
      [(NSNotificationCenter *)v27 postNotification:*(void *)(*((void *)&v39 + 1) + 8 * i)];
    }
    uint64_t v28 = [v6 countByEnumeratingWithState:&v39 objects:v38 count:16];
    BOOL result = 1;
  }
  while (v28);
  return result;
}

+ (NSBundle)bundleWithURL:(NSURL *)url
{
  v3 = (void *)[objc_allocWithZone((Class)a1) initWithURL:url];

  return (NSBundle *)v3;
}

+ (NSBundle)bundleWithIdentifier:(NSString *)identifier
{
  if (!identifier) {
    return 0;
  }
  v4 = (__CFBundle *)MEMORY[0x185306020](identifier);
  if (!v4) {
    return 0;
  }
  CFURLRef v5 = CFBundleCopyBundleURL(v4);
  if (!v5) {
    return 0;
  }
  CFURLRef v6 = v5;
  uint64_t v7 = [(__CFURL *)v5 path];
  if (v7) {
    BOOL v8 = (NSBundle *)[a1 bundleWithPath:v7];
  }
  else {
    BOOL v8 = 0;
  }
  CFRelease(v6);
  return v8;
}

+ (NSBundle)bundleWithPath:(NSString *)path
{
  v3 = (void *)[objc_allocWithZone((Class)a1) initWithPath:path];

  return (NSBundle *)v3;
}

- (NSBundle)initWithURL:(NSURL *)url
{
  if (!url)
  {
    BOOL v8 = +[NSString stringWithFormat:@"%@: nil URL argument", _NSMethodExceptionProem((objc_class *)self, a2)];
    goto LABEL_8;
  }
  if (![(NSURL *)url isFileURL])
  {
    BOOL v8 = +[NSString stringWithFormat:@"%@: non-file URL argument", _NSMethodExceptionProem((objc_class *)self, a2)];
LABEL_8:
    uint64_t v9 = v8;

    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v9 userInfo:0]);
  }
  id v6 = [(NSURL *)url path];

  return [(NSBundle *)self initWithPath:v6];
}

- (NSString)pathForResource:(NSString *)name ofType:(NSString *)ext inDirectory:(NSString *)subpath
{
  CFURLRef v5 = [(NSBundle *)self URLForResource:name withExtension:ext subdirectory:subpath];

  return (NSString *)[(NSURL *)v5 path];
}

- (NSString)pathForResource:(NSString *)name ofType:(NSString *)ext
{
  v4 = [(NSURL *)[(NSBundle *)self URLForResource:name withExtension:ext] path];
  if (pathForResource_ofType__onceToken != -1) {
    dispatch_once(&pathForResource_ofType__onceToken, &__block_literal_global_4);
  }
  return v4;
}

- (NSURL)URLForResource:(NSString *)name withExtension:(NSString *)ext
{
  return [(NSBundle *)self URLForResource:name withExtension:ext subdirectory:0];
}

- (id)localizedAttributedStringForKey:(id)a3 value:(id)a4 table:(id)a5 localization:(id)a6
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    if (a4)
    {
      objc_super v17 = _NSStringCreateByParsingMarkdownAndOptionallyInflecting(a4, [(NSBundle *)self _cfBundle], 0, 0, 1);
      if (v17) {
        return v17;
      }
      unint64_t v18 = [NSAttributedString alloc];
      uint64_t v19 = (__CFString *)a4;
    }
    else
    {
      unint64_t v18 = [NSAttributedString alloc];
      uint64_t v19 = &stru_1ECA5C228;
    }
    __int16 v24 = [(NSAttributedString *)v18 initWithString:v19];
    goto LABEL_23;
  }
  id v11 = @"Localizable";
  if (a5 && ![a5 isEqualToString:&stru_1ECA5C228]) {
    id v11 = (__CFString *)a5;
  }
  os_unfair_lock_lock(&self->_lock);
  if (a6
    || (int v20 = self->_attributedStringTable) == 0
    || (unint64_t v21 = (void *)[(NSMutableDictionary *)v20 objectForKey:v11]) == 0
    || (uint64_t v22 = objc_msgSend((id)objc_msgSend(v21, "objectForKey:", a3), "copy")) == 0)
  {
    os_unfair_lock_unlock(&self->_lock);
    v34 = 0;
    if ([(NSBundle *)self _cfBundle])
    {
      uint64_t v12 = (void *)_CFBundleCopyLocalizedStringForLocalizationAndTableURL();
      size_t v13 = objc_msgSend(v12, "__baseAttributedString");
      if (!v13)
      {
        if (v12)
        {
          id v14 = [(NSBundle *)self _cfBundle];
          FormatSpecifierConfiguration = (void *)_CFStringGetFormatSpecifierConfiguration();
          v16 = _NSStringCreateByParsingMarkdownAndOptionallyInflecting(v12, v14, 0, FormatSpecifierConfiguration, 1);
LABEL_20:
          objc_super v17 = v16;
LABEL_31:

          if (!v17)
          {
            id v28 = a3;
            if (a4)
            {
              if ([a4 length]) {
                id v28 = a4;
              }
              else {
                id v28 = a3;
              }
            }
            objc_super v17 = [[NSAttributedString alloc] initWithString:v28];
          }
          char v29 = objc_msgSend(a5, "hasSuffix:", @".nocache", v34);
          if (!a6 && (v29 & 1) == 0)
          {
            os_unfair_lock_lock(&self->_lock);
            attributedStringTable = self->_attributedStringTable;
            if (!attributedStringTable)
            {
              attributedStringTable = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
              self->_attributedStringTable = attributedStringTable;
            }
            v31 = (void *)[(NSMutableDictionary *)attributedStringTable objectForKey:v11];
            id v32 = (void *)[(NSMutableAttributedString *)v17 copy];
            if (v31)
            {
              [v31 setObject:v32 forKey:a3];
            }
            else
            {
              id v33 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
              [v33 setObject:v32 forKey:a3];
              [(NSMutableDictionary *)self->_attributedStringTable setObject:v33 forKey:v11];
            }
            os_unfair_lock_unlock(&self->_lock);
          }
          return v17;
        }
LABEL_26:
        if (a4 && [a4 length])
        {
          Class v26 = [(NSBundle *)self _cfBundle];
          id v27 = a4;
        }
        else
        {
          Class v26 = [(NSBundle *)self _cfBundle];
          id v27 = a3;
        }
        objc_super v17 = _NSStringCreateByParsingMarkdownAndOptionallyInflecting(v27, v26, 0, 0, 1);
        uint64_t v12 = 0;
        goto LABEL_31;
      }
    }
    else
    {
      size_t v13 = objc_msgSend(0, "__baseAttributedString");
      if (!v13) {
        goto LABEL_26;
      }
      uint64_t v12 = 0;
    }
    v16 = (NSMutableAttributedString *)objc_msgSend(v13, "attributedStringByInflectingString", 0, v35);
    goto LABEL_20;
  }
  v23 = (NSAttributedString *)v22;
  os_unfair_lock_unlock(&self->_lock);
  __int16 v24 = v23;
LABEL_23:

  return v24;
}

- (NSString)resourcePath
{
  v2 = [(NSBundle *)self _cfBundle];
  if (!v2) {
    return 0;
  }
  CFURLRef v3 = CFBundleCopyResourcesDirectoryURL(v2);
  if (!v3) {
    return 0;
  }
  CFURLRef v4 = v3;
  CFURLRef v5 = (NSString *)[(__CFURL *)v3 path];
  CFRelease(v4);
  return v5;
}

- (NSString)executablePath
{
  v2 = [(NSBundle *)self _cfBundle];
  if (!v2) {
    return 0;
  }
  CFURLRef v3 = CFBundleCopyExecutableURL(v2);
  if (!v3) {
    return 0;
  }
  CFURLRef v4 = v3;
  CFURLRef v5 = (NSString *)[(__CFURL *)v3 path];
  CFRelease(v4);
  return v5;
}

- (NSString)bundlePath
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (_CFExecutableLinkedOnOrAfter()
    || (BOOL v8 = (NSString *)(id)[self->_initialPath copy]) == 0)
  {
    CFURLRef v3 = [(NSBundle *)self _cfBundle];
    if (v3)
    {
      CFURLRef v4 = CFBundleCopyBundleURL(v3);
      if (v4)
      {
        CFURLRef v5 = v4;
        id v6 = (NSString *)[(__CFURL *)v4 path];
        CFRelease(v5);
        return v6;
      }
    }
    BOOL v8 = (NSString *)(id)[self->_resolvedPath copy];
    uint64_t v9 = _NSOSLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v10 = 134218242;
      id v11 = self;
      __int16 v12 = 2112;
      size_t v13 = v8;
      _os_log_error_impl(&dword_181795000, v9, OS_LOG_TYPE_ERROR, "This bundle %p does not have a valid path. Using backstop: %@", (uint8_t *)&v10, 0x16u);
    }
  }
  return v8;
}

- (id)objectForInfoDictionaryKey:(NSString *)key
{
  id result = [(NSDictionary *)[(NSBundle *)self localizedInfoDictionary] objectForKey:key];
  if (!result)
  {
    id v6 = [(NSBundle *)self infoDictionary];
    return [(NSDictionary *)v6 objectForKey:key];
  }
  return result;
}

- (NSDictionary)localizedInfoDictionary
{
  id result = [(NSBundle *)self _cfBundle];
  if (result)
  {
    CFDictionaryRef v3 = CFBundleGetLocalInfoDictionary((CFBundleRef)result);
    return (NSDictionary *)v3;
  }
  return result;
}

- (id)localizedStringForKey:(id)a3 value:(id)a4 table:(id)a5 localizations:(id)a6
{
  id v6 = [(NSBundle *)self _cfBundle];
  if (v6) {
    id v6 = (__CFBundle *)_CFBundleCopyLocalizedStringForLocalizations();
  }

  return v6;
}

- (NSURL)URLForResource:(NSString *)name withExtension:(NSString *)ext subdirectory:(NSString *)subpath
{
  if ((!name || ![(NSString *)name length]) && (!ext || ![(NSString *)ext length])) {
    return 0;
  }
  uint64_t v9 = [(NSBundle *)self _cfBundle];
  if (v9) {
    uint64_t v9 = CFBundleCopyResourceURL(v9, (CFStringRef)name, (CFStringRef)ext, (CFStringRef)subpath);
  }

  return (NSURL *)v9;
}

- (NSString)bundleIdentifier
{
  v2 = [(NSBundle *)self infoDictionary];
  uint64_t v3 = *MEMORY[0x1E4F1CFF8];

  return (NSString *)[(NSDictionary *)v2 objectForKey:v3];
}

- (NSDictionary)infoDictionary
{
  id result = [(NSBundle *)self _cfBundle];
  if (result)
  {
    CFDictionaryRef v3 = CFBundleGetInfoDictionary((CFBundleRef)result);
    return (NSDictionary *)v3;
  }
  return result;
}

- (NSString)localizedStringForKey:(NSString *)key value:(NSString *)value table:(NSString *)tableName
{
  BOOL v8 = [(NSBundle *)self _cfBundle];
  if (v8) {
    BOOL v8 = (__CFBundle *)CFBundleCopyLocalizedString(v8, (CFStringRef)key, (CFStringRef)value, (CFStringRef)tableName);
  }

  return (NSString *)v8;
}

- (__CFBundle)_cfBundle
{
  p_cfBundle = (unint64_t *)&self->_cfBundle;
  if (!atomic_load((unint64_t *)&self->_cfBundle))
  {
    CFStringRef resolvedPath = (const __CFString *)self->_resolvedPath;
    if (resolvedPath)
    {
      CFURLRef v6 = CFURLCreateWithFileSystemPath(0, resolvedPath, kCFURLPOSIXPathStyle, 1u);
      CFBundleRef v7 = CFBundleCreate(0, v6);
      if (v7)
      {
        uint64_t v8 = 0;
        atomic_compare_exchange_strong((atomic_ullong *volatile)&self->_cfBundle, (unint64_t *)&v8, (unint64_t)v7);
        if (v8) {
          CFRelease(v7);
        }
      }
      CFRelease(v6);
    }
  }
  return (__CFBundle *)atomic_load(p_cfBundle);
}

- (NSAttributedString)localizedAttributedStringForKey:(NSString *)key value:(NSString *)value table:(NSString *)tableName
{
  return (NSAttributedString *)[(NSBundle *)self localizedAttributedStringForKey:key value:value table:tableName localization:0];
}

+ (NSArray)preferredLocalizationsFromArray:(NSArray *)localizationsArray forPreferences:(NSArray *)preferencesArray
{
  if (localizationsArray)
  {
    CFArrayRef v5 = CFBundleCopyLocalizationsForPreferences((CFArrayRef)localizationsArray, (CFArrayRef)preferencesArray);
  }
  else
  {
    CFArrayRef v5 = 0;
  }
  return (NSArray *)v5;
}

+ (NSBundle)mainBundle
{
  os_unfair_lock_lock(&stru_1EB1ED16C);
  id v3 = (id)qword_1EB1ED170;
  if (!v3)
  {
    os_unfair_lock_unlock(&stru_1EB1ED16C);
    MainBundle = CFBundleGetMainBundle();
    CFArrayRef v5 = MainBundle;
    if (MainBundle
      && (CFURLRef v6 = CFBundleCopyBundleURL(MainBundle),
          CFStringRef v7 = CFURLCopyFileSystemPath(v6, kCFURLPOSIXPathStyle),
          CFRelease(v6),
          v7))
    {
      id v3 = (id)[objc_alloc((Class)a1) initWithPath:v7];
      CFRelease(v7);
    }
    else
    {
      id v3 = 0;
    }
    os_unfair_lock_lock(&stru_1EB1ED16C);
    if (qword_1EB1ED170)
    {

      id v3 = (id)qword_1EB1ED170;
    }
    else if (v3)
    {
      uint64_t v8 = v5;
      atomic_store((unint64_t)v5, (unint64_t *)v3 + 2);
      atomic_fetch_or((atomic_ullong *volatile)v3 + 1, 0x10000uLL);
      atomic_fetch_or((atomic_ullong *volatile)v3 + 1, 0x4000000uLL);
      if (*((void *)v3 + 6))
      {
        id v9 = *((id *)v3 + 5);
        *((void *)v3 + 5) = [*((id *)v3 + 6) copy];
      }
      id v10 = +[__NSBundleTables bundleTables]();
      -[__NSBundleTables removeBundle:forPath:type:]((uint64_t)v10, v3, 0, 0x20000);
      qword_1EB1ED170 = (uint64_t)v3;
    }
  }
  os_unfair_lock_unlock(&stru_1EB1ED16C);

  return (NSBundle *)v3;
}

- (NSURL)bundleURL
{
  if (_CFExecutableLinkedOnOrAfter()
    || (id v5 = (id)[self->_initialPath copy]) == 0)
  {
    id result = [(NSBundle *)self _cfBundle];
    if (!result) {
      return result;
    }
    CFURLRef v4 = CFBundleCopyBundleURL((CFBundleRef)result);
  }
  else
  {
    CFURLRef v4 = (CFURLRef)[objc_allocWithZone(MEMORY[0x1E4F1CB10]) initFileURLWithPath:v5 isDirectory:1];
  }

  return (NSURL *)v4;
}

- (id)_objectForUnlocalizedInfoDictionaryKey:(id)a3
{
  CFURLRef v4 = [(NSBundle *)self infoDictionary];

  return [(NSDictionary *)v4 objectForKey:a3];
}

- (NSArray)URLsForResourcesWithExtension:(NSString *)ext subdirectory:(NSString *)subpath
{
  CFURLRef v6 = [(NSBundle *)self _cfBundle];
  if (v6) {
    CFURLRef v6 = CFBundleCopyResourceURLsOfType(v6, (CFStringRef)ext, (CFStringRef)subpath);
  }

  return (NSArray *)v6;
}

- (id)localizedStringForKey:(id)a3 value:(id)a4 table:(id)a5 localization:(id)a6
{
  CFURLRef v6 = [(NSBundle *)self _cfBundle];
  if (v6) {
    CFURLRef v6 = (__CFBundle *)CFBundleCopyLocalizedStringForLocalization();
  }

  return v6;
}

- (NSURL)builtInPlugInsURL
{
  v2 = [(NSBundle *)self _cfBundle];
  if (v2) {
    v2 = CFBundleCopyBuiltInPlugInsURL(v2);
  }

  return (NSURL *)v2;
}

- (BOOL)unload
{
  id v3 = [(NSBundle *)self _cfBundleIfPresent];
  if (v3)
  {
    CFURLRef v4 = v3;
    CFBundleUnloadExecutable(v3);
    if (CFBundleIsExecutableLoaded(v4))
    {
      LOBYTE(v3) = 0;
    }
    else
    {
      int v5 = atomic_load(&self->_flags);
      if ((v5 & 0x4000000) != 0) {
        atomic_fetch_and((atomic_ullong *volatile)&self->_flags, 0xFFFFFFFFF9FFFFFFLL);
      }
      LOBYTE(v3) = 1;
    }
  }
  return (char)v3;
}

- (id)description
{
  uint64_t v3 = objc_opt_class();
  CFURLRef v4 = [(NSBundle *)self bundlePath];
  BOOL v5 = [(NSBundle *)self isLoaded];
  CFURLRef v6 = @"not yet ";
  if (v5) {
    CFURLRef v6 = &stru_1ECA5C228;
  }
  return +[NSString stringWithFormat:@"%@ <%@> (%@loaded)", v3, v4, v6];
}

- (BOOL)isLoaded
{
  int v2 = atomic_load(&self->_flags);
  if ((v2 & 0x4000000) != 0)
  {
    LOBYTE(v3) = 1;
  }
  else
  {
    uint64_t v3 = [(NSBundle *)self _cfBundleIfPresent];
    if (v3) {
      LOBYTE(v3) = CFBundleIsExecutableLoaded(v3) != 0;
    }
  }
  return (char)v3;
}

- (__CFBundle)_cfBundleIfPresent
{
  return (__CFBundle *)atomic_load((unint64_t *)&self->_cfBundle);
}

+ (NSArray)preferredLocalizationsFromArray:(NSArray *)localizationsArray
{
  if (localizationsArray)
  {
    CFArrayRef v4 = CFBundleCopyPreferredLocalizationsFromArray((CFArrayRef)localizationsArray);
  }
  else
  {
    CFArrayRef v4 = 0;
  }
  return (NSArray *)v4;
}

- (NSURL)executableURL
{
  int v2 = [(NSBundle *)self _cfBundle];
  if (v2) {
    int v2 = CFBundleCopyExecutableURL(v2);
  }

  return (NSURL *)v2;
}

+ (NSArray)allBundles
{
  id v2 = +[__NSBundleTables bundleTables]();

  return (NSArray *)-[__NSBundleTables allBundles]((uint64_t)v2);
}

- (NSString)pathForResource:(NSString *)name ofType:(NSString *)ext inDirectory:(NSString *)subpath forLocalization:(NSString *)localizationName
{
  CFURLRef v6 = [(NSBundle *)self URLForResource:name withExtension:ext subdirectory:subpath localization:localizationName];

  return (NSString *)[(NSURL *)v6 path];
}

- (NSURL)URLForResource:(NSString *)name withExtension:(NSString *)ext subdirectory:(NSString *)subpath localization:(NSString *)localizationName
{
  if ((!name || ![(NSString *)name length]) && (!ext || ![(NSString *)ext length])) {
    return 0;
  }
  id v11 = [(NSBundle *)self _cfBundle];
  if (v11) {
    id v11 = CFBundleCopyResourceURLForLocalization(v11, (CFStringRef)name, (CFStringRef)ext, (CFStringRef)subpath, (CFStringRef)localizationName);
  }

  return (NSURL *)v11;
}

- (NSURL)resourceURL
{
  id v2 = [(NSBundle *)self _cfBundle];
  if (v2) {
    id v2 = CFBundleCopyResourcesDirectoryURL(v2);
  }

  return (NSURL *)v2;
}

- (id)localizedStringsForTable:(id)a3 localization:(id)a4
{
  CFArrayRef v4 = [(NSBundle *)self _cfBundle];
  if (v4) {
    CFArrayRef v4 = (__CFBundle *)CFBundleCopyLocalizedStringTableForLocalization();
  }

  return v4;
}

- (NSArray)pathsForResourcesOfType:(NSString *)ext inDirectory:(NSString *)subpath
{
  CFURLRef v6 = [(NSBundle *)self _cfBundle];
  if (!v6) {
    return 0;
  }
  CFArrayRef v7 = CFBundleCopyResourceURLsOfType(v6, (CFStringRef)ext, (CFStringRef)subpath);
  if (!v7) {
    return 0;
  }
  CFArrayRef v8 = v7;
  uint64_t v9 = [(__CFArray *)v7 count];
  id v10 = (NSArray *)[MEMORY[0x1E4F1CA48] array];
  if (v9)
  {
    for (CFIndex i = 0; i != v9; ++i)
      -[NSArray addObject:](v10, "addObject:", objc_msgSend((id)CFArrayGetValueAtIndex(v8, i), "path"));
  }
  CFRelease(v8);
  return v10;
}

- (NSArray)pathsForResourcesOfType:(NSString *)ext inDirectory:(NSString *)subpath forLocalization:(NSString *)localizationName
{
  CFArrayRef v8 = [(NSBundle *)self _cfBundle];
  if (!v8) {
    return 0;
  }
  CFArrayRef v9 = CFBundleCopyResourceURLsOfTypeForLocalization(v8, (CFStringRef)ext, (CFStringRef)subpath, (CFStringRef)localizationName);
  if (!v9) {
    return 0;
  }
  CFArrayRef v10 = v9;
  uint64_t v11 = [(__CFArray *)v9 count];
  __int16 v12 = (NSArray *)[MEMORY[0x1E4F1CA48] array];
  if (v11)
  {
    for (CFIndex i = 0; i != v11; ++i)
      -[NSArray addObject:](v12, "addObject:", objc_msgSend((id)CFArrayGetValueAtIndex(v10, i), "path"));
  }
  CFRelease(v10);
  return v12;
}

+ (NSArray)URLsForResourcesWithExtension:(NSString *)ext subdirectory:(NSString *)subpath inBundleWithURL:(NSURL *)bundleURL
{
  CFArrayRef v5 = CFBundleCopyResourceURLsOfTypeInDirectory((CFURLRef)bundleURL, (CFStringRef)ext, (CFStringRef)subpath);

  return (NSArray *)v5;
}

+ (NSURL)URLForResource:(NSString *)name withExtension:(NSString *)ext subdirectory:(NSString *)subpath inBundleWithURL:(NSURL *)bundleURL
{
  if ((!name || ![(NSString *)name length]) && (!ext || ![(NSString *)ext length])) {
    return 0;
  }
  CFURLRef v10 = CFBundleCopyResourceURLInDirectory((CFURLRef)bundleURL, (CFStringRef)name, (CFStringRef)ext, (CFStringRef)subpath);

  return (NSURL *)v10;
}

- (BOOL)preflightAndReturnError:(NSError *)error
{
  v13[1] = *MEMORY[0x1E4F143B8];
  CFArrayRef v4 = [(NSBundle *)self _cfBundle];
  v13[0] = 0;
  if (!v4)
  {
    if (error)
    {
      CFArrayRef v5 = [[NSError alloc] initWithDomain:@"NSCocoaErrorDomain" code:4 userInfo:0];
      goto LABEL_7;
    }
    return 0;
  }
  if (_MergedGlobals_92)
  {
    if (error)
    {
      CFGetAllocator(v4);
      CFArrayRef v5 = (NSError *)_CFBundleCreateError();
LABEL_7:
      CFURLRef v6 = v5;
      BOOL result = 0;
LABEL_18:
      if (!result)
      {
        __int16 v12 = v6;
        BOOL result = 0;
        *error = v12;
      }
      return result;
    }
    return 0;
  }
  if (error) {
    CFArrayRef v8 = (CFErrorRef *)v13;
  }
  else {
    CFArrayRef v8 = 0;
  }
  int v9 = CFBundlePreflightExecutable(v4, v8);
  BOOL v10 = v9 == 0;
  BOOL result = v9 != 0;
  if (!v10 || error == 0) {
    CFURLRef v6 = 0;
  }
  else {
    CFURLRef v6 = (NSError *)v13[0];
  }
  if (error) {
    goto LABEL_18;
  }
  return result;
}

+ (id)findBundleResources:(id)a3 callingMethod:(SEL)a4 directory:(id)a5 languages:(id)a6 name:(id)a7 types:(id)a8 limit:(unint64_t)a9
{
  if (a3 && (uint64_t v11 = (__CFBundle *)[a3 _cfBundle]) != 0)
  {
    if (a5) {
      CFURLRef v12 = CFURLCreateWithFileSystemPath(0, (CFStringRef)a5, kCFURLPOSIXPathStyle, 1u);
    }
    else {
      CFURLRef v12 = CFBundleCopyBundleURL(v11);
    }
    CFURLRef v13 = v12;
    if (!v12) {
      return v13;
    }
    if ([a8 count]) {
      [a8 objectAtIndex:0];
    }
    LOBYTE(v18) = 0;
  }
  else
  {
    CFURLRef v13 = CFURLCreateWithFileSystemPath(0, (CFStringRef)a5, kCFURLPOSIXPathStyle, 1u);
    if (!v13) {
      return v13;
    }
    if ([a8 count]) {
      [a8 objectAtIndex:0];
    }
    LOBYTE(v18) = 0;
  }
  Resources = (void *)_CFBundleCopyFindResources();
  CFRelease(v13);
  if (!Resources) {
    return 0;
  }
  uint64_t v15 = objc_msgSend(Resources, "count", v18, 0);
  CFURLRef v13 = (CFURLRef)[MEMORY[0x1E4F1CA48] array];
  if (v15)
  {
    for (CFIndex i = 0; i != v15; ++i)
      -[__CFURL addObject:](v13, "addObject:", objc_msgSend((id)objc_msgSend((id)CFArrayGetValueAtIndex((CFArrayRef)Resources, i), "absoluteURL"), "absoluteString"));
  }
  CFRelease(Resources);
  return v13;
}

- (id)findBundleResourceURLsCallingMethod:(SEL)a3 passingTest:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  [(NSBundle *)self _cfBundle];
  id v13 = a4;
  LOBYTE(v12) = 0;
  Resources = (void *)_CFBundleCopyFindResources();
  CFURLRef v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(Resources, "count", v12, v13));
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v7 = [Resources countByEnumeratingWithState:&v15 objects:v14 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(Resources);
        }
        objc_msgSend(v6, "addObject:", objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * v10++), "absoluteURL"));
      }
      while (v8 != v10);
      uint64_t v8 = [Resources countByEnumeratingWithState:&v15 objects:v14 count:16];
    }
    while (v8);
  }

  return v6;
}

+ (id)findBundleResourceURLsCallingMethod:(SEL)a3 baseURL:(id)a4 passingTest:(id)a5
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  LOBYTE(v12) = 0;
  Resources = (void *)_CFBundleCopyFindResources();
  CFURLRef v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(Resources, "count", v12, a5));
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v7 = [Resources countByEnumeratingWithState:&v15 objects:v14 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(Resources);
        }
        objc_msgSend(v6, "addObject:", objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * v10++), "absoluteURL"));
      }
      while (v8 != v10);
      uint64_t v8 = [Resources countByEnumeratingWithState:&v15 objects:v14 count:16];
    }
    while (v8);
  }

  return v6;
}

+ (NSString)pathForResource:(NSString *)name ofType:(NSString *)ext inDirectory:(NSString *)bundlePath
{
  if (name && [(NSString *)name length])
  {
    if (!bundlePath) {
      return 0;
    }
  }
  else
  {
    if (!ext) {
      return 0;
    }
    NSUInteger v8 = [(NSString *)ext length];
    if (!bundlePath || !v8) {
      return 0;
    }
  }
  CFURLRef v9 = CFURLCreateWithFileSystemPath(0, (CFStringRef)bundlePath, kCFURLPOSIXPathStyle, 1u);
  if (v9)
  {
    CFURLRef v10 = v9;
    CFURLRef v11 = CFBundleCopyResourceURLInDirectory(v9, (CFStringRef)name, (CFStringRef)ext, 0);
    CFRelease(v10);
    if (v11)
    {
      uint64_t v12 = (NSString *)[(__CFURL *)v11 path];
      CFRelease(v11);
      return v12;
    }
  }
  return 0;
}

+ (NSArray)pathsForResourcesOfType:(NSString *)ext inDirectory:(NSString *)bundlePath
{
  if (!bundlePath) {
    return 0;
  }
  CFURLRef v5 = CFURLCreateWithFileSystemPath(0, (CFStringRef)bundlePath, kCFURLPOSIXPathStyle, 1u);
  CFURLRef v6 = (NSArray *)v5;
  if (!v5) {
    return v6;
  }
  CFArrayRef v7 = CFBundleCopyResourceURLsOfTypeInDirectory(v5, (CFStringRef)ext, 0);
  CFRelease(v6);
  if (!v7) {
    return 0;
  }
  uint64_t v8 = [(__CFArray *)v7 count];
  CFURLRef v6 = (NSArray *)[MEMORY[0x1E4F1CA48] array];
  if (v8)
  {
    for (CFIndex i = 0; i != v8; ++i)
      -[NSArray addObject:](v6, "addObject:", objc_msgSend((id)CFArrayGetValueAtIndex(v7, i), "path"));
  }
  CFRelease(v7);
  return v6;
}

- (NSArray)URLsForResourcesWithExtension:(NSString *)ext subdirectory:(NSString *)subpath localization:(NSString *)localizationName
{
  uint64_t v8 = [(NSBundle *)self _cfBundle];
  if (v8) {
    uint64_t v8 = CFBundleCopyResourceURLsOfTypeForLocalization(v8, (CFStringRef)ext, (CFStringRef)subpath, (CFStringRef)localizationName);
  }

  return (NSArray *)v8;
}

- (id)_localizedStringsForKeys:(id)a3 forAllLocalizationsOfTable:(id)a4
{
  CFArrayRef v4 = [(NSBundle *)self _cfBundle];
  if (v4) {
    CFArrayRef v4 = (__CFBundle *)_CFBundleCopyFilteredLocalizedStringsForAllLocalizations();
  }

  return v4;
}

+ (id)_localizedStringsForKeys:(id)a3 forAllLocalizationsOfTable:(id)a4 inBundleWithURL:(id)a5
{
  CFURLRef v5 = (void *)_CFBundleCopyFilteredLocalizedStringsForAllLocalizationsForURL();

  return v5;
}

- (BOOL)_searchForLocalizedString:(id)a3 foundKey:(id *)a4 foundTable:(id *)a5
{
  if (![(NSBundle *)self _cfBundle]) {
    return 0;
  }
  int v7 = _CFBundleSearchForLocalizedString();
  int v8 = v7;
  BOOL v9 = v7 != 0;
  if (a4 && v7) {
    *a4 = 0;
  }
  if (a5 && v8) {
    *a5 = 0;
  }
  return v9;
}

- (id)_initUniqueWithURL:(id)a3
{
  return [(NSBundle *)self initWithURL:a3];
}

+ (id)_bundleWithIdentifier:(id)a3 andLibraryName:(id)a4
{
  if (!a3) {
    return 0;
  }
  CFURLRef v6 = +[NSBundle mainBundle];
  if (![(NSString *)[(NSBundle *)v6 bundleIdentifier] isEqualToString:a3])
  {
    BundleWithIdentifierAndLibraryName = (__CFBundle *)_CFBundleGetBundleWithIdentifierAndLibraryName();
    if (BundleWithIdentifierAndLibraryName)
    {
      CFURLRef v8 = CFBundleCopyBundleURL(BundleWithIdentifierAndLibraryName);
      if (v8)
      {
        CFURLRef v9 = v8;
        CFURLRef v10 = (void *)[a1 bundleWithURL:v8];
        CFRelease(v9);
        return v10;
      }
    }
    return 0;
  }
  return v6;
}

- (id)_initUniqueWithPath:(id)a3
{
  return [(NSBundle *)self initWithPath:a3];
}

- (NSURL)appStoreReceiptURL
{
  if (_iOSStyleReceipt_onceToken != -1) {
    dispatch_once(&_iOSStyleReceipt_onceToken, &__block_literal_global_240);
  }
  if (![(NSBundle *)self isEqual:+[NSBundle mainBundle]])return 0; {
  Class v3 = objc_lookUpClass("LSBundleProxy");
  }
  if (!v3) {
    return 0;
  }
  CFArrayRef v4 = (void *)[(objc_class *)v3 bundleProxyForCurrentProcess];

  return (NSURL *)[v4 appStoreReceiptURL];
}

- (id)_wrappedBundleURL
{
  id v2 = [(NSBundle *)self _cfBundle];
  if (v2) {
    id v2 = (__CFBundle *)_CFBundleCopyWrappedBundleURL();
  }

  return v2;
}

- (id)_wrapperContainerURL
{
  id v2 = [(NSBundle *)self _cfBundle];
  if (v2) {
    id v2 = (__CFBundle *)_CFBundleCopyWrapperContainerURL();
  }

  return v2;
}

- (NSString)pathForAuxiliaryExecutable:(NSString *)executableName
{
  CFArrayRef v4 = [(NSBundle *)self _cfBundle];
  if (!executableName) {
    return 0;
  }
  if (!v4) {
    return 0;
  }
  CFURLRef v5 = CFBundleCopyAuxiliaryExecutableURL(v4, (CFStringRef)executableName);
  if (!v5) {
    return 0;
  }
  CFURLRef v6 = v5;
  int v7 = (NSString *)[(__CFURL *)v5 path];
  CFRelease(v6);
  return v7;
}

- (NSURL)URLForAuxiliaryExecutable:(NSString *)executableName
{
  CFArrayRef v4 = [(NSBundle *)self _cfBundle];
  CFURLRef v5 = 0;
  if (executableName && v4) {
    CFURLRef v5 = CFBundleCopyAuxiliaryExecutableURL(v4, (CFStringRef)executableName);
  }

  return (NSURL *)v5;
}

- (NSString)privateFrameworksPath
{
  id v2 = [(NSBundle *)self _cfBundle];
  if (!v2) {
    return 0;
  }
  CFURLRef v3 = CFBundleCopyPrivateFrameworksURL(v2);
  if (!v3) {
    return 0;
  }
  CFURLRef v4 = v3;
  CFURLRef v5 = (NSString *)[(__CFURL *)v3 path];
  CFRelease(v4);
  return v5;
}

- (NSURL)privateFrameworksURL
{
  id v2 = [(NSBundle *)self _cfBundle];
  if (v2) {
    id v2 = CFBundleCopyPrivateFrameworksURL(v2);
  }

  return (NSURL *)v2;
}

- (NSString)sharedFrameworksPath
{
  id v2 = [(NSBundle *)self _cfBundle];
  if (!v2) {
    return 0;
  }
  CFURLRef v3 = CFBundleCopySharedFrameworksURL(v2);
  if (!v3) {
    return 0;
  }
  CFURLRef v4 = v3;
  CFURLRef v5 = (NSString *)[(__CFURL *)v3 path];
  CFRelease(v4);
  return v5;
}

- (NSURL)sharedFrameworksURL
{
  id v2 = [(NSBundle *)self _cfBundle];
  if (v2) {
    id v2 = CFBundleCopySharedFrameworksURL(v2);
  }

  return (NSURL *)v2;
}

- (NSString)sharedSupportPath
{
  id v2 = [(NSBundle *)self _cfBundle];
  if (!v2) {
    return 0;
  }
  CFURLRef v3 = CFBundleCopySharedSupportURL(v2);
  if (!v3) {
    return 0;
  }
  CFURLRef v4 = v3;
  CFURLRef v5 = (NSString *)[(__CFURL *)v3 path];
  CFRelease(v4);
  return v5;
}

- (NSURL)sharedSupportURL
{
  id v2 = [(NSBundle *)self _cfBundle];
  if (v2) {
    id v2 = CFBundleCopySharedSupportURL(v2);
  }

  return (NSURL *)v2;
}

- (NSString)builtInPlugInsPath
{
  id v2 = [(NSBundle *)self _cfBundle];
  if (!v2) {
    return 0;
  }
  CFURLRef v3 = CFBundleCopyBuiltInPlugInsURL(v2);
  if (!v3) {
    return 0;
  }
  CFURLRef v4 = v3;
  CFURLRef v5 = (NSString *)[(__CFURL *)v3 path];
  CFRelease(v4);
  return v5;
}

- (unint64_t)versionNumber
{
  unint64_t result = [(NSBundle *)self _cfBundle];
  if (result) {
    return CFBundleGetVersionNumber((CFBundleRef)result);
  }
  return result;
}

- (id)bundleLanguages
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v2 = [(NSBundle *)self localizations];
  CFURLRef v3 = (void *)[MEMORY[0x1E4F1CA48] array];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v4 = [(NSArray *)v2 countByEnumeratingWithState:&v10 objects:v9 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(v3, "addObject:", objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v7++), "stringByAppendingString:", @".lproj"));
      }
      while (v5 != v7);
      uint64_t v5 = [(NSArray *)v2 countByEnumeratingWithState:&v10 objects:v9 count:16];
    }
    while (v5);
  }
  return v3;
}

- (void)invalidateResourceCache
{
  if ([(NSBundle *)self _cfBundle])
  {
    MEMORY[0x1F40D8C48]();
  }
}

+ (id)loadedBundles
{
  id v2 = +[__NSBundleTables bundleTables]();

  return (id)-[__NSBundleTables loadedBundles]((uint64_t)v2);
}

- (void)__static
{
}

+ (NSArray)allFrameworks
{
  if (allFrameworks_onceToken != -1) {
    dispatch_once(&allFrameworks_onceToken, &__block_literal_global_48);
  }
  id v2 = +[__NSBundleTables bundleTables]();

  return (NSArray *)-[__NSBundleTables allFrameworks]((uint64_t)v2);
}

uint64_t __25__NSBundle_allFrameworks__block_invoke()
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v0 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  v1 = (void *)MEMORY[0x185308110]();
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  CFURLRef v3 = +[NSBundle mainBundle];
  unsigned int outCount = 0;
  uint64_t v4 = objc_copyImageNames(&outCount);
  if (v4)
  {
    uint64_t v5 = v4;
    if (outCount)
    {
      for (unint64_t i = 0; i < outCount; ++i)
      {
        uint64_t v7 = v5[i];
        size_t v8 = strnlen(v7, 0x402uLL);
        id v9 = _NSFileSystemRepresentationString((uint64_t)v7, v8);
        uint64_t v10 = normalizedPath(v9);
        if (v10)
        {
          long long v11 = (void *)v10;
          if (![v2 objectForKey:v10])
          {
            long long v12 = _NSFrameworkPathFromLibraryPath(v11);
            if (v12 || (long long v12 = _NSBundlePathFromExecutablePath(v11)) != 0)
            {
              long long v13 = [[NSBundle alloc] initWithPath:v12];
              if (v13)
              {
                uint64_t v14 = (atomic_ullong *)v13;
                [v2 setObject:v13 forKey:v11];

                atomic_fetch_or(v14 + 1, 0x4000000uLL);
                if (v3 != (NSBundle *)v14) {
                  [v0 addObject:v14];
                }
              }
            }
          }
        }
      }
    }
    free(v5);
  }

  id v15 = v0;
  id v16 = +[__NSBundleTables bundleTables]();
  return -[__NSBundleTables addStaticFrameworkBundles:]((uint64_t)v16, v15);
}

+ (id)debugDescription
{
  id v2 = (void *)[a1 loadedBundles];

  return (id)[v2 description];
}

- (NSString)developmentLocalization
{
  unint64_t result = [(NSBundle *)self _cfBundle];
  if (result)
  {
    CFURLRef v3 = (id)CFBundleGetDevelopmentRegion((CFBundleRef)result);
    return (NSString *)v3;
  }
  return result;
}

- (NSArray)executableArchitectures
{
  id v2 = [(NSBundle *)self _cfBundle];
  if (v2) {
    id v2 = CFBundleCopyExecutableArchitectures(v2);
  }

  return (NSArray *)v2;
}

- (id)_localizedStringNoCacheNoMarkdownParsingForKey:(id)a3 value:(id)a4 table:(id)a5 localizations:(id)a6 actualTableURL:(id *)a7 formatSpecifierConfiguration:(id *)a8
{
  uint64_t v10 = [(NSBundle *)self _cfBundle];
  if (v10)
  {
    long long v11 = (void *)_CFBundleCopyLocalizedStringForLocalizationTableURLAndMarkdownOption();
    uint64_t v10 = 0;
    if (!a7) {
      goto LABEL_7;
    }
  }
  else
  {
    long long v11 = 0;
    if (!a7) {
      goto LABEL_7;
    }
  }
  if (v11) {
    long long v12 = v10;
  }
  else {
    long long v12 = 0;
  }
  *a7 = v12;
LABEL_7:
  long long v13 = v10;
  if (a8)
  {
    if (v11) {
      FormatSpecifierConfiguration = (void *)_CFStringGetFormatSpecifierConfiguration();
    }
    else {
      FormatSpecifierConfiguration = 0;
    }
    *a8 = FormatSpecifierConfiguration;
  }
  return v11;
}

- (void)setPreservationPriority:(double)priority forTags:(NSSet *)tags
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = +[_NSBundleODRDataForApplications dataForBundle:createIfRequired:]((uint64_t)_NSBundleODRDataForApplications, (uint64_t)self, 1);
  if (v6)
  {
    p_isa = (id *)&v6->super.super.isa;
    initialStateGroup = v6->_initialStateGroup;
    dispatch_time_t v9 = dispatch_time(0, 3000000000);
    if (dispatch_group_wait(initialStateGroup, v9))
    {
      if (qword_1EB1E8600 != -1) {
        dispatch_once(&qword_1EB1E8600, &__block_literal_global_349);
      }
      uint64_t v10 = qword_1EB1E85F8;
      if (os_log_type_enabled((os_log_t)qword_1EB1E85F8, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)id v15 = 0;
        _os_log_debug_impl(&dword_181795000, v10, OS_LOG_TYPE_DEBUG, "Unable to connect to daemon to set preservation priority", v15, 2u);
      }
    }
    else
    {
      [p_isa[2] lock];
      long long v18 = 0u;
      long long v19 = 0u;
      long long v16 = 0u;
      long long v17 = 0u;
      uint64_t v11 = [(NSSet *)tags countByEnumeratingWithState:&v16 objects:v15 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v17;
        do
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v17 != v13) {
              objc_enumerationMutation(tags);
            }
            objc_msgSend((id)objc_msgSend(p_isa[5], "objectForKey:", *(void *)(*((void *)&v16 + 1) + 8 * i)), "setPreservationPriority:", priority);
          }
          uint64_t v12 = [(NSSet *)tags countByEnumeratingWithState:&v16 objects:v15 count:16];
        }
        while (v12);
      }
      [p_isa[2] unlock];
      objc_msgSend((id)objc_msgSend(+[NSBundleResourceRequest _connection](NSBundleResourceRequest, "_connection"), "remoteObjectProxy"), "setPreservationPriority:forTags:inBundle:", tags, objc_msgSend(p_isa[3], "bundleURL"), priority);
    }
  }
}

- (void)setPreservationPriority:(double)a3 forTag:(id)a4
{
  uint64_t v6 = [MEMORY[0x1E4F1CAD0] setWithObject:a4];

  [(NSBundle *)self setPreservationPriority:v6 forTags:a3];
}

- (double)preservationPriorityForTag:(NSString *)tag
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = +[_NSBundleODRDataForApplications dataForBundle:createIfRequired:]((uint64_t)_NSBundleODRDataForApplications, (uint64_t)self, 1);
  if (!v4) {
    return 0.0;
  }
  uint64_t v5 = v4;
  initialStateGroup = v4->_initialStateGroup;
  dispatch_time_t v7 = dispatch_time(0, 3000000000);
  if (dispatch_group_wait(initialStateGroup, v7))
  {
    if (qword_1EB1E8600 != -1) {
      dispatch_once(&qword_1EB1E8600, &__block_literal_global_349);
    }
    size_t v8 = qword_1EB1E85F8;
    double v9 = 1.0;
    if (os_log_type_enabled((os_log_t)qword_1EB1E85F8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)uint64_t v12 = 0;
      _os_log_debug_impl(&dword_181795000, v8, OS_LOG_TYPE_DEBUG, "Unable to connect to daemon to get preservation priority", v12, 2u);
    }
  }
  else
  {
    [(NSLock *)v5->super._lock lock];
    objc_msgSend(-[NSDictionary objectForKey:](v5->_tagToTagState, "objectForKey:", tag), "preservationPriority");
    double v9 = v10;
    [(NSLock *)v5->super._lock unlock];
  }
  return v9;
}

@end