@interface ISBundleIcon
+ (BOOL)supportsSecureCoding;
- (ISBundleIcon)initWithBundleURL:(id)a3;
- (ISBundleIcon)initWithBundleURL:(id)a3 fileExtension:(id)a4;
- (ISBundleIcon)initWithBundleURL:(id)a3 type:(id)a4;
- (ISBundleIcon)initWithBundleURL:(id)a3 type:(id)a4 tag:(id)a5 tagClass:(id)a6;
- (ISBundleIcon)initWithCoder:(id)a3;
- (NSString)tag;
- (NSString)tagClass;
- (NSString)type;
- (NSURL)url;
- (double)_aspectRatio;
- (id)_makeAppResourceProvider;
- (id)_makeDocumentResourceProvider;
- (id)description;
- (id)makeResourceProvider;
- (void)_makeAppResourceProvider;
- (void)_makeDocumentResourceProvider;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ISBundleIcon

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ISBundleIcon)initWithBundleURL:(id)a3 type:(id)a4 tag:(id)a5 tagClass:(id)a6
{
  v45[2] = *MEMORY[0x1E4F143B8];
  id obj = a3;
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v40 = a6;
  id v12 = a6;
  v13 = [v9 absoluteString];
  v14 = v13;
  if (v10)
  {
    uint64_t v15 = objc_msgSend(v13, "stringByAppendingString:", v10, obj, a6);

    v14 = (void *)v15;
  }
  if (v11)
  {
    uint64_t v16 = [v14 stringByAppendingString:v11];

    v14 = (void *)v16;
  }
  v43 = v10;
  if (v12)
  {
    uint64_t v17 = [v14 stringByAppendingString:v12];

    v14 = (void *)v17;
  }
  id v18 = (id)[objc_alloc(MEMORY[0x1E4F223C8]) initWithURL:v9 allowPlaceholder:1 error:0];
  if (!v18)
  {
    v19 = [MEMORY[0x1E4F223F8] bundleRecordForCurrentProcess];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && ([v19 URL],
          v20 = objc_claimAutoreleasedReturnValue(),
          int v21 = [v20 isEqual:v9],
          v20,
          v21))
    {
      id v18 = v19;
    }
    else
    {
      id v18 = 0;
    }
  }
  v22 = objc_msgSend(v18, "alternateIconName", obj);
  v42 = v12;
  if (v22)
  {
    uint64_t v23 = [v14 stringByAppendingString:v22];

    v14 = (void *)v23;
  }
  v24 = objc_msgSend(v9, "__is__contentModifiedDate");
  v25 = objc_msgSend(MEMORY[0x1E4F29128], "_IF_UUIDWithString:", v14);
  v26 = (void *)MEMORY[0x1E4F29128];
  [v24 timeIntervalSinceReferenceDate];
  v27 = objc_msgSend(v26, "_IF_UUIDWithDouble:");
  v28 = (void *)MEMORY[0x1E4F29128];
  v45[0] = v25;
  v45[1] = v27;
  v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:v45 count:2];
  v30 = objc_msgSend(v28, "_IF_UUIDByXORingUUIDs:", v29);

  v44.receiver = self;
  v44.super_class = (Class)ISBundleIcon;
  v31 = [(ISConcreteIcon *)&v44 initWithDigest:v30];
  v32 = v31;
  if (v31)
  {
    objc_storeStrong((id *)&v31->_url, obja);
    uint64_t v33 = [v11 copy];
    tag = v32->_tag;
    v32->_tag = (NSString *)v33;

    objc_storeStrong((id *)&v32->_tagClass, v40);
    uint64_t v35 = [v43 copy];
    type = v32->_type;
    v32->_type = (NSString *)v35;
  }
  return v32;
}

- (ISBundleIcon)initWithBundleURL:(id)a3
{
  return [(ISBundleIcon *)self initWithBundleURL:a3 type:0 tag:0 tagClass:0];
}

- (ISBundleIcon)initWithBundleURL:(id)a3 type:(id)a4
{
  return [(ISBundleIcon *)self initWithBundleURL:a3 type:a4 tag:0 tagClass:0];
}

- (ISBundleIcon)initWithBundleURL:(id)a3 fileExtension:(id)a4
{
  return [(ISBundleIcon *)self initWithBundleURL:a3 type:0 tag:a4 tagClass:*MEMORY[0x1E4F224F8]];
}

- (ISBundleIcon)initWithCoder:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)ISBundleIcon;
  v5 = [(ISConcreteIcon *)&v16 initWithCoder:v4];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bundleURLString"];
    url = v5->_url;
    v5->_url = v6;
    v8 = v6;

    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"tag"];
    tag = v5->_tag;
    v5->_tag = (NSString *)v9;

    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"tagClass"];
    tagClass = v5->_tagClass;
    v5->_tagClass = (NSString *)v11;

    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"type"];
    type = v5->_type;
    v5->_type = (NSString *)v13;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ISBundleIcon;
  id v4 = a3;
  [(ISConcreteIcon *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_url, @"bundleURLString", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_tag forKey:@"tag"];
  [v4 encodeObject:self->_tagClass forKey:@"tagClass"];
  [v4 encodeObject:self->_type forKey:@"type"];
}

