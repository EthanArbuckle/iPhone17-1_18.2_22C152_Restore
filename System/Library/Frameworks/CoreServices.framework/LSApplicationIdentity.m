@interface LSApplicationIdentity
+ (BOOL)personaWithUniqueString:(id)a3 getPersonaType:(unint64_t *)a4 error:(id *)a5;
+ (BOOL)supportsSecureCoding;
+ (Class)currentIdentityClass;
+ (id)bundleIdentifierForIdentityString:(id)a3 error:(id *)a4;
+ (id)enumeratorWithOptions:(unint64_t)a3;
+ (id)identityStringsForApplicationWithBundleIdentifier:(id)a3 error:(id *)a4;
+ (unsigned)classVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)needsMigration;
- (Class)classForCoder;
- (LSApplicationIdentity)initWithBundleIdentifier:(id)a3 URL:(id)a4 personaUniqueString:(id)a5 personaType:(unint64_t)a6;
- (LSApplicationIdentity)initWithBundleIdentifier:(id)a3 allowPlaceholder:(BOOL)a4 personaUniqueString:(id)a5 error:(id *)a6;
- (LSApplicationIdentity)initWithCoder:(id)a3;
- (LSApplicationIdentity)initWithIdentityBookmark:(id)a3 identityString:(id)a4 personaUniqueString:(id)a5 personaType:(unint64_t)a6;
- (LSApplicationIdentity)initWithIdentityString:(id)a3;
- (LSApplicationIdentity)initWithIdentityString:(id)a3 parsedIdentityStringDictionary:(id)a4 error:(id *)a5;
- (id)bundleIdentifier;
- (id)findApplicationRecordFetchingPlaceholder:(int64_t)a3 error:(id *)a4;
- (id)findApplicationRecordWithError:(id *)a3;
- (id)initForRecord:(id)a3 personaWithAttributes:(id)a4;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation LSApplicationIdentity

- (id)findApplicationRecordWithError:(id *)a3
{
  return [(LSApplicationIdentity *)self findApplicationRecordFetchingPlaceholder:1 error:a3];
}

- (id)findApplicationRecordFetchingPlaceholder:(int64_t)a3 error:(id *)a4
{
  v5 = [[LSApplicationRecord alloc] initWithBundleIdentifier:self->_identityBookmark fetchingPlaceholder:a3 error:a4];
  v6 = v5;
  if (a4 && !v5)
  {
    _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28760], -10814, (uint64_t)"-[LSApplicationIdentity findApplicationRecordFetchingPlaceholder:error:]", 471, 0);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (void).cxx_destruct
{
}

- (id)initForRecord:(id)a3 personaWithAttributes:(id)a4
{
  v6 = (LSApplicationRecord *)a3;
  v7 = (_LSPersonaWithAttributes *)a4;
  v8 = computeIdentityBookmark(v6);
  v9 = computeIdentityString(v6, v7);
  v10 = -[_LSDatabase store]((uint64_t)v7);
  if (v7) {
    uint64_t v11 = -[_LSPersonaWithAttributes personaType]((uint64_t)v7);
  }
  else {
    uint64_t v11 = 4;
  }
  v12 = [(LSApplicationIdentity *)self initWithIdentityBookmark:v8 identityString:v9 personaUniqueString:v10 personaType:v11];

  return v12;
}

- (LSApplicationIdentity)initWithIdentityBookmark:(id)a3 identityString:(id)a4 personaUniqueString:(id)a5 personaType:(unint64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v17.receiver = self;
  v17.super_class = (Class)LSApplicationIdentity;
  v13 = [(LSBundleIdentity *)&v17 initWithIdentityString:v11 personaUniqueString:v12 personaType:a6];
  if (v13)
  {
    uint64_t v14 = [v10 copy];
    identityBookmark = v13->_identityBookmark;
    v13->_identityBookmark = (NSString *)v14;
  }
  return v13;
}

+ (unsigned)classVersion
{
  return 2;
}

+ (Class)currentIdentityClass
{
  return (Class)objc_opt_class();
}

- (id)bundleIdentifier
{
  return self->_identityBookmark;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)LSApplicationIdentity;
  [(LSBundleIdentity *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInt32:forKey:", objc_msgSend((id)objc_opt_class(), "classVersion"), @"version");
  [v4 encodeObject:self->_identityBookmark forKey:@"identityBookmark"];
}

- (Class)classForCoder
{
  return (Class)objc_opt_class();
}

- (LSApplicationIdentity)initWithIdentityString:(id)a3 parsedIdentityStringDictionary:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = [v9 objectForKey:@"b"];
  id v12 = (void *)v11;
  if (v10) {
    BOOL v13 = v11 == 0;
  }
  else {
    BOOL v13 = 1;
  }
  if (v13)
  {
    if (v11)
    {
LABEL_9:
      id v15 = v12;
      goto LABEL_14;
    }
  }
  else
  {
    char isKindOfClass = objc_opt_isKindOfClass();
    if (isKindOfClass) {
      goto LABEL_9;
    }
  }
  v16 = _LSDefaultLog();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
    -[LSApplicationIdentity initWithIdentityString:parsedIdentityStringDictionary:error:]((uint64_t)v8, v16);
  }

  id v15 = 0;
