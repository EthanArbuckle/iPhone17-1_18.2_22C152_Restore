@interface _LSDisplayNameConstructor
+ (BOOL)showAllExtensions;
+ (NSString)suffixForRemoteXCTests;
+ (id)concatenateBaseName:(id)a3 andExtension:(id)a4;
+ (id)displayNameConstructorWithContext:(LSContext *)a3 bundle:(unsigned int)a4 bundleClass:(const unsigned int *)a5 node:(id)a6 preferredLocalizations:(id)a7 error:(id *)a8;
+ (id)displayNameConstructorWithContext:(LSContext *)a3 node:(id)a4 error:(id *)a5;
+ (id)displayNameConstructorWithContextIfNeeded:(Context *)a3 bundle:(unsigned int)a4 bundleClass:(const unsigned int *)a5 node:(id)a6 preferredLocalizations:(id)a7 error:(id *)a8;
+ (id)displayNameConstructorWithContextIfNeeded:(Context *)a3 node:(id)a4 error:(id *)a5;
+ (id)displayNameConstructorsWithContext:(LSContext *)a3 bundle:(unsigned int)a4 bundleClass:(const unsigned int *)a5 node:(id)a6 error:(id *)a7;
+ (id)displayNameConstructorsWithContext:(LSContext *)a3 node:(id)a4 error:(id *)a5;
+ (id)displayNameConstructorsWithContextIfNeeded:(Context *)a3 bundle:(unsigned int)a4 bundleClass:(const unsigned int *)a5 node:(id)a6 error:(id *)a7;
+ (id)displayNameConstructorsWithContextIfNeeded:(Context *)a3 node:(id)a4 error:(id *)a5;
+ (unsigned)prepareMimicWithPopulator:(id)a3 error:(id *)a4;
+ (void)getExtensionRange:(_NSRange *)a3 secondaryExtensionRange:(_NSRange *)a4 fromFileName:(id)a5 considerConfusables:(BOOL)a6;
+ (void)setSuffixForRemoteXCTests:(id)a3;
- (BOOL)canSetExtensionHiddenWithContext:(LSContext *)a3;
- (BOOL)isStringNaturallyRTL:(id)a3;
- (BOOL)mayHideExtensionWithContextIfNeeded:(Context *)a3;
- (BOOL)showExtensionWithContextIfNeeded:(Context *)a3 asIfShowingAllExtensions:(id)a4;
- (BOOL)wantsHiddenExtension;
- (_LSDisplayNameConstructor)init;
- (_LSDisplayNameConstructor)initWithContextIfNeeded:(Context *)a3 node:(id)a4 isDirectory:(BOOL)a5 bundleClass:(const unsigned int *)a6 desiredDisplayName:(id)a7 treatAsFSName:(BOOL)a8;
- (id)cleanSecondaryExtension:(id)a3;
- (id)combineBaseName:(id)a3 extension:(id)a4;
- (id)insertCompleteNameBiDiControlCharacters:(id)a3;
- (id)insertNameComponentBiDiControlCharacters:(id)a3;
- (id)transformBeforeCombining:(id)a3 needsBiDiControlCharacters:(BOOL *)a4;
- (id)unlocalizedNameWithContext:(LSContext *)a3;
- (id)unlocalizedNameWithContext:(LSContext *)a3 asIfShowingAllExtensions:(id)a4;
- (id)unlocalizedNameWithContextIfNeeded:(Context *)a3;
- (id)unlocalizedNameWithContextIfNeeded:(Context *)a3 asIfShowingAllExtensions:(id)a4;
- (void)getTransformedBaseName:(id *)a3 extension:(id *)a4 needsBiDiControlCharacters:(BOOL)a5[2];
- (void)getUnlocalizedBaseName:(id *)a3 extension:(id *)a4 requiresAdditionalBiDiControlCharacters:(BOOL *)a5;
- (void)initContentBitsWithDisplayName:(id)a3 treatAsFSName:(BOOL)a4;
- (void)initNamePartsWithDisplayName:(id)a3;
- (void)initNodeBitsWithContextIfNeeded:(Context *)a3 node:(id)a4 isDirectory:(BOOL)a5 bundleClass:(const unsigned int *)a6;
@end

@implementation _LSDisplayNameConstructor

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extension, 0);
  objc_storeStrong((id *)&self->_baseName, 0);

  objc_storeStrong((id *)&self->_originalName, 0);
}

- (_LSDisplayNameConstructor)initWithContextIfNeeded:(Context *)a3 node:(id)a4 isDirectory:(BOOL)a5 bundleClass:(const unsigned int *)a6 desiredDisplayName:(id)a7 treatAsFSName:(BOOL)a8
{
  BOOL v8 = a8;
  BOOL v11 = a5;
  id v15 = a4;
  id v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)_LSDisplayNameConstructor;
  v17 = [(_LSDisplayNameConstructor *)&v21 init];
  if (v15)
  {
    if (v16) {
      goto LABEL_3;
    }
LABEL_7:
    v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2, v17, @"LSDisplayNameConstructor.mm", 880, @"Invalid parameter not satisfying: %@", @"displayName != nil" object file lineNumber description];

    if (!v17) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  v19 = [MEMORY[0x1E4F28B00] currentHandler];
  [v19 handleFailureInMethod:a2, v17, @"LSDisplayNameConstructor.mm", 879, @"Invalid parameter not satisfying: %@", @"node != NULL" object file lineNumber description];

  if (!v16) {
    goto LABEL_7;
  }
