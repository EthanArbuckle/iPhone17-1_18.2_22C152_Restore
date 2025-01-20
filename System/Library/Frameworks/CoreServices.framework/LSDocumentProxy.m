@interface LSDocumentProxy
+ (BOOL)supportsSecureCoding;
+ (id)documentProxyForName:(id)a3 type:(id)a4 MIMEType:(id)a5;
+ (id)documentProxyForName:(id)a3 type:(id)a4 MIMEType:(id)a5 isContentManaged:(BOOL)a6 sourceAuditToken:(id *)a7;
+ (id)documentProxyForName:(id)a3 type:(id)a4 MIMEType:(id)a5 managedSourceAuditToken:(id *)a6;
+ (id)documentProxyForName:(id)a3 type:(id)a4 MIMEType:(id)a5 sourceIsManaged:(BOOL)a6;
+ (id)documentProxyForURL:(id)a3;
+ (id)documentProxyForURL:(id)a3 isContentManaged:(BOOL)a4 sourceAuditToken:(id *)a5;
+ (id)documentProxyForURL:(id)a3 managedSourceAuditToken:(id *)a4;
+ (id)documentProxyForURL:(id)a3 sourceIsManaged:(BOOL)a4;
- (BOOL)isContentManaged;
- (BOOL)isImageOrVideo;
- (BOOL)sourceIsManaged;
- (LSDocumentProxy)initWithCoder:(id)a3;
- (LSDocumentProxy)initWithURL:(id)a3 name:(id)a4 type:(id)a5 MIMEType:(id)a6 isContentManaged:(BOOL)a7 sourceAuditToken:(id *)a8;
- (NSString)MIMEType;
- (NSString)containerOwnerApplicationIdentifier;
- (NSString)name;
- (NSString)typeIdentifier;
- (NSURL)URL;
- (const)managedSourceAuditToken;
- (const)sourceAuditToken;
- (id)_boundIconInfo;
- (id)applicationsAvailableForOpeningByDraggingAndDroppingWithError:(id *)a3;
- (id)applicationsAvailableForOpeningFromAirDropWithError:(id *)a3;
- (id)applicationsAvailableForOpeningWithError:(id *)a3;
- (id)applicationsAvailableForOpeningWithHandlerRanks:(id)a3 error:(id *)a4;
- (id)applicationsAvailableForOpeningWithStyle:(unsigned __int8)a3 limit:(unint64_t)a4 XPCConnection:(id)a5 error:(id *)a6;
- (id)applicationsOrClaimBindings:(BOOL)a3 availableForOpeningWithStyle:(unsigned __int8)a4 handlerRank:(id)a5 limit:(unint64_t)a6 XPCConnection:(id)a7 error:(id *)a8;
- (id)availableClaimBindingsForMode:(unsigned __int8)a3 error:(id *)a4;
- (id)availableClaimBindingsForMode:(unsigned __int8)a3 handlerRank:(id)a4 error:(id *)a5;
- (id)availableClaimBindingsReturningError:(id *)a3;
- (id)claimBindingsAvailableForOpeningWithStyle:(unsigned __int8)a3 handlerRank:(id)a4 limit:(unint64_t)a5 XPCConnection:(id)a6 error:(id *)a7;
- (id)debugDescription;
- (id)description;
- (id)iconDataForVariant:(int)a3 withOptions:(int)a4;
- (id)uniqueIdentifier;
- (optional<LaunchServices::BindingEvaluator>)_bindingEvaluatorWithAuditToken:(SEL)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation LSDocumentProxy

- (NSString)typeIdentifier
{
  return self->_typeIdentifier;
}

- (NSURL)URL
{
  return self->_URL;
}

+ (id)documentProxyForName:(id)a3 type:(id)a4 MIMEType:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = (void *)[objc_alloc((Class)a1) initWithURL:0 name:v8 type:v9 MIMEType:v10 isContentManaged:0 sourceAuditToken:0];

  return v11;
}

- (LSDocumentProxy)initWithURL:(id)a3 name:(id)a4 type:(id)a5 MIMEType:(id)a6 isContentManaged:(BOOL)a7 sourceAuditToken:(id *)a8
{
  id v15 = a3;
  v16 = (__CFString *)a4;
  id v17 = a5;
  id v18 = a6;
  if (v16) {
    v19 = v16;
  }
  else {
    v19 = @"untitled";
  }
  v30.receiver = self;
  v30.super_class = (Class)LSDocumentProxy;
  v20 = [(LSResourceProxy *)&v30 _initWithLocalizedName:v19];
  v21 = v20;
  if (v20)
  {
    objc_storeStrong(v20 + 9, a3);
    uint64_t v22 = [(__CFString *)v19 copy];
    id v23 = v21[10];
    v21[10] = (id)v22;

    uint64_t v24 = [v17 copy];
    id v25 = v21[11];
    v21[11] = (id)v24;

    uint64_t v26 = [v18 copy];
    id v27 = v21[12];
    v21[12] = (id)v26;

    *((unsigned char *)v21 + 64) = a7;
    if (!a8) {
      a8 = (const $115C4C562B26FF47E01F9F4EA65B5887 *)_LSGetAuditTokenForSelf();
    }
    long long v28 = *(_OWORD *)&a8->var0[4];
    *((_OWORD *)v21 + 2) = *(_OWORD *)a8->var0;
    *((_OWORD *)v21 + 3) = v28;
  }

  return (LSDocumentProxy *)v21;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_MIMEType, 0);
  objc_storeStrong((id *)&self->_typeIdentifier, 0);
  objc_storeStrong((id *)&self->_name, 0);

  objc_storeStrong((id *)&self->_URL, 0);
}

