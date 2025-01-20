@interface CPLPrivateEngineAlias
+ (BOOL)registerPrivateEngineAlias:(id)a3 error:(id *)a4;
+ (BOOL)unregisterPrivateEngineAliasWithName:(id)a3 error:(id *)a4;
+ (NSArray)registeredAliasNames;
+ (NSArray)registeredAliases;
+ (NSString)privateEngineAliasPathEnvKey;
+ (NSString)privateEnginePathEnvKey;
+ (id)_defaultBaseURL;
+ (id)_destinationURL;
+ (id)privateEngineAliasWithName:(id)a3;
+ (unint64_t)baseLibraryOptions;
+ (void)_loadNonBuiltinAliases;
+ (void)_registerAliases;
+ (void)_registerPrivateEngineAlias:(id)a3 builtin:(BOOL)a4;
+ (void)_saveNonBuiltinAliases;
+ (void)setOverridePrivateEngineAliasPath:(id)a3;
- (CPLPrivateEngineAlias)initWithName:(id)a3 mainScopeIdentifier:(id)a4 libraryIdentifier:(id)a5 libraryOptions:(unint64_t)a6 baseURL:(id)a7;
- (CPLPrivateEngineAlias)initWithName:(id)a3 universeName:(id)a4 libraryIdentifier:(id)a5 libraryOptions:(unint64_t)a6 baseURL:(id)a7;
- (CPLPrivateEngineAlias)initWithPlist:(id)a3;
- (NSString)aliasName;
- (NSString)libraryIdentifier;
- (NSString)mainScopeIdentifier;
- (NSString)universeName;
- (NSURL)baseURL;
- (NSURL)cplDirectoryURL;
- (id)asPlist;
- (id)newLibraryManager;
- (unint64_t)libraryOptions;
@end

@implementation CPLPrivateEngineAlias

+ (id)_defaultBaseURL
{
  v2 = +[NSProcessInfo processInfo];
  v3 = [v2 environment];

  v4 = +[CPLPrivateEngineAlias privateEnginePathEnvKey];
  uint64_t v5 = [v3 objectForKeyedSubscript:v4];
  if (v5)
  {
    v6 = (void *)v5;

LABEL_4:
    id v7 = [objc_alloc((Class)NSURL) initFileURLWithPath:v6 isDirectory:1];

    goto LABEL_5;
  }
  v6 = [v3 objectForKeyedSubscript:@"TMPDIR"];

  if (v6) {
    goto LABEL_4;
  }
  id v7 = [objc_alloc((Class)NSURL) initFileURLWithPath:@"/var/tmp" isDirectory:1];
LABEL_5:

  return v7;
}

+ (void)_registerAliases
{
  if (![(id)qword_100041390 count])
  {
    if (!qword_100041398)
    {
      v3 = +[NSProcessInfo processInfo];
      v4 = [v3 environment];
      uint64_t v5 = +[CPLPrivateEngineAlias privateEngineAliasPathEnvKey];
      uint64_t v6 = [v4 objectForKeyedSubscript:v5];
      id v7 = (void *)qword_100041398;
      qword_100041398 = v6;
    }
    byte_1000413A0 = 1;
    v8 = [CPLPrivateEngineAlias alloc];
    v9 = [(CPLPrivateEngineAlias *)v8 initWithName:silentMoverEngineAliasName universeName:silentMoverEngineUniverseName libraryIdentifier:@"CPLSilentMoverLib" libraryOptions:8 baseURL:0];
    [a1 _registerPrivateEngineAlias:v9 builtin:1];

    v10 = [CPLPrivateEngineAlias alloc];
    v11 = [(CPLPrivateEngineAlias *)v10 initWithName:normalCPLEngineAliasName universeName:0 libraryIdentifier:@"CPLPrimarySync" libraryOptions:9 baseURL:0];
    [a1 _registerPrivateEngineAlias:v11 builtin:1];

    v12 = +[NSUserDefaults standardUserDefaults];
    unsigned int v13 = [v12 BOOLForKey:@"CPLTestPrivateEngineDisableScopeSync"];

    if (v13) {
      uint64_t v14 = 9;
    }
    else {
      uint64_t v14 = 1035;
    }
    v15 = [[CPLPrivateEngineAlias alloc] initWithName:@"tests" universeName:@"UnitTests" libraryIdentifier:@"CPLUnitTests" libraryOptions:v14 baseURL:0];
    [a1 _registerPrivateEngineAlias:v15 builtin:1];

    [a1 _loadNonBuiltinAliases];
  }
}

