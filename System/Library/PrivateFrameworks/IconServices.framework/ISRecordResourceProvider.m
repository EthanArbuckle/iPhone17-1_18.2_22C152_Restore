@interface ISRecordResourceProvider
- (BOOL)_isAppleResource;
- (BOOL)_shouldTreatLikeApp;
- (ISRecordResourceProvider)initWithRecord:(id)a3 fileExtension:(id)a4 options:(unint64_t)a5;
- (ISRecordResourceProvider)initWithRecord:(id)a3 options:(unint64_t)a4;
- (LSRecord)record;
- (NSString)fileExtension;
- (NSString)templateType;
- (id)description;
- (id)iconResource;
- (id)resourceNamed:(id)a3;
- (id)symbol;
- (id)templateIconResource;
- (void)configureProviderFromDescriptor:(id)a3;
- (void)resolveResources;
- (void)setPlatformWithBundle:(id)a3;
- (void)setTemplateType:(id)a3;
@end

@implementation ISRecordResourceProvider

- (ISRecordResourceProvider)initWithRecord:(id)a3 options:(unint64_t)a4
{
  return [(ISRecordResourceProvider *)self initWithRecord:a3 fileExtension:0 options:a4];
}

- (ISRecordResourceProvider)initWithRecord:(id)a3 fileExtension:(id)a4 options:(unint64_t)a5
{
  v30[3] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  if (objc_msgSend(v9, "_is_canProvideIconResources"))
  {
    v27.receiver = self;
    v27.super_class = (Class)ISRecordResourceProvider;
    v11 = [(ISResourceProvider *)&v27 init];
    v12 = v11;
    if (v11)
    {
      objc_storeStrong((id *)&v11->_record, a3);
      v13 = [v9 iconDictionary];
      v30[0] = @"UTTypeIconBadgeName";
      v30[1] = @"UTTypeIconText";
      v30[2] = @"UTTypeIconBackgroundName";
      v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:3];
      v15 = objc_msgSend(v13, "_IF_stringForKeys:", v14);

      if (v15) {
        unint64_t v16 = a5 | 2;
      }
      else {
        unint64_t v16 = a5;
      }
      v17 = (void *)MEMORY[0x1E4F22468];
      id v29 = v9;
      v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v29 count:1];
      v19 = objc_msgSend(v17, "_is_resourceTokenForRecords:", v18);

      id v25 = 0;
      uint64_t v26 = 0;
      objc_msgSend(MEMORY[0x1E4F22468], "_is_getSequenceNumber:andUUID:", &v26, &v25);
      id v20 = v25;
      [(ISResourceProvider *)v12 setLsDatabaseSequenceNumber:v26];
      [(ISResourceProvider *)v12 setLsDatabaseUUID:v20];
      [(ISResourceProvider *)v12 setResourceToken:v19];
      v21 = [v9 persistentIdentifier];
      v28 = v21;
      v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v28 count:1];
      [(ISResourceProvider *)v12 setSourceRecordIdentifiers:v22];

      [(ISResourceProvider *)v12 setOptions:v16];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v23 = objc_msgSend(v9, "_IS_platformToIFPlatform");
        if (v23) {
          [(ISResourceProvider *)v12 setPlatform:v23];
        }
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0
        || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
        && objc_msgSend(v9, "_IS_allowsArbitraryExtensionAsText"))
      {
        objc_storeStrong((id *)&v12->_fileExtension, a4);
      }
    }
  }
  else
  {

    v12 = 0;
  }

  return v12;
}

- (void)resolveResources
{
  v47[1] = *MEMORY[0x1E4F143B8];
  if (![(ISResourceProvider *)self resolved])
  {
    [(ISResourceProvider *)self setResolved:1];
    if (objc_opt_respondsToSelector())
    {
      uint64_t v3 = [(LSRecord *)self->_record iconResourceBundleURL];
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) == 0)
      {
        v4 = 0;
        goto LABEL_8;
      }
      uint64_t v3 = [(LSRecord *)self->_record URL];
    }
    v4 = (void *)v3;
LABEL_8:
    v5 = (void *)[objc_alloc(MEMORY[0x1E4F6F1C0]) initWithURL:v4];
    v6 = [(LSRecord *)self->_record iconDictionary];
    v45 = +[ISResourceProvider resourceWithBundleURL:v4 iconDictionary:v6 options:0];
    v7 = +[ISDefaults sharedInstance];
    if ([(LSRecord *)v7 isDebugGraphicIconColourEnabled])
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) == 0) {
          goto LABEL_14;
        }
        v7 = self->_record;
        if ([(LSRecord *)v7 isDeclared])
        {
          id v9 = v45;
          v44 = +[ISDefaults sharedInstance];
          v43 = [v44 debugPreDefinedGraphicIconColor];
          v47[0] = v43;
          id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v47 count:1];
          v11 = [v9 descriptor];
          [v11 setEnclosureColors:v10];

          v12 = [v9 descriptor];

          [v12 setDebugColourSet:1];
        }
      }
    }

