@interface ISIconFactory
+ (id)_iconForURL:(id)a3;
+ (id)_iconForURL:(id)a3 options:(unint64_t)a4;
- (ISIconFactory)initWithApplicationBundleIdentifier:(id)a3;
- (ISIconFactory)initWithApplicationExtensionBundleIdentifier:(id)a3;
- (ISIconFactory)initWithApplicationIdentity:(id)a3;
- (ISIconFactory)initWithBundleIdentifier:(id)a3;
- (ISIconFactory)initWithBundleURL:(id)a3 fileExtension:(id)a4;
- (ISIconFactory)initWithBundleURL:(id)a3 type:(id)a4;
- (ISIconFactory)initWithFileExtension:(id)a3;
- (ISIconFactory)initWithImages:(id)a3;
- (ISIconFactory)initWithMIMEType:(id)a3;
- (ISIconFactory)initWithModelCode:(id)a3;
- (ISIconFactory)initWithResourceProxy:(id)a3;
- (ISIconFactory)initWithSymbolName:(id)a3;
- (ISIconFactory)initWithSymbolName:(id)a3 configuration:(id)a4;
- (ISIconFactory)initWithType:(id)a3;
- (ISIconFactory)initWithURL:(id)a3;
- (ISIconFactory)initWithURL:(id)a3 options:(unint64_t)a4;
- (id)_init;
@end

@implementation ISIconFactory

- (ISIconFactory)initWithBundleIdentifier:(id)a3
{
  id v4 = a3;
  v5 = [[ISBundleIdentifierIcon alloc] initWithBundleIdentifier:v4];
  v6 = _aliasedIcon(v4, v5);
  if (v6)
  {
    v7 = _ISDefaultLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      -[ISIconFactory initWithBundleIdentifier:]();
    }

    v8 = v6;
    v5 = v8;
  }
  v9 = +[ISIconManager sharedInstance];
  v10 = [v9 findOrRegisterIcon:v5];

  return v10;
}

- (ISIconFactory)initWithType:(id)a3
{
  id v4 = a3;
  if (![v4 caseInsensitiveCompare:*MEMORY[0x1E4F225C8]])
  {
    v8 = ISGenericFolderIcon;
LABEL_6:
    v7 = [(__objc2_class *)v8 sharedInstance];
    goto LABEL_7;
  }
  if (![v4 caseInsensitiveCompare:*MEMORY[0x1E4F22528]])
  {
    v8 = ISGenericApplicationIcon;
    goto LABEL_6;
  }
  v5 = [[ISTypeIcon alloc] initWithType:v4];
  v6 = +[ISIconManager sharedInstance];
  v7 = [v6 findOrRegisterIcon:v5];

LABEL_7:
  return v7;
}

- (ISIconFactory)initWithResourceProxy:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = [v4 bundleIdentifier];
    v6 = [[ISBundleIdentifierIcon alloc] initWithBundleIdentifier:v5];
  }
  else
  {
    v6 = 0;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_15;
    }
    id v8 = v4;
    v11 = [v8 URL];

    if (v11)
    {
      v12 = [v8 URL];
      uint64_t v13 = +[ISIconFactory _iconForURL:v12 options:0];
    }
    else
    {
      v14 = [v8 typeIdentifier];

      if (!v14)
      {
        uint64_t v19 = [v8 name];
        if (v19)
        {
          v20 = (void *)v19;
          v21 = [v8 name];
          v22 = [v21 pathExtension];
          uint64_t v23 = [v22 length];

          if (v23)
          {
            v24 = [ISTagIcon alloc];
            v12 = [v8 name];
            v25 = [(ISBundleIdentifierIcon *)v12 pathExtension];
            uint64_t v10 = [(ISTagIcon *)v24 initWithFileExtension:v25];

            goto LABEL_13;
          }
        }
        v26 = [v8 MIMEType];

        if (v26)
        {
          v27 = [ISTagIcon alloc];
          v12 = [v8 MIMEType];
          uint64_t v13 = [(ISTagIcon *)v27 initWithMIMEType:v12];
          goto LABEL_12;
        }
        v28 = [v8 typeIdentifier];

        if (!v28)
        {
          uint64_t v9 = +[ISIcon genericDocumentIcon];
          goto LABEL_6;
        }
      }
      v15 = [ISTypeIcon alloc];
      v12 = [v8 typeIdentifier];
      uint64_t v13 = [(ISTypeIcon *)v15 initWithType:v12];
    }