+ (id)documentProxyForURL:(id)a3 isContentManaged:(BOOL)a4 sourceAuditToken:(id *)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = objc_alloc((Class)a1);
  id v10 = [v8 path];
  v11 = [v10 lastPathComponent];
  v12 = (void *)[v9 initWithURL:v8 name:v11 type:0 MIMEType:0 isContentManaged:v6 sourceAuditToken:a5];

  return v12;
}

+ (id)documentProxyForName:(id)a3 type:(id)a4 MIMEType:(id)a5 isContentManaged:(BOOL)a6 sourceAuditToken:(id *)a7
{
  BOOL v8 = a6;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = (void *)[objc_alloc((Class)a1) initWithURL:0 name:v12 type:v13 MIMEType:v14 isContentManaged:v8 sourceAuditToken:a7];

  return v15;
}

+ (id)documentProxyForURL:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)a1);
  BOOL v6 = [v4 path];
  v7 = [v6 lastPathComponent];
  BOOL v8 = (void *)[v5 initWithURL:v4 name:v7 type:0 MIMEType:0 isContentManaged:0 sourceAuditToken:0];

  return v8;
}

- (BOOL)isImageOrVideo
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v2 = [(LSDocumentProxy *)self name];
  v3 = [v2 pathExtension];

  if (v3)
  {
    id v4 = +[UTTypeRecord typeRecordsWithTag:v3 ofClass:@"public.filename-extension"];
    if (-[LSDocumentProxy isImageOrVideo]::once != -1) {
      dispatch_once(&-[LSDocumentProxy isImageOrVideo]::once, &__block_literal_global_33);
    }
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v5 = v4;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v13;
      while (2)
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v13 != v7) {
            objc_enumerationMutation(v5);
          }
          id v9 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "pedigree", (void)v12);
          char v10 = [v9 intersectsSet:-[LSDocumentProxy isImageOrVideo]::imageAndVideoTypes];

          if (v10)
          {
            LOBYTE(v6) = 1;
            goto LABEL_14;
          }
        }
        uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
LABEL_14:
  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

void __33__LSDocumentProxy_isImageOrVideo__block_invoke()
{
  uint64_t v0 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", @"public.image", @"public.video", @"public.movie", 0);
  v1 = (void *)-[LSDocumentProxy isImageOrVideo]::imageAndVideoTypes;
  -[LSDocumentProxy isImageOrVideo]::imageAndVideoTypes = v0;
}

- (NSString)containerOwnerApplicationIdentifier
{
  return 0;
}

- (const)sourceAuditToken
{
  return (const $115C4C562B26FF47E01F9F4EA65B5887 *)&self->_sourceAuditToken;
}

- (id)availableClaimBindingsReturningError:(id *)a3
{
  return [(LSDocumentProxy *)self claimBindingsAvailableForOpeningWithStyle:0 handlerRank:0 limit:-1 XPCConnection:0 error:a3];
}

- (id)availableClaimBindingsForMode:(unsigned __int8)a3 error:(id *)a4
{
  return [(LSDocumentProxy *)self claimBindingsAvailableForOpeningWithStyle:a3 handlerRank:0 limit:-1 XPCConnection:0 error:a4];
}

- (id)availableClaimBindingsForMode:(unsigned __int8)a3 handlerRank:(id)a4 error:(id *)a5
{
  id v5 = [(LSDocumentProxy *)self claimBindingsAvailableForOpeningWithStyle:a3 handlerRank:a4 limit:-1 XPCConnection:0 error:a5];

  return v5;
}