LABEL_3:
  if (v17)
  {
LABEL_4:
    [(_LSDisplayNameConstructor *)v17 initNodeBitsWithContextIfNeeded:a3 node:v15 isDirectory:v11 bundleClass:a6];
    [(_LSDisplayNameConstructor *)v17 initContentBitsWithDisplayName:v16 treatAsFSName:v8];
    [(_LSDisplayNameConstructor *)v17 initNamePartsWithDisplayName:v16];
  }
LABEL_5:

  return v17;
}

- (void)initNodeBitsWithContextIfNeeded:(Context *)a3 node:(id)a4 isDirectory:(BOOL)a5 bundleClass:(const unsigned int *)a6
{
  BOOL v7 = a5;
  id v14 = a4;
  char v10 = *((unsigned char *)self + 32) & 0xFE | [v14 hasHiddenExtension];
  *((unsigned char *)self + 32) = v10;
  if (v7)
  {
    +[_LSDServiceDomain defaultServiceDomain]();
    BOOL v11 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
    v12 = (LSContext *)LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)a3, v11, 0);

    char v10 = *((unsigned char *)self + 32) & 0xFD | (2 * (_LSNodeIsPackage(v12, v14, 0) == 0));
    *((unsigned char *)self + 32) = v10;
  }
  if (a6)
  {
    int v13 = *a6;
  }
  else
  {
    int v13 = _LSGetBundleClassForNode(0, v14);
    char v10 = *((unsigned char *)self + 32);
  }
  *((unsigned char *)self + 32) = v10 & 0xFB | (4 * (v13 == 2));
}

- (void)initNamePartsWithDisplayName:(id)a3
{
  id v5 = a3;
  long long v17 = xmmword_182AF8FF0;
  [(id)objc_opt_class() getExtensionRange:&v17 secondaryExtensionRange:0 fromFileName:v5 considerConfusables:0];
  v6 = (NSString *)[v5 copy];
  originalName = self->_originalName;
  self->_originalName = v6;

  uint64_t v8 = v17;
  if ((void)v17 == 0x7FFFFFFFFFFFFFFFLL || !*((void *)&v17 + 1))
  {
    id v15 = (NSString *)objc_msgSend(v5, "copy", (void)v17);
    baseName = self->_baseName;
    self->_baseName = v15;
  }
  else
  {
    if (!(void)v17)
    {
      id v16 = [MEMORY[0x1E4F28B00] currentHandler];
      [v16 handleFailureInMethod:a2, self, @"LSDisplayNameConstructor.mm", 1039, @"Path extension allegedly starts at the beginning of the display name, which is invalid." object file lineNumber description];

      uint64_t v8 = v17;
    }
    v9 = objc_msgSend(v5, "substringToIndex:", v8 - 1, (void)v17);
    char v10 = (NSString *)[v9 copy];
    BOOL v11 = self->_baseName;
    self->_baseName = v10;

    baseName = [v5 substringFromIndex:(void)v17];
    int v13 = (NSString *)[baseName copy];
    extension = self->_extension;
    self->_extension = v13;
  }
}

- (void)initContentBitsWithDisplayName:(id)a3 treatAsFSName:(BOOL)a4
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __83___LSDisplayNameConstructor_Private__initContentBitsWithDisplayName_treatAsFSName___block_invoke;
  v4[3] = &unk_1E522EAD0;
  BOOL v5 = a4;
  v4[4] = self;
  _LSDNCWithInlineBuffer(a3, v4);
}

+ (void)getExtensionRange:(_NSRange *)a3 secondaryExtensionRange:(_NSRange *)a4 fromFileName:(id)a5 considerConfusables:(BOOL)a6
{
  if (a3)
  {
    a3->location = 0x7FFFFFFFFFFFFFFFLL;
    a3->length = 0;
  }
  if (a4)
  {
    a4->location = 0x7FFFFFFFFFFFFFFFLL;
    a4->length = 0;
  }
}

+ (id)concatenateBaseName:(id)a3 andExtension:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    id v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, a1, @"LSDisplayNameConstructor.mm", 1203, @"Invalid parameter not satisfying: %@", @"baseName != nil" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  id v15 = [MEMORY[0x1E4F28B00] currentHandler];
  [v15 handleFailureInMethod:a2, a1, @"LSDisplayNameConstructor.mm", 1204, @"Invalid parameter not satisfying: %@", @"extension != nil" object file lineNumber description];

LABEL_3:
  uint64_t v10 = [v9 length];
  if (v10)
  {
    uint64_t v11 = [v7 length];
    id v12 = (id)[objc_alloc(MEMORY[0x1E4F28E78]) initWithCapacity:v10 + v11 + 1];
    [v12 appendString:v7];
    [v12 appendString:@"."];
    [v12 appendString:v9];
  }
  else
  {
    id v12 = v7;
  }

  return v12;
}