LABEL_12:
    uint64_t v10 = v13;

LABEL_13:
    v6 = v12;
    goto LABEL_14;
  }
  v7 = [ISBundleIdentifierIcon alloc];
  id v8 = [v4 bundleIdentifier];
  uint64_t v9 = [(ISBundleIdentifierIcon *)v7 initWithBundleIdentifier:v8];
LABEL_6:
  uint64_t v10 = v9;
LABEL_14:

  v6 = (ISBundleIdentifierIcon *)v10;
LABEL_15:
  if (v6)
  {
    v16 = +[ISIconManager sharedInstance];
    v17 = [v16 findOrRegisterIcon:v6];
  }
  else
  {
    v17 = +[ISUnknownIcon sharedInstance];
  }

  return v17;
}

+ (id)_iconForURL:(id)a3
{
  return +[ISIconFactory _iconForURL:a3 options:0];
}

+ (id)_iconForURL:(id)a3 options:(unint64_t)a4
{
  char v85 = a4;
  v96[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = +[ISURLResourcePropertySpecification sharedInstance];
  v6 = [v5 iconInitWithURLProperties];
  id v87 = 0;
  v7 = objc_msgSend(v4, "__is_resourceValuesForKeys:error:", v6, &v87);
  id v8 = v87;

  uint64_t v9 = (uint64_t *)MEMORY[0x1E4F1C700];
  if (v7)
  {
    uint64_t v10 = *MEMORY[0x1E4F1C700];
  }
  else
  {
    v11 = _ISDefaultLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v89 = v4;
      __int16 v90 = 2112;
      id v91 = v8;
      _os_log_impl(&dword_1AE771000, v11, OS_LOG_TYPE_DEFAULT, "Could not get resource properties for URL: %@ with error: %@", buf, 0x16u);
    }

    v12 = _ISURLCacheLog();
    os_signpost_id_t v13 = os_signpost_id_make_with_pointer(v12, v4);

    if (v13)
    {
      v14 = _ISURLCacheLog();
      BOOL v15 = os_signpost_enabled(v14);

      if (v15)
      {
        v16 = _ISURLCacheLog();
        v17 = v16;
        if (v13 != -1 && os_signpost_enabled(v16))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1AE771000, v17, OS_SIGNPOST_EVENT, v13, "path", "resource property values are nil", buf, 2u);
        }
      }
    }
    uint64_t v10 = *v9;
    v95[0] = *v9;
    uint64_t v18 = [v4 path];
    uint64_t v19 = (void *)v18;
    v20 = &stru_1F06391F0;
    if (v18) {
      v20 = (__CFString *)v18;
    }
    v95[1] = *MEMORY[0x1E4F1C670];
    v96[0] = v20;
    v96[1] = MEMORY[0x1E4F1CC38];
    v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v96 forKeys:v95 count:2];
  }
  v21 = objc_msgSend(v7, "_IF_objectOfClass:forKey:", objc_opt_class(), v10);
  if (!v21)
  {
    v22 = _ISURLCacheLog();
    os_signpost_id_t v23 = os_signpost_id_make_with_pointer(v22, v4);

    if (v23)
    {
      v24 = _ISURLCacheLog();
      BOOL v25 = os_signpost_enabled(v24);

      if (v25)
      {
        v26 = _ISURLCacheLog();
        v27 = v26;
        if (v23 != -1 && os_signpost_enabled(v26))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1AE771000, v27, OS_SIGNPOST_EVENT, v23, "path", "NSURLPathKey is nil", buf, 2u);
        }
      }
    }
    v21 = [v4 path];
  }
  v86 = v8;
  int v28 = objc_msgSend(v7, "_IF_BOOLForKey:", *MEMORY[0x1E4F1C628]);
  int v29 = objc_msgSend(v7, "_IF_BOOLForKey:", *MEMORY[0x1E4F1C658]);
  v30 = [v21 pathExtension];
  if ((objc_msgSend(v7, "_IF_BOOLForKey:", *MEMORY[0x1E4F1C610]) & 1) != 0
    || objc_msgSend(v7, "_IF_BOOLForKey:", *MEMORY[0x1E4F1C680]))
  {
    v31 = _ISDefaultLog();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG)) {
      +[ISIconFactory _iconForURL:options:]();
    }

    v32 = [[ISAliasIcon alloc] initWithAliasURL:v4];
    goto LABEL_27;
  }
  if (objc_msgSend(v7, "_IF_BOOLForKey:", *MEMORY[0x1E4F1C618]))
  {
LABEL_33:
    BOOL v37 = _ISGenerateInProcess(v4);
    v38 = _ISDefaultLog();
    BOOL v39 = os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG);
    if (v37)
    {
      if (v39) {
        +[ISIconFactory _iconForURL:options:].cold.4();
      }

      v40 = (void *)[objc_alloc(MEMORY[0x1E4F6F1C0]) initWithURL:v4];
      v41 = [v40 iconDictionary];
      v42 = objc_msgSend(v41, "_IF_arrayForKey:", @"CFBundleIconFiles");

      if (![v42 count])
      {
        v43 = [v40 iconDictionary];
        v44 = objc_msgSend(v43, "_IF_stringForKey:", @"CFBundleIconFile");

        if (v44)
        {
          v94 = v44;
          uint64_t v45 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v94 count:1];

          v42 = (void *)v45;
        }
      }
      v46 = [MEMORY[0x1E4F6F1F0] imageBagWithResourcesNames:v42 fromBundle:v40];
      if (!v46)
      {
        v46 = [MEMORY[0x1E4F6F1F0] defaultAppIconAssetsBag];
      }
      v33 = [[ISImageBagIcon alloc] initWithImageBag:v46];
    }
    else
    {
      if (v39) {
        +[ISIconFactory _iconForURL:options:].cold.5();
      }

      v33 = [[ISBundleIcon alloc] initWithBundleURL:v4];
      v57 = (void *)[objc_alloc(MEMORY[0x1E4F223C8]) initWithURL:v4 allowPlaceholder:0 error:0];
      v40 = v57;
      if (!v57 || [v57 developerType] != 1) {
        goto LABEL_75;
      }
      v58 = [v40 bundleIdentifier];
      v42 = _aliasedIcon(v58, v33);

      if (v42)
      {
        v59 = _ISDefaultLog();
        if (os_log_type_enabled(v59, OS_LOG_TYPE_DEBUG))
        {
          [v40 bundleIdentifier];
          v83 = log = v59;
          *(_DWORD *)buf = 138412802;
          id v89 = v83;
          __int16 v90 = 2112;
          id v91 = v4;
          __int16 v92 = 2112;
          v93 = v33;

          v59 = log;
        }

        v60 = v42;
        v33 = v60;
      }
    }

