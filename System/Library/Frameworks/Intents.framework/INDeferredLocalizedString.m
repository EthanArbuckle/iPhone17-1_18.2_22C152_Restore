@interface INDeferredLocalizedString
+ (BOOL)supportsSecureCoding;
+ (id)makeFromWidgetPlistableRepresentation:(id)a3 error:(id *)a4;
+ (void)initialize;
- (Class)classForCoder;
- (Class)classForKeyedArchiver;
- (INDeferredLocalizedString)initWithCoder:(id)a3;
- (INDeferredLocalizedString)initWithDeferredFormat:(id)a3 fromTable:(id)a4 bundle:(id)a5 arguments:(char *)a6;
- (INDeferredLocalizedString)initWithDeferredFormat:(id)a3 fromTable:(id)a4 bundleIdentifier:(id)a5 bundleURL:(id)a6 arguments:(id)a7;
- (NSArray)_arguments;
- (NSString)_bundleIdentifier;
- (NSString)_cachedLocalization;
- (NSString)_formatKey;
- (NSString)_table;
- (NSURL)_bundleURL;
- (id)_intents_encodeForProto;
- (id)description;
- (id)localizeForLanguage:(id)a3;
- (id)widgetPlistableRepresentationWithParameters:(id)a3 error:(id *)a4;
- (unint64_t)length;
- (unsigned)characterAtIndex:(unint64_t)a3;
- (void)encodeWithCoder:(id)a3;
- (void)getCharacters:(unsigned __int16 *)a3 range:(_NSRange)a4;
@end

@implementation INDeferredLocalizedString

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedLocalization, 0);
  objc_storeStrong((id *)&self->_bundleURL, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_arguments, 0);
  objc_storeStrong((id *)&self->_table, 0);

  objc_storeStrong((id *)&self->_formatKey, 0);
}

- (NSString)_cachedLocalization
{
  return self->_cachedLocalization;
}

- (NSURL)_bundleURL
{
  return self->_bundleURL;
}

- (NSString)_bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (NSArray)_arguments
{
  return self->_arguments;
}

- (NSString)_table
{
  return self->_table;
}

- (NSString)_formatKey
{
  return self->_formatKey;
}

- (id)widgetPlistableRepresentationWithParameters:(id)a3 error:(id *)a4
{
  v5 = (void *)MEMORY[0x1E4F1CA60];
  id v6 = a3;
  v7 = [v5 dictionary];
  v8 = [(INDeferredLocalizedString *)self _formatKey];
  v9 = NSStringFromSelector(sel__formatKey);
  objc_msgSend(v7, "intents_setPlistSafeObject:forKey:", v8, v9);

  v10 = [(INDeferredLocalizedString *)self _table];
  v11 = NSStringFromSelector(sel__table);
  objc_msgSend(v7, "intents_setPlistSafeObject:forKey:", v10, v11);

  v12 = [(INDeferredLocalizedString *)self _arguments];
  v13 = NSStringFromSelector(sel__arguments);
  objc_msgSend(v7, "intents_setPlistSafeObject:forKey:", v12, v13);

  v14 = [(INDeferredLocalizedString *)self _bundleIdentifier];
  v15 = NSStringFromSelector(sel__bundleIdentifier);
  objc_msgSend(v7, "intents_setPlistSafeObject:forKey:", v14, v15);

  v16 = [(INDeferredLocalizedString *)self _bundleURL];
  v17 = NSStringFromSelector(sel__bundleURL);
  objc_msgSend(v7, "intents_setPlistSafeObject:forKey:", v16, v17);

  v18 = [v6 languageCode];

  if (v18) {
    [(INDeferredLocalizedString *)self localizeForLanguage:v18];
  }
  else {
  v19 = [(INDeferredLocalizedString *)self _cachedLocalization];
  }
  v20 = NSStringFromSelector(sel__cachedLocalization);
  objc_msgSend(v7, "intents_setPlistSafeObject:forKey:", v19, v20);

  v21 = (void *)[v7 copy];

  return v21;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(INDeferredLocalizedString *)self _formatKey];
  id v6 = NSStringFromSelector(sel__formatKey);
  [v4 encodeObject:v5 forKey:v6];

  v7 = [(INDeferredLocalizedString *)self _table];
  v8 = NSStringFromSelector(sel__table);
  [v4 encodeObject:v7 forKey:v8];

  v9 = [(INDeferredLocalizedString *)self _arguments];
  v10 = NSStringFromSelector(sel__arguments);
  [v4 encodeObject:v9 forKey:v10];

  v11 = [(INDeferredLocalizedString *)self _bundleIdentifier];
  v12 = NSStringFromSelector(sel__bundleIdentifier);
  [v4 encodeObject:v11 forKey:v12];

  v13 = [(INDeferredLocalizedString *)self _bundleURL];
  v14 = NSStringFromSelector(sel__bundleURL);
  [v4 encodeObject:v13 forKey:v14];

  id v16 = [(INDeferredLocalizedString *)self _cachedLocalization];
  v15 = NSStringFromSelector(sel__cachedLocalization);
  [v4 encodeObject:v16 forKey:v15];
}

