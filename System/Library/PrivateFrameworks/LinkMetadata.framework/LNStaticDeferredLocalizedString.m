@interface LNStaticDeferredLocalizedString
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (Class)classForCoder;
- (Class)classForKeyedArchiver;
- (LNStaticDeferredLocalizedString)initWithCoder:(id)a3;
- (LNStaticDeferredLocalizedString)initWithKey:(id)a3 defaultValue:(id)a4 table:(id)a5 bundleURL:(id)a6;
- (LNStaticDeferredLocalizedString)initWithKey:(id)a3 defaultValue:(id)a4 table:(id)a5 bundleURL:(id)a6 alternatives:(id)a7;
- (LNStaticDeferredLocalizedString)initWithKey:(id)a3 table:(id)a4 bundleURL:(id)a5;
- (LNStaticDeferredLocalizedString)initWithLocalizedKey:(id)a3 bundleIdentifier:(id)a4 bundleURL:(id)a5 table:(id)a6;
- (LNStaticDeferredLocalizedString)initWithLocalizedStringResource:(id)a3;
- (LNStaticDeferredLocalizedString)initWithLocalizedStringResource:(id)a3 alternatives:(id)a4;
- (LNStaticDeferredLocalizedString)localizedStringWithPluralizationNumber:(id)a3 forLocaleIdentifier:(id)a4;
- (LNStaticDeferredLocalizedString)localizedStringWithReplacements:(id)a3 forLocaleIdentifier:(id)a4;
- (NSString)bundleIdentifier;
- (NSString)defaultValue;
- (NSString)description;
- (NSString)key;
- (NSString)localizedKey;
- (NSString)table;
- (NSURL)bundleURL;
- (_NSLocalizedStringResource)localizedStringResource;
- (id)_dictionaryRepresenation;
- (id)_init;
- (id)_initWithDictionary:(id)a3;
- (id)localizedStringForLocaleIdentifier:(id)a3;
- (id)localizedStringForLocaleIdentifier:(id)a3 bundleURL:(id)a4;
- (id)localizedStringForLocaleIdentifier:(id)a3 kind:(id)a4;
- (unint64_t)hash;
- (unint64_t)length;
- (unsigned)characterAtIndex:(unint64_t)a3;
- (void)encodeWithCoder:(id)a3;
- (void)getCharacters:(unsigned __int16 *)a3 range:(_NSRange)a4;
@end

@implementation LNStaticDeferredLocalizedString

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedStringResource, 0);
  objc_storeStrong((id *)&self->_defaultValue, 0);
  objc_storeStrong((id *)&self->_bundleURL, 0);
  objc_storeStrong((id *)&self->_table, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

- (Class)classForCoder
{
  return (Class)objc_opt_class();
}

- (LNStaticDeferredLocalizedString)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"localizedStringResource"];
  if (v5)
  {
    v6 = (void *)v5;
    self = [(LNStaticDeferredLocalizedString *)self initWithLocalizedStringResource:v5];
    v7 = self;
  }
  else
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"key"];
    if (v6)
    {
      v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"table"];
      v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"defaultValue"];
      v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bundleURL"];
      self = [(LNStaticDeferredLocalizedString *)self initWithKey:v6 defaultValue:v9 table:v8 bundleURL:v10];

      v7 = self;
    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (LNStaticDeferredLocalizedString)initWithLocalizedStringResource:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"LNStaticDeferredLocalizedString.m", 45, @"Invalid parameter not satisfying: %@", @"localizedStringResource" object file lineNumber description];
  }
  v7 = [(LNStaticDeferredLocalizedString *)self _init];
  v8 = (LNStaticDeferredLocalizedString *)v7;
  if (v7)
  {
    objc_storeStrong(v7 + 6, a3);
    v9 = v8;
  }

  return v8;
}

