@interface ISPersona
- (BOOL)isEnterprisePersona;
- (ISPersona)initWithRecord:(id)a3;
- (LSBundleRecord)record;
- (id)resourceBadge;
- (int64_t)personaType;
@end

@implementation ISPersona

- (ISPersona)initWithRecord:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v21.receiver = self;
  v21.super_class = (Class)ISPersona;
  v6 = [(ISPersona *)&v21 init];
  v7 = v6;
  if (!v6) {
    goto LABEL_16;
  }
  objc_storeStrong((id *)&v6->_record, a3);
  v7->_personaType = 0;
  v8 = +[ISDefaults sharedInstance];
  if ([v8 enableInstanceIDBasedTwoAppModel])
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0) {
      goto LABEL_14;
    }
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    v8 = objc_msgSend(v5, "identities", 0);
    uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v22 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v18;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v18 != v12) {
            objc_enumerationMutation(v8);
          }
          if ([*(id *)(*((void *)&v17 + 1) + 8 * v13) personaType] == 2) {
            v7->_personaType = 1;
          }
          ++v13;
        }
        while (v11 != v13);
        uint64_t v11 = [v8 countByEnumeratingWithState:&v17 objects:v22 count:16];
      }
      while (v11);
    }
  }

LABEL_14:
  v14 = +[ISDefaults sharedInstance];
  int v15 = [v14 enableBadgeOverhang];

  if (v15) {
    v7->_personaType = 1;
  }
LABEL_16:

  return v7;
}

- (BOOL)isEnterprisePersona
{
  return [(ISPersona *)self personaType] == 1;
}

- (id)resourceBadge
{
  v10[1] = *MEMORY[0x1E4F143B8];
  if ([(ISPersona *)self isEnterprisePersona])
  {
    v2 = objc_opt_new();
    v3 = (void *)[objc_alloc(MEMORY[0x1E4F6F1C8]) initWithSystemColor:11];
    v10[0] = v3;
    v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
    [v2 setSymbolColors:v4];

    id v5 = (void *)[objc_alloc(MEMORY[0x1E4F6F1C8]) initWithSystemColor:4];
    v9 = v5;
    v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v9 count:1];
    [v2 setEnclosureColors:v6];

    [v2 setRenderingMode:2];
    v7 = +[ISGraphicSymbolResource graphicSymbolResourceWithConfiguration:v2 symbolName:@"frying.pan.fill" url:0];
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (LSBundleRecord)record
{
  return self->_record;
}

- (int64_t)personaType
{
  return self->_personaType;
}

- (void).cxx_destruct
{
}

@end