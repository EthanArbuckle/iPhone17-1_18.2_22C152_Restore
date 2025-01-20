@interface ISBundleIdentifierIcon
+ (BOOL)supportsSecureCoding;
- (ISBundleIdentifierIcon)initWithBundleIdentifier:(id)a3;
- (ISBundleIdentifierIcon)initWithCoder:(id)a3;
- (NSString)bundleIdentifier;
- (double)_aspectRatio;
- (id)_makeResourceProviderAllowIconResourceFallback:(BOOL)a3;
- (id)description;
- (id)makeResourceProvider;
- (id)makeSymbolResourceProvider;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ISBundleIdentifierIcon

- (id)description
{
  v3 = NSString;
  v9.receiver = self;
  v9.super_class = (Class)ISBundleIdentifierIcon;
  v4 = [(ISBundleIdentifierIcon *)&v9 description];
  bundleIdentifier = self->_bundleIdentifier;
  v6 = [(ISConcreteIcon *)self digest];
  v7 = [v3 stringWithFormat:@"%@ BundleID: %@ digest: %@", v4, bundleIdentifier, v6];

  return v7;
}

- (ISBundleIdentifierIcon)initWithBundleIdentifier:(id)a3
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = (objc_class *)objc_opt_class();
  v7 = NSStringFromClass(v6);
  v8 = [v7 stringByAppendingPathComponent:v5];

  objc_super v9 = [objc_alloc(MEMORY[0x1E4F223C8]) initWithBundleIdentifier:v5 allowPlaceholder:1 error:0];
  if (v9) {
    goto LABEL_8;
  }
  objc_super v9 = [MEMORY[0x1E4F223F8] bundleRecordForCurrentProcess];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && ([v9 bundleIdentifier],
        v10 = objc_claimAutoreleasedReturnValue(),
        char v11 = [v10 isEqualToString:v5],
        v10,
        (v11 & 1) != 0))
  {
    if (v9) {
      goto LABEL_8;
    }
  }
  else
  {
  }
  objc_super v9 = [objc_alloc(MEMORY[0x1E4F223C8]) initWithBundleIdentifierOfSystemPlaceholder:v5 error:0];
  if (v9)
  {
LABEL_8:
    if ([v9 isPlaceholder])
    {
      v12 = [v9 URL];
      v13 = objc_msgSend(v12, "__is__contentModifiedDate");

      v14 = NSString;
      [v13 timeIntervalSinceReferenceDate];
      v16 = objc_msgSend(v14, "stringWithFormat:", @"%f", v15);
      uint64_t v17 = [v8 stringByAppendingPathComponent:v16];

      v18 = _ISDefaultLog();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
        -[ISBundleIdentifierIcon initWithBundleIdentifier:](v17, v18, v19, v20, v21, v22, v23, v24);
      }
    }
    else
    {
      v25 = [v9 persistentIdentifier];

      if (!v25)
      {
LABEL_16:
        v36 = [v9 alternateIconName];
        if (v36)
        {
          uint64_t v37 = [v5 stringByAppendingPathComponent:v36];

          v38 = _ISDefaultLog();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG)) {
            -[ISBundleIdentifierIcon initWithBundleIdentifier:](v37, v38, v39, v40, v41, v42, v43, v44);
          }

          v8 = (void *)v37;
        }

        goto LABEL_21;
      }
      v26 = (void *)MEMORY[0x1E4F29128];
      v27 = [v9 persistentIdentifier];
      v28 = objc_msgSend(v26, "_IF_UUIDWithData:", v27);
      v29 = [v28 UUIDString];
      uint64_t v17 = [v5 stringByAppendingPathComponent:v29];

      v13 = _ISDefaultLog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
        -[ISBundleIdentifierIcon initWithBundleIdentifier:](v17, v13, v30, v31, v32, v33, v34, v35);
      }
    }

    v8 = (void *)v17;
    goto LABEL_16;
  }
  objc_super v9 = _ISDefaultLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v51 = v5;
    _os_log_impl(&dword_1AE771000, v9, OS_LOG_TYPE_DEFAULT, "No record for %@", buf, 0xCu);
  }
LABEL_21:

  v45 = objc_msgSend(MEMORY[0x1E4F29128], "_IF_UUIDWithString:", v8);
  v49.receiver = self;
  v49.super_class = (Class)ISBundleIdentifierIcon;
  v46 = [(ISConcreteIcon *)&v49 initWithDigest:v45];
  v47 = v46;
  if (v46) {
    objc_storeStrong((id *)&v46->_bundleIdentifier, a3);
  }

  return v47;
}