- (id)applicationsAvailableForOpeningWithHandlerRanks:(id)a3 error:(id *)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  CFSetRef v6 = (CFSetRef)a3;
  uint64_t v7 = (void *)MEMORY[0x18530F680]();
  if (!v6) {
    CFSetRef v6 = _LSCopyAllHandlerRankStrings();
  }
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  CFSetRef v9 = v6;
  uint64_t v10 = [(__CFSet *)v9 countByEnumeratingWithState:&v26 objects:v36 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v27 != v11) {
          objc_enumerationMutation(v9);
        }
        long long v13 = [[_LSDocumentProxyBindingQuery alloc] initWithDocumentProxy:self style:0 handlerRank:*(void *)(*((void *)&v26 + 1) + 8 * i)];
        if (v13) {
          [v8 addObject:v13];
        }
      }
      uint64_t v10 = [(__CFSet *)v9 countByEnumeratingWithState:&v26 objects:v36 count:16];
    }
    while (v10);
  }

  long long v14 = +[_LSQueryContext defaultContext];
  id v25 = 0;
  long long v15 = [v14 resolveQueries:v8 error:&v25];
  id v16 = v25;

  if (v15)
  {
    id v17 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __73__LSDocumentProxy_applicationsAvailableForOpeningWithHandlerRanks_error___block_invoke;
    v23[3] = &unk_1E522F1D0;
    id v18 = v17;
    uint64_t v24 = v18;
    [v15 enumerateKeysAndObjectsUsingBlock:v23];
    v19 = v24;
  }
  else
  {
    v19 = _LSDefaultLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v20 = [(__CFSet *)v9 allObjects];
      v21 = [v20 componentsJoinedByString:@", "];
      *(_DWORD *)buf = 138412802;
      v31 = self;
      __int16 v32 = 2112;
      v33 = v21;
      __int16 v34 = 2112;
      id v35 = v16;
      _os_log_impl(&dword_182959000, v19, OS_LOG_TYPE_DEFAULT, "Could not find apps for %@ (ranks %@): %@.", buf, 0x20u);
    }
    id v18 = 0;
  }

  if (a4 && !v18) {
    *a4 = v16;
  }

  return v18;
}

void __73__LSDocumentProxy_applicationsAvailableForOpeningWithHandlerRanks_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a3;
  id v5 = [a2 handlerRank];
  if (v6 && v5) {
    [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:v5];
  }
}

- (id)applicationsAvailableForOpeningWithError:(id *)a3
{
  return [(LSDocumentProxy *)self applicationsAvailableForOpeningWithStyle:0 limit:-1 XPCConnection:0 error:a3];
}

- (id)applicationsAvailableForOpeningFromAirDropWithError:(id *)a3
{
  return [(LSDocumentProxy *)self applicationsAvailableForOpeningWithStyle:1 limit:-1 XPCConnection:0 error:a3];
}

- (id)applicationsAvailableForOpeningByDraggingAndDroppingWithError:(id *)a3
{
  return [(LSDocumentProxy *)self applicationsAvailableForOpeningWithStyle:2 limit:-1 XPCConnection:0 error:a3];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (LSDocumentProxy)initWithCoder:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)LSDocumentProxy;
  id v5 = [(LSResourceProxy *)&v20 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = objc_msgSend(v4, "ls_decodeObjectOfClass:forKey:", objc_opt_class(), @"URL");
    URL = v5->_URL;
    v5->_URL = (NSURL *)v6;

    uint64_t v8 = objc_msgSend(v4, "ls_decodeObjectOfClass:forKey:", objc_opt_class(), @"name");
    name = v5->_name;
    v5->_name = (NSString *)v8;

    uint64_t v10 = objc_msgSend(v4, "ls_decodeObjectOfClass:forKey:", objc_opt_class(), @"typeIdentifier");
    typeIdentifier = v5->_typeIdentifier;
    v5->_typeIdentifier = (NSString *)v10;

    uint64_t v12 = objc_msgSend(v4, "ls_decodeObjectOfClass:forKey:", objc_opt_class(), @"MIMEType");
    MIMEType = v5->_MIMEType;
    v5->_MIMEType = (NSString *)v12;

    v5->_isContentManaged = [v4 decodeBoolForKey:@"contentManaged"];
    long long v14 = objc_msgSend(v4, "ls_decodeObjectOfClass:forKey:", objc_opt_class(), @"sourceAuditToken");
    long long v15 = v14;
    if (v14)
    {
      if ([v14 length] == 32)
      {
        id v16 = (_OWORD *)[v15 bytes];
        long long v17 = v16[1];
        *(_OWORD *)v5->_sourceAuditToken.val = *v16;
        *(_OWORD *)&v5->_sourceAuditToken.val[4] = v17;
      }
      else
      {
        id v18 = _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F281F8], 4864, (uint64_t)"-[LSDocumentProxy initWithCoder:]", 269, 0);
        [v4 failWithError:v18];
      }
    }
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)LSDocumentProxy;
  [(LSResourceProxy *)&v6 encodeWithCoder:v4];
  [v4 encodeObject:self->_URL forKey:@"URL"];
  [v4 encodeObject:self->_name forKey:@"name"];
  [v4 encodeObject:self->_typeIdentifier forKey:@"typeIdentifier"];
  [v4 encodeObject:self->_MIMEType forKey:@"MIMEType"];
  [v4 encodeBool:self->_isContentManaged forKey:@"contentManaged"];
  id v5 = [MEMORY[0x1E4F1C9B8] dataWithBytes:&self->_sourceAuditToken length:32];
  [v4 encodeObject:v5 forKey:@"sourceAuditToken"];
}