LABEL_75:
    goto LABEL_28;
  }
  if (v29)
  {
    if (objc_msgSend(v7, "_IF_BOOLForKey:", *MEMORY[0x1E4F1C640])
      && objc_msgSend(v4, "__is_hasFileExtension:", @"appex"))
    {
      goto LABEL_33;
    }
    v54 = _ISDefaultLog();
    if (os_log_type_enabled(v54, OS_LOG_TYPE_DEBUG)) {
      +[ISIconFactory _iconForURL:options:].cold.6();
    }

    v55 = [ISTagIcon alloc];
    v56 = (void *)MEMORY[0x1E4F22680];
LABEL_86:
    v32 = [(ISTagIcon *)v55 initWithFileExtension:v30 baseType:*v56];
LABEL_27:
    v33 = (ISImageBagIcon *)v32;
    goto LABEL_28;
  }
  uint64_t v61 = [v30 length];
  uint64_t v62 = *MEMORY[0x1E4F1C670];
  if (!v61
    && objc_msgSend(v7, "_IF_BOOLForKey:", *MEMORY[0x1E4F1C670])
    && objc_msgSend(v7, "_IF_BOOLForKey:", *MEMORY[0x1E4F1C640]))
  {
    v63 = _ISDefaultLog();
    if (os_log_type_enabled(v63, OS_LOG_TYPE_DEBUG)) {
      +[ISIconFactory _iconForURL:options:].cold.7();
    }

    v64 = [ISTypeIcon alloc];
    v32 = [(ISTypeIcon *)v64 initWithType:*MEMORY[0x1E4F22710]];
    goto LABEL_27;
  }
  if (objc_msgSend(v7, "_IF_BOOLForKey:", v62))
  {
    v65 = _ISDefaultLog();
    if (os_log_type_enabled(v65, OS_LOG_TYPE_DEBUG)) {
      +[ISIconFactory _iconForURL:options:].cold.8();
    }

    v55 = [ISTagIcon alloc];
    v56 = (void *)MEMORY[0x1E4F22608];
    goto LABEL_86;
  }
  if (v28)
  {
    v66 = _ISURLCacheLog();
    os_signpost_id_t v67 = os_signpost_id_make_with_pointer(v66, v4);

    if (v67)
    {
      v68 = _ISURLCacheLog();
      BOOL v69 = os_signpost_enabled(v68);

      if (v69)
      {
        v70 = _ISURLCacheLog();
        v71 = v70;
        if (v67 != -1 && os_signpost_enabled(v70))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1AE771000, v71, OS_SIGNPOST_EVENT, v67, "isFileReferenceURL", "checking for file ref url", buf, 2u);
        }
      }
    }
    if ([v4 isFileReferenceURL])
    {
      v72 = _ISURLCacheLog();
      os_signpost_id_t v73 = os_signpost_id_make_with_pointer(v72, v4);

      if (v73)
      {
        v74 = _ISURLCacheLog();
        BOOL v75 = os_signpost_enabled(v74);

        if (v75)
        {
          v76 = _ISURLCacheLog();
          v77 = v76;
          if (v73 != -1 && os_signpost_enabled(v76))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_1AE771000, v77, OS_SIGNPOST_EVENT, v73, "filePathURL", "getting file path URL for debug level logging", buf, 2u);
          }
        }
      }
      v78 = _ISDefaultLog();
      if (os_log_type_enabled(v78, OS_LOG_TYPE_DEBUG)) {
        +[ISIconFactory _iconForURL:options:]0(v4, v78);
      }
    }
    else
    {
      v78 = _ISDefaultLog();
      if (os_log_type_enabled(v78, OS_LOG_TYPE_DEBUG)) {
        +[ISIconFactory _iconForURL:options:]1();
      }
    }

    v79 = +[ISCustomIconManager sharedInstance];
    v80 = [v79 specialFolderTypeForURL:v4];

    if (v80)
    {
      v81 = _ISDefaultLog();
      if (os_log_type_enabled(v81, OS_LOG_TYPE_DEBUG)) {
        +[ISIconFactory _iconForURL:options:].cold.9();
      }

      v82 = [[ISTypeIcon alloc] initWithType:v80];
    }
    else
    {
      v82 = +[ISGenericFolderIcon sharedInstance];
    }
    v33 = (ISImageBagIcon *)v82;
  }
  else
  {
    v33 = 0;
  }