+ (unint64_t)baseLibraryOptions
{
  if (byte_1000413A0) {
    return 8;
  }
  else {
    return 0;
  }
}

+ (NSString)privateEnginePathEnvKey
{
  return (NSString *)@"CPL_PRIVATE_ENGINE_PATH";
}

+ (NSString)privateEngineAliasPathEnvKey
{
  return (NSString *)@"CPL_PRIVATE_ENGINE_ALIAS_PATH";
}

+ (void)setOverridePrivateEngineAliasPath:(id)a3
{
}

+ (id)_destinationURL
{
  if (qword_100041398)
  {
    id v2 = (id)qword_100041398;
  }
  else
  {
    id v2 = [@"~/.cplprivateengines.plist" stringByExpandingTildeInPath];
  }
  v3 = v2;
  id v4 = [objc_alloc((Class)NSURL) initFileURLWithPath:v2 isDirectory:0];

  return v4;
}

+ (void)_saveNonBuiltinAliases
{
  id v3 = objc_alloc((Class)NSMutableArray);
  id v4 = objc_msgSend(v3, "initWithCapacity:", objc_msgSend((id)qword_1000413A8, "count"));
  uint64_t v5 = (void *)qword_1000413A8;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10000B01C;
  v8[3] = &unk_100034D28;
  id v9 = v4;
  id v6 = v4;
  [v5 enumerateKeysAndObjectsUsingBlock:v8];
  id v7 = [a1 _destinationURL];
  [v6 writeToURL:v7 error:0];
}

+ (void)_loadNonBuiltinAliases
{
  id v3 = objc_alloc((Class)NSArray);
  id v4 = [a1 _destinationURL];
  id v5 = [v3 initWithContentsOfURL:v4 error:0];

  if (v5)
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v6 = v5;
    id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v15;
      do
      {
        v10 = 0;
        do
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v14 + 1) + 8 * (void)v10);
          v12 = [CPLPrivateEngineAlias alloc];
          unsigned int v13 = -[CPLPrivateEngineAlias initWithPlist:](v12, "initWithPlist:", v11, (void)v14);
          if (v13) {
            [a1 _registerPrivateEngineAlias:v13 builtin:0];
          }

          v10 = (char *)v10 + 1;
        }
        while (v8 != v10);
        id v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v8);
    }
  }
}

+ (BOOL)registerPrivateEngineAlias:(id)a3 error:(id *)a4
{
  id v6 = a3;
  [a1 _registerAliases];
  id v7 = (void *)qword_100041390;
  id v8 = [v6 aliasName];
  uint64_t v9 = [v7 objectForKeyedSubscript:v8];

  if (v9)
  {
    v10 = [v6 aliasName];

    id v11 = +[CPLErrors cplErrorWithCode:150, @"Alias %@ is already registered", v10 description];

    if (a4)
    {
      id v11 = v11;
      *a4 = v11;
    }
  }
  else
  {
    [a1 _registerPrivateEngineAlias:v6 builtin:0];

    [a1 _saveNonBuiltinAliases];
    id v11 = 0;
  }

  return v9 == 0;
}

+ (void)_registerPrivateEngineAlias:(id)a3 builtin:(BOOL)a4
{
  id v5 = a3;
  id v6 = (void *)qword_100041390;
  id v14 = v5;
  if (!qword_100041390)
  {
    id v7 = objc_alloc_init((Class)NSMutableDictionary);
    id v8 = (void *)qword_100041390;
    qword_100041390 = (uint64_t)v7;

    id v9 = objc_alloc_init((Class)NSMutableDictionary);
    v10 = (void *)qword_1000413A8;
    qword_1000413A8 = (uint64_t)v9;

    id v5 = v14;
    id v6 = (void *)qword_100041390;
  }
  id v11 = [v5 aliasName];
  [v6 setObject:v14 forKeyedSubscript:v11];

  if (!a4)
  {
    v12 = (void *)qword_1000413A8;
    unsigned int v13 = [v14 aliasName];
    [v12 setObject:v14 forKeyedSubscript:v13];
  }
}