- (id)uniqueIdentifier
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA58]);
  id v4 = [(LSDocumentProxy *)self name];

  if (v4)
  {
    id v5 = [(LSDocumentProxy *)self name];
    objc_super v6 = [v5 dataUsingEncoding:4];
    [v3 appendData:v6];
  }
  uint64_t v7 = [(LSDocumentProxy *)self typeIdentifier];

  if (v7)
  {
    uint64_t v8 = [(LSDocumentProxy *)self typeIdentifier];
    CFSetRef v9 = [v8 dataUsingEncoding:4];
    [v3 appendData:v9];
  }
  uint64_t v10 = [(LSDocumentProxy *)self MIMEType];

  if (v10)
  {
    uint64_t v11 = [(LSDocumentProxy *)self MIMEType];
    uint64_t v12 = [v11 dataUsingEncoding:4];
    [v3 appendData:v12];
  }
  BOOL v15 = [(LSDocumentProxy *)self isContentManaged];
  [v3 appendBytes:&v15 length:1];
  long long v13 = objc_msgSend(MEMORY[0x1E4F29128], "_LS_UUIDWithData:digestType:", v3, 2);

  return v13;
}

- (id)description
{
  id v3 = [NSString alloc];
  id v4 = [(LSResourceProxy *)self localizedName];
  id v5 = [(LSDocumentProxy *)self typeIdentifier];
  objc_super v6 = [(LSDocumentProxy *)self MIMEType];
  uint64_t v7 = (void *)[v3 initWithFormat:@"LSDocumentProxy: Name=%@ UTI=%@ MIMEType=%@", v4, v5, v6];

  return v7;
}

- (id)debugDescription
{
  BOOL v3 = [(LSDocumentProxy *)self isContentManaged];
  id v4 = objc_alloc(MEMORY[0x1E4F1C9B8]);
  id v5 = self;
  objc_super v6 = objc_msgSend(v4, "initWithBytes:length:", -[LSDocumentProxy sourceAuditToken](v5, "sourceAuditToken"), 32);
  id v7 = [NSString alloc];
  uint64_t v8 = objc_opt_class();
  CFSetRef v9 = [(LSDocumentProxy *)v5 URL];
  uint64_t v10 = [(LSDocumentProxy *)v5 name];
  uint64_t v11 = [(LSDocumentProxy *)v5 typeIdentifier];
  uint64_t v12 = [(LSDocumentProxy *)v5 MIMEType];
  uint64_t v13 = [v6 description];
  long long v14 = (void *)v13;
  BOOL v15 = "no";
  if (v3) {
    BOOL v15 = "yes";
  }
  id v16 = (void *)[v7 initWithFormat:@"<%@ %p> { URL: %@, Name: %@, UTI: %@, MIMEType: %@, isContentManaged: %s, sourceAuditToken: %@ }", v8, v5, v9, v10, v11, v12, v15, v13];

  return v16;
}

+ (id)documentProxyForURL:(id)a3 managedSourceAuditToken:(id *)a4
{
  id v4 = [a1 documentProxyForURL:a3 isContentManaged:a4 != 0 sourceAuditToken:a4];

  return v4;
}

+ (id)documentProxyForURL:(id)a3 sourceIsManaged:(BOOL)a4
{
  id v4 = [a1 documentProxyForURL:a3 isContentManaged:a4 sourceAuditToken:0];

  return v4;
}

+ (id)documentProxyForName:(id)a3 type:(id)a4 MIMEType:(id)a5 managedSourceAuditToken:(id *)a6
{
  objc_super v6 = [a1 documentProxyForName:a3 type:a4 MIMEType:a5 isContentManaged:a6 != 0 sourceAuditToken:a6];

  return v6;
}

+ (id)documentProxyForName:(id)a3 type:(id)a4 MIMEType:(id)a5 sourceIsManaged:(BOOL)a6
{
  objc_super v6 = [a1 documentProxyForName:a3 type:a4 MIMEType:a5 isContentManaged:a6 sourceAuditToken:0];

  return v6;
}

- (BOOL)sourceIsManaged
{
  return self->_isContentManaged;
}

- (const)managedSourceAuditToken
{
  return (const $115C4C562B26FF47E01F9F4EA65B5887 *)&self->_sourceAuditToken;
}

- (BOOL)isContentManaged
{
  return self->_isContentManaged;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)MIMEType
{
  return self->_MIMEType;
}