- (INDeferredLocalizedString)initWithCoder:(id)a3
{
  id v4 = a3;
  v38.receiver = self;
  v38.super_class = (Class)INDeferredLocalizedString;
  v5 = [(INDeferredLocalizedString *)&v38 init];
  if (!v5) {
    goto LABEL_9;
  }
  uint64_t v6 = objc_opt_class();
  v7 = NSStringFromSelector(sel__formatKey);
  uint64_t v8 = [v4 decodeObjectOfClass:v6 forKey:v7];
  formatKey = v5->_formatKey;
  v5->_formatKey = (NSString *)v8;

  if (!v5->_formatKey) {
    goto LABEL_9;
  }
  uint64_t v10 = objc_opt_class();
  v11 = NSStringFromSelector(sel__table);
  uint64_t v12 = [v4 decodeObjectOfClass:v10 forKey:v11];
  table = v5->_table;
  v5->_table = (NSString *)v12;

  v14 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v15 = objc_opt_class();
  id v16 = objc_msgSend(v14, "setWithObjects:", v15, objc_opt_class(), 0);
  v17 = NSStringFromSelector(sel__arguments);
  uint64_t v18 = [v4 decodeObjectOfClasses:v16 forKey:v17];
  v19 = (void *)v18;
  v20 = (void *)(v18 ? v18 : MEMORY[0x1E4F1CBF0]);
  objc_storeStrong((id *)&v5->_arguments, v20);

  uint64_t v21 = objc_opt_class();
  v22 = NSStringFromSelector(sel__bundleIdentifier);
  uint64_t v23 = [v4 decodeObjectOfClass:v21 forKey:v22];
  bundleIdentifier = v5->_bundleIdentifier;
  v5->_bundleIdentifier = (NSString *)v23;

  uint64_t v25 = objc_opt_class();
  v26 = NSStringFromSelector(sel__bundleURL);
  uint64_t v27 = [v4 decodeObjectOfClass:v25 forKey:v26];
  bundleURL = v5->_bundleURL;
  v5->_bundleURL = (NSURL *)v27;

  v29 = v5->_bundleURL;
  if (!v29 || [(NSURL *)v29 isFileURL])
  {
    uint64_t v30 = objc_opt_class();
    v31 = NSStringFromSelector(sel__cachedLocalization);
    uint64_t v32 = [v4 decodeObjectOfClass:v30 forKey:v31];
    cachedLocalization = v5->_cachedLocalization;
    v5->_cachedLocalization = (NSString *)v32;

    uint64_t v34 = [(INDeferredLocalizedString *)v5 localizeForLanguage:0];
    v35 = v5->_cachedLocalization;
    v5->_cachedLocalization = (NSString *)v34;

    v36 = v5;
  }
  else
  {
LABEL_9:
    v36 = 0;
  }

  return v36;
}

- (Class)classForKeyedArchiver
{
  return (Class)objc_opt_class();
}

- (Class)classForCoder
{
  return (Class)objc_opt_class();
}

- (void)getCharacters:(unsigned __int16 *)a3 range:(_NSRange)a4
{
}