+ (BOOL)unregisterPrivateEngineAliasWithName:(id)a3 error:(id *)a4
{
  id v6 = a3;
  [a1 _registerAliases];
  id v7 = [(id)qword_100041390 objectForKeyedSubscript:v6];

  if (v7)
  {
    id v8 = [(id)qword_1000413A8 objectForKeyedSubscript:v6];

    if (v8)
    {
      [(id)qword_100041390 removeObjectForKey:v6];
      [(id)qword_1000413A8 removeObjectForKey:v6];
      [a1 _saveNonBuiltinAliases];
      [a1 _saveNonBuiltinAliases];
      id v9 = 0;
      BOOL v10 = 1;
      goto LABEL_9;
    }
    CFStringRef v11 = @"Can't registered builtin alias %@";
  }
  else
  {
    CFStringRef v11 = @"Unknown alias %@";
  }
  +[CPLErrors cplErrorWithCode:description:](CPLErrors, "cplErrorWithCode:description:", 150, v11, v6);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  if (a4)
  {
    id v9 = v9;
    BOOL v10 = 0;
    *a4 = v9;
  }
  else
  {
    BOOL v10 = 0;
  }
LABEL_9:

  return v10;
}

+ (id)privateEngineAliasWithName:(id)a3
{
  id v4 = a3;
  [a1 _registerAliases];
  id v5 = [(id)qword_100041390 objectForKeyedSubscript:v4];

  return v5;
}

+ (NSArray)registeredAliasNames
{
  [a1 _registerAliases];
  id v2 = [(id)qword_100041390 allKeys];
  id v3 = v2;
  if (!v2) {
    id v2 = &__NSArray0__struct;
  }
  id v4 = v2;

  return v4;
}

+ (NSArray)registeredAliases
{
  [a1 _registerAliases];
  id v2 = [(id)qword_100041390 allValues];
  id v3 = v2;
  if (!v2) {
    id v2 = &__NSArray0__struct;
  }
  id v4 = v2;

  return v4;
}

- (CPLPrivateEngineAlias)initWithName:(id)a3 mainScopeIdentifier:(id)a4 libraryIdentifier:(id)a5 libraryOptions:(unint64_t)a6 baseURL:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  if (!v15)
  {
    id v15 = [(id)objc_opt_class() _defaultBaseURL];
  }
  v29.receiver = self;
  v29.super_class = (Class)CPLPrivateEngineAlias;
  long long v16 = [(CPLPrivateEngineAlias *)&v29 init];
  if (v16)
  {
    long long v17 = (NSString *)[v12 copy];
    aliasName = v16->_aliasName;
    v16->_aliasName = v17;

    v19 = (NSString *)[v13 copy];
    mainScopeIdentifier = v16->_mainScopeIdentifier;
    v16->_mainScopeIdentifier = v19;

    v21 = (NSString *)[v14 copy];
    libraryIdentifier = v16->_libraryIdentifier;
    v16->_libraryIdentifier = v21;

    v16->_libraryOptions = a6;
    v23 = (NSURL *)[v15 copy];
    baseURL = v16->_baseURL;
    v16->_baseURL = v23;

    v25 = [v15 URLByAppendingPathComponent:v14];
    uint64_t v26 = [v25 URLByAppendingPathExtension:@"cpltestlibrary"];
    cplDirectoryURL = v16->_cplDirectoryURL;
    v16->_cplDirectoryURL = (NSURL *)v26;
  }
  return v16;
}

- (CPLPrivateEngineAlias)initWithName:(id)a3 universeName:(id)a4 libraryIdentifier:(id)a5 libraryOptions:(unint64_t)a6 baseURL:(id)a7
{
  id v11 = a7;
  id v12 = a5;
  id v13 = a3;
  id v14 = CPLPrimaryScopeIdentifierForUniverseName();
  id v15 = [(CPLPrivateEngineAlias *)self initWithName:v13 mainScopeIdentifier:v14 libraryIdentifier:v12 libraryOptions:a6 baseURL:v11];

  return v15;
}

- (CPLPrivateEngineAlias)initWithPlist:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [v4 objectForKeyedSubscript:@"name"];
    uint64_t v6 = [v4 objectForKeyedSubscript:@"identifier"];
    id v7 = (void *)v6;
    id v8 = 0;
    if (!v5 || !v6) {
      goto LABEL_30;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      id v8 = 0;
LABEL_30:

      goto LABEL_31;
    }
    id v9 = [v4 objectForKeyedSubscript:@"path"];
    if (v9)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        id v8 = 0;