- (optional<LaunchServices::BindingEvaluator>)_bindingEvaluatorWithAuditToken:(SEL)a3
{
  v22[21] = *(FSNode **)MEMORY[0x1E4F143B8];
  retstr->var0.var0 = 0;
  retstr->var1 = 0;
  id v7 = [(LSDocumentProxy *)self URL];
  uint64_t v8 = v7;
  if (v7)
  {
    if ([(LaunchServices::BindingEvaluator *)v7 hasDirectoryPath]) {
      CFSetRef v9 = &kUTTypeDirectory;
    }
    else {
      CFSetRef v9 = &kUTTypeData;
    }
    BOOL v10 = +[FSNode canReadURL:v8 fromSandboxWithAuditToken:a4];
    CFStringRef v11 = *v9;
    if (v10)
    {
      LaunchServices::BindingEvaluator::CreateWithURL(v8, v22);
      std::optional<LaunchServices::BindingEvaluator>::operator=[abi:nn180100]<LaunchServices::BindingEvaluator,void>((LaunchServices::BindingEvaluator *)retstr, (const LaunchServices::BindingEvaluator *)v22);
      LaunchServices::BindingEvaluator::~BindingEvaluator((LaunchServices::BindingEvaluator *)v22);
      goto LABEL_19;
    }
  }
  else
  {
    CFStringRef v11 = 0;
  }
  uint64_t v12 = [(LSDocumentProxy *)self typeIdentifier];
  if (v12)
  {
    uint64_t v13 = [(LSDocumentProxy *)self name];
    LaunchServices::BindingEvaluator::CreateWithUTI(v12, v13, (LaunchServices::BindingEvaluator *)v22);
    std::optional<LaunchServices::BindingEvaluator>::operator=[abi:nn180100]<LaunchServices::BindingEvaluator,void>((LaunchServices::BindingEvaluator *)retstr, (const LaunchServices::BindingEvaluator *)v22);
    LaunchServices::BindingEvaluator::~BindingEvaluator((LaunchServices::BindingEvaluator *)v22);
  }
  else
  {
    long long v14 = [(LSDocumentProxy *)self name];
    BOOL v15 = [v14 pathExtension];

    if (v15)
    {
      PreferredIdentifierForTag = (LaunchServices::BindingEvaluator *)UTTypeCreatePreferredIdentifierForTag(@"public.filename-extension", v15, v11);
      if (PreferredIdentifierForTag)
      {
        long long v17 = [(LSDocumentProxy *)self name];
        LaunchServices::BindingEvaluator::CreateWithUTI(PreferredIdentifierForTag, v17, (LaunchServices::BindingEvaluator *)v22);
        std::optional<LaunchServices::BindingEvaluator>::operator=[abi:nn180100]<LaunchServices::BindingEvaluator,void>((LaunchServices::BindingEvaluator *)retstr, (const LaunchServices::BindingEvaluator *)v22);
        LaunchServices::BindingEvaluator::~BindingEvaluator((LaunchServices::BindingEvaluator *)v22);
      }
    }
    else
    {
      PreferredIdentifierForTag = [(LSDocumentProxy *)self MIMEType];
      if (PreferredIdentifierForTag)
      {
        id v18 = (LaunchServices::BindingEvaluator *)UTTypeCreatePreferredIdentifierForTag(@"public.mime-type", (CFStringRef)PreferredIdentifierForTag, v11);
        if (v18)
        {
          v19 = [(LSDocumentProxy *)self name];
          LaunchServices::BindingEvaluator::CreateWithUTI(v18, v19, (LaunchServices::BindingEvaluator *)v22);
          std::optional<LaunchServices::BindingEvaluator>::operator=[abi:nn180100]<LaunchServices::BindingEvaluator,void>((LaunchServices::BindingEvaluator *)retstr, (const LaunchServices::BindingEvaluator *)v22);
          LaunchServices::BindingEvaluator::~BindingEvaluator((LaunchServices::BindingEvaluator *)v22);
        }
      }
    }
  }
LABEL_19:
  if (!retstr->var1)
  {
    if (v11) {
      objc_super v20 = (LaunchServices::BindingEvaluator *)v11;
    }
    else {
      objc_super v20 = (LaunchServices::BindingEvaluator *)@"public.data";
    }
    LaunchServices::BindingEvaluator::CreateWithUTI(v20, 0, (LaunchServices::BindingEvaluator *)v22);
    std::optional<LaunchServices::BindingEvaluator>::operator=[abi:nn180100]<LaunchServices::BindingEvaluator,void>((LaunchServices::BindingEvaluator *)retstr, (const LaunchServices::BindingEvaluator *)v22);
    LaunchServices::BindingEvaluator::~BindingEvaluator((LaunchServices::BindingEvaluator *)v22);
  }

  return result;
}