- (id)insertNameComponentBiDiControlCharacters:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    BOOL v5 = [(_LSDisplayNameConstructor *)self isStringNaturallyRTL:v4];
    v6 = v4;
    if (v5)
    {
      v6 = objc_msgSend(MEMORY[0x1E4F28E78], "stringWithCapacity:", objc_msgSend(v4, "length") + 2);
      [v6 appendCharacters:&UNICHAR_FIRST_STRONG_ISOLATE length:1];
      [v6 appendString:v4];
      [v6 appendCharacters:&UNICHAR_POP_DIRECTIONAL_ISOLATE length:1];
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)unlocalizedNameWithContextIfNeeded:(Context *)a3 asIfShowingAllExtensions:(id)a4
{
  id v6 = a4;
  id v7 = self->_baseName;
  id v8 = self->_extension;
  if (!v8
    || ![(_LSDisplayNameConstructor *)self showExtensionWithContextIfNeeded:a3 asIfShowingAllExtensions:v6]|| ([(_LSDisplayNameConstructor *)self combineBaseName:v7 extension:v8], (v9 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    v9 = [(_LSDisplayNameConstructor *)self combineBaseName:v7 extension:0];
  }
  uint64_t v10 = (__CFString *)[v9 copy];

  if (v10) {
    uint64_t v11 = v10;
  }
  else {
    uint64_t v11 = @"?";
  }
  id v12 = v11;

  return v12;
}

- (id)combineBaseName:(id)a3 extension:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  __int16 v19 = 0;
  id v17 = v7;
  id v18 = v6;
  [(_LSDisplayNameConstructor *)self getTransformedBaseName:&v18 extension:&v17 needsBiDiControlCharacters:&v19];
  id v8 = (NSString *)v18;

  v9 = (NSString *)v17;
  int v10 = HIBYTE(v19);
  if (v19)
  {
    if ((_BYTE)v19)
    {
      uint64_t v12 = [(_LSDisplayNameConstructor *)self insertNameComponentBiDiControlCharacters:v8];

      int v10 = HIBYTE(v19);
      id v8 = (NSString *)v12;
    }
    if (v10)
    {
      uint64_t v13 = [(_LSDisplayNameConstructor *)self insertNameComponentBiDiControlCharacters:v9];

      v9 = (NSString *)v13;
    }
  }
  else if (v8 == self->_baseName && v9 == self->_extension)
  {
    uint64_t v11 = self->_originalName;
    goto LABEL_14;
  }
  if (v9)
  {
    id v14 = [(id)objc_opt_class() concatenateBaseName:v8 andExtension:v9];
  }
  else
  {
    id v14 = v8;
  }
  uint64_t v11 = v14;
  if (v19 | HIBYTE(v19))
  {
    uint64_t v15 = [(_LSDisplayNameConstructor *)self insertCompleteNameBiDiControlCharacters:v14];

    uint64_t v11 = (NSString *)v15;
  }
LABEL_14:

  return v11;
}

- (void)getTransformedBaseName:(id *)a3 extension:(id *)a4 needsBiDiControlCharacters:(BOOL)a5[2]
{
  if (a3)
  {
    if (a4) {
      goto LABEL_3;
    }
LABEL_11:
    uint64_t v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"LSDisplayNameConstructor.mm", 1267, @"Invalid parameter not satisfying: %@", @"ioExtension != NULL" object file lineNumber description];

    if (a3) {
      goto LABEL_4;
    }
    goto LABEL_12;
  }
  uint64_t v11 = [MEMORY[0x1E4F28B00] currentHandler];
  [v11 handleFailureInMethod:a2, self, @"LSDisplayNameConstructor.mm", 1266, @"Invalid parameter not satisfying: %@", @"ioBaseName != NULL" object file lineNumber description];

  if (!a4) {
    goto LABEL_11;
  }
LABEL_3:
  if (a3) {
    goto LABEL_4;
  }
LABEL_12:
  uint64_t v13 = [MEMORY[0x1E4F28B00] currentHandler];
  [v13 handleFailureInMethod:a2, self, @"LSDisplayNameConstructor.mm", 1268, @"Invalid parameter not satisfying: %@", @"ioBaseName != NULL" object file lineNumber description];

LABEL_4:
  __int16 v14 = 0;
  if (*a3)
  {
    *a3 = [(_LSDisplayNameConstructor *)self transformBeforeCombining:*a3 needsBiDiControlCharacters:(char *)&v14 + 1];
  }
  if (*a4)
  {
    *a4 = [(_LSDisplayNameConstructor *)self transformBeforeCombining:*a4 needsBiDiControlCharacters:&v14];
    BOOL v10 = v14;
  }
  else
  {
    BOOL v10 = 0;
  }
  *a5 = HIBYTE(v14);
  a5[1] = v10;
}

- (id)transformBeforeCombining:(id)a3 needsBiDiControlCharacters:(BOOL *)a4
{
  id v6 = (NSString *)a3;
  id v7 = v6;
  if (v6)
  {
    if ((*((unsigned char *)self + 32) & 8) != 0)
    {
      id v8 = v6;
      if ((*((unsigned char *)self + 32) & 0x20) != 0)
      {
        uint64_t v9 = _LSDNCBalanceBiDiControlCharacters(v6);

        id v8 = (void *)v9;
      }
      LOBYTE(v6) = [(_LSDisplayNameConstructor *)self isStringNaturallyRTL:v8];
    }
    else
    {
      LOBYTE(v6) = 0;
      id v8 = v7;
    }
  }
  else
  {
    id v8 = 0;
  }
  if (a4) {
    *a4 = (char)v6;
  }
  if (v8)
  {
    char v10 = *((unsigned char *)self + 32);
    if ((v10 & 0x10) != 0)
    {
      uint64_t v11 = [v8 stringByReplacingOccurrencesOfString:@":" withString:@"/"];

      if (!v11)
      {
        id v8 = 0;
        goto LABEL_17;
      }
      char v10 = *((unsigned char *)self + 32);
      id v8 = (void *)v11;
    }
    if ((v10 & 0x40) != 0)
    {
      uint64_t v12 = _LSDNCReplaceForbiddenCharacters((NSString *)v8, 0);

      id v8 = (void *)v12;
    }
  }
LABEL_17:

  return v8;
}