LABEL_29:

        goto LABEL_30;
      }
    }
    BOOL v10 = [v4 objectForKeyedSubscript:@"mainScopeIdentifier"];
    if (v10) {
      goto LABEL_12;
    }
    id v11 = [v4 objectForKeyedSubscript:@"universe"];
    if (v11)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        BOOL v10 = 0;
        goto LABEL_24;
      }
    }
    BOOL v10 = CPLPrimaryScopeIdentifierForUniverseName();

    if (v10)
    {
LABEL_12:
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v11 = [v4 objectForKeyedSubscript:@"options"];
        if (!v11)
        {
          id v12 = [(id)objc_opt_class() baseLibraryOptions];
          goto LABEL_21;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v12 = [v11 integerValue];
LABEL_21:
          id v13 = v12;
          if (v9) {
            id v14 = [objc_alloc((Class)NSURL) initFileURLWithPath:v9 isDirectory:0];
          }
          else {
            id v14 = 0;
          }
          self = [(CPLPrivateEngineAlias *)self initWithName:v5 mainScopeIdentifier:v10 libraryIdentifier:v7 libraryOptions:v13 baseURL:v14];

          id v8 = self;
          goto LABEL_27;
        }
LABEL_24:
        id v8 = 0;
LABEL_27:

        goto LABEL_28;
      }
    }
    id v8 = 0;
LABEL_28:

    goto LABEL_29;
  }
  id v8 = 0;
LABEL_31:

  return v8;
}

- (id)asPlist
{
  v14[0] = @"name";
  id v3 = [(CPLPrivateEngineAlias *)self aliasName];
  v15[0] = v3;
  v14[1] = @"identifier";
  id v4 = [(CPLPrivateEngineAlias *)self libraryIdentifier];
  v15[1] = v4;
  v14[2] = @"mainScopeIdentifier";
  uint64_t v5 = [(CPLPrivateEngineAlias *)self mainScopeIdentifier];
  v15[2] = v5;
  uint64_t v6 = +[NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:3];
  id v7 = [v6 mutableCopy];

  id v8 = [(CPLPrivateEngineAlias *)self baseURL];
  id v9 = [(id)objc_opt_class() _defaultBaseURL];
  LOBYTE(v5) = [v8 isEqual:v9];

  if ((v5 & 1) == 0)
  {
    BOOL v10 = [(CPLPrivateEngineAlias *)self baseURL];
    id v11 = [v10 path];
    [v7 setObject:v11 forKeyedSubscript:@"path"];
  }
  id v12 = +[NSNumber numberWithUnsignedInteger:self->_libraryOptions];
  [v7 setObject:v12 forKeyedSubscript:@"options"];

  return v7;
}

- (NSString)universeName
{
  id v2 = [(CPLPrivateEngineAlias *)self mainScopeIdentifier];
  id v3 = CPLUniverseNameFromMainScopeIdentifier();

  return (NSString *)v3;
}

- (id)newLibraryManager
{
  id v3 = [(NSURL *)self->_cplDirectoryURL URLByAppendingPathComponent:@"state"];
  id v4 = [(NSURL *)self->_cplDirectoryURL URLByAppendingPathComponent:@"resources"];
  id v5 = [objc_alloc((Class)CPLLibraryManager) initWithClientLibraryBaseURL:self->_cplDirectoryURL cloudLibraryStateStorageURL:v3 cloudLibraryResourceStorageURL:v4 libraryIdentifier:self->_libraryIdentifier mainScopeIdentifier:self->_mainScopeIdentifier options:self->_libraryOptions];

  return v5;
}

- (NSString)aliasName
{
  return self->_aliasName;
}

- (NSString)mainScopeIdentifier
{
  return self->_mainScopeIdentifier;
}

- (NSString)libraryIdentifier
{
  return self->_libraryIdentifier;
}

- (unint64_t)libraryOptions
{
  return self->_libraryOptions;
}

- (NSURL)baseURL
{
  return self->_baseURL;
}

- (NSURL)cplDirectoryURL
{
  return self->_cplDirectoryURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cplDirectoryURL, 0);
  objc_storeStrong((id *)&self->_baseURL, 0);
  objc_storeStrong((id *)&self->_libraryIdentifier, 0);
  objc_storeStrong((id *)&self->_mainScopeIdentifier, 0);
  objc_storeStrong((id *)&self->_aliasName, 0);
}

@end