- (LNStaticDeferredLocalizedString)initWithLocalizedStringResource:(id)a3 alternatives:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  int v9 = [(LNStaticDeferredLocalizedString *)self isMemberOfClass:objc_opt_class()];
  if (v8 && v9 && [v8 count])
  {
    v10 = [[LNStaticDeferredLocalizedStringWithAlternatives alloc] initWithLocalizedStringResource:v7 alternatives:v8];
LABEL_9:

    goto LABEL_10;
  }
  if (!v7)
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"LNStaticDeferredLocalizedString.m", 63, @"Invalid parameter not satisfying: %@", @"localizedStringResource" object file lineNumber description];
  }
  v10 = [(LNStaticDeferredLocalizedString *)self _init];
  if (v10)
  {
    v11 = (_NSLocalizedStringResource *)v7;
    self = (LNStaticDeferredLocalizedString *)v10->super._localizedStringResource;
    v10->super._localizedStringResource = v11;
    goto LABEL_9;
  }
LABEL_10:

  return &v10->super;
}

- (id)_init
{
  v6.receiver = self;
  v6.super_class = (Class)LNStaticDeferredLocalizedString;
  v2 = [(LNStaticDeferredLocalizedString *)&v6 init];
  v3 = v2;
  if (v2)
  {
    *(void *)&v2->_getterLock._os_unfair_lock_opaque = 0;
    id v4 = v2;
  }

  return v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(LNStaticDeferredLocalizedString *)self localizedStringResource];
  [v4 encodeObject:v5 forKey:@"localizedStringResource"];

  objc_super v6 = [(LNStaticDeferredLocalizedString *)self key];
  [v4 encodeObject:v6 forKey:@"key"];

  id v7 = [(LNStaticDeferredLocalizedString *)self defaultValue];
  [v4 encodeObject:v7 forKey:@"defaultValue"];

  id v8 = [(LNStaticDeferredLocalizedString *)self bundleURL];
  [v4 encodeObject:v8 forKey:@"bundleURL"];

  id v9 = [(LNStaticDeferredLocalizedString *)self table];
  [v4 encodeObject:v9 forKey:@"table"];
}

- (NSString)table
{
  os_unfair_lock_lock(&self->_getterLock);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __40__LNStaticDeferredLocalizedString_table__block_invoke;
  v8[3] = &unk_1E590D970;
  v8[4] = self;
  v3 = (void (**)(void))MEMORY[0x19F39FBA0](v8);
  id v4 = [(_NSLocalizedStringResource *)self->_localizedStringResource table];
  table = v4;
  if (!v4) {
    table = self->_table;
  }
  objc_super v6 = table;

  v3[2](v3);
  return v6;
}

void __40__LNStaticDeferredLocalizedString_table__block_invoke(uint64_t a1)
{
}

- (NSString)key
{
  os_unfair_lock_lock(&self->_getterLock);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __38__LNStaticDeferredLocalizedString_key__block_invoke;
  v8[3] = &unk_1E590D970;
  v8[4] = self;
  v3 = (void (**)(void))MEMORY[0x19F39FBA0](v8);
  id v4 = [(_NSLocalizedStringResource *)self->_localizedStringResource key];
  key = v4;
  if (!v4) {
    key = self->_key;
  }
  objc_super v6 = key;

  v3[2](v3);
  return v6;
}

void __38__LNStaticDeferredLocalizedString_key__block_invoke(uint64_t a1)
{
}

- (NSString)defaultValue
{
  os_unfair_lock_lock(&self->_getterLock);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __47__LNStaticDeferredLocalizedString_defaultValue__block_invoke;
  v8[3] = &unk_1E590D970;
  v8[4] = self;
  v3 = (void (**)(void))MEMORY[0x19F39FBA0](v8);
  id v4 = [(_NSLocalizedStringResource *)self->_localizedStringResource defaultValue];
  defaultValue = v4;
  if (!v4) {
    defaultValue = self->_defaultValue;
  }
  objc_super v6 = defaultValue;

  v3[2](v3);
  return v6;
}

void __47__LNStaticDeferredLocalizedString_defaultValue__block_invoke(uint64_t a1)
{
}