- (unsigned)characterAtIndex:(unint64_t)a3
{
  return [(NSString *)self->_cachedLocalization characterAtIndex:a3];
}

- (unint64_t)length
{
  return [(NSString *)self->_cachedLocalization length];
}

- (id)description
{
  return self->_cachedLocalization;
}

- (id)localizeForLanguage:(id)a3
{
  v14 = self->_arguments;
  formatKey = self->_formatKey;
  table = self->_table;
  bundleIdentifier = self->_bundleIdentifier;
  bundleURL = self->_bundleURL;
  cachedLocalization = self->_cachedLocalization;
  id v10 = a3;
  v11 = +[INImageServiceConnection sharedConnection];
  uint64_t v12 = INLocalizedDeferredString(formatKey, (id *)&v14, table, bundleIdentifier, bundleURL, cachedLocalization, v10, v11);

  return v12;
}

- (INDeferredLocalizedString)initWithDeferredFormat:(id)a3 fromTable:(id)a4 bundleIdentifier:(id)a5 bundleURL:(id)a6 arguments:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v42.receiver = self;
  v42.super_class = (Class)INDeferredLocalizedString;
  v17 = [(INDeferredLocalizedString *)&v42 init];
  if (v17)
  {
    uint64_t v18 = [v12 copy];
    formatKey = v17->_formatKey;
    v17->_formatKey = (NSString *)v18;

    id v41 = v13;
    uint64_t v20 = [v13 copy];
    table = v17->_table;
    v17->_table = (NSString *)v20;

    id v40 = v14;
    uint64_t v22 = [v14 copy];
    bundleIdentifier = v17->_bundleIdentifier;
    v17->_bundleIdentifier = (NSString *)v22;

    uint64_t v24 = [v15 copy];
    bundleURL = v17->_bundleURL;
    v17->_bundleURL = (NSURL *)v24;

    uint64_t v26 = [v16 copy];
    arguments = v17->_arguments;
    v17->_arguments = (NSArray *)v26;

    v28 = v17->_bundleIdentifier;
    v29 = v17->_bundleURL;
    if (*(_OWORD *)&v17->_bundleIdentifier == 0)
    {
      uint64_t v30 = 0;
    }
    else
    {
      id v39 = v12;
      v31 = v17->_formatKey;
      uint64_t v32 = v17->_table;
      cachedLocalization = v17->_cachedLocalization;
      uint64_t v34 = +[INImageServiceConnection sharedConnection];
      v35 = v31;
      id v12 = v39;
      uint64_t v36 = INLocalizedDeferredString(v35, (id *)&v17->_arguments, v32, v28, v29, cachedLocalization, 0, v34);
      v37 = v17->_cachedLocalization;
      v17->_cachedLocalization = (NSString *)v36;

      uint64_t v30 = v17;
    }
    id v14 = v40;
    id v13 = v41;
  }
  else
  {
    uint64_t v30 = 0;
  }

  return v30;
}

- (INDeferredLocalizedString)initWithDeferredFormat:(id)a3 fromTable:(id)a4 bundle:(id)a5 arguments:(char *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v26 = a6;
  id v13 = [v12 bundleIdentifier];
  id v14 = [v12 bundleURL];
  if (!v13)
  {
    id v15 = [MEMORY[0x1E4F223F0] bundleProxyForCurrentProcess];
    if (v15)
    {
      objc_opt_class();
      id v16 = v15;
      if (objc_opt_isKindOfClass())
      {
        id v16 = [v15 containingBundle];
      }
    }
    else
    {
      id v16 = 0;
    }

    id v13 = [v16 bundleIdentifier];
    v17 = [v16 bundleURL];

    if (v13)
    {
      id v14 = v17;
    }
    else
    {
      uint64_t v18 = [MEMORY[0x1E4F28B50] mainBundle];
      id v13 = [v18 bundleIdentifier];
      id v14 = [v18 bundleURL];
    }
  }
  v19 = INLocalizedFormat(v10, v11, v13, v14, 0, 0, 0, 0);
  uint64_t v20 = INSharedFormatRegularExpression();
  uint64_t v21 = objc_msgSend(v20, "numberOfMatchesInString:options:range:", v19, 0, 0, objc_msgSend(v19, "length"));

  for (i = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v21]; v21; --v21)
  {
    uint64_t v23 = v26;
    v26 += 8;
    [i addObject:*(void *)v23];
  }
  uint64_t v24 = [(INDeferredLocalizedString *)self initWithDeferredFormat:v10 fromTable:v11 bundleIdentifier:v13 bundleURL:v14 arguments:i];

  return v24;
}