- (BOOL)showExtensionWithContextIfNeeded:(Context *)a3 asIfShowingAllExtensions:(id)a4
{
  id v6 = a4;
  id v7 = v6;
  if (v6) {
    char v8 = [v6 BOOLValue];
  }
  else {
    char v8 = [(id)objc_opt_class() showAllExtensions];
  }
  if ((v8 & 1) != 0 || ![(_LSDisplayNameConstructor *)self wantsHiddenExtension]) {
    LOBYTE(v9) = 1;
  }
  else {
    BOOL v9 = ![(_LSDisplayNameConstructor *)self mayHideExtensionWithContextIfNeeded:a3];
  }

  return v9;
}

- (BOOL)isStringNaturallyRTL:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  uint64_t v8 = 0;
  BOOL v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  if (v3)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __55___LSDisplayNameConstructor_RTL__isStringNaturallyRTL___block_invoke;
    v7[3] = &unk_1E522EB20;
    v7[4] = &v8;
    _LSDNCWithCharacters(v3, v7);
    BOOL v5 = *((unsigned char *)v9 + 24) != 0;
  }
  else
  {
    BOOL v5 = 0;
  }
  _Block_object_dispose(&v8, 8);

  return v5;
}

- (BOOL)wantsHiddenExtension
{
  return *((unsigned char *)self + 32) & 1;
}

- (BOOL)mayHideExtensionWithContextIfNeeded:(Context *)a3
{
  return self->_extension != 0;
}

- (id)unlocalizedNameWithContextIfNeeded:(Context *)a3
{
  return [(_LSDisplayNameConstructor *)self unlocalizedNameWithContextIfNeeded:a3 asIfShowingAllExtensions:0];
}

+ (id)displayNameConstructorWithContextIfNeeded:(Context *)a3 node:(id)a4 error:(id *)a5
{
  BOOL v5 = [a1 displayNameConstructorWithContextIfNeeded:a3 bundle:0 bundleClass:0 node:a4 preferredLocalizations:0 error:a5];

  return v5;
}

+ (id)displayNameConstructorWithContextIfNeeded:(Context *)a3 bundle:(unsigned int)a4 bundleClass:(const unsigned int *)a5 node:(id)a6 preferredLocalizations:(id)a7 error:(id *)a8
{
  v45[1] = *MEMORY[0x1E4F143B8];
  unsigned int v43 = a4;
  id v12 = a6;
  id v13 = a7;
  BOOL v14 = v13 != 0;
  if (a4 || ![v12 isVolume])
  {
    char v15 = 0;
    uint64_t v16 = 0;
    int v42 = 0;
    if (![v12 isDirectory]) {
      goto LABEL_8;
    }
  }
  else
  {
    int v42 = 0;
    char v15 = 1;
  }
  if ([v12 isBusyDirectory]) {
    goto LABEL_64;
  }
  uint64_t v16 = 1;
  if (v15)
  {
    id v17 = 0;
    char v18 = 1;
    __int16 v19 = v13;
    goto LABEL_23;
  }
LABEL_8:
  __int16 v19 = v13;
  if (!v13)
  {
    v20 = [v12 URL];
    __int16 v19 = objc_msgSend(v20, "ls_preferredLocalizations");
  }
  uint64_t v21 = _LSGetBRDisplayNameForContainerNode(v12, v19);
  if (v21 || (_LSGetBRDisplayNameForSideFaultFileNode(v12), (uint64_t v21 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    uint64_t v22 = 0;
    id v17 = (id)v21;
LABEL_54:
    v34 = (void *)[objc_alloc((Class)a1) initWithContextIfNeeded:a3 node:v12 isDirectory:v16 bundleClass:a5 desiredDisplayName:v17 treatAsFSName:v22];
    goto LABEL_55;
  }
  if (!a5)
  {
    if (!_LSDNCGetBundleClass((id *)&a3->_contextPointer, v12, v16, &v42, a8)) {
      goto LABEL_62;
    }
    a5 = (const unsigned int *)&v42;
  }
  if (*a5)
  {
    +[_LSDServiceDomain defaultServiceDomain]();
    v23 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
    v24 = (LSContext *)LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)a3, v23, 0);

    if (!v24)
    {
      if (!a8) {
        goto LABEL_62;
      }
      goto LABEL_68;
    }
    uint64_t v25 = v43;
    if (v43) {
      goto LABEL_19;
    }
    if (!_LSFindOrFindOrRegisterBundleNode(v24, v12, (unsigned int *)a5, 0x2000000u, 0, &v43, 0))
    {
      uint64_t v25 = v43;
LABEL_19:
      _LSBundleGetLocalizedName(v24->db, v25, 0, v12, v19, 0);
      id v17 = (id)objc_claimAutoreleasedReturnValue();
      char v18 = 0;
      goto LABEL_22;
    }
  }
  char v18 = 0;
  id v17 = 0;
LABEL_22:
  BOOL v14 = 1;
  if (!v16) {
    goto LABEL_43;
  }
LABEL_23:
  if (v17) {
    goto LABEL_43;
  }
  +[_LSDServiceDomain defaultServiceDomain]();
  v26 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
  v38 = (LaunchServices::CanonicalString **)LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)a3, v26, 0);

  if (!v38)
  {
    if (!a8) {
      goto LABEL_62;
    }
LABEL_68:
    LaunchServices::Database::Context::error((id *)&a3->_contextPointer);
    v34 = 0;
    id v17 = 0;
    *a8 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_55;
  }
  v27 = [v12 extensionWithError:a8];
  v28 = v27;
  if (v27)
  {
    if (![v27 length])
    {

      id v17 = 0;
      v28 = 0;
      goto LABEL_42;
    }
    if (v18)
    {
      id v17 = 0;
LABEL_42:

LABEL_43:
      char v33 = v18 ^ 1;
      if (v17) {
        char v33 = 1;
      }
      if (v33)
      {
        uint64_t v22 = 0;
      }
      else
      {
        id v41 = 0;
        uint64_t v22 = [v12 getResourceValue:&v41 forKey:*MEMORY[0x1E4F1C898] options:1 error:0];
        if (v22) {
          id v17 = v41;
        }
        else {
          id v17 = 0;
        }
      }
      if (v17) {
        goto LABEL_54;
      }
      goto LABEL_52;
    }
    if (a5 && *a5 == 10)
    {
      v37 = [v12 nameWithError:0];
      if (!v37 || ![(_LSDatabase *)v37 isEqual:@"myDocuments.cannedSearch"]) {
        goto LABEL_39;
      }
      if (!v14)
      {
        v30 = [v12 URL];
        __int16 v19 = objc_msgSend(v30, "ls_preferredLocalizations");
      }
      v31 = (LaunchServices::CanonicalString *)LaunchServices::CanonicalString::Find(*v38, v37, v29);
      if (v31)
      {
        uint64_t LocalizedString = LaunchServices::CanonicalString::getLocalizedString(v31);
        LaunchServices::LocalizedString::localizeUnsafely(LocalizedString, *v38, v19);
        id v17 = (id)objc_claimAutoreleasedReturnValue();

        if (v17) {
          goto LABEL_42;
        }
      }
      else
      {
LABEL_39:
      }
    }
    if ([v12 canIssueIO])
    {
      _LSBundleGetDisplayNameForNodeWithUnregisteredBundleType((void **)v38, v12, v28, 0);
      id v17 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_42;
    }
    if (a8)
    {
      uint64_t v44 = *MEMORY[0x1E4F28228];
      v45[0] = @"node had unregistered bundle type but can't issue IO to localize its name";
      v36 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v45 forKeys:&v44 count:1];
      _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28798], 5, (uint64_t)"+[_LSDisplayNameConstructor(ConstructForAnyFile) displayNameConstructorWithContextIfNeeded:bundle:bundleClass:node:preferredLocalizations:error:]", 444, v36);
      *a8 = (id)objc_claimAutoreleasedReturnValue();
    }