LABEL_14:
    objc_opt_class();
    char v13 = objc_opt_isKindOfClass();
    v14 = [(ISResourceProvider *)self resourcesByResourceKey];
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v45);

    v46[0] = @"UTTypeIconText";
    v46[1] = @"CFBundleIconText";
    v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v46 count:2];
    unint64_t v16 = objc_msgSend(v6, "_IF_stringForKeys:", v15);
    v17 = [v16 uppercaseString];

    if (v17 && ![v17 isEqual:@"*"]
      || ([(ISRecordResourceProvider *)self fileExtension],
          v18 = objc_claimAutoreleasedReturnValue(),
          [v18 uppercaseString],
          uint64_t v19 = objc_claimAutoreleasedReturnValue(),
          v17,
          v18,
          (v17 = (void *)v19) != 0))
    {
      id v20 = [(ISResourceProvider *)self resourcesByResourceKey];
      [v20 setObject:v17 forKeyedSubscript:@"kISTextResourceKey"];
    }
    [(ISRecordResourceProvider *)self setPlatformWithBundle:v5];
    v21 = [(ISRecordResourceProvider *)self record];
    BOOL v22 = [(ISResourceProvider *)self _findBadgeResourceWithIconDictionary:v6 bundle:v5 record:v21];

    BOOL v23 = [(ISResourceProvider *)self _findBackgroundResourceWithIconDictionary:v6 bundle:v5];
    if (!v22 && !v23)
    {
      v24 = [(ISResourceProvider *)self badgeResource];

      if (!v24)
      {
        if ((v13 & 1) == 0 || (id v25 = v45) == 0)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v26 = [(LSRecord *)self->_record declaringBundleRecord];
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v25 = +[ISResourceProvider resourceWithRecord:v26 options:0];
            }
            else
            {
              id v25 = 0;
            }
          }
          else
          {
            id v25 = 0;
          }
        }
        objc_super v27 = [(ISResourceProvider *)self resourcesByResourceKey];
        [v27 setObject:v25 forKeyedSubscript:@"kISBadgeResourceKey"];
      }
    }
    BOOL v28 = [(ISResourceProvider *)self _findCustomRecipeWithIconDictionary:v6 bundle:v5];
    id v29 = [(ISResourceProvider *)self resourcesByResourceKey];
    if (![v29 count] && !v28)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v30 = [(LSRecord *)self->_record containingBundleRecord];
        objc_opt_class();
        char v31 = objc_opt_isKindOfClass();

        if ((v31 & 1) == 0) {
          goto LABEL_38;
        }
        id v29 = [(LSRecord *)self->_record containingBundleRecord];
        v32 = [v29 URL];
        v33 = [v29 iconDictionary];
        v34 = +[ISResourceProvider resourceWithBundleURL:v32 iconDictionary:v33 options:0];

        if (v34)
        {
          v35 = [(ISResourceProvider *)self resourcesByResourceKey];
          [v35 setObject:v34 forKeyedSubscript:@"kISPrimaryResourceKey"];
        }
      }
    }

LABEL_38:
    if ([(ISRecordResourceProvider *)self _shouldTreatLikeApp]) {
      [(ISResourceProvider *)self setResourceType:1];
    }
    v36 = [(ISResourceProvider *)self resourcesByResourceKey];
    if ([v36 count]) {
      BOOL v28 = 1;
    }

    if (v28) {
      goto LABEL_54;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v37 = (__CFString **)MEMORY[0x1E4F22528];
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v38 = @"com.apple.application-and-system-extension";
LABEL_52:
        uint64_t v40 = +[ISResourceProvider resourceWithTypeIdentifier:v38 options:0];
        goto LABEL_53;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v39 = objc_msgSend(v6, "_IF_dictionaryForKey:", 0x1F063A070);

        if (v39)
        {
          uint64_t v40 = +[ISGraphicSymbolResource defaultResource];
LABEL_53:
          v41 = (void *)v40;
          v42 = [(ISResourceProvider *)self resourcesByResourceKey];
          [v42 setObject:v41 forKeyedSubscript:@"kISPrimaryResourceKey"];

LABEL_54:
          return;
        }
      }
      v37 = (__CFString **)MEMORY[0x1E4F22590];
    }
    v38 = *v37;
    goto LABEL_52;
  }
}