- (NSURL)bundleURL
{
  os_unfair_lock_lock(&self->_getterLock);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __44__LNStaticDeferredLocalizedString_bundleURL__block_invoke;
  v8[3] = &unk_1E590D970;
  v8[4] = self;
  v3 = (void (**)(void))MEMORY[0x19F39FBA0](v8);
  id v4 = [(_NSLocalizedStringResource *)self->_localizedStringResource bundleURL];
  bundleURL = v4;
  if (!v4) {
    bundleURL = self->_bundleURL;
  }
  objc_super v6 = bundleURL;

  v3[2](v3);
  return v6;
}

void __44__LNStaticDeferredLocalizedString_bundleURL__block_invoke(uint64_t a1)
{
}

- (id)localizedStringForLocaleIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(LNStaticDeferredLocalizedString *)self localizedStringResource];

  if (v5)
  {
    objc_super v6 = [(LNStaticDeferredLocalizedString *)self localizedStringResource];
    id v7 = (void *)[v6 copy];

    if (v4) {
      [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:v4];
    }
    else {
    id v9 = [MEMORY[0x1E4F1CA20] autoupdatingCurrentLocale];
    }
    [v7 setLocale:v9];

    id v8 = [v7 localize];
  }
  else
  {
    id v8 = [(LNStaticDeferredLocalizedString *)self key];
  }

  return v8;
}

- (LNStaticDeferredLocalizedString)localizedStringWithPluralizationNumber:(id)a3 forLocaleIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(LNStaticDeferredLocalizedString *)self localizedStringResource];

  if (v8)
  {
    id v9 = [(LNStaticDeferredLocalizedString *)self localizedStringResource];
    v10 = (void *)[v9 copy];

    if (v7) {
      [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:v7];
    }
    else {
    v12 = [MEMORY[0x1E4F1CA20] autoupdatingCurrentLocale];
    }
    [v10 setLocale:v12];

    id v13 = objc_alloc_init(MEMORY[0x1E4F292C0]);
    [v13 setPluralizationNumber:v6];
    v11 = [v10 localizeWithOptions:v13];
  }
  else
  {
    v11 = [(LNStaticDeferredLocalizedString *)self key];
  }

  return (LNStaticDeferredLocalizedString *)v11;
}

- (_NSLocalizedStringResource)localizedStringResource
{
  os_unfair_lock_lock(&self->_localizedStringResourceLock);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __58__LNStaticDeferredLocalizedString_localizedStringResource__block_invoke;
  v18[3] = &unk_1E590D970;
  v18[4] = self;
  v3 = (void (**)(void))MEMORY[0x19F39FBA0](v18);
  localizedStringResource = self->_localizedStringResource;
  if (localizedStringResource) {
    goto LABEL_7;
  }
  id v5 = [(LNStaticDeferredLocalizedString *)self bundleURL];
  if (v5)
  {
LABEL_6:
    id v9 = objc_alloc(MEMORY[0x1E4F292B8]);
    v10 = [(LNStaticDeferredLocalizedString *)self key];
    v11 = [(LNStaticDeferredLocalizedString *)self defaultValue];
    v12 = [(LNStaticDeferredLocalizedString *)self table];
    id v13 = [MEMORY[0x1E4F1CA20] currentLocale];
    v14 = (_NSLocalizedStringResource *)[v9 initWithKey:v10 defaultValue:v11 table:v12 locale:v13 bundleURL:v5];
    v15 = self->_localizedStringResource;
    self->_localizedStringResource = v14;

    localizedStringResource = self->_localizedStringResource;
LABEL_7:
    v16 = localizedStringResource;
    goto LABEL_8;
  }
  id v6 = [MEMORY[0x1E4F223F8] bundleRecordForCurrentProcess];
  id v7 = [v6 URL];
  if (v7)
  {
    id v5 = v7;

    goto LABEL_6;
  }
  id v8 = [MEMORY[0x1E4F28B50] mainBundle];
  id v5 = [v8 bundleURL];

  if (v5) {
    goto LABEL_6;
  }
  v16 = 0;
LABEL_8:
  v3[2](v3);

  return v16;
}