- (id)_makeDocumentResourceProvider
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v3 = (id)*MEMORY[0x1E4F22590];
  p_url = (id *)&self->_url;
  if ([(NSURL *)self->_url __is_isApplication])
  {
    id v5 = objc_alloc(MEMORY[0x1E4F223C8]);
    id v6 = *p_url;
    id v24 = 0;
    uint64_t v7 = [v5 initWithURL:v6 allowPlaceholder:1 error:&v24];
    id v8 = v24;
    if (v7)
    {
LABEL_16:
      uint64_t v9 = v7;
      goto LABEL_17;
    }
    uint64_t v9 = _ISDefaultLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = *p_url;
      *(_DWORD *)buf = 138412546;
      id v27 = v10;
      __int16 v28 = 2112;
      id v29 = v8;
      _os_log_impl(&dword_1AE771000, v9, OS_LOG_TYPE_DEFAULT, "Application record not found for URL %@ with error: %@", buf, 0x16u);
    }
LABEL_15:

    goto LABEL_16;
  }
  if (!objc_msgSend(*p_url, "__is_isAppExtension"))
  {
    uint64_t v13 = _ISDefaultLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      [(ISBundleIcon *)(uint64_t *)&self->_url _makeDocumentResourceProvider];
    }
    uint64_t v9 = 0;
    v14 = 0;
    goto LABEL_22;
  }
  id v11 = objc_alloc(MEMORY[0x1E4F223A0]);
  id v12 = *p_url;
  id v23 = 0;
  uint64_t v9 = [v11 initWithURL:v12 error:&v23];
  id v8 = v23;
  if (!v9)
  {
    uint64_t v9 = _ISDefaultLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v15 = *p_url;
      *(_DWORD *)buf = 138412546;
      id v27 = v15;
      __int16 v28 = 2112;
      id v29 = v8;
      _os_log_impl(&dword_1AE771000, v9, OS_LOG_TYPE_DEFAULT, "ApplicationExtension record not found for URL %@ with error: %@", buf, 0x16u);
    }
    uint64_t v7 = 0;
    goto LABEL_15;
  }
  if (([v9 _is_canProvideIconResources] & 1) == 0)
  {
    uint64_t v7 = [v9 containingBundleRecord];
    goto LABEL_15;
  }
LABEL_17:

  if (!v9) {
    goto LABEL_26;
  }
  if (self->_type)
  {
    uint64_t v16 = -[NSObject _IS_iconDictionaryForType:](v9, "_IS_iconDictionaryForType:");
  }
  else
  {
    if (!self->_tag || !self->_tagClass) {
      goto LABEL_26;
    }
    uint64_t v16 = -[NSObject _IS_iconDictionaryForTag:tagClass:](v9, "_IS_iconDictionaryForTag:tagClass:");
  }
  uint64_t v13 = v16;
  if (!v16)
  {
LABEL_26:
    v14 = 0;
    goto LABEL_27;
  }
  v25[0] = 0x1F0639250;
  v25[1] = 0x1F063A290;
  uint64_t v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:2];
  id v18 = [v13 _IF_stringForKeys:v17];

  v14 = [[ISBundleResourceProvider alloc] initWithBundleURL:*p_url iconDictionary:v13 options:v18 != 0];
LABEL_22:

LABEL_27:
  if (![(ISResourceProvider *)v14 options])
  {
    v19 = [(ISBundleResourceProvider *)v14 iconResource];

    if (!v19)
    {
      v20 = _ISDefaultLog();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        -[ISBundleIcon _makeDocumentResourceProvider](p_url);
      }

      uint64_t v21 = +[ISResourceProvider defaultAppIconResourceProvider];

      v14 = (ISBundleResourceProvider *)v21;
    }
  }
  [(ISResourceProvider *)v14 setResourceType:2];

  return v14;
}