LABEL_28:
  v34 = objc_opt_new();
  if ((v28 ^ 1 | v29)) {
    goto LABEL_46;
  }
  int v35 = objc_msgSend(v4, "__is_accessFlags");
  if (v35)
  {
    if (v35 != 2) {
      goto LABEL_46;
    }
    v36 = kISIconDecorationDropFolderBadgeType;
  }
  else
  {
    v36 = kISIconDecorationPrivateFolderBadgeType;
  }
  v47 = [[ISIconDecoration alloc] initWithType:*v36];
  [v34 addObject:v47];

LABEL_46:
  if (objc_msgSend(v4, "__is_locked", log))
  {
    v48 = [[ISIconDecoration alloc] initWithType:@"com.apple.icon-decoration.badge.locked"];
    [v34 addObject:v48];
  }
  if ([v34 count])
  {
    if ((v85 & 2) != 0)
    {
      v50 = _ISDefaultLog();
      if (os_log_type_enabled(v50, OS_LOG_TYPE_DEBUG)) {
        +[ISIconFactory _iconForURL:options:]();
      }
    }
    else
    {
      v49 = [(ISImageBagIcon *)v33 decorations];
      v50 = [v49 arrayByAddingObjectsFromArray:v34];

      v51 = [[ISDecoratedIcon alloc] initWithIcon:v33 decorations:v50];
      v33 = (ISImageBagIcon *)v51;
    }
  }
  if (!v33)
  {
    v52 = _ISDefaultLog();
    if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG)) {
      +[ISIconFactory _iconForURL:options:]();
    }

    v33 = +[ISUnknownIcon sharedInstance];
  }

  return v33;
}

- (id)_init
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"ISIcon.m" lineNumber:576 description:@"Unexpected call of -[ISIconFactory _init]"];

  return 0;
}