void __58__LNStaticDeferredLocalizedString_localizedStringResource__block_invoke(uint64_t a1)
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (LNStaticDeferredLocalizedString)initWithKey:(id)a3 table:(id)a4 bundleURL:(id)a5
{
  return [(LNStaticDeferredLocalizedString *)self initWithKey:a3 defaultValue:0 table:a4 bundleURL:a5];
}

- (LNStaticDeferredLocalizedString)initWithKey:(id)a3 defaultValue:(id)a4 table:(id)a5 bundleURL:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if (!v11)
  {
    v26 = [MEMORY[0x1E4F28B00] currentHandler];
    [v26 handleFailureInMethod:a2, self, @"LNStaticDeferredLocalizedString.m", 203, @"Invalid parameter not satisfying: %@", @"key" object file lineNumber description];
  }
  v15 = [(LNStaticDeferredLocalizedString *)self _init];
  if (v15)
  {
    uint64_t v16 = [v11 copy];
    key = v15->_key;
    v15->_key = (NSString *)v16;

    uint64_t v18 = [v12 copy];
    defaultValue = v15->_defaultValue;
    v15->_defaultValue = (NSString *)v18;

    uint64_t v20 = [v13 copy];
    table = v15->_table;
    v15->_table = (NSString *)v20;

    uint64_t v22 = [v14 copy];
    bundleURL = v15->_bundleURL;
    v15->_bundleURL = (NSURL *)v22;

    v24 = v15;
  }

  return v15;
}

- (id)_dictionaryRepresenation
{
  v2 = self;
  LNStaticDeferredLocalizedString._dictionaryRepresentation()();

  v3 = (void *)sub_19CBBF3E0();
  swift_bridgeObjectRelease();
  return v3;
}

- (id)_initWithDictionary:(id)a3
{
  return (id)LNStaticDeferredLocalizedString.init(dictionary:)();
}

- (Class)classForKeyedArchiver
{
  return (Class)objc_opt_class();
}

- (void)getCharacters:(unsigned __int16 *)a3 range:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v7 = [(LNStaticDeferredLocalizedString *)self key];
  objc_msgSend(v7, "getCharacters:range:", a3, location, length);
}

- (unsigned)characterAtIndex:(unint64_t)a3
{
  id v4 = [(LNStaticDeferredLocalizedString *)self key];
  LOWORD(a3) = [v4 characterAtIndex:a3];

  return a3;
}

- (unint64_t)length
{
  v2 = [(LNStaticDeferredLocalizedString *)self key];
  unint64_t v3 = [v2 length];

  return v3;
}

- (NSString)description
{
  unint64_t v3 = [(LNStaticDeferredLocalizedString *)self localizedStringResource];

  id v4 = NSString;
  id v5 = (objc_class *)objc_opt_class();
  id v6 = NSStringFromClass(v5);
  if (v3)
  {
    id v7 = [(LNStaticDeferredLocalizedString *)self localizedStringResource];
    id v8 = [v4 stringWithFormat:@"<%@: %p, localizedStringResource: %@>", v6, self, v7];
  }
  else
  {
    id v7 = [(LNStaticDeferredLocalizedString *)self key];
    id v9 = [(LNStaticDeferredLocalizedString *)self defaultValue];
    v10 = [(LNStaticDeferredLocalizedString *)self table];
    id v11 = [(LNStaticDeferredLocalizedString *)self bundleURL];
    id v8 = [v4 stringWithFormat:@"<%@: %p, key: %@, defaultValue: %@, table: %@, bundleURL: %@>", v6, self, v7, v9, v10, v11];
  }
  return (NSString *)v8;
}

