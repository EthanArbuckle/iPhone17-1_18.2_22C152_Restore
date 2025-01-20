@interface ISGraphicSymbolDescriptor
+ (id)descriptorFromGraphicIconConfiguration:(id)a3;
+ (id)descriptorFromGraphicSymbolRecipe:(id)a3;
- (BOOL)placeholder;
- (NSURL)_url;
- (id)description;
- (void)set_url:(id)a3;
@end

@implementation ISGraphicSymbolDescriptor

+ (id)descriptorFromGraphicSymbolRecipe:(id)a3
{
  v27[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = objc_alloc_init(ISGraphicSymbolDescriptor);
  v5 = _ISDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    +[ISGraphicSymbolDescriptor descriptorFromGraphicSymbolRecipe:]((uint64_t)v3, v5);
  }

  if (!v3)
  {
    v6 = _ISDefaultLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v26 = 0;
      _os_log_impl(&dword_1AE771000, v6, OS_LOG_TYPE_INFO, "No graphic variant recipe was provided", v26, 2u);
    }
  }
  objc_msgSend(v3, "_IF_stringForKey:", @"ISTypeIdentifier");
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  if (!v7) {
    goto LABEL_17;
  }
  v8 = [MEMORY[0x1E4F22490] typeRecordWithIdentifier:v7];
  v9 = v8;
  if (v8 && [v8 isDeclared])
  {
    v10 = [v9 iconDictionary];
    v11 = objc_msgSend(v10, "_IF_dictionaryForKey:", @"ISGraphicIconConfiguration");
  }
  else
  {
    v11 = 0;
  }

  if (!v11)
  {
    id v7 = 0;
LABEL_17:
    char v13 = 1;
    goto LABEL_18;
  }
  v12 = _ISDefaultLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    +[ISGraphicSymbolDescriptor descriptorFromGraphicSymbolRecipe:v12];
  }

  id v7 = v11;
  char v13 = 0;
  id v3 = v7;
LABEL_18:
  v14 = nameFromGraphicSymbolRecipe(v3);
  [(IFGraphicSymbolDescriptor *)v4 setName:v14];

  v15 = colorsFromGraphicSymbolRecipe(v3, @"ISSymbolColor");
  [(IFGraphicSymbolDescriptor *)v4 setSymbolColors:v15];

  v16 = colorsFromGraphicSymbolRecipe(v3, @"ISEnclosureColor");
  [(IFGraphicSymbolDescriptor *)v4 setEnclosureColors:v16];

  [(IFGraphicSymbolDescriptor *)v4 setRenderingMode:rendingModeFromGraphicSymbolRecipe(v3)];
  v17 = +[ISDefaults sharedInstance];
  int v18 = [v17 isDebugGraphicIconColourEnabled];

  if (v18)
  {
    v19 = +[ISDefaults sharedInstance];
    v20 = [v19 debugGraphicIconColor];

    if ((v13 & 1) == 0)
    {
      v21 = +[ISDefaults sharedInstance];
      uint64_t v22 = [v21 debugPreDefinedGraphicIconColor];

      v20 = (void *)v22;
    }
    if (v20)
    {
      v27[0] = v20;
      v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:1];
      [(IFGraphicSymbolDescriptor *)v4 setEnclosureColors:v23];

      [(IFGraphicSymbolDescriptor *)v4 setDebugColourSet:1];
    }
  }
  v24 = _ISDefaultLog();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
    +[ISGraphicSymbolDescriptor descriptorFromGraphicSymbolRecipe:](v4);
  }

  return v4;
}