LABEL_14:
  uint64_t v17 = objc_opt_class();
  uint64_t v18 = [v9 objectForKey:@"p"];
  v19 = (void *)v18;
  if (v17 && v18 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    v19 = 0;
  }
  uint64_t v20 = objc_opt_class();
  uint64_t v21 = [v9 objectForKey:@"pt"];
  v22 = (void *)v21;
  if (v20 && v21 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    v22 = 0;
  }
  uint64_t v23 = objc_opt_class();
  uint64_t v24 = [v9 objectForKey:@"v"];
  v25 = (void *)v24;
  if (v23 && v24 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    v25 = 0;
  }

  if (!v15 || (v19 != 0) == (v22 == 0))
  {

    v27 = _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28760], -50, (uint64_t)"-[LSApplicationIdentity initWithIdentityString:parsedIdentityStringDictionary:error:]", 319, 0);
  }
  else
  {
    if (v22) {
      uint64_t v26 = [v22 unsignedIntegerValue];
    }
    else {
      uint64_t v26 = 4;
    }
    v32.receiver = self;
    v32.super_class = (Class)LSApplicationIdentity;
    v30 = [(LSBundleIdentity *)&v32 initWithIdentityString:v8 personaUniqueString:v19 personaType:v26];
    v29 = v30;
    if (v30)
    {
      objc_storeStrong((id *)&v30->_identityBookmark, v15);
      id v28 = 0;
      goto LABEL_37;
    }
    v27 = _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28798], 12, (uint64_t)"-[LSApplicationIdentity initWithIdentityString:parsedIdentityStringDictionary:error:]", 314, 0);
  }
  id v28 = v27;
  if (a5)
  {
    id v28 = v27;
    v29 = 0;
    *a5 = v28;
  }
  else
  {
    v29 = 0;
  }
LABEL_37:

  return v29;
}

- (LSApplicationIdentity)initWithIdentityString:(id)a3
{
  id v5 = a3;
  v6 = (void *)MEMORY[0x1E4F28D90];
  v7 = [v5 dataUsingEncoding:4];
  id v15 = 0;
  id v8 = [v6 JSONObjectWithData:v7 options:0 error:&v15];
  id v9 = v15;

  if (!v8)
  {

LABEL_5:
    id v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, 0, @"LSApplicationIdentity.mm", 339, @"Bad input initializing with identity string: %@", v9 object file lineNumber description];

    uint64_t v10 = 0;
    goto LABEL_6;
  }
  id v14 = v9;
  uint64_t v10 = [(LSApplicationIdentity *)self initWithIdentityString:v5 parsedIdentityStringDictionary:v8 error:&v14];
  id v11 = v14;

  id v9 = v11;
  if (!v10) {
    goto LABEL_5;
  }
LABEL_6:

  return v10;
}

- (LSApplicationIdentity)initWithBundleIdentifier:(id)a3 allowPlaceholder:(BOOL)a4 personaUniqueString:(id)a5 error:(id *)a6
{
  BOOL v8 = a4;
  id v10 = a3;
  id v11 = a5;
  id v12 = [[LSApplicationRecord alloc] initWithBundleIdentifier:v10 allowPlaceholder:v8 error:a6];
  BOOL v13 = v12;
  if (a6 && !v12)
  {
    _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28760], -10814, (uint64_t)"-[LSApplicationIdentity initWithBundleIdentifier:allowPlaceholder:personaUniqueString:error:]", 348, 0);
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  id v14 = computeIdentityBookmark(v13);
  id v15 = (_LSPersonaWithAttributes *)-[_LSPersonaWithAttributes initWithPersonaType:personaUniqueString:]([_LSPersonaWithAttributes alloc], 0, v11);
  v16 = computeIdentityString(v13, v15);
  uint64_t v17 = [(LSApplicationIdentity *)self initWithIdentityBookmark:v14 identityString:v16 personaUniqueString:v11 personaType:0];

  return v17;
}

- (LSApplicationIdentity)initWithBundleIdentifier:(id)a3 URL:(id)a4 personaUniqueString:(id)a5 personaType:(unint64_t)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  if (!v11)
  {
    v37 = [MEMORY[0x1E4F28B00] currentHandler];
    [v37 handleFailureInMethod:a2 object:self file:@"LSApplicationIdentity.mm" lineNumber:364 description:@"bundleIdentifier was nil when creating application identity"];
  }
  if (v13)
  {
    if (a6 == 4)
    {
      id v14 = _LSDefaultLog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
        -[LSApplicationIdentity initWithBundleIdentifier:URL:personaUniqueString:personaType:](v14, v15, v16, v17, v18, v19, v20, v21);
      }
    }
    id v22 = v11;
    uint64_t v24 = (NSURL *)-[_LSPersonaWithAttributes initWithPersonaType:personaUniqueString:]([_LSPersonaWithAttributes alloc], a6, v13);
  }
  else
  {
    if (a6 != 4)
    {
      v25 = _LSDefaultLog();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT)) {
        -[LSApplicationIdentity initWithBundleIdentifier:URL:personaUniqueString:personaType:](v25, v26, v27, v28, v29, v30, v31, v32);
      }
    }
    id v33 = v11;
    uint64_t v24 = 0;
  }
  v34 = computeIdentityString((NSString *)v11, v24, v23);
  v35 = [(LSApplicationIdentity *)self initWithIdentityBookmark:v11 identityString:v34 personaUniqueString:v13 personaType:a6];

  return v35;
}