- (id)_boundIconInfo
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  if (IconServicesLibrary(void)::frameworkLibrary
    || (IconServicesLibrary(void)::frameworkLibrary = (uint64_t)dlopen("/System/Library/PrivateFrameworks/IconServices.framework/IconServices", 2)) != 0)
  {
    uint64_t v40 = 0;
    v41 = (id *)&v40;
    uint64_t v42 = 0x3032000000;
    v43 = __Block_byref_object_copy__24;
    v44 = __Block_byref_object_dispose__24;
    id v45 = 0;
    BOOL v3 = self;
    objc_sync_enter(v3);
    v39.receiver = v3;
    v39.super_class = (Class)LSDocumentProxy;
    id v4 = [(LSResourceProxy *)&v39 _boundIconInfo];
    id v5 = [v4 applicationIdentifier];
    BOOL v6 = v5 == 0;

    if (v6)
    {
      if (_LSCurrentProcessMayMapDatabase())
      {
        id v38 = 0;
        id v35 = 0;
        id v36 = 0;
        char v37 = 0;
        if (!LaunchServices::Database::Context::status((id *)&v35))
        {
          +[_LSDServiceDomain defaultServiceDomain]();
          uint64_t v12 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
          uint64_t v13 = (LSContext *)LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&v35, v12, 0);

          -[_LSBoundIconInfo setDocumentAllowOverride:]((uint64_t)v4, 1);
          -[_LSBoundIconInfo setPrerendered:]((uint64_t)v4, 0);
          [(LSDocumentProxy *)v3 _bindingEvaluatorWithAuditToken:0];
          if (v53)
          {
            LaunchServices::BindingEvaluator::setLimit((uint64_t)v52, 1uLL);
            LaunchServices::BindingEvaluator::getCalculatedUTI((LaunchServices::BindingEvaluator *)v52, v13);
            long long v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
            if (v14)
            {
              int v34 = 0;
              uint64_t active = _UTGetActiveTypeForCFStringIdentifier(v13->db, v14, &v34);
              uint64_t v16 = active;
              if (!active || (*(unsigned char *)(active + 9) & 2) != 0)
              {
                -[_LSBoundIconInfo setFileNames:](v4, 0);
                -[_LSBoundIconInfo setIconsDictionary:](v4, 0);
                [v4 setApplicationIdentifier:@"com.apple.mobilecoretypes"];
                -[_LSBoundIconInfo setContainerURL:]((uint64_t)v4, 0);
                uint64_t v24 = (void *)[objc_alloc(MEMORY[0x1E4F1CB10]) initFileURLWithPath:@"/System/Library/CoreServices/MobileCoreTypes.bundle" isDirectory:1];
                [v4 setResourcesDirectoryURL:v24];

                -[_LSBoundIconInfo setDocumentAllowOverride:]((uint64_t)v4, 0);
              }
              else
              {
                uint64_t v28 = 0;
                long long v29 = &v28;
                uint64_t v30 = 0x3032000000;
                v31 = __Block_byref_object_copy__24;
                __int16 v32 = __Block_byref_object_dispose__24;
                id v33 = 0;
                v26[0] = 0;
                v26[1] = v26;
                v26[2] = 0x3032000000;
                v26[3] = __Block_byref_object_copy__24;
                v26[4] = __Block_byref_object_dispose__24;
                id v27 = 0;
                v46[0] = MEMORY[0x1E4F143A8];
                v46[1] = 3321888768;
                v46[2] = __42__LSDocumentProxy_Binding___boundIconInfo__block_invoke;
                v46[3] = &unk_1ECB177B8;
                v49 = &v28;
                v50 = v13;
                v48 = v26;
                id v17 = v4;
                id v47 = v17;
                std::__optional_copy_base<LaunchServices::BindingEvaluator,false>::__optional_copy_base[abi:nn180100]((LaunchServices::BindingEvaluator *)v51, (const LaunchServices::BindingEvaluator *)v52);
                id v18 = (uint64_t (**)(void, void))MEMORY[0x18530F950](v46);
                if ((v18[2](v18, v16) & 1) != 0
                  || (uint64_t v19 = _UTGetActiveTypeWithIconForNSStringIdentifier(v13->db, v14, &v34),
                      v18[2](v18, v19)))
                {
                  objc_super v20 = [(id)v29[5] bundleIdentifier];
                  [v17 setApplicationIdentifier:v20];

                  v21 = [(id)v29[5] containerURL];
                  -[_LSBoundIconInfo setContainerURL:]((uint64_t)v17, v21);

                  uint64_t v22 = [(id)v29[5] _boundIconInfo];
                  id v23 = [v22 resourcesDirectoryURL];
                  [v17 setResourcesDirectoryURL:v23];

                  -[_LSBoundIconInfo setBadge:]((uint64_t)v17, 1);
                }

                if (v51[168]) {
                  LaunchServices::BindingEvaluator::~BindingEvaluator((LaunchServices::BindingEvaluator *)v51);
                }

                _Block_object_dispose(v26, 8);
                _Block_object_dispose(&v28, 8);
              }
            }

            objc_storeStrong(v41 + 5, v4);
            if (v53) {
              LaunchServices::BindingEvaluator::~BindingEvaluator((LaunchServices::BindingEvaluator *)v52);
            }
          }
        }
        if (v35 && v37) {
          _LSContextDestroy(v35);
        }
        id v7 = v36;
        id v35 = 0;
        id v36 = 0;

        char v37 = 0;
        id v8 = v38;
        id v38 = 0;
      }
      else
      {
        BOOL v10 = +[_LSDService synchronousXPCProxyWithErrorHandler:]((uint64_t)_LSDReadService, 0);
        v25[0] = MEMORY[0x1E4F143A8];
        v25[1] = 3221225472;
        v25[2] = __42__LSDocumentProxy_Binding___boundIconInfo__block_invoke_154;
        v25[3] = &unk_1E522F1F8;
        v25[4] = v3;
        v25[5] = &v40;
        [v10 getBoundIconInfoForDocumentProxy:v3 completionHandler:v25];
      }
    }
    else
    {
      objc_storeStrong(v41 + 5, v4);
    }

    objc_sync_exit(v3);
    id v9 = v41[5];
    _Block_object_dispose(&v40, 8);
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