- (BOOL)_shouldTreatLikeApp
{
  uint64_t v3 = [(ISRecordResourceProvider *)self record];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v4 = [(ISRecordResourceProvider *)self record];
    char v5 = [v4 conformsToTypeIdentifier:@"com.apple.application-icon"];
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (void)configureProviderFromDescriptor:(id)a3
{
  id v4 = a3;
  char v5 = [(ISRecordResourceProvider *)self record];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    && ![(ISRecordResourceProvider *)self _shouldTreatLikeApp])
  {
    v7 = [(ISResourceProvider *)self suggestedRecipe];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {

      goto LABEL_7;
    }
    if ([v4 appearance] != 1)
    {
      uint64_t v8 = [v4 appearance];

      if (v8 != 2) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }

    goto LABEL_4;
  }
  if ([v4 appearance] == 1)
  {
LABEL_4:

LABEL_6:
    [(ISResourceProvider *)self setAllowNonDefaultAppearances:1];
    [(ISResourceProvider *)self setAllowAlterationsToResourceArt:1];
    goto LABEL_7;
  }
  uint64_t v6 = [v4 appearance];

  if (v6 == 2) {
    goto LABEL_6;
  }
LABEL_7:
  v9.receiver = self;
  v9.super_class = (Class)ISRecordResourceProvider;
  [(ISResourceProvider *)&v9 configureProviderFromDescriptor:v4];
}

- (id)iconResource
{
  v6.receiver = self;
  v6.super_class = (Class)ISRecordResourceProvider;
  uint64_t v3 = [(ISResourceProvider *)&v6 iconResource];
  if (!v3)
  {
    [(ISRecordResourceProvider *)self resolveResources];
    v5.receiver = self;
    v5.super_class = (Class)ISRecordResourceProvider;
    uint64_t v3 = [(ISResourceProvider *)&v5 iconResource];
  }
  return v3;
}

- (id)resourceNamed:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ISRecordResourceProvider;
  objc_super v5 = [(ISResourceProvider *)&v8 resourceNamed:v4];
  if (!v5)
  {
    [(ISRecordResourceProvider *)self resolveResources];
    v7.receiver = self;
    v7.super_class = (Class)ISRecordResourceProvider;
    objc_super v5 = [(ISResourceProvider *)&v7 resourceNamed:v4];
  }

  return v5;
}

- (id)templateIconResource
{
  return 0;
}

- (id)symbol
{
  return __34__ISRecordResourceProvider_symbol__block_invoke((uint64_t)self, self->_record);
}

id __34__ISRecordResourceProvider_symbol__block_invoke(uint64_t a1, void *a2)
{
  v10[2] = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || ([v2 isCoreType] & 1) == 0)
  {
    if (objc_opt_respondsToSelector())
    {
      uint64_t v3 = [v2 iconResourceBundleURL];
LABEL_7:
      id v4 = (void *)v3;
      goto LABEL_9;
    }
    if (objc_opt_respondsToSelector())
    {
      uint64_t v3 = [v2 URL];
      goto LABEL_7;
    }
  }
  id v4 = 0;
LABEL_9:
  objc_super v5 = [v2 iconDictionary];
  v10[0] = @"CFBundleSymbolName";
  v10[1] = @"UTTypeSymbolName";
  objc_super v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:2];
  objc_super v7 = objc_msgSend(v5, "_IF_stringForKeys:", v6);

  if (v7) {
    objc_super v8 = (void *)[objc_alloc(MEMORY[0x1E4F6F210]) initWithSymbolName:v7 bundleURL:v4];
  }
  else {
    objc_super v8 = 0;
  }

  return v8;
}

- (BOOL)_isAppleResource
{
  return (objc_opt_isKindOfClass() & 1) != 0
      && [(LSRecord *)self->_record developerType] == 1;
}

- (void)setPlatformWithBundle:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)ISRecordResourceProvider;
  [(ISResourceProvider *)&v3 setPlatformWithBundle:a3];
}

- (id)description
{
  objc_super v3 = NSString;
  v10.receiver = self;
  v10.super_class = (Class)ISRecordResourceProvider;
  id v4 = [(ISRecordResourceProvider *)&v10 description];
  objc_super v5 = [(ISRecordResourceProvider *)self record];
  objc_super v6 = [(ISRecordResourceProvider *)self record];
  objc_super v7 = [v6 iconDictionary];
  objc_super v8 = [v3 stringWithFormat:@"%@ - %@ %@", v4, v5, v7];

  return v8;
}

- (NSString)templateType
{
  return (NSString *)objc_getProperty(self, a2, 112, 1);
}

- (void)setTemplateType:(id)a3
{
}

- (LSRecord)record
{
  return (LSRecord *)objc_getProperty(self, a2, 120, 1);
}

- (NSString)fileExtension
{
  return (NSString *)objc_getProperty(self, a2, 128, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileExtension, 0);
  objc_storeStrong((id *)&self->_record, 0);
  objc_storeStrong((id *)&self->_templateType, 0);
}

@end