LABEL_62:
    v34 = 0;
    id v17 = 0;
    goto LABEL_55;
  }
LABEL_64:
  uint64_t v16 = 1;
LABEL_52:
  id v17 = [v12 nameWithError:a8];
  if (v17)
  {
    uint64_t v22 = 1;
    goto LABEL_54;
  }
  v34 = 0;
LABEL_55:

  return v34;
}

- (id)insertCompleteNameBiDiControlCharacters:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    BOOL v5 = objc_msgSend(MEMORY[0x1E4F28E78], "stringWithCapacity:", objc_msgSend(v3, "length") + 1);
    [v5 appendCharacters:&UNICHAR_LEFT_TO_RIGHT_MARK length:1];
    [v5 appendString:v4];
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)canSetExtensionHiddenWithContext:(LSContext *)a3
{
  if ((*((unsigned char *)self + 32) & 4) != 0) {
    return 0;
  }
  BOOL v5 = self->_extension;
  if (v5)
  {
    uint64_t v10 = a3;
    id v11 = 0;
    char v12 = 0;
    id v13 = 0;
    BOOL v6 = [(_LSDisplayNameConstructor *)self mayHideExtensionWithContextIfNeeded:&v10];
    if (v10 && v12) {
      _LSContextDestroy((void **)&v10->db);
    }
    id v7 = v11;
    uint64_t v10 = 0;
    id v11 = 0;

    char v12 = 0;
    id v8 = v13;
    id v13 = 0;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

+ (id)displayNameConstructorsWithContextIfNeeded:(Context *)a3 node:(id)a4 error:(id *)a5
{
  BOOL v5 = [a1 displayNameConstructorsWithContextIfNeeded:a3 bundle:0 bundleClass:0 node:a4 error:a5];

  return v5;
}

+ (id)displayNameConstructorsWithContextIfNeeded:(Context *)a3 bundle:(unsigned int)a4 bundleClass:(const unsigned int *)a5 node:(id)a6 error:(id *)a7
{
  v62[1] = *MEMORY[0x1E4F143B8];
  unsigned int v60 = a4;
  id v11 = a6;
  int v12 = [v11 isVolume];
  if (v12) {
    uint64_t v13 = 1;
  }
  else {
    uint64_t v13 = [v11 isDirectory];
  }
  int v59 = 0;
  BOOL v14 = _LSGetBRDisplayNameForSideFaultFileNode(v11);
  id v58 = v14;

  if (!v14)
  {
    if (v12)
    {
      [v11 getResourceValue:&v58 forKey:*MEMORY[0x1E4F1C898] options:1 error:a7];
      id v15 = v58;
      if (v15) {
        goto LABEL_12;
      }
      goto LABEL_9;
    }
    id v17 = [v11 nameWithError:a7];
    id v18 = v58;
    id v58 = v17;

    id v15 = v17;
LABEL_11:
    uint64_t v19 = [v15 stringByDeletingPathExtension];

    id v15 = (id)v19;
    if (v19) {
      goto LABEL_12;
    }
LABEL_9:
    uint64_t v16 = 0;
    goto LABEL_56;
  }
  id v15 = v14;
  if ((v12 & 1) == 0) {
    goto LABEL_11;
  }
LABEL_12:
  v48 = (objc_class *)a1;
  v20 = [MEMORY[0x1E4F1CA60] dictionary];
  if (a5)
  {
    if (!v13) {
      goto LABEL_49;
    }
  }
  else
  {
    if ((_LSDNCGetBundleClass((id *)&a3->_contextPointer, v11, v13, &v59, a7) & 1) == 0) {
      goto LABEL_39;
    }
    a5 = (const unsigned int *)&v59;
    if (!v13)
    {
LABEL_49:
      v38 = [v20 objectForKeyedSubscript:@"LSDefaultLocalizedValue"];
      BOOL v39 = v38 == 0;

      if (v58) {
        BOOL v40 = v39;
      }
      else {
        BOOL v40 = 0;
      }
      if (v40)
      {
        id v41 = [v48 alloc];
        int v42 = (void *)[v41 initWithContextIfNeeded:a3 node:v11 isDirectory:v13 bundleClass:a5 desiredDisplayName:v58 treatAsFSName:1];
        [v20 setObject:v42 forKeyedSubscript:@"LSDefaultLocalizedValue"];
      }
      uint64_t v16 = (void *)[v20 copy];
      goto LABEL_55;
    }
  }
  if ([v11 isBusyDirectory]) {
    goto LABEL_49;
  }
  +[_LSDServiceDomain defaultServiceDomain]();
  uint64_t v21 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
  uint64_t v22 = (LSContext *)LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)a3, v21, 0);

  if (v22)
  {
    id v47 = [v11 extensionWithError:0];
    uint64_t v23 = v60;
    if (v60
      || (_LSFindOrFindOrRegisterBundleNode(v22, v11, (unsigned int *)a5, 0x2000000u, 0, &v60, 0), (uint64_t v23 = v60) != 0))
    {
      v24 = _LSBundleGetLocalizedNameDictionary(v22->db, v23, v11, v15);
      if (v24)
      {
LABEL_47:
        uint64_t v25 = v47;
        goto LABEL_48;
      }
    }
    else
    {
      v24 = 0;
    }
    uint64_t v25 = v47;
    if (!v47) {
      goto LABEL_48;
    }
    if ([v47 length]) {
      char v26 = v12;
    }
    else {
      char v26 = 1;
    }
    if ((v26 & 1) != 0
      || !_LSBundleNodeHasUnregisteredPersonality((void **)&v22->db, v11, v47, (int *)a5))
    {
LABEL_46:
      v24 = 0;
      goto LABEL_47;
    }
    if ([v11 canIssueIO])
    {
      if (*a5 != 10) {
        goto LABEL_41;
      }
      v27 = [v11 nameWithError:0];
      v28 = v27;
      if (!v27
        || ![(_LSDatabase *)v27 isEqual:@"myDocuments.cannedSearch"]
        || (v30 = (LaunchServices::CanonicalString *)LaunchServices::CanonicalString::Find((LaunchServices::CanonicalString *)v22->db, v28, v29)) == 0)
      {

        goto LABEL_41;
      }
      uint64_t LocalizedString = (LaunchServices::LocalizedString *)LaunchServices::CanonicalString::getLocalizedString(v30);
      v24 = LaunchServices::LocalizedString::getAllUnsafeLocalizations(LocalizedString, v22->db, 0, 0, 0);

      uint64_t v25 = v47;
      if (!v24)
      {
LABEL_41:
        if ([v11 canIssueIO])
        {
          char v33 = [v11 bundleInfoDictionaryWithError:0];
          if (v33)
          {
            v34 = (objc_class *)objc_opt_class();
            uint64_t v35 = *MEMORY[0x1E4F1CC48];
            v36 = XNSDictionaryObjectForKeyOfClass(v33, (objc_object *)*MEMORY[0x1E4F1CC48], v34);
            if (v36)
            {
              v46 = [v15 stringByDeletingPathExtension];
              if (objc_msgSend(v36, "caseInsensitiveCompare:"))
              {
                v24 = 0;
              }
              else
              {
                uint64_t v44 = _LSBundleGetLocalizer(v22->db, 0, 0, v11);
                v45 = v44;
                if (v44)
                {
                  v24 = [v44 localizedStringDictionaryWithString:v35 defaultValue:0];
                }
                else
                {
                  v24 = 0;
                }
              }
            }
            else
            {
              v24 = 0;
            }
          }
          else
          {
            v24 = 0;
          }

          goto LABEL_47;
        }
        goto LABEL_46;
      }
LABEL_48:
      v49[0] = MEMORY[0x1E4F143A8];
      v49[1] = 3221225472;
      v49[2] = __123___LSDisplayNameConstructor_ConstructForAnyFile__displayNameConstructorsWithContextIfNeeded_bundle_bundleClass_node_error___block_invoke;
      v49[3] = &unk_1E522EA80;
      id v37 = v25;
      char v56 = 1;
      id v50 = v37;
      v53 = v48;
      id v51 = v20;
      v54 = a3;
      char v57 = v13;
      id v52 = v11;
      v55 = a5;
      [v24 enumerateKeysAndObjectsUsingBlock:v49];

      goto LABEL_49;
    }
    if (a7)
    {
      uint64_t v61 = *MEMORY[0x1E4F28228];
      v62[0] = @"node had unregistered personality but cannot do IO to localize its name";
      v32 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v62 forKeys:&v61 count:1];
      _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28798], 5, (uint64_t)"+[_LSDisplayNameConstructor(ConstructForAnyFile) displayNameConstructorsWithContextIfNeeded:bundle:bundleClass:node:error:]", 628, v32);
      *a7 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else if (a7)
  {
    LaunchServices::Database::Context::error((id *)&a3->_contextPointer);
    uint64_t v16 = 0;
    *a7 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_55;
  }