uint64_t __42__LSDocumentProxy_Binding___boundIconInfo__block_invoke(uint64_t a1, uint64_t a2)
{
  if (!a2) {
    goto LABEL_23;
  }
  uint64_t v3 = a2;
  if (_UTTypeHasIcon(a2)) {
    goto LABEL_3;
  }
  id v7 = (void *)_CSStringCopyCFString();
  LODWORD(v34[0]) = 0;
  uint64_t active = _UTGetActiveTypeWithIconForNSStringIdentifier(**(void ***)(a1 + 56), v7, v34);
  uint64_t v3 = active;
  if (!active)
  {

LABEL_23:
    uint64_t v20 = 0;
LABEL_24:
    LaunchServices::BindingEvaluator::getBestBinding((LaunchServices::BindingEvaluator *)(a1 + 64), v34);
    if (v38)
    {
      v21 = [LSApplicationRecord alloc];
      uint64_t v22 = [(LSApplicationRecord *)v21 _initWithContext:*(void *)(a1 + 56) bundleID:LODWORD(v34[0]) bundleData:v34[1] error:0];
      uint64_t v23 = *(void *)(*(void *)(a1 + 40) + 8);
      uint64_t v24 = *(void **)(v23 + 40);
      *(void *)(v23 + 40) = v22;

      uint64_t v25 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) compatibilityObject];
      uint64_t v26 = *(void *)(*(void *)(a1 + 48) + 8);
      id v27 = *(void **)(v26 + 40);
      *(void *)(v26 + 40) = v25;

      if (v35 && (*(_DWORD *)(v35 + 28) || *(_DWORD *)(v35 + 60)))
      {
        id v28 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        if (*(_DWORD *)(v35 + 60))
        {
          long long v29 = (void *)_CSStringCopyCFString();
          [v28 addObject:v29];
        }
        else
        {
          for (uint64_t i = 28; i != 60; i += 4)
          {
            if (!*(_DWORD *)(v35 + i)) {
              break;
            }
            __int16 v32 = (void *)_CSStringCopyCFString();
            [v28 addObject:v32];
          }
        }
        uint64_t v30 = (char *)[v28 copy];
        -[_LSBoundIconInfo setFileNames:](*(void **)(a1 + 32), v30);
      }
      else
      {
        id v28 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) _boundIconInfo];
        -[_LSBoundIconInfo iconsDictionary]((uint64_t)v28);
        uint64_t v30 = (char *)objc_claimAutoreleasedReturnValue();
        -[_LSBoundIconInfo setIconsDictionary:](*(void **)(a1 + 32), v30);
      }

      if (v38)
      {
      }
      return 1;
    }
    return v20;
  }
  int v9 = *(_DWORD *)(active + 8);

  if ((v9 & 0x200) != 0) {
    goto LABEL_23;
  }
LABEL_3:
  if ((*(unsigned char *)(v3 + 9) & 0x20) != 0)
  {
    id v6 = [[LSApplicationExtensionRecord alloc] _initWithContext:*(void *)(a1 + 56) pluginID:*(unsigned int *)(v3 + 20) pluginData:0 error:0];
    BOOL v10 = [v6 containingBundleRecord];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v10);
    }
  }
  else
  {
    id v4 = [[LSApplicationRecord alloc] _initWithContext:*(void *)(a1 + 56) bundleID:*(unsigned int *)(v3 + 20) bundleData:0 error:0];
    uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
    id v6 = *(id *)(v5 + 40);
    *(void *)(v5 + 40) = v4;
  }

  uint64_t v11 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) compatibilityObject];
  uint64_t v12 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v11;

  _UTTypeGetIconNames(**(void ***)(a1 + 56), v3);
  long long v14 = (char *)objc_claimAutoreleasedReturnValue();
  if ((*(unsigned char *)(v3 + 8) & 0x20) != 0) {
    -[_LSBoundIconInfo setDocumentAllowOverride:](*(void *)(a1 + 32), 0);
  }
  -[_LSBoundIconInfo setFileNames:](*(void **)(a1 + 32), v14);
  uint64_t v15 = _UTTypeGetIconName(**(void ***)(a1 + 56), v3);
  uint64_t v16 = _UTTypeGetGlyphName(**(void ***)(a1 + 56), v3);
  if (v15 | v16)
  {
    id v17 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v18 = v17;
    if (v15) {
      [v17 setObject:v15 forKeyedSubscript:@"UTTypeIconName"];
    }
    if (v16) {
      [v18 setObject:v15 forKeyedSubscript:@"UTTypeGlyphName"];
    }
    +[_LSLazyPropertyList lazyPropertyListWithPropertyList:]((uint64_t)_LSLazyPropertyList, v18);
    uint64_t v19 = (char *)objc_claimAutoreleasedReturnValue();
    -[_LSBoundIconInfo setIconsDictionary:](*(void **)(a1 + 32), v19);
  }
  else
  {
    -[_LSBoundIconInfo setIconsDictionary:](*(void **)(a1 + 32), 0);
  }

  uint64_t v20 = 1;
  if (-[_LSBoundIconInfo documentAllowOverride](*(void *)(a1 + 32))) {
    goto LABEL_24;
  }
  return v20;
}