- (void).cxx_destruct
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ISBundleIdentifierIcon)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ISBundleIdentifierIcon;
  id v5 = [(ISConcreteIcon *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bundleIdentifier"];
    bundleIdentifier = v5->_bundleIdentifier;
    v5->_bundleIdentifier = (NSString *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ISBundleIdentifierIcon;
  id v4 = a3;
  [(ISConcreteIcon *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_bundleIdentifier, @"bundleIdentifier", v5.receiver, v5.super_class);
}

- (id)_makeResourceProviderAllowIconResourceFallback:(BOOL)a3
{
  BOOL v3 = a3;
  objc_super v5 = +[ISDefaults sharedInstance];
  int v6 = [v5 enableAppIconOverides];

  if (!v6
    || (+[ISCustomIconManager sharedInstance],
        v7 = objc_claimAutoreleasedReturnValue(),
        [v7 overrideResourceForBundleIdentifier:self->_bundleIdentifier],
        v8 = objc_claimAutoreleasedReturnValue(),
        v7,
        !v8))
  {
    p_bundleIdentifier = (uint64_t *)&self->_bundleIdentifier;
    char v11 = (void *)[objc_alloc(MEMORY[0x1E4F223C8]) initWithBundleIdentifier:self->_bundleIdentifier allowPlaceholder:1 error:0];
    if (v11)
    {
      v12 = v11;
      v13 = [v11 appClipMetadata];

      if (v13) {
        v13 = objc_opt_new();
      }
    }
    else
    {
      v12 = (void *)[objc_alloc(MEMORY[0x1E4F223A0]) initWithBundleIdentifier:*p_bundleIdentifier error:0];
      v13 = 0;
      if (objc_msgSend(v12, "_IS_isMessagesExtension")) {
        v13 = objc_opt_new();
      }
      if ((objc_msgSend(v12, "_is_canProvideIconResources") & 1) == 0)
      {
        uint64_t v14 = [v12 containingBundleRecord];

        v12 = (void *)v14;
      }
      if (!v12)
      {
        uint64_t v15 = [objc_alloc(MEMORY[0x1E4F223C8]) initWithBundleIdentifierOfSystemPlaceholder:*p_bundleIdentifier error:0];
        if (!v15)
        {
          v26 = [MEMORY[0x1E4F22490] typeRecordWithIdentifier:*MEMORY[0x1E4F22528]];
          uint64_t v17 = v26;
          if (v26) {
            id v27 = v26;
          }

          id v16 = 0;
LABEL_15:
          v18 = [[ISRecordResourceProvider alloc] initWithRecord:v17 options:0];
          if (v18)
          {
            objc_super v9 = v18;
            if (!v3) {
              goto LABEL_26;
            }
          }
          else
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              uint64_t v19 = [v17 containingBundleRecord];

              objc_super v9 = [[ISRecordResourceProvider alloc] initWithRecord:v19 options:0];
              uint64_t v17 = (void *)v19;
              if (!v3) {
                goto LABEL_26;
              }
            }
            else
            {
              objc_super v9 = 0;
              if (!v3)
              {
LABEL_26:
                uint64_t v23 = [(ISResourceProvider *)v9 suggestedRecipe];
                if (v23)
                {
                  uint64_t v24 = [(ISResourceProvider *)v9 suggestedRecipe];
                  [(ISResourceProvider *)v9 setSuggestedRecipe:v24];
                }
                else
                {
                  [(ISResourceProvider *)v9 setSuggestedRecipe:v13];
                }

                [(ISResourceProvider *)v9 setResourceType:1];
                goto LABEL_30;
              }
            }
          }
          uint64_t v20 = [(ISRecordResourceProvider *)v9 iconResource];

          if (!v20)
          {
            uint64_t v21 = _ISDefaultLog();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
              [(ISBundleIdentifierIcon *)p_bundleIdentifier _makeResourceProviderAllowIconResourceFallback:v21];
            }

            uint64_t v22 = +[ISResourceProvider defaultAppIconResourceProvider];

            [(ISResourceProvider *)v22 setPlaceholder:1];
            objc_super v9 = v22;
          }
          goto LABEL_26;
        }
        v12 = (void *)v15;
      }
    }
    id v16 = v12;
    uint64_t v17 = v16;
    goto LABEL_15;
  }
  objc_super v9 = [[ISResourceProvider alloc] initWithResource:v8 templateResource:0];

LABEL_30:
  return v9;
}

- (id)makeResourceProvider
{
  return [(ISBundleIdentifierIcon *)self _makeResourceProviderAllowIconResourceFallback:1];
}

- (id)makeSymbolResourceProvider
{
  return [(ISBundleIdentifierIcon *)self _makeResourceProviderAllowIconResourceFallback:0];
}

- (double)_aspectRatio
{
  return 1.0;
}

- (NSString)bundleIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)initWithBundleIdentifier:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithBundleIdentifier:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithBundleIdentifier:(uint64_t)a3 .cold.3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_makeResourceProviderAllowIconResourceFallback:(os_log_t)log .cold.1(uint64_t *a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *a1;
  int v4 = 138412546;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_1AE771000, log, OS_LOG_TYPE_ERROR, "Failed to find icon resources for bundle identifier %@ - %@. Creating placeholder provider", (uint8_t *)&v4, 0x16u);
}

@end