- (ISIconFactory)initWithURL:(id)a3 options:(unint64_t)a4
{
  id v6 = a3;
  v7 = _ISURLCacheLog();
  os_signpost_id_t v8 = os_signpost_id_make_with_pointer(v7, v6);

  if (v8)
  {
    uint64_t v9 = _ISURLCacheLog();
    uint64_t v10 = v9;
    if (v8 != -1 && os_signpost_enabled(v9))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1AE771000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "accessing URL", "-[ISIcon initWithURL:options:]", buf, 2u);
    }
  }
  v11 = +[ISIconFactory _iconForURL:v6 options:a4];
  v12 = _ISURLCacheLog();
  os_signpost_id_t v13 = os_signpost_id_make_with_pointer(v12, v6);

  if (v13)
  {
    v14 = _ISURLCacheLog();
    BOOL v15 = os_signpost_enabled(v14);

    if (v15)
    {
      v16 = _ISURLCacheLog();
      v17 = v16;
      if (v13 != -1 && os_signpost_enabled(v16))
      {
        *(_WORD *)v21 = 0;
        _os_signpost_emit_with_name_impl(&dword_1AE771000, v17, OS_SIGNPOST_INTERVAL_END, v13, "accessing URL", "-[ISIcon initWithURL:options:]", v21, 2u);
      }
    }
  }
  uint64_t v18 = +[ISIconManager sharedInstance];
  uint64_t v19 = [v18 findOrRegisterIcon:v11];

  return v19;
}

- (ISIconFactory)initWithURL:(id)a3
{
  id v4 = a3;
  v5 = _ISURLCacheLog();
  os_signpost_id_t v6 = os_signpost_id_make_with_pointer(v5, v4);

  if (v6)
  {
    v7 = _ISURLCacheLog();
    os_signpost_id_t v8 = v7;
    if (v6 != -1 && os_signpost_enabled(v7))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1AE771000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "accessing URL", "-[ISIcon initWithURL:]", buf, 2u);
    }
  }
  uint64_t v9 = +[ISIconFactory _iconForURL:v4 options:0];
  uint64_t v10 = _ISURLCacheLog();
  os_signpost_id_t v11 = os_signpost_id_make_with_pointer(v10, v4);

  if (v11)
  {
    v12 = _ISURLCacheLog();
    BOOL v13 = os_signpost_enabled(v12);

    if (v13)
    {
      v14 = _ISURLCacheLog();
      BOOL v15 = v14;
      if (v11 != -1 && os_signpost_enabled(v14))
      {
        *(_WORD *)uint64_t v19 = 0;
        _os_signpost_emit_with_name_impl(&dword_1AE771000, v15, OS_SIGNPOST_INTERVAL_END, v11, "accessing URL", "-[ISIcon initWithURL:]", v19, 2u);
      }
    }
  }
  v16 = +[ISIconManager sharedInstance];
  v17 = [v16 findOrRegisterIcon:v9];

  return v17;
}

- (ISIconFactory)initWithApplicationIdentity:(id)a3
{
  id v4 = a3;
  v5 = [[ISApplicationIdentityIcon alloc] initWithApplicationIdentity:v4];

  os_signpost_id_t v6 = +[ISIconManager sharedInstance];
  v7 = [v6 findOrRegisterIcon:v5];

  return v7;
}

- (ISIconFactory)initWithApplicationBundleIdentifier:(id)a3
{
  id v4 = a3;
  v5 = [[ISBundleIdentifierIcon alloc] initWithBundleIdentifier:v4];

  os_signpost_id_t v6 = +[ISIconManager sharedInstance];
  v7 = [v6 findOrRegisterIcon:v5];

  return v7;
}

- (ISIconFactory)initWithApplicationExtensionBundleIdentifier:(id)a3
{
  id v4 = a3;
  v5 = [[ISBundleIdentifierIcon alloc] initWithBundleIdentifier:v4];

  os_signpost_id_t v6 = +[ISIconManager sharedInstance];
  v7 = [v6 findOrRegisterIcon:v5];

  return v7;
}

- (ISIconFactory)initWithBundleURL:(id)a3 type:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  os_signpost_id_t v8 = [[ISBundleIcon alloc] initWithBundleURL:v7 type:v6];

  uint64_t v9 = +[ISIconManager sharedInstance];
  uint64_t v10 = [v9 findOrRegisterIcon:v8];

  return v10;
}

- (ISIconFactory)initWithBundleURL:(id)a3 fileExtension:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  os_signpost_id_t v8 = [[ISBundleIcon alloc] initWithBundleURL:v7 fileExtension:v6];

  uint64_t v9 = +[ISIconManager sharedInstance];
  uint64_t v10 = [v9 findOrRegisterIcon:v8];

  return v10;
}