LABEL_39:
  uint64_t v16 = 0;
LABEL_55:

LABEL_56:

  return v16;
}

- (_LSDisplayNameConstructor)init
{
}

- (id)unlocalizedNameWithContext:(LSContext *)a3
{
  id v8 = a3;
  id v9 = 0;
  char v10 = 0;
  id v11 = 0;
  id v3 = [(_LSDisplayNameConstructor *)self unlocalizedNameWithContextIfNeeded:&v8 asIfShowingAllExtensions:0];
  if (v8) {
    BOOL v4 = v10 == 0;
  }
  else {
    BOOL v4 = 1;
  }
  if (!v4) {
    _LSContextDestroy((void **)&v8->db);
  }
  id v5 = v9;
  id v8 = 0;
  id v9 = 0;

  char v10 = 0;
  id v6 = v11;
  id v11 = 0;

  return v3;
}

- (id)unlocalizedNameWithContext:(LSContext *)a3 asIfShowingAllExtensions:(id)a4
{
  id v6 = a4;
  int v12 = a3;
  id v13 = 0;
  char v14 = 0;
  id v15 = 0;
  id v7 = [(_LSDisplayNameConstructor *)self unlocalizedNameWithContextIfNeeded:&v12 asIfShowingAllExtensions:v6];
  if (v12) {
    BOOL v8 = v14 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (!v8) {
    _LSContextDestroy((void **)&v12->db);
  }
  id v9 = v13;
  int v12 = 0;
  id v13 = 0;

  char v14 = 0;
  id v10 = v15;
  id v15 = 0;

  return v7;
}

- (void)getUnlocalizedBaseName:(id *)a3 extension:(id *)a4 requiresAdditionalBiDiControlCharacters:(BOOL *)a5
{
  if (a3)
  {
    if (a4) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"LSDisplayNameConstructor.mm", 187, @"Invalid parameter not satisfying: %@", @"outSafeExtension != NULL" object file lineNumber description];

    if (a5) {
      goto LABEL_4;
    }
LABEL_7:
    v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2, self, @"LSDisplayNameConstructor.mm", 188, @"Invalid parameter not satisfying: %@", @"outRequiresBiDi != NULL" object file lineNumber description];

    goto LABEL_4;
  }
  id v18 = [MEMORY[0x1E4F28B00] currentHandler];
  [v18 handleFailureInMethod:a2, self, @"LSDisplayNameConstructor.mm", 186, @"Invalid parameter not satisfying: %@", @"outSafeBaseName != NULL" object file lineNumber description];

  if (!a4) {
    goto LABEL_6;
  }