- (unint64_t)hash
{
  unint64_t v3 = [(LNStaticDeferredLocalizedString *)self localizedStringResource];

  if (v3)
  {
    id v4 = [(LNStaticDeferredLocalizedString *)self localizedStringResource];
    id v5 = [v4 key];
    uint64_t v6 = [v5 hash];
    id v7 = [(LNStaticDeferredLocalizedString *)self localizedStringResource];
    id v8 = [v7 table];
    unint64_t v9 = [v8 hash] ^ v6;
  }
  else
  {
    id v4 = [(LNStaticDeferredLocalizedString *)self key];
    uint64_t v10 = [v4 hash];
    id v5 = [(LNStaticDeferredLocalizedString *)self defaultValue];
    uint64_t v11 = [v5 hash] ^ v10;
    id v7 = [(LNStaticDeferredLocalizedString *)self table];
    unint64_t v9 = v11 ^ [v7 hash];
  }

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (LNStaticDeferredLocalizedString *)a3;
  id v5 = v4;
  if (self != v4)
  {
    uint64_t v6 = v4;
    if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      char v15 = 0;
LABEL_52:

      goto LABEL_53;
    }
    id v7 = [(LNStaticDeferredLocalizedString *)self localizedStringResource];

    if (v7)
    {
      id v8 = [(LNStaticDeferredLocalizedString *)self localizedStringResource];
      unint64_t v9 = [v8 key];
      id v10 = [(LNStaticDeferredLocalizedString *)v6 localizedStringResource];
      uint64_t v11 = [v10 key];
      id v12 = v9;
      id v13 = v11;
      id v14 = v13;
      if (v12 == v13)
      {

        goto LABEL_18;
      }
      char v15 = 0;
      if (v12 && v13)
      {
        int v16 = [v12 isEqualToString:v13];

        if (!v16) {
          goto LABEL_29;
        }
LABEL_18:
        id v47 = v10;
        v44 = [(LNStaticDeferredLocalizedString *)self localizedStringResource];
        v21 = [v44 defaultValue];
        v46 = [(LNStaticDeferredLocalizedString *)v6 localizedStringResource];
        uint64_t v22 = [v46 defaultValue];
        id v23 = v21;
        id v24 = v22;
        v25 = v24;
        id v45 = v8;
        if (v23 == v24)
        {
        }
        else
        {
          char v15 = 0;
          id v26 = v24;
          v27 = v23;
          if (!v23 || !v24)
          {
LABEL_44:

            goto LABEL_45;
          }
          int v28 = [v23 isEqualToString:v24];

          if (!v28)
          {
            char v15 = 0;
LABEL_45:
            id v29 = v44;
            id v8 = v45;
LABEL_46:
            v41 = v14;

            id v14 = v23;
            id v10 = v47;
LABEL_49:

            id v14 = v41;
            goto LABEL_50;
          }
        }
        v27 = [(LNStaticDeferredLocalizedString *)self localizedStringResource];
        v34 = [v27 table];
        v43 = [(LNStaticDeferredLocalizedString *)v6 localizedStringResource];
        v35 = [v43 table];
        id v26 = v34;
        id v36 = v35;
        v37 = v36;
        if (v26 == v36)
        {
          char v15 = 1;
        }
        else
        {
          char v15 = 0;
          if (v26 && v36) {
            char v15 = [v26 isEqualToString:v36];
          }
        }

        goto LABEL_44;
      }
      id v29 = v12;
LABEL_48:
      v41 = v14;
      goto LABEL_49;
    }
    v17 = [(LNStaticDeferredLocalizedString *)self key];
    uint64_t v18 = [(LNStaticDeferredLocalizedString *)v6 key];
    id v8 = v17;
    id v19 = v18;
    id v12 = v19;
    if (v8 == v19)
    {
    }
    else
    {
      char v15 = 0;
      if (!v8 || !v19)
      {
        id v14 = v19;
        id v10 = v8;
        goto LABEL_50;
      }
      int v20 = [v8 isEqualToString:v19];

      if (!v20)
      {
        char v15 = 0;
LABEL_51:

        goto LABEL_52;
      }
    }
    v30 = [(LNStaticDeferredLocalizedString *)self defaultValue];
    v31 = [(LNStaticDeferredLocalizedString *)v6 defaultValue];
    id v10 = v30;
    id v32 = v31;
    id v14 = v32;
    if (v10 == v32)
    {
    }
    else
    {
      char v15 = 0;
      if (!v10 || !v32)
      {
        id v29 = v10;
        goto LABEL_48;
      }
      int v33 = [v10 isEqualToString:v32];

      if (!v33)
      {
LABEL_29:
        char v15 = 0;
LABEL_50:

        goto LABEL_51;
      }
    }
    v38 = [(LNStaticDeferredLocalizedString *)self table];
    v39 = [(LNStaticDeferredLocalizedString *)v6 table];
    id v29 = v38;
    id v40 = v39;
    v46 = v29;
    id v47 = v10;
    if (v29 == v40)
    {
      char v15 = 1;
      v25 = v29;
      id v23 = v29;
    }
    else
    {
      v25 = v40;
      char v15 = 0;
      if (v29 && v40) {
        char v15 = [v29 isEqualToString:v40];
      }
      id v23 = v25;
    }
    goto LABEL_46;
  }
  char v15 = 1;