+ (id)descriptorFromGraphicIconConfiguration:(id)a3
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = objc_alloc_init(ISGraphicSymbolDescriptor);
  v5 = [v3 symbolColors];
  [(IFGraphicSymbolDescriptor *)v4 setSymbolColors:v5];

  v6 = [v3 enclosureColors];
  [(IFGraphicSymbolDescriptor *)v4 setEnclosureColors:v6];

  -[IFGraphicSymbolDescriptor setRenderingMode:](v4, "setRenderingMode:", [v3 renderingMode]);
  id v7 = +[ISDefaults sharedInstance];
  int v8 = [v7 isDebugGraphicIconColourEnabled];

  if (v8)
  {
    v9 = +[ISDefaults sharedInstance];
    v10 = [v9 debugISIconGraphicIconColor];

    if (v10)
    {
      v14[0] = v10;
      v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
      [(IFGraphicSymbolDescriptor *)v4 setEnclosureColors:v11];

      [(IFGraphicSymbolDescriptor *)v4 setDebugColourSet:1];
    }
  }
  v12 = _ISDefaultLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    +[ISGraphicSymbolDescriptor descriptorFromGraphicIconConfiguration:](v4);
  }

  return v4;
}

- (BOOL)placeholder
{
  v5 = [(IFGraphicSymbolDescriptor *)self symbolColors];
  if (v5)
  {
    v2 = [(IFGraphicSymbolDescriptor *)self symbolColors];
    if ([v2 count])
    {
      LOBYTE(v6) = 1;
LABEL_12:

      goto LABEL_13;
    }
  }
  id v7 = [(IFGraphicSymbolDescriptor *)self enclosureColors];
  if (v7)
  {
    id v3 = [(IFGraphicSymbolDescriptor *)self enclosureColors];
    if ([v3 count] || -[IFGraphicSymbolDescriptor renderingMode](self, "renderingMode"))
    {
      LOBYTE(v6) = 1;
LABEL_8:

      goto LABEL_11;
    }
  }
  else if ([(IFGraphicSymbolDescriptor *)self renderingMode])
  {
    LOBYTE(v6) = 1;
    goto LABEL_11;
  }
  uint64_t v9 = [(IFGraphicSymbolDescriptor *)self name];
  if (v9)
  {
    v10 = (void *)v9;
    v11 = [(IFGraphicSymbolDescriptor *)self name];
    int v6 = [v11 isEqual:@"questionmark.app.dashed"] ^ 1;

    if (v7) {
      goto LABEL_8;
    }
  }
  else
  {
    LOBYTE(v6) = 0;
    if (v7) {
      goto LABEL_8;
    }
  }
LABEL_11:
  if (v5) {
    goto LABEL_12;
  }
LABEL_13:

  return v6 ^ 1;
}

- (id)description
{
  id v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(IFGraphicSymbolDescriptor *)self name];
  [(IFGraphicSymbolDescriptor *)self size];
  uint64_t v7 = v6;
  [(IFGraphicSymbolDescriptor *)self size];
  uint64_t v9 = v8;
  [(IFSymbolImageDescriptor *)self scale];
  v11 = [v3 stringWithFormat:@"<%@ %p> %@ - (%0.2f, %0.2f)@%.0fx", v4, self, v5, v7, v9, v10];

  return v11;
}

- (NSURL)_url
{
  return (NSURL *)objc_getProperty(self, a2, 296, 1);
}

- (void)set_url:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (void)descriptorFromGraphicSymbolRecipe:(void *)a1 .cold.1(void *a1)
{
  v1 = [a1 description];
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_5(&dword_1AE771000, v2, v3, "Created %@ from graphic variant dictionary %@", v4, v5, v6, v7, v8);
}

+ (void)descriptorFromGraphicSymbolRecipe:(os_log_t)log .cold.2(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_debug_impl(&dword_1AE771000, log, OS_LOG_TYPE_DEBUG, "Updated recipe found for %@ => %@", (uint8_t *)&v3, 0x16u);
}

+ (void)descriptorFromGraphicSymbolRecipe:(uint64_t)a1 .cold.3(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1AE771000, a2, OS_LOG_TYPE_DEBUG, "Attempting to make descriptor for %@", (uint8_t *)&v2, 0xCu);
}

+ (void)descriptorFromGraphicIconConfiguration:(void *)a1 .cold.1(void *a1)
{
  v1 = [a1 description];
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_5(&dword_1AE771000, v2, v3, "Created %@ from graphic icon configuration %@", v4, v5, v6, v7, v8);
}

@end