LABEL_3:
  if (!a5) {
    goto LABEL_7;
  }
LABEL_4:
  baseName = self->_baseName;
  id v11 = self->_extension;
  __int16 v23 = 0;
  uint64_t v21 = v11;
  uint64_t v22 = baseName;
  int v12 = baseName;
  [(_LSDisplayNameConstructor *)self getTransformedBaseName:&v22 extension:&v21 needsBiDiControlCharacters:&v23];
  id v13 = v22;

  char v14 = v21;
  id v15 = v13;
  *a3 = v15;
  uint64_t v16 = v14;
  *a4 = v16;
  int v17 = v23 | HIBYTE(v23);

  *a5 = v17 != 0;
}

+ (NSString)suffixForRemoteXCTests
{
  if ([(id)__LSDefaultsGetSharedInstance() isInXCTestRigInsecure])
  {
    v2 = getenv("LS_SUFFIX_FOR_REMOTE_XCTESTS");
    if (v2)
    {
      v2 = [NSString stringWithUTF8String:v2];
    }
  }
  else
  {
    v2 = 0;
  }

  return (NSString *)v2;
}

+ (void)setSuffixForRemoteXCTests:(id)a3
{
  id v3 = a3;
  if ([(id)__LSDefaultsGetSharedInstance() isInXCTestRigInsecure])
  {
    if (v3) {
      setenv("LS_SUFFIX_FOR_REMOTE_XCTESTS", (const char *)[v3 UTF8String], 1);
    }
    else {
      unsetenv("LS_SUFFIX_FOR_REMOTE_XCTESTS");
    }
  }
}