- (ISIconFactory)initWithImages:(id)a3
{
  id v4 = a3;
  v5 = [[ISImageBagIcon alloc] initWithImages:v4];

  return (ISIconFactory *)v5;
}

- (ISIconFactory)initWithFileExtension:(id)a3
{
  id v4 = a3;
  v5 = [[ISTagIcon alloc] initWithFileExtension:v4];

  id v6 = +[ISIconManager sharedInstance];
  id v7 = [v6 findOrRegisterIcon:v5];

  return v7;
}

- (ISIconFactory)initWithModelCode:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if ((id)*MEMORY[0x1E4F224D8] == v4 || objc_msgSend(v4, "isEqualToString:"))
  {
    id v6 = +[ISCurrentDeviceIcon sharedInstance];
  }
  else
  {
    id v7 = [[ISTagIcon alloc] initWithModelCode:v5];
    os_signpost_id_t v8 = +[ISIconManager sharedInstance];
    id v6 = [v8 findOrRegisterIcon:v7];
  }
  return v6;
}

- (ISIconFactory)initWithMIMEType:(id)a3
{
  id v4 = a3;
  v5 = [[ISTagIcon alloc] initWithMIMEType:v4];

  id v6 = +[ISIconManager sharedInstance];
  id v7 = [v6 findOrRegisterIcon:v5];

  return v7;
}

- (ISIconFactory)initWithSymbolName:(id)a3
{
  id v4 = a3;
  v5 = [[ISSymbolIcon alloc] initWithSymbolName:v4];

  id v6 = +[ISIconManager sharedInstance];
  id v7 = [v6 findOrRegisterIcon:v5];

  return v7;
}

- (ISIconFactory)initWithSymbolName:(id)a3 configuration:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  os_signpost_id_t v8 = [[ISSymbolIcon alloc] initWithSymbolName:v7 configuration:v6];

  uint64_t v9 = +[ISIconManager sharedInstance];
  uint64_t v10 = [v9 findOrRegisterIcon:v8];

  return v10;
}

+ (void)_iconForURL:options:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1AE771000, v0, v1, "Creating kUnknownFSObjectIcon icon for URL: %@", v2, v3, v4, v5, v6);
}

+ (void)_iconForURL:options:.cold.2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1AE771000, v0, v1, "Ignoring decorations %@ for URL: %@");
}

+ (void)_iconForURL:options:.cold.3()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1AE771000, v0, v1, "Creating Bundle Alias icon for Bookmark icon for URL: %@", v2, v3, v4, v5, v6);
}

+ (void)_iconForURL:options:.cold.4()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1AE771000, v0, v1, "Creating icon for placeholder bundle at URL: %@", v2, v3, v4, v5, v6);
}

+ (void)_iconForURL:options:.cold.5()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1AE771000, v0, v1, "Creating Bundle icon for URL: %@", v2, v3, v4, v5, v6);
}

+ (void)_iconForURL:options:.cold.6()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1AE771000, v0, v1, "Creating File Extension icon for package URL: %@", v2, v3, v4, v5, v6);
}

+ (void)_iconForURL:options:.cold.7()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1AE771000, v0, v1, "Creating executable icon for file URL: %@", v2, v3, v4, v5, v6);
}

+ (void)_iconForURL:options:.cold.8()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1AE771000, v0, v1, "Creating File Extension icon for file URL: %@", v2, v3, v4, v5, v6);
}

+ (void)_iconForURL:options:.cold.9()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1AE771000, v0, v1, "Identified custom folder type %@ for URL: %@");
}

+ (void)_iconForURL:(void *)a1 options:(NSObject *)a2 .cold.10(void *a1, NSObject *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [a1 filePathURL];
  int v5 = 138412546;
  uint8_t v6 = a1;
  __int16 v7 = 2112;
  os_signpost_id_t v8 = v4;
  _os_log_debug_impl(&dword_1AE771000, a2, OS_LOG_TYPE_DEBUG, "Creating Folder icon for URL: %@ (%@)", (uint8_t *)&v5, 0x16u);
}

+ (void)_iconForURL:options:.cold.11()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1AE771000, v0, v1, "Creating Folder icon for URL: %@", v2, v3, v4, v5, v6);
}

- (void)initWithBundleIdentifier:.cold.1()
{
  OUTLINED_FUNCTION_0();
}

@end