+ (id)makeFromWidgetPlistableRepresentation:(id)a3 error:(id *)a4
{
  id v4 = a3;
  v5 = objc_alloc_init(INDeferredLocalizedString);
  uint64_t v6 = NSStringFromSelector(sel__formatKey);
  uint64_t v7 = objc_msgSend(v4, "intents_stringForKey:", v6);
  formatKey = v5->_formatKey;
  v5->_formatKey = (NSString *)v7;

  if (!v5->_formatKey) {
    goto LABEL_8;
  }
  v9 = NSStringFromSelector(sel__table);
  uint64_t v10 = objc_msgSend(v4, "intents_stringForKey:", v9);
  table = v5->_table;
  v5->_table = (NSString *)v10;

  id v12 = NSStringFromSelector(sel__arguments);
  uint64_t v13 = objc_msgSend(v4, "intents_safeObjectForKey:ofType:", v12, objc_opt_class());
  id v14 = (void *)v13;
  id v15 = (void *)(v13 ? v13 : MEMORY[0x1E4F1CBF0]);
  objc_storeStrong((id *)&v5->_arguments, v15);

  id v16 = NSStringFromSelector(sel__bundleIdentifier);
  uint64_t v17 = objc_msgSend(v4, "intents_stringForKey:", v16);
  bundleIdentifier = v5->_bundleIdentifier;
  v5->_bundleIdentifier = (NSString *)v17;

  v19 = NSStringFromSelector(sel__bundleURL);
  uint64_t v20 = objc_msgSend(v4, "intents_urlForKey:", v19);
  bundleURL = v5->_bundleURL;
  v5->_bundleURL = (NSURL *)v20;

  uint64_t v22 = v5->_bundleURL;
  if (!v22 || [(NSURL *)v22 isFileURL])
  {
    uint64_t v23 = NSStringFromSelector(sel__cachedLocalization);
    uint64_t v24 = objc_msgSend(v4, "intents_stringForKey:", v23);
    cachedLocalization = v5->_cachedLocalization;
    v5->_cachedLocalization = (NSString *)v24;

    uint64_t v26 = [(INDeferredLocalizedString *)v5 localizeForLanguage:0];
    uint64_t v27 = v5->_cachedLocalization;
    v5->_cachedLocalization = (NSString *)v26;

    v28 = v5;
  }
  else
  {
LABEL_8:
    v28 = 0;
  }

  return v28;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1 && INLogInitIfNeeded_once != -1)
  {
    dispatch_once(&INLogInitIfNeeded_once, &__block_literal_global_71966);
  }
}

- (id)_intents_encodeForProto
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v11 = 0;
  v2 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:self requiringSecureCoding:1 error:&v11];
  id v3 = v11;
  if (v2)
  {
    id v4 = NSString;
    v5 = (objc_class *)objc_opt_class();
    uint64_t v6 = NSStringFromClass(v5);
    uint64_t v7 = [v2 base64EncodedStringWithOptions:0];
    uint64_t v8 = [v4 stringWithFormat:@"%@:%@", v6, v7];
  }
  else
  {
    v9 = INSiriLogContextIntents;
    if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v13 = "-[INDeferredLocalizedString(ProtoUtils) _intents_encodeForProto]";
      __int16 v14 = 2112;
      id v15 = v3;
      _os_log_error_impl(&dword_18CB2F000, v9, OS_LOG_TYPE_ERROR, "%s Failed to encode string for proto: %@", buf, 0x16u);
    }
    uint64_t v8 = 0;
  }

  return v8;
}

@end