+ (id)displayNameConstructorWithContext:(LSContext *)a3 node:(id)a4 error:(id *)a5
{
  id v8 = a4;
  char v14 = a3;
  id v15 = 0;
  char v16 = 0;
  id v17 = 0;
  id v9 = [a1 displayNameConstructorWithContextIfNeeded:&v14 bundle:0 bundleClass:0 node:v8 preferredLocalizations:0 error:a5];
  if (v14) {
    BOOL v10 = v16 == 0;
  }
  else {
    BOOL v10 = 1;
  }
  if (!v10) {
    _LSContextDestroy((void **)&v14->db);
  }
  id v11 = v15;
  char v14 = 0;
  id v15 = 0;

  char v16 = 0;
  id v12 = v17;
  id v17 = 0;

  return v9;
}

+ (id)displayNameConstructorWithContext:(LSContext *)a3 bundle:(unsigned int)a4 bundleClass:(const unsigned int *)a5 node:(id)a6 preferredLocalizations:(id)a7 error:(id *)a8
{
  uint64_t v11 = *(void *)&a4;
  id v14 = a6;
  id v15 = a7;
  uint64_t v21 = a3;
  id v22 = 0;
  char v23 = 0;
  id v24 = 0;
  char v16 = [a1 displayNameConstructorWithContextIfNeeded:&v21 bundle:v11 bundleClass:a5 node:v14 preferredLocalizations:v15 error:a8];
  if (v21) {
    BOOL v17 = v23 == 0;
  }
  else {
    BOOL v17 = 1;
  }
  if (!v17) {
    _LSContextDestroy((void **)&v21->db);
  }
  id v18 = v22;
  uint64_t v21 = 0;
  id v22 = 0;

  char v23 = 0;
  id v19 = v24;
  id v24 = 0;

  return v16;
}

+ (id)displayNameConstructorsWithContext:(LSContext *)a3 node:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v14 = a3;
  id v15 = 0;
  char v16 = 0;
  id v17 = 0;
  id v9 = [a1 displayNameConstructorsWithContextIfNeeded:&v14 bundle:0 bundleClass:0 node:v8 error:a5];
  if (v14) {
    BOOL v10 = v16 == 0;
  }
  else {
    BOOL v10 = 1;
  }
  if (!v10) {
    _LSContextDestroy((void **)&v14->db);
  }
  id v11 = v15;
  id v14 = 0;
  id v15 = 0;

  char v16 = 0;
  id v12 = v17;
  id v17 = 0;

  return v9;
}

+ (id)displayNameConstructorsWithContext:(LSContext *)a3 bundle:(unsigned int)a4 bundleClass:(const unsigned int *)a5 node:(id)a6 error:(id *)a7
{
  uint64_t v9 = *(void *)&a4;
  id v12 = a6;
  id v18 = a3;
  id v19 = 0;
  char v20 = 0;
  id v21 = 0;
  id v13 = [a1 displayNameConstructorsWithContextIfNeeded:&v18 bundle:v9 bundleClass:a5 node:v12 error:a7];
  if (v18) {
    BOOL v14 = v20 == 0;
  }
  else {
    BOOL v14 = 1;
  }
  if (!v14) {
    _LSContextDestroy((void **)&v18->db);
  }
  id v15 = v19;
  id v18 = 0;
  id v19 = 0;

  char v20 = 0;
  id v16 = v21;
  id v21 = 0;

  return v13;
}

+ (unsigned)prepareMimicWithPopulator:(id)a3 error:(id *)a4
{
  id v5 = a3;
  if (_LSPrepareMimicForBundleLookup(v5, (uint64_t)a4))
  {
    v11[0] = sel_isBusyDirectory;
    v11[1] = sel_hasHiddenExtension;
    v11[2] = sel_isSideFault;
    id v6 = v5;
    uint64_t v7 = 0;
    LOBYTE(v8) = 1;
    do
    {
      while (!(_BYTE)v8)
      {
        if (++v7 == 3)
        {

          goto LABEL_11;
        }
        LOBYTE(v8) = 0;
      }
      int v8 = [v6 populateSimpleSelector:v11[v7++] error:a4];
    }
    while (v7 != 3);

    if (v8)
    {
      unsigned __int8 v9 = [v6 populateValueForKey:*MEMORY[0x1E4F1C898] error:a4];
      goto LABEL_12;
    }
  }
LABEL_11:
  unsigned __int8 v9 = 0;
LABEL_12:

  return v9;
}

+ (BOOL)showAllExtensions
{
  return 0;
}

- (id)cleanSecondaryExtension:(id)a3
{
  id v3 = a3;
  if (-[_LSDisplayNameConstructor(Private) cleanSecondaryExtension:]::once != -1) {
    dispatch_once(&-[_LSDisplayNameConstructor(Private) cleanSecondaryExtension:]::once, &__block_literal_global_30);
  }
  id v4 = v3;
  if ([v3 rangeOfCharacterFromSet:-[_LSDisplayNameConstructor(Private) cleanSecondaryExtension:]::nonExtensionCharacters] != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v7 = 0;
    int v8 = &v7;
    uint64_t v9 = 0x3032000000;
    BOOL v10 = __Block_byref_object_copy__21;
    id v11 = __Block_byref_object_dispose__21;
    id v12 = 0;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __62___LSDisplayNameConstructor_Private__cleanSecondaryExtension___block_invoke_2;
    v6[3] = &unk_1E522EAF8;
    v6[4] = &v7;
    _LSDNCWithInlineBuffer(v3, v6);
    id v4 = (id)v8[5];

    _Block_object_dispose(&v7, 8);
  }

  return v4;
}

@end