LABEL_53:

  return v15;
}

- (LNStaticDeferredLocalizedString)localizedStringWithReplacements:(id)a3 forLocaleIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(LNStaticDeferredLocalizedString *)self localizedStringResource];

  unint64_t v9 = [(LNStaticDeferredLocalizedString *)self key];
  if (v8)
  {
    id v10 = [(LNStaticDeferredLocalizedString *)self table];
    uint64_t v11 = [(LNStaticDeferredLocalizedString *)self bundleURL];
    uint64_t v12 = [v9 localizedStringWithReplacements:v6 table:v10 bundleURL:v11 localeIdentifier:v7];

    unint64_t v9 = (void *)v12;
  }

  return (LNStaticDeferredLocalizedString *)v9;
}

- (id)localizedStringForLocaleIdentifier:(id)a3 bundleURL:(id)a4
{
  id v6 = a3;
  id v7 = (objc_class *)MEMORY[0x1E4F292B8];
  id v8 = a4;
  id v9 = [v7 alloc];
  id v10 = [(LNStaticDeferredLocalizedString *)self key];
  uint64_t v11 = [(LNStaticDeferredLocalizedString *)self defaultValue];
  uint64_t v12 = [(LNStaticDeferredLocalizedString *)self table];
  id v13 = [MEMORY[0x1E4F1CA20] currentLocale];
  id v14 = (void *)[v9 initWithKey:v10 defaultValue:v11 table:v12 locale:v13 bundleURL:v8];

  if (v6) {
    [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:v6];
  }
  else {
  char v15 = [MEMORY[0x1E4F1CA20] autoupdatingCurrentLocale];
  }
  [v14 setLocale:v15];

  int v16 = [v14 localize];

  return v16;
}

- (id)localizedStringForLocaleIdentifier:(id)a3 kind:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (![(LNStaticDeferredLocalizedString *)self isMemberOfClass:objc_opt_class()]
    || ([(LNStaticDeferredLocalizedString *)self localizedStringForLocaleIdentifier:v6 kind:v7], (id v8 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    id v8 = [(LNStaticDeferredLocalizedString *)self localizedStringForLocaleIdentifier:v6];
  }

  return v8;
}

- (LNStaticDeferredLocalizedString)initWithKey:(id)a3 defaultValue:(id)a4 table:(id)a5 bundleURL:(id)a6 alternatives:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  int v17 = [(LNStaticDeferredLocalizedString *)self isMemberOfClass:objc_opt_class()];
  if (v16 && v17 && [v16 count])
  {
    uint64_t v18 = [[LNStaticDeferredLocalizedStringWithAlternatives alloc] initWithKey:v12 defaultValue:v13 table:v14 bundleURL:v15 alternatives:v16];
  }
  else
  {
    uint64_t v18 = [(LNStaticDeferredLocalizedString *)self initWithKey:v12 defaultValue:v13 table:v14 bundleURL:v15];
  }

  return &v18->super;
}

- (NSString)localizedKey
{
  return (NSString *)[(LNStaticDeferredLocalizedString *)self localizedStringForLocaleIdentifier:0];
}

- (NSString)bundleIdentifier
{
  return 0;
}

- (LNStaticDeferredLocalizedString)initWithLocalizedKey:(id)a3 bundleIdentifier:(id)a4 bundleURL:(id)a5 table:(id)a6
{
  return [(LNStaticDeferredLocalizedString *)self initWithKey:a3 table:a6 bundleURL:a5];
}

@end