- (id)_makeAppResourceProvider
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  p_url = (uint64_t *)&self->_url;
  if ([(NSURL *)self->_url __is_isApplication])
  {
    id v3 = objc_alloc(MEMORY[0x1E4F223C8]);
    uint64_t v4 = *p_url;
    id v29 = 0;
    id v5 = [v3 initWithURL:v4 allowPlaceholder:1 error:&v29];
    id v6 = v29;
    if (!v5)
    {
      id v15 = _ISDefaultLog();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v16 = *p_url;
        *(_DWORD *)buf = 138412546;
        uint64_t v31 = v16;
        __int16 v32 = 2112;
        id v33 = v6;
        _os_log_impl(&dword_1AE771000, v15, OS_LOG_TYPE_DEFAULT, "Application record not found for URL %@ with error: %@", buf, 0x16u);
      }

      goto LABEL_17;
    }
    uint64_t v7 = +[ISDefaults sharedInstance];
    if ([v7 enableAppIconOverides])
    {
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) == 0)
      {
LABEL_16:
        uint64_t v17 = v5;
LABEL_17:
        uint64_t v7 = 0;
        uint64_t v18 = (uint64_t)v5;
        goto LABEL_18;
      }
      uint64_t v7 = v5;
      uint64_t v9 = +[ISCustomIconManager sharedInstance];
      id v10 = [v7 bundleIdentifier];
      id v11 = [v9 overrideResourceForBundleIdentifier:v10];

      if (v11)
      {
        id v12 = [[ISResourceProvider alloc] initWithResource:v11 templateResource:0];

        goto LABEL_34;
      }
    }

    goto LABEL_16;
  }
  if (!objc_msgSend((id)*p_url, "__is_isAppExtension"))
  {
    uint64_t v7 = 0;
    id v6 = 0;
LABEL_21:
    v20 = [MEMORY[0x1E4F6F1C0] bundleWithURL:*p_url];
    if (v20)
    {
      id v12 = [[ISBundleResourceProvider alloc] initWithBundle:v20 options:0];
    }
    else
    {
      uint64_t v21 = _ISDefaultLog();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
        [(ISBundleIcon *)p_url _makeAppResourceProvider];
      }

      id v12 = 0;
    }

    goto LABEL_27;
  }
  id v13 = objc_alloc(MEMORY[0x1E4F223A0]);
  uint64_t v14 = *p_url;
  id v28 = 0;
  id v5 = [v13 initWithURL:v14 error:&v28];
  id v6 = v28;
  if (v5)
  {
    if ([v5 _IS_isMessagesExtension]) {
      uint64_t v7 = objc_opt_new();
    }
    else {
      uint64_t v7 = 0;
    }
    if ([v5 _is_canProvideIconResources])
    {
      v19 = v6;
      id v6 = v5;
      goto LABEL_19;
    }
    uint64_t v18 = [v5 containingBundleRecord];
  }
  else
  {
    id v5 = _ISDefaultLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v27 = *p_url;
      *(_DWORD *)buf = 138412546;
      uint64_t v31 = v27;
      __int16 v32 = 2112;
      id v33 = v6;
      _os_log_impl(&dword_1AE771000, v5, OS_LOG_TYPE_DEFAULT, "ApplicationExtension record not found for URL %@ with error: %@", buf, 0x16u);
    }
    uint64_t v7 = 0;
    uint64_t v18 = 0;
  }
LABEL_18:

  v19 = v6;
  id v6 = (id)v18;
LABEL_19:

  if (!v6) {
    goto LABEL_21;
  }
  id v12 = [[ISRecordResourceProvider alloc] initWithRecord:v6 options:0];
  if (!v12) {
    goto LABEL_21;
  }
LABEL_27:
  v22 = [(ISBundleResourceProvider *)v12 iconResource];
  if (v22)
  {
  }
  else
  {
    id v23 = [(ISResourceProvider *)v12 customRecipe];

    if (!v23)
    {
      id v24 = _ISDefaultLog();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
        -[ISBundleIcon _makeAppResourceProvider]((id *)p_url);
      }

      v25 = +[ISResourceProvider defaultAppIconResourceProvider];

      [(ISResourceProvider *)v25 setPlaceholder:1];
      id v12 = v25;
    }
  }
  [(ISResourceProvider *)v12 setSuggestedRecipe:v7];
  [(ISResourceProvider *)v12 setResourceType:1];
LABEL_34:

  return v12;
}

- (id)makeResourceProvider
{
  if (self->_tag && self->_tagClass || self->_type)
  {
    v2 = [(ISBundleIcon *)self _makeDocumentResourceProvider];
  }
  else
  {
    v2 = [(ISBundleIcon *)self _makeAppResourceProvider];
  }
  return v2;
}

- (id)description
{
  id v3 = NSString;
  v12.receiver = self;
  v12.super_class = (Class)ISBundleIcon;
  uint64_t v4 = [(ISBundleIcon *)&v12 description];
  url = self->_url;
  type = self->_type;
  tag = self->_tag;
  tagClass = self->_tagClass;
  uint64_t v9 = [(ISConcreteIcon *)self digest];
  id v10 = [v3 stringWithFormat:@"%@ Bundle URL: %@ type: %@ tag: %@ tag class: %@ digest:%@", v4, url, type, tag, tagClass, v9];

  return v10;
}

- (double)_aspectRatio
{
  return 1.0;
}

- (NSURL)url
{
  return (NSURL *)objc_getProperty(self, a2, 40, 1);
}

- (NSString)type
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (NSString)tag
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (NSString)tagClass
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tagClass, 0);
  objc_storeStrong((id *)&self->_tag, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

- (void)_makeDocumentResourceProvider
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_1AE771000, a2, OS_LOG_TYPE_DEBUG, "Bundle at URL: %@ does not provide document icon resources.", (uint8_t *)&v3, 0xCu);
}

- (void)_makeAppResourceProvider
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_1AE771000, a2, OS_LOG_TYPE_DEBUG, "Failed to load bundle: %@", (uint8_t *)&v3, 0xCu);
}

@end