- (LSApplicationIdentity)initWithCoder:(id)a3
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)LSApplicationIdentity;
  id v5 = [(LSBundleIdentity *)&v17 initWithCoder:v4];
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    BOOL v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    id v9 = objc_msgSend(v4, "ls_decodeObjectOfClasses:forKey:", v8, @"identityBookmark");
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if (v9) {
        id Property = objc_getProperty(v9, v10, 16, 1);
      }
      else {
        id Property = 0;
      }
      id v12 = (NSString *)Property;
    }
    else
    {
      id v12 = v9;
    }
    identityBookmark = v5->_identityBookmark;
    v5->_identityBookmark = v12;

    if (!v5->_identityBookmark)
    {

      uint64_t v18 = *MEMORY[0x1E4F28228];
      v19[0] = @"could not decode identity (missing bundleID?)";
      id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:&v18 count:1];
      uint64_t v15 = _LSMakeNSErrorImpl(@"LSApplicationWorkspaceErrorDomain", 118, (uint64_t)"-[LSApplicationIdentity initWithCoder:]", 414, v14);
      [v4 failWithError:v15];

      id v5 = 0;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  v3.receiver = self;
  v3.super_class = (Class)LSApplicationIdentity;
  return [(NSString *)self->_identityBookmark hash] ^ __ROR8__([(LSBundleIdentity *)&v3 hash], 56);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    id v5 = v4;
    v8.receiver = self;
    v8.super_class = (Class)LSApplicationIdentity;
    if ([(LSBundleIdentity *)&v8 isEqual:v5]) {
      char v6 = [(NSString *)self->_identityBookmark isEqual:v5[4]];
    }
    else {
      char v6 = 0;
    }
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (BOOL)needsMigration
{
  return [(id)objc_opt_class() classVersion] != 2;
}

+ (id)enumeratorWithOptions:(unint64_t)a3
{
  objc_super v3 = [[LSApplicationIdentityEnumerator alloc] initWithAppEnumerationOptions:a3];

  return v3;
}

+ (id)bundleIdentifierForIdentityString:(id)a3 error:(id *)a4
{
  id v5 = (void *)MEMORY[0x1E4F28D90];
  char v6 = [a3 dataUsingEncoding:4];
  id v13 = 0;
  uint64_t v7 = [v5 JSONObjectWithData:v6 options:0 error:&v13];
  id v8 = v13;

  if (!v7) {
    goto LABEL_6;
  }
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = [v7 objectForKey:@"b"];
  id v11 = (void *)v10;
  if (v9 && v10 && (objc_opt_isKindOfClass() & 1) == 0)
  {

LABEL_6:
    id v11 = 0;
  }
  if (a4 && !v11) {
    *a4 = v8;
  }

  return v11;
}

+ (id)identityStringsForApplicationWithBundleIdentifier:(id)a3 error:(id *)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v16 = 0;
  char v6 = [[LSApplicationRecord alloc] initWithBundleIdentifier:v5 fetchingPlaceholder:1 error:&v16];
  id v15 = v16;
  if (!v6)
  {
    id v8 = 0;
    if (!a4) {
      goto LABEL_14;
    }
    goto LABEL_12;
  }
  id v7 = [(LSApplicationRecord *)v6 identities];
  id v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v7, "count"));
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v9 = v7;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v9);
        }
        id v13 = [*(id *)(*((void *)&v17 + 1) + 8 * i) identityString];
        [v8 addObject:v13];
      }
      uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v10);
  }

  if (a4)
  {
LABEL_12:
    if (!v8) {
      *a4 = v15;
    }
  }
LABEL_14:

  return v8;
}

+ (BOOL)personaWithUniqueString:(id)a3 getPersonaType:(unint64_t *)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = [(id)getUMUserPersonaAttributesClass() personaAttributesForPersonaUniqueString:v7 withError:a5];
  id v9 = v8;
  if (v8) {
    *a4 = LSPersonaTypeForPersonaAttributes(v8);
  }

  return v9 != 0;
}

- (void)initWithIdentityString:(uint64_t)a1 parsedIdentityStringDictionary:(NSObject *)a2 error:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_182959000, a2, OS_LOG_TYPE_ERROR, "No bundleID in identity string %@; need one for an identity on this platform",
    (uint8_t *)&v2,
    0xCu);
}

- (void)initWithBundleIdentifier:(uint64_t)a3 URL:(uint64_t)a4 personaUniqueString:(uint64_t)a5 personaType:(uint64_t)a6 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithBundleIdentifier:(uint64_t)a3 URL:(uint64_t)a4 personaUniqueString:(uint64_t)a5 personaType:(uint64_t)a6 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end