void __42__LSDocumentProxy_Binding___boundIconInfo__block_invoke_154(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
    objc_storeStrong((id *)(v5 + 40), a2);
    uint64_t v6 = *(void *)(v5 + 40);
    v7.receiver = *(id *)(a1 + 32);
    v7.super_class = (Class)LSDocumentProxy;
    objc_msgSendSuper2(&v7, sel__setBoundIconInfo_, v6);
  }
}

- (id)applicationsOrClaimBindings:(BOOL)a3 availableForOpeningWithStyle:(unsigned __int8)a4 handlerRank:(id)a5 limit:(unint64_t)a6 XPCConnection:(id)a7 error:(id *)a8
{
  uint64_t v10 = a4;
  BOOL v11 = a3;
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v13 = a5;
  id v14 = a7;
  uint64_t v15 = (void *)MEMORY[0x18530F680]();
  long long v29 = v13;
  id v36 = [[_LSDocumentProxyBindingQuery alloc] initWithDocumentProxy:self style:v10 handlerRank:v13];
  [(_LSDocumentProxyBindingQuery *)v36 setYieldClaimBindings:v11];
  uint64_t v16 = +[_LSQueryContext defaultContext];
  id v17 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithObjects:&v36 count:1];
  if (v14)
  {
    id v35 = 0;
    id v18 = [v16 _resolveQueries:v17 XPCConnection:v14 error:&v35];
    id v19 = v35;
    uint64_t v20 = [v18 allValues];
    uint64_t v21 = [v20 firstObject];
  }
  else
  {
    id v34 = 0;
    id v18 = [v16 resolveQueries:v17 error:&v34];
    id v19 = v34;
    uint64_t v20 = [v18 allValues];
    uint64_t v21 = [v20 firstObject];
  }
  uint64_t v22 = (void *)v21;

  if (v22)
  {
    id v23 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    uint64_t v24 = v22;
    uint64_t v25 = [v24 countByEnumeratingWithState:&v30 objects:v41 count:16];
    if (v25)
    {
      uint64_t v26 = *(void *)v31;
      do
      {
        for (uint64_t i = 0; i != v25; ++i)
        {
          if (*(void *)v31 != v26) {
            objc_enumerationMutation(v24);
          }
          [v23 addObject:*(void *)(*((void *)&v30 + 1) + 8 * i)];
        }
        uint64_t v25 = [v24 countByEnumeratingWithState:&v30 objects:v41 count:16];
      }
      while (v25);
    }
  }
  else
  {
    uint64_t v24 = _LSDefaultLog();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      char v38 = self;
      __int16 v39 = 2112;
      id v40 = v19;
      _os_log_impl(&dword_182959000, v24, OS_LOG_TYPE_DEFAULT, "Could not find apps for %@: %@.", buf, 0x16u);
    }
    id v23 = 0;
  }

  if (a8 && !v23) {
    *a8 = v19;
  }

  return v23;
}

- (id)applicationsAvailableForOpeningWithStyle:(unsigned __int8)a3 limit:(unint64_t)a4 XPCConnection:(id)a5 error:(id *)a6
{
  uint64_t v6 = [(LSDocumentProxy *)self applicationsOrClaimBindings:0 availableForOpeningWithStyle:a3 handlerRank:0 limit:a4 XPCConnection:a5 error:a6];

  return v6;
}

- (id)claimBindingsAvailableForOpeningWithStyle:(unsigned __int8)a3 handlerRank:(id)a4 limit:(unint64_t)a5 XPCConnection:(id)a6 error:(id *)a7
{
  objc_super v7 = [(LSDocumentProxy *)self applicationsOrClaimBindings:1 availableForOpeningWithStyle:a3 handlerRank:a4 limit:a5 XPCConnection:a6 error:a7];

  return v7;
}

- (id)iconDataForVariant:(int)a3 withOptions:(int)a4
{
  id v4 = ((void (*)(void *, uint64_t, uint64_t))softLink_ISIconDataForResourceProxy[0])(self, *(uint64_t *)&a3, *(uint64_t *)&a4);

